/obj/item/storage/salvage_crate
	name = "base salvage crate"
	desc = "A sealed crate full of unknown salvage."
	icon = 'icons/obj/salvage/salvage_crates.dmi'
	icon_state = "salvage"
	base_icon_state = "salvage"
	/// Has this salvage crate been opened yet?
	var/opened = FALSE
	/// Is this salvage crate still locked
	var/locked = TRUE
	/// Is this salvage crate being unlocked
	var/unlocking = FALSE
	/// The loot table to spawn items from
	var/datum/salvage_loot_table/loot_datum = /datum/salvage_loot_table
	/// Minimum amount of loot items to spawn
	var/minimum_loot = 1
	/// Maximum amount of loot items to spawn
	var/maximum_loot = 4
	/// Tier of salvage. Determines specific loot to spawn
	var/salvage_tier = 1

/obj/item/storage/salvage_crate/Initialize(mapload)
	. = ..()
	update_appearance(UPDATE_OVERLAYS)

/obj/item/storage/salvage_crate/examine()
	. = ..()
	if(locked)
		. += SPAN_NOTICE("It looks like a multitool could help in unlocking this crate.")
	if(!opened)
		. += SPAN_NOTICE("A small beacon flashes on the crate. It hasn't been tampered with.")

/obj/item/storage/salvage_crate/update_icon_state()
	. = ..()
	icon_state = "[base_icon_state][living_viewers() ? "_open" : ""]"

/obj/item/storage/salvage_crate/update_overlays()
	. = ..()
	if(unlocking)
		. += image(icon = icon, icon_state = "crate_unlocking")
	else
		. += image(icon = icon, icon_state = "[locked ? "crate_locked" : "crate_unlocked"]")
	if(!opened)
		. += image(icon = icon, icon_state = "crate_unopened")

/obj/item/storage/salvage_crate/populate_contents()
	var/loot_to_spawn = rand(minimum_loot, maximum_loot)
	while(loot_to_spawn > 0)
		var/list/loot_table = list()
		switch(salvage_tier)
			if(2)
				loot_table = loot_datum.uncommon_loot
			if(3)
				loot_table = loot_datum.rare_loot
			if(4)
				loot_table = loot_datum.ultra_loot
			else
				loot_table = loot_datum.common_loot
		var/loot_type = pickweight(loot_table)
		if(!loot_type) // Break out if this shit is ever null
			log_debug("Attempted to create a [name] with null loot.")
			break
		var/atom/loot_atom = new loot_type(src)
		if(isitem(loot_atom))
			var/obj/item/loot_item = loot_atom
			loot_item.researchable = FALSE
		loot_to_spawn--

/obj/item/storage/salvage_crate/open(mob/user)
	if(locked)
		to_chat(user, SPAN_NOTICE("[src] is locked!"))
		return
	if(!opened)
		opened = TRUE
		update_appearance(UPDATE_OVERLAYS)
	. = ..()
	if(living_viewers())
		flick("[icon_state]_opening", src)
	update_appearance(UPDATE_ICON_STATE)
	for(var/mob/M in src.contents)
		M.forceMove(get_turf(src))
	for(var/obj/item/grenade/bomb in src.contents)
		if(prob(75))
			bomb.forceMove(get_turf(src))
			bomb.prime()

/obj/item/storage/salvage_crate/close(mob/user)
	. = ..()
	if(!living_viewers()) // I know it's inverse of open but if it ain't done this way you get broken animations
		update_appearance(UPDATE_ICON_STATE)
		flick("[icon_state]_closing", src)

/obj/item/storage/salvage_crate/try_insert_item(obj/item/I, mob/user)
	if(locked)
		return
	if(!opened)
		return
	. = ..()

/obj/item/storage/salvage_crate/multitool_act(mob/living/user, obj/item/I)
	if(!locked)
		to_chat(user, SPAN_NOTICE("[src] is already unlocked!"))
		return
	visible_message(
			SPAN_NOTICE("[user] connects [I] to [src] and starts to unlock it."),
			SPAN_NOTICE("[user] connects [I] to [src] and starts to unlock it."),
			SPAN_NOTICE("You hear something unlocking.")
	)
	unlocking = TRUE
	update_appearance(UPDATE_OVERLAYS)
	if(!do_after_once(user, 1 SECONDS, target = src))
		unlocking = FALSE
		update_appearance(UPDATE_OVERLAYS)
		return
	unlocking = FALSE
	locked = FALSE
	update_appearance(UPDATE_OVERLAYS)

/obj/item/storage/salvage_crate/proc/living_viewers()
	for(var/mob/M in mobs_viewing)
		if(!isobserver(M))
			return TRUE
	return FALSE

/obj/item/storage/salvage_crate/salvage
	name = "salvage crate"

/obj/item/storage/salvage_crate/illegal
	name = "operative dead drop"
	icon_state = "illegal"
	base_icon_state = "illegal"

/obj/item/storage/salvage_crate/parts
	name = "spare parts crate"
	icon_state = "parts"
	base_icon_state = "parts"

/obj/item/storage/salvage_crate/cooler
	name = "abandoned cooler"
	icon_state = "cooler"
	base_icon_state = "cooler"

/obj/item/storage/salvage_crate/lost
	name = "lost and found crate"
	icon_state = "lost"
	base_icon_state = "lost"

/obj/item/storage/salvage_crate/service
	name = "service surplus crate"
	icon_state = "service"
	base_icon_state = "service"

/obj/item/storage/salvage_crate/industrial
	name = "industrial crate"
	icon_state = "industrial"
	base_icon_state = "industrial"

/obj/item/storage/salvage_crate/freezer
	name = "deep freezer"
	icon_state = "freezer"
	base_icon_state = "freezer"

/obj/item/storage/salvage_crate/med
	name = "dated medicine crate"
	icon_state = "med"
	base_icon_state = "med"

/obj/item/storage/salvage_crate/backlog
	name = "undelivered backlog crate"
	icon_state = "backlog"
	base_icon_state = "backlog"

/obj/item/storage/salvage_crate/clown
	name = "failed comedian's footlocker"
	icon_state = "clown"
	base_icon_state = "clown"

/obj/item/storage/salvage_crate/hazmat
	name = "hazmat crate"
	icon_state = "hazmat"
	base_icon_state = "hazmat"

/obj/item/storage/salvage_crate/unstable
	name = "unstable samples crate"
	icon_state = "unstable"
	base_icon_state = "unstable"

/obj/item/storage/salvage_crate/contain
	name = "long term containment crate"
	icon_state = "contain"
	base_icon_state = "contain"

/obj/item/storage/salvage_crate/live
	name = "live samples crate"
	icon_state = "live"
	base_icon_state = "live"

/obj/item/storage/salvage_crate/exotic
	name = "exotic imports crate"
	icon_state = "exotic"
	base_icon_state = "exotic"

/obj/item/storage/salvage_crate/dno
	name = "DO NOT OPEN crate"
	icon_state = "dno"
	base_icon_state = "dno"

/obj/item/storage/salvage_crate/bluespace
	name = "bluespace crate"
	icon_state = "bluespace"
	base_icon_state = "bluespace"

/obj/item/storage/salvage_crate/ancient
	name = "ancient crate"
	icon_state = "ancient"
	base_icon_state = "ancient"

/obj/item/storage/salvage_crate/deposit
	name = "safety deposit box"
	icon_state = "deposit"
	base_icon_state = "deposit"

/obj/item/storage/salvage_crate/pandora
	name = "pandora's box"
	icon_state = "pandora"
	base_icon_state = "pandora"
