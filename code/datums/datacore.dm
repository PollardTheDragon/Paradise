/datum/datacore
	var/list/medical = list()
	var/list/general = list()
	var/list/security = list()
	var/list/ai = list()
	//This list tracks characters spawned in the world and cannot be modified in-game. Currently referenced by respawn_character().
	var/list/locked = list()

/*
We can't just insert in HTML into the TGUI so we need the raw data to play with.
Instead of creating this list over and over when someone leaves their PDA open to the page
we'll only update it when it changes.  The PDA_Manifest global list is zeroed out upon any change
using /datum/datacore/proc/manifest_inject(), or manifest_insert()
*/

GLOBAL_LIST_EMPTY(PDA_Manifest)

/datum/datacore/proc/get_manifest_json()
	if(length(GLOB.PDA_Manifest))
		return
	var/heads[0]
	var/sec[0]
	var/eng[0]
	var/med[0]
	var/sci[0]
	var/ser[0]
	var/sup[0]
	var/bot[0]
	var/misc[0]
	for(var/datum/data/record/t in GLOB.data_core.general)
		var/name = sanitize(t.fields["name"])
		var/rank = sanitize(t.fields["rank"])
		var/real_rank = t.fields["real_rank"]

		var/isactive = t.fields["p_stat"]
		var/department = 0
		var/depthead = 0 			// Department Heads will be placed at the top of their lists.
		if(real_rank in GLOB.command_positions)
			heads[++heads.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1
			depthead = 1
			if(rank == "Captain" && length(heads) != 1)
				heads.Swap(1,  length(heads))

		if(real_rank in GLOB.active_security_positions)
			sec[++sec.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1
			if(depthead && length(sec) != 1)
				sec.Swap(1, length(sec))

		if(real_rank in GLOB.engineering_positions)
			eng[++eng.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1
			if(depthead && length(eng) != 1)
				eng.Swap(1, length(eng))

		if(real_rank in GLOB.medical_positions)
			med[++med.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1
			if(depthead && length(med) != 1)
				med.Swap(1, length(med))

		if(real_rank in GLOB.science_positions)
			sci[++sci.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1
			if(depthead && length(sci) != 1)
				sci.Swap(1, length(sci))

		if(real_rank in GLOB.service_positions)
			ser[++ser.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1
			if(depthead && length(ser) != 1)
				ser.Swap(1, length(ser))

		if(real_rank in GLOB.supply_positions)
			sup[++sup.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1
			if(depthead && length(sup) != 1)
				sup.Swap(1, length(sup))

		if(real_rank in GLOB.nonhuman_positions)
			bot[++bot.len] = list("name" = name, "rank" = rank, "active" = isactive)
			department = 1

		if(!department && !(name in heads))
			misc[++misc.len] = list("name" = name, "rank" = rank, "active" = isactive)


	GLOB.PDA_Manifest = list(\
		"heads" = heads,\
		"sec" = sec,\
		"eng" = eng,\
		"med" = med,\
		"sci" = sci,\
		"ser" = ser,\
		"sup" = sup,\
		"bot" = bot,\
		"misc" = misc\
		)
	return



/datum/datacore/proc/manifest()
	for(var/mob/living/carbon/human/H in GLOB.player_list)
		manifest_inject(H)

/datum/datacore/proc/manifest_modify(name, assignment)
	if(length(GLOB.PDA_Manifest))
		GLOB.PDA_Manifest.Cut()
	var/datum/data/record/foundrecord
	var/real_title = assignment

	for(var/datum/data/record/t in GLOB.data_core.general)
		if(t)
			if(t.fields["name"] == name)
				foundrecord = t
				break

	var/list/all_jobs = get_job_datums()
	var/is_custom_job = TRUE

	for(var/datum/job/J in all_jobs)
		var/list/alttitles = get_alternate_titles(J.title)
		if(J.title == real_title)
			is_custom_job = FALSE
		if(assignment in alttitles)
			real_title = J.title
			is_custom_job = FALSE
			break

	if(is_custom_job && foundrecord)
		real_title = foundrecord.fields["real_rank"]

	if(foundrecord)
		foundrecord.fields["rank"] = assignment
		foundrecord.fields["real_rank"] = real_title

GLOBAL_VAR_INIT(record_id_num, 1001)
/datum/datacore/proc/manifest_inject(mob/living/carbon/human/H)
	if(length(GLOB.PDA_Manifest))
		GLOB.PDA_Manifest.Cut()

	if(H.mind && (H.mind.assigned_role != H.mind.special_role))
		var/assignment
		if(H.mind.role_alt_title)
			assignment = H.mind.role_alt_title
		else if(H.mind.assigned_role)
			assignment = H.mind.assigned_role
		else if(H.job)
			assignment = H.job
		else
			assignment = "Unassigned"
		GLOB.crew_list[H.real_name] = assignment

		var/id = num2hex(GLOB.record_id_num++, 6)


		//General Record
		var/datum/data/record/G = new()
		G.fields["id"]			= id
		G.fields["name"]		= H.real_name
		G.fields["real_rank"]	= H.mind.assigned_role
		G.fields["rank"]		= assignment
		G.fields["age"]			= H.age
		G.fields["fingerprint"]	= md5(H.dna.uni_identity)
		G.fields["p_stat"]		= "Active"
		G.fields["m_stat"]		= "Stable"
		G.fields["sex"]			= capitalize(H.gender)
		G.fields["species"]		= H.dna.species.name
		G.fields["ai_target"]	= "None" // for malf hud

		// Do some ID card checking stuff here to save on resources
		var/card_photo
		if(istype(H.wear_id, /obj/item/card/id))
			var/obj/item/card/id/IDC = H.wear_id
			card_photo = IDC.photo
		else
			card_photo = get_id_photo(H)

		G.fields["photo"] = card_photo
		G.fields["photo-south"] = "data:image/png;base64,[icon2base64(icon(card_photo, dir = SOUTH))]"
		G.fields["photo-west"] = "data:image/png;base64,[icon2base64(icon(card_photo, dir = WEST))]"
		if(H.gen_record && !jobban_isbanned(H, ROLEBAN_RECORDS))
			G.fields["notes"] = H.gen_record
		else
			G.fields["notes"] = "No notes found."
		G.fields["nt_relation"] = H?.client?.prefs?.active_character?.nanotrasen_relation || "Unknown relation."
		general += G

		//Medical Record
		var/datum/data/record/M = new()
		M.fields["id"]			= id
		M.fields["name"]		= H.real_name
		M.fields["blood_type"]	= H.dna.blood_type
		M.fields["b_dna"]		= H.dna.unique_enzymes
		M.fields["mi_dis"]		= "None"
		M.fields["mi_dis_d"]	= "No minor disabilities have been declared."
		M.fields["ma_dis"]		= "None"
		M.fields["ma_dis_d"]	= "No major disabilities have been diagnosed."
		M.fields["alg"]			= "None"
		M.fields["alg_d"]		= "No allergies have been detected in this patient."
		M.fields["cdi"]			= "None"
		M.fields["cdi_d"]		= "No diseases have been diagnosed at the moment."
		if(H.med_record && !jobban_isbanned(H, ROLEBAN_RECORDS))
			M.fields["notes"] = H.med_record
		else
			M.fields["notes"] = "No notes found."
		medical += M

		//Security Record
		var/datum/data/record/S = new()
		S.fields["id"]			= id
		S.fields["name"]		= H.real_name
		S.fields["criminal"]	= "None"
		S.fields["mi_crim"]		= "None"
		S.fields["mi_crim_d"]	= "No minor crime convictions."
		S.fields["ma_crim"]		= "None"
		S.fields["ma_crim_d"]	= "No major crime convictions."
		S.fields["notes"]		= "No notes."
		if(H.sec_record && !jobban_isbanned(H, ROLEBAN_RECORDS))
			S.fields["notes"] = H.sec_record
		else
			S.fields["notes"] = "No notes found."
		LAZYINITLIST(S.fields["comments"])
		security += S

		//Locked Record
		var/datum/data/record/L = new()
		L.fields["id"]			= md5("[H.real_name][H.mind.assigned_role]")
		L.fields["name"]		= H.real_name
		L.fields["rank"] 		= H.mind.assigned_role
		L.fields["age"]			= H.age
		L.fields["sex"]			= capitalize(H.gender)
		L.fields["blood_type"]	= H.dna.blood_type
		L.fields["b_dna"]		= H.dna.unique_enzymes
		L.fields["enzymes"]		= H.dna.SE // Used in respawning
		L.fields["identity"]	= H.dna.UI // "
		L.fields["image"]		= getFlatIcon(H)	//This is god-awful
		locked += L
	return

/proc/get_id_photo(mob/living/carbon/human/H, custom_job = null)
	var/icon/preview_icon = null
	var/obj/item/organ/external/head/head_organ = H.get_organ("head")
	var/obj/item/organ/internal/eyes/eyes_organ = H.get_int_organ(/obj/item/organ/internal/eyes)

	var/g = "m"
	if(H.gender == FEMALE)
		g = "f"

	var/icon/icobase = head_organ.icobase //At this point all the organs would have the same icobase, so this is just recycling.

	preview_icon = new /icon(icobase, "torso_[g]")
	var/icon/temp
	temp = new /icon(icobase, "groin_[g]")
	preview_icon.Blend(temp, ICON_OVERLAY)
	var/head = "head"
	if(head_organ.alt_head && head_organ.dna.species.bodyflags & HAS_ALT_HEADS)
		var/datum/sprite_accessory/alt_heads/alternate_head = GLOB.alt_heads_list[head_organ.alt_head]
		if(alternate_head.icon_state)
			head = alternate_head.icon_state
	temp = new /icon(icobase, "[head]_[g]")
	preview_icon.Blend(temp, ICON_OVERLAY)

	//Tail
	if(H.body_accessory && (istype(H.body_accessory, /datum/body_accessory/tail) || istype(H.body_accessory, /datum/body_accessory/wing)))
		temp = new/icon("icon" = H.body_accessory.icon, "icon_state" = H.body_accessory.icon_state)
		preview_icon.Blend(temp, ICON_OVERLAY)
	else if(H.tail && H.dna.species.bodyflags & HAS_TAIL)
		temp = new/icon("icon" = 'icons/effects/species.dmi', "icon_state" = "[H.tail]_s")
		preview_icon.Blend(temp, ICON_OVERLAY)
	else if(H.wing && H.dna.species.bodyflags & HAS_WING)
		temp = new/icon("icon" = 'icons/effects/species.dmi', "icon_state" = "[H.wing]_s")
		preview_icon.Blend(temp, ICON_OVERLAY)

	for(var/obj/item/organ/external/E in H.bodyparts)
		preview_icon.Blend(E.get_icon(), ICON_OVERLAY)

	// Skin tone
	if(H.dna.species.bodyflags & HAS_SKIN_TONE)
		if(H.s_tone >= 0)
			preview_icon.Blend(rgb(H.s_tone, H.s_tone, H.s_tone), ICON_ADD)
		else
			preview_icon.Blend(rgb(-H.s_tone,  -H.s_tone,  -H.s_tone), ICON_SUBTRACT)

	// Proper Skin color - Fix, you can't have HAS_SKIN_TONE *and* HAS_SKIN_COLOR
	if(H.dna.species.bodyflags & HAS_SKIN_COLOR)
		preview_icon.Blend(H.skin_colour, ICON_ADD)

	//Tail Markings
	var/icon/t_marking_s
	if(H.dna.species.bodyflags & HAS_TAIL_MARKINGS)
		var/tail_marking = H.m_styles["tail"]
		var/datum/sprite_accessory/tail_marking_style = GLOB.marking_styles_list[tail_marking]
		if(tail_marking_style && tail_marking_style.species_allowed)
			t_marking_s = new/icon("icon" = tail_marking_style.icon, "icon_state" = "[tail_marking_style.icon_state]_s")
			t_marking_s.Blend(H.m_colours["tail"], ICON_ADD)
			if(!(H.body_accessory && istype(H.body_accessory, /datum/body_accessory/body)))
				preview_icon.Blend(t_marking_s, ICON_OVERLAY)

	var/icon/face_s = new/icon("icon" = 'icons/mob/human_face.dmi', "icon_state" = "bald_s")
	if(!(H.dna.species.bodyflags & NO_EYES))
		var/icon/eyes_s = new/icon("icon" = 'icons/mob/human_face.dmi', "icon_state" = H.dna.species ? H.dna.species.eyes : "eyes_s")
		if(!eyes_organ)
			return
		eyes_s.Blend(eyes_organ.eye_color, ICON_ADD)
		face_s.Blend(eyes_s, ICON_OVERLAY)

	var/datum/sprite_accessory/hair_style = GLOB.hair_styles_full_list[head_organ.h_style]
	if(hair_style)
		var/icon/hair_s = new/icon("icon" = hair_style.icon, "icon_state" = "[hair_style.icon_state]_s")
		// I'll want to make a species-specific proc for this sooner or later
		// But this'll do for now
		if(istype(head_organ.dna.species, /datum/species/slime))
			hair_s.Blend("[H.skin_colour]A0", ICON_AND) //A0 = 160 alpha.
		else
			hair_s.Blend(head_organ.hair_colour, ICON_ADD)

		if(hair_style.secondary_theme)
			var/icon/hair_secondary_s = new/icon("icon" = hair_style.icon, "icon_state" = "[hair_style.icon_state]_[hair_style.secondary_theme]_s")
			if(!hair_style.no_sec_colour)
				hair_secondary_s.Blend(head_organ.sec_hair_colour, ICON_ADD)
			hair_s.Blend(hair_secondary_s, ICON_OVERLAY)

		face_s.Blend(hair_s, ICON_OVERLAY)

	//Head Accessory
	if(head_organ.dna.species.bodyflags & HAS_HEAD_ACCESSORY)
		var/datum/sprite_accessory/head_accessory_style = GLOB.head_accessory_styles_list[head_organ.ha_style]
		if(head_accessory_style && head_accessory_style.species_allowed)
			var/icon/head_accessory_s = new/icon("icon" = head_accessory_style.icon, "icon_state" = "[head_accessory_style.icon_state]_s")
			head_accessory_s.Blend(head_organ.headacc_colour, ICON_ADD)
			face_s.Blend(head_accessory_s, ICON_OVERLAY)

	var/datum/sprite_accessory/facial_hair_style = GLOB.facial_hair_styles_list[head_organ.f_style]
	if(facial_hair_style && facial_hair_style.species_allowed)
		var/icon/facial_s = new/icon("icon" = facial_hair_style.icon, "icon_state" = "[facial_hair_style.icon_state]_s")
		if(istype(head_organ.dna.species, /datum/species/slime))
			facial_s.Blend("[H.skin_colour]A0", ICON_ADD) //A0 = 160 alpha.
		else
			facial_s.Blend(head_organ.facial_colour, ICON_ADD)

		if(facial_hair_style.secondary_theme)
			var/icon/facial_secondary_s = new/icon("icon" = facial_hair_style.icon, "icon_state" = "[facial_hair_style.icon_state]_[facial_hair_style.secondary_theme]_s")
			if(!facial_hair_style.no_sec_colour)
				facial_secondary_s.Blend(head_organ.sec_facial_colour, ICON_ADD)
			facial_s.Blend(facial_secondary_s, ICON_OVERLAY)

		face_s.Blend(facial_s, ICON_OVERLAY)

	//Markings
	if((H.dna.species.bodyflags & HAS_HEAD_MARKINGS) || (H.dna.species.bodyflags & HAS_BODY_MARKINGS))
		if(H.dna.species.bodyflags & HAS_BODY_MARKINGS) //Body markings.
			var/body_marking = H.m_styles["body"]
			var/datum/sprite_accessory/body_marking_style = GLOB.marking_styles_list[body_marking]
			if(body_marking_style && body_marking_style.species_allowed)
				var/icon/b_marking_s = new/icon("icon" = body_marking_style.icon, "icon_state" = "[body_marking_style.icon_state]_s")
				b_marking_s.Blend(H.m_colours["body"], ICON_ADD)
				face_s.Blend(b_marking_s, ICON_OVERLAY)
		if(H.dna.species.bodyflags & HAS_HEAD_MARKINGS) //Head markings.
			var/head_marking = H.m_styles["head"]
			var/datum/sprite_accessory/head_marking_style = GLOB.marking_styles_list[head_marking]
			if(head_marking_style && head_marking_style.species_allowed)
				var/icon/h_marking_s = new/icon("icon" = head_marking_style.icon, "icon_state" = "[head_marking_style.icon_state]_s")
				h_marking_s.Blend(H.m_colours["head"], ICON_ADD)
				face_s.Blend(h_marking_s, ICON_OVERLAY)

	preview_icon.Blend(face_s, ICON_OVERLAY)
	//Underwear
	var/icon/underwear_standing = new /icon('icons/mob/clothing/underwear.dmi', "nude")
	if(H.underwear && H.dna.species.clothing_flags & HAS_UNDERWEAR)
		var/datum/sprite_accessory/underwear/U = GLOB.underwear_list[H.underwear]
		if(U)
			var/u_icon = U.sprite_sheets && (H.dna.species.sprite_sheet_name in U.sprite_sheets) ? U.sprite_sheets[H.dna.species.sprite_sheet_name] : U.icon //Species-fit the undergarment.
			underwear_standing.Blend(new /icon(u_icon, "uw_[U.icon_state]_s"), ICON_OVERLAY)

	if(H.undershirt && H.dna.species.clothing_flags & HAS_UNDERSHIRT)
		var/datum/sprite_accessory/undershirt/U2 = GLOB.undershirt_list[H.undershirt]
		if(U2)
			var/u2_icon = U2.sprite_sheets && (H.dna.species.sprite_sheet_name in U2.sprite_sheets) ? U2.sprite_sheets[H.dna.species.sprite_sheet_name] : U2.icon
			underwear_standing.Blend(new /icon(u2_icon, "us_[U2.icon_state]_s"), ICON_OVERLAY)

	if(H.socks && H.dna.species.clothing_flags & HAS_SOCKS)
		var/datum/sprite_accessory/socks/U3 = GLOB.socks_list[H.socks]
		if(U3)
			var/u3_icon = U3.sprite_sheets && (H.dna.species.sprite_sheet_name in U3.sprite_sheets) ? U3.sprite_sheets[H.dna.species.sprite_sheet_name] : U3.icon
			underwear_standing.Blend(new /icon(u3_icon, "sk_[U3.icon_state]_s"), ICON_OVERLAY)

	if(underwear_standing)
		preview_icon.Blend(underwear_standing, ICON_OVERLAY)

	var/icon/hands_icon = icon(preview_icon)
	hands_icon.Blend(icon('icons/mob/clothing/masking_helpers.dmi', "l_hand_mask"), ICON_MULTIPLY)

	var/icon/clothes_s = null
	var/job_clothes = null
	if(custom_job)
		job_clothes = custom_job
	else if(H.mind)
		job_clothes = H.mind.assigned_role
	switch(job_clothes)
		if("Head of Personnel")
			clothes_s = new /icon('icons/mob/clothing/under/civilian.dmi', "hop_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "brown"), ICON_UNDERLAY)
		if("Nanotrasen Representative")
			clothes_s = new /icon('icons/mob/clothing/under/centcom.dmi', "officer_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "laceups"), ICON_UNDERLAY)
		if("Nanotrasen Career Trainer")
			clothes_s = new /icon('icons/mob/clothing/under/procedure.dmi', "trainer_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "laceups"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/suit.dmi', "trainercoat"), ICON_OVERLAY)
		if("Blueshield")
			clothes_s = new /icon('icons/mob/clothing/under/centcom.dmi', "officer_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "jackboots"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/suit.dmi', "blueshield"), ICON_OVERLAY)
		if("Magistrate")
			clothes_s = new /icon('icons/mob/clothing/under/suit.dmi', "really_black_suit_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "laceups"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/suit.dmi', "judge"), ICON_OVERLAY)
		if("Bartender")
			clothes_s = new /icon('icons/mob/clothing/under/civilian.dmi', "ba_suit_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "black"), ICON_UNDERLAY)
		if("Botanist")
			clothes_s = new /icon('icons/mob/clothing/under/civilian.dmi', "hydroponics_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "black"), ICON_UNDERLAY)
		if("Chef")
			clothes_s = new /icon('icons/mob/clothing/under/civilian.dmi', "chef_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "black"), ICON_UNDERLAY)
		if("Janitor")
			clothes_s = new /icon('icons/mob/clothing/under/civilian.dmi', "janitor_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "black"), ICON_UNDERLAY)
		if("Librarian")
			clothes_s = new /icon('icons/mob/clothing/under/civilian.dmi', "red_suit_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "black"), ICON_UNDERLAY)
		if("Clown")
			clothes_s = new /icon('icons/mob/clothing/under/civilian.dmi', "clown_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "clown"), ICON_UNDERLAY)
		if("Mime")
			clothes_s = new /icon('icons/mob/clothing/under/civilian.dmi', "mime_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "black"), ICON_UNDERLAY)
		if("Quartermaster")
			clothes_s = new /icon('icons/mob/clothing/under/cargo.dmi', "qm_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "brown"), ICON_UNDERLAY)
		if("Cargo Technician")
			clothes_s = new /icon('icons/mob/clothing/under/cargo.dmi', "cargo_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "black"), ICON_UNDERLAY)
		if("Shaft Miner")
			clothes_s = new /icon('icons/mob/clothing/under/cargo.dmi', "explorer_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "explorer"), ICON_UNDERLAY)
		if("Internal Affairs Agent")
			clothes_s = new /icon('icons/mob/clothing/under/civilian.dmi', "internalaffairs_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "brown"), ICON_UNDERLAY)
		if("Chaplain")
			clothes_s = new /icon('icons/mob/clothing/under/civilian.dmi', "chapblack_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "black"), ICON_UNDERLAY)
		if("Research Director")
			clothes_s = new /icon('icons/mob/clothing/under/rnd.dmi', "director_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "brown"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/suit.dmi', "labcoat_open"), ICON_OVERLAY)
		if("Scientist")
			clothes_s = new /icon('icons/mob/clothing/under/rnd.dmi', "science_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "white"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/suit.dmi', "labcoat_tox_open"), ICON_OVERLAY)
		if("Chemist")
			clothes_s = new /icon('icons/mob/clothing/under/medical.dmi', "chemistry_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "white"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/suit.dmi', "labcoat_chem_open"), ICON_OVERLAY)
		if("Chief Medical Officer")
			clothes_s = new /icon('icons/mob/clothing/under/medical.dmi', "cmo_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "brown"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/suit.dmi', "labcoat_cmo_open"), ICON_OVERLAY)
		if("Medical Doctor")
			clothes_s = new /icon('icons/mob/clothing/under/medical.dmi', "medical_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "white"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/suit.dmi', "labcoat_open"), ICON_OVERLAY)
		if("Coroner")
			clothes_s = new /icon('icons/mob/clothing/under/medical.dmi', "scrubsblack_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "white"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/suit.dmi', "labcoat_mort_open"), ICON_OVERLAY)
		if("Geneticist")
			clothes_s = new /icon('icons/mob/clothing/under/rnd.dmi', "genetics_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "white"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/suit.dmi', "labcoat_gen_open"), ICON_OVERLAY)
		if("Virologist")
			clothes_s = new /icon('icons/mob/clothing/under/medical.dmi', "virology_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "white"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/suit.dmi', "labcoat_vir_open"), ICON_OVERLAY)
		if("Psychiatrist")
			clothes_s = new /icon('icons/mob/clothing/under/medical.dmi', "psych_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "laceups"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/suit.dmi', "labcoat_open"), ICON_UNDERLAY)
		if("Paramedic")
			clothes_s = new /icon('icons/mob/clothing/under/medical.dmi', "paramedic_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "black"), ICON_UNDERLAY)
		if("Captain")
			clothes_s = new /icon('icons/mob/clothing/under/captain.dmi', "captain_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "brown"), ICON_UNDERLAY)
		if("Head of Security")
			clothes_s = new /icon('icons/mob/clothing/under/security.dmi', "hos_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "jackboots"), ICON_UNDERLAY)
		if("Warden")
			clothes_s = new /icon('icons/mob/clothing/under/security.dmi', "warden_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "jackboots"), ICON_UNDERLAY)
		if("Detective")
			clothes_s = new /icon('icons/mob/clothing/under/security.dmi', "detective_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "brown"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/suit.dmi', "detective"), ICON_OVERLAY)
		if("Security Officer")
			clothes_s = new /icon('icons/mob/clothing/under/security.dmi', "security_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "jackboots"), ICON_UNDERLAY)
		if("Chief Engineer")
			clothes_s = new /icon('icons/mob/clothing/under/engineering.dmi', "chief_engineer_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "brown"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/belt.dmi', "utility"), ICON_OVERLAY)
		if("Station Engineer")
			clothes_s = new /icon('icons/mob/clothing/under/engineering.dmi', "engineer_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "orange"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/belt.dmi', "utility"), ICON_OVERLAY)
		if("Life Support Specialist")
			clothes_s = new /icon('icons/mob/clothing/under/engineering.dmi', "atmos_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "black"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/belt.dmi', "utility"), ICON_OVERLAY)
		if("Roboticist")
			clothes_s = new /icon('icons/mob/clothing/under/rnd.dmi', "robotics_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "black"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/suit.dmi', "labcoat_open"), ICON_OVERLAY)
		if("Syndicate Agent")
			clothes_s = new /icon('icons/mob/clothing/under/syndicate.dmi', "syndicate_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "black"), ICON_UNDERLAY)
		if("Syndicate Officer")
			clothes_s = new /icon('icons/mob/clothing/under/syndicate.dmi', "syndicate_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "jackboots"), ICON_UNDERLAY)
		if("Syndicate Nuclear Operative")
			clothes_s = new /icon('icons/mob/clothing/under/syndicate.dmi', "syndicate_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "jackboots"), ICON_UNDERLAY)
		if("Emergency Response Team Officer")
			clothes_s = new /icon('icons/mob/clothing/under/centcom.dmi', "officer_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "jackboots"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/hands.dmi', "swat_gl"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/belt.dmi', "security"), ICON_OVERLAY)
		if("Emergency Response Team Engineer")
			clothes_s = new /icon('icons/mob/clothing/under/centcom.dmi', "officer_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "workboots"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/hands.dmi', "swat_gl"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/belt.dmi', "utility"), ICON_OVERLAY)
		if("Emergency Response Team Medic")
			clothes_s = new /icon('icons/mob/clothing/under/centcom.dmi', "officer_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "white"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/hands.dmi', "swat_gl"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/belt.dmi', "medical"), ICON_OVERLAY)
		if("Emergency Response Team Inquisitor")
			clothes_s = new /icon('icons/mob/clothing/under/centcom.dmi', "officer_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "jackboots"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/hands.dmi', "swat_gl"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/belt.dmi', "claymore"), ICON_OVERLAY)
		if("Emergency Response Team Janitor")
			clothes_s = new /icon('icons/mob/clothing/under/centcom.dmi', "officer_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "galoshes"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/hands.dmi', "swat_gl"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/belt.dmi', "janibelt"), ICON_OVERLAY)
		if("Emergency Response Team Leader")
			clothes_s = new /icon('icons/mob/clothing/under/centcom.dmi', "officer_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "laceups"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/hands.dmi', "wgloves"), ICON_UNDERLAY)
		if("Emergency Response Team Member")
			clothes_s = new /icon('icons/mob/clothing/under/centcom.dmi', "officer_s")
			clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "jackboots"), ICON_UNDERLAY)
			clothes_s.Blend(new /icon('icons/mob/clothing/hands.dmi', "swat_gl"), ICON_UNDERLAY)
		if("Naked")
			clothes_s = null
		else
			if(H.mind && (H.mind.assigned_role in get_all_centcom_jobs()))
				clothes_s = new /icon('icons/mob/clothing/under/centcom.dmi', "officer_s")
				clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "laceups"), ICON_UNDERLAY)
			else
				clothes_s = new /icon('icons/mob/clothing/under/color.dmi', "grey_s")
				clothes_s.Blend(new /icon('icons/mob/clothing/feet.dmi', "black"), ICON_UNDERLAY)

	preview_icon.Blend(face_s, ICON_OVERLAY) // Why do we do this twice
	if(clothes_s)
		preview_icon.Blend(clothes_s, ICON_OVERLAY)
	//Bus body accessories that go over clothes.
	if(H.body_accessory && istype(H.body_accessory, /datum/body_accessory/body))
		temp = new/icon("icon" = H.body_accessory.icon, "icon_state" = H.body_accessory.icon_state)
		if(H.body_accessory.pixel_x_offset)
			temp.Shift(EAST, H.body_accessory.pixel_x_offset)
		if(H.body_accessory.pixel_y_offset)
			temp.Shift(NORTH, H.body_accessory.pixel_y_offset)
		if(H.dna.species.bodyflags & HAS_SKIN_COLOR)
			temp.Blend(H.skin_colour, H.body_accessory.blend_mode)
		if(t_marking_s)
			temp.Blend(t_marking_s, ICON_OVERLAY)
		preview_icon.Blend(temp, ICON_OVERLAY)

	preview_icon.Blend(hands_icon, ICON_OVERLAY)
	qdel(face_s)
	qdel(clothes_s)

	return preview_icon
