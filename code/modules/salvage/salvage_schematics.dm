// MARK: Salvage Bench
/obj/structure/salvage_bench
	name = "decryptor assembly table"
	desc = "A table used with a decryptor schematic to assemble a schematic."
	icon = 'icons/obj/salvage/salvage_tools.dmi'
	icon_state = "schematics_workbench"
	anchored = TRUE
	/// The schematic loaded into the assembly table
	var/obj/item/salvage_decryptor_schematic/decryptor_schematic
	/// The ingredients inside the table
	var/list/stored_items = list()

/obj/structure/salvage_bench/examine(mob/user)
	. = ..()
	if(decryptor_schematic)
		. += SPAN_NOTICE("Currently displaying [decryptor_schematic].")
		. += SPAN_NOTICE("[decryptor_schematic] requires the following components:")
		var/list/checked_schematic_ingredients = list()
		var/list/required_items = decryptor_schematic.required_items
		for(var/obj/item/schematic_ingredient in required_items)
			if(schematic_ingredient in checked_schematic_ingredients)
				continue
			var/count = count_by_type(required_items, schematic_ingredient)
			. += SPAN_NOTICE("- [schematic_ingredient] x[count]")
			checked_schematic_ingredients += schematic_ingredient
	if(!length(stored_items))
		return
	. += ""
	. += SPAN_NOTICE("[src] contains the following items:")
	var/list/checked_ingredients = list()
	for(var/obj/item/ingredient in stored_items)
		if(ingredient in checked_ingredients)
			continue
		var/count = count_by_type(stored_items, ingredient)
		. += SPAN_NOTICE("- [ingredient] x[count]")
		checked_ingredients += ingredient

/obj/structure/salvage_bench/update_overlays()
	. = ..()
	overlays.Cut()
	if(decryptor_schematic)
		. += image(icon = icon, icon_state = decryptor_schematic.icon_state + "_workbench")

/obj/structure/salvage_bench/AltClick(mob/user, modifiers)
	. = ..()
	if(!iscarbon(user))
		return
	if(!Adjacent(user))
		return
	if(!length(stored_items))
		to_chat(user, SPAN_NOTICE("[src] has no ingredients to remove!"))
		return
	var/obj/item/item_to_remove = tgui_input_list(user, "Select an item", src, stored_items)
	user.put_in_hands(item_to_remove)
	stored_items -= item_to_remove

/obj/structure/salvage_bench/attack_hand(mob/living/user)
	. = ..()
	if(!Adjacent(user))
		return
	if(!decryptor_schematic)
		return
	if(length(stored_items))
		if(tgui_alert(user, "Are you sure you want to remove the schematic? Doing so will dump the stored ingredients out of [src]!", "Confirm Schematic Removal", list("Yes", "No")) == "No")
			return
		for(var/obj/item/I in stored_items)
			I.forceMove(get_turf(src))
			stored_items -= I
	user.put_in_hands(decryptor_schematic)
	decryptor_schematic = null
	update_appearance()

/obj/structure/salvage_bench/item_interaction(mob/living/user, obj/item/used, list/modifiers)
	if(user.a_intent != INTENT_HELP)
		return ..()
	if(istype(used, /obj/item/salvage_decryptor_schematic))
		if(decryptor_schematic)
			to_chat(user, SPAN_NOTICE("[src] already has an open schematic! Remove that first!"))
			return
		if(used.flags & NODROP || !user.transfer_item_to(used, src))
			to_chat(user, SPAN_WARNING("[used] is stuck to your hand!"))
			return ITEM_INTERACT_COMPLETE
		decryptor_schematic = used
		to_chat(user, SPAN_WARNING("You roll [used] out on [src]."))
		update_appearance()
		return
	if(!decryptor_schematic)
		to_chat(user, SPAN_NOTICE("There is no schematic open to provide components to!"))
		return
	if(!(used.type in decryptor_schematic.required_items))
		to_chat(user, SPAN_NOTICE("This object doesn't fit in [decryptor_schematic]'s requirements!"))
		return
	if(used.flags & NODROP || !user.transfer_item_to(used, src))
		to_chat(user, SPAN_WARNING("[used] is stuck to your hand!"))
		return ITEM_INTERACT_COMPLETE
	stored_items += used
	to_chat(user, SPAN_WARNING("You add [used] to [src]'s components."))

/obj/structure/salvage_bench/hammer_act(mob/living/user, obj/item/I)
	. = ..()
	// POLTODO: Schematic completion


// MARK: Salvage Schematics
/obj/item/salvage_decryptor_schematic
	name = "salvage decryptor schematic"
	desc = "A schematic that can be used to assemble a salvage decryptor."
	icon = 'icons/obj/salvage/salvage_tools.dmi'
	w_class = WEIGHT_CLASS_SMALL
	new_attack_chain = TRUE
	/// What root icon do we use
	var/icon_root = ""
	/// What decryptor do we make
	var/decryptor_type
	/// What materials do we need to assemble the decryptor
	var/list/required_items = list()

/obj/item/salvage_decryptor_schematic/Initialize(mapload)
	. = ..()
	icon_state = "mod_decryptor_" + icon_root + "_schematic"
	update_icon()

/obj/item/salvage_decryptor_schematic/examine(mob/user)
	. = ..()
	. += SPAN_NOTICE("This schematic requires the following components:")
	var/list/checked_ingredients = list()
	for(var/obj/item/ingredient in required_items)
		if(ingredient in checked_ingredients)
			continue
		var/count = count_by_type(required_items, ingredient)
		. += SPAN_NOTICE("- [ingredient] x[count]")
		checked_ingredients += ingredient

/obj/item/salvage_decryptor_schematic/illegal
	name = "dead drop decryptor schematic"
	icon_root = "drop"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/illegal

/obj/item/salvage_decryptor_schematic/parts
	name = "spare parts decryptor schematic"
	icon_root = "parts"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/parts

/obj/item/salvage_decryptor_schematic/cooler
	name = "cooler decryptor schematic"
	icon_root = "cooler"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/cooler

/obj/item/salvage_decryptor_schematic/lost
	name = "lost and found decryptor schematic"
	icon_root = "lost"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/lost

/obj/item/salvage_decryptor_schematic/service
	name = "service decryptor schematic"
	icon_root = "service"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/service

/obj/item/salvage_decryptor_schematic/industrial
	name = "industrial decryptor schematic"
	icon_root = "industrial"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/industrial

/obj/item/salvage_decryptor_schematic/freezer
	name = "deep freezer decryptor schematic"
	icon_root = "freezer"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/freezer

/obj/item/salvage_decryptor_schematic/med
	name = "dated medicine decryptor schematic"
	icon_root = "med"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/med

/obj/item/salvage_decryptor_schematic/backlog
	name = "undelivered backlog decryptor schematic"
	icon_root = "backlog"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/backlog

/obj/item/salvage_decryptor_schematic/hazmat
	name = "hazmat decryptor schematic"
	icon_root = "hazmat"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/hazmat

/obj/item/salvage_decryptor_schematic/clown
	name = "failed comedian decryptor schematic"
	icon_root = "comedian"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/clown

/obj/item/salvage_decryptor_schematic/unstable
	name = "unstable samples decryptor schematic"
	icon_root = "unstable"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/unstable

/obj/item/salvage_decryptor_schematic/contain
	name = "long term containment decryptor schematic"
	icon_root = "contain"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/contain

/obj/item/salvage_decryptor_schematic/live
	name = "live samples decryptor schematic"
	icon_root = "live"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/live

/obj/item/salvage_decryptor_schematic/exotic
	name = "exotic decryptor schematic"
	icon_root = "exotic"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/exotic

/obj/item/salvage_decryptor_schematic/dno
	name = "'Do Not Open' decryptor schematic"
	icon_root = "donot"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/dno

/obj/item/salvage_decryptor_schematic/bluespace
	name = "bluespace decryptor schematic"
	icon_root = "bluespace"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/bluespace

/obj/item/salvage_decryptor_schematic/ancient
	name = "ancient decryptor schematic"
	icon_root = "ancient"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/ancient

/obj/item/salvage_decryptor_schematic/deposit
	name = "deposit decryptor schematic"
	icon_root = "deposit"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/deposit

/obj/item/salvage_decryptor_schematic/pandora
	name = "'Pandora' decryptor schematic"
	icon_root = "pandora"
	required_items = list()
	decryptor_type = /obj/item/salvage_decryptor/pandora

// MARK: Salvage Decryptors
/obj/item/salvage_decryptor
	name = "salvage decryptor"
	desc = "A thrown together upgrade for a salvage scanner that will seek out more specialized crates. The circuitry is delicate and prone to overloading."
	icon = 'icons/obj/salvage/salvage_tools.dmi'
	w_class = WEIGHT_CLASS_SMALL
	new_attack_chain = TRUE
	/// What root icon do we use
	var/icon_root = ""
	/// What crate do we help find
	var/crate_type
	/// How much do we improve our odds of finding the crate we want
	var/weight_increase = 1500 // Huge bonus
	/// What is our durability
	var/durability = 6 // 6 uses

/obj/item/salvage_decryptor/Initialize(mapload)
	. = ..()
	icon_state = "mod_decryptor_" + icon_root
	update_icon()

/obj/item/salvage_decryptor/illegal
	name = "dead drop decryptor"
	icon_root = "drop"
	crate_type = /obj/item/storage/salvage_crate/illegal

/obj/item/salvage_decryptor/parts
	name = "spare parts decryptor"
	icon_root = "parts"
	crate_type = /obj/item/storage/salvage_crate/parts

/obj/item/salvage_decryptor/cooler
	name = "cooler decryptor"
	icon_root = "cooler"
	crate_type = /obj/item/storage/salvage_crate/cooler

/obj/item/salvage_decryptor/lost
	name = "lost and found decryptor"
	icon_root = "lost"
	crate_type = /obj/item/storage/salvage_crate/lost

/obj/item/salvage_decryptor/service
	name = "service decryptor"
	icon_root = "service"
	crate_type = /obj/item/storage/salvage_crate/service

/obj/item/salvage_decryptor/industrial
	name = "industrial decryptor"
	icon_root = "industrial"
	crate_type = /obj/item/storage/salvage_crate/industrial

/obj/item/salvage_decryptor/freezer
	name = "deep freezer decryptor"
	icon_root = "freezer"
	crate_type = /obj/item/storage/salvage_crate/freezer

/obj/item/salvage_decryptor/med
	name = "dated medicine decryptor"
	icon_root = "med"
	crate_type = /obj/item/storage/salvage_crate/med

/obj/item/salvage_decryptor/backlog
	name = "undelivered backlog decryptor"
	icon_root = "backlog"
	crate_type = /obj/item/storage/salvage_crate/backlog

/obj/item/salvage_decryptor/hazmat
	name = "hazmat decryptor"
	icon_root = "hazmat"
	crate_type = /obj/item/storage/salvage_crate/hazmat

/obj/item/salvage_decryptor/clown
	name = "failed comedian decryptor"
	icon_root = "comedian"
	crate_type = /obj/item/storage/salvage_crate/clown

/obj/item/salvage_decryptor/unstable
	name = "unstable samples decryptor"
	icon_root = "unstable"
	crate_type = /obj/item/storage/salvage_crate/unstable

/obj/item/salvage_decryptor/contain
	name = "long term containment decryptor"
	icon_root = "contain"
	crate_type = /obj/item/storage/salvage_crate/contain

/obj/item/salvage_decryptor/live
	name = "live samples decryptor"
	icon_root = "live"
	crate_type = /obj/item/storage/salvage_crate/live

/obj/item/salvage_decryptor/exotic
	name = "exotic decryptor"
	icon_root = "exotic"
	crate_type = /obj/item/storage/salvage_crate/exotic

/obj/item/salvage_decryptor/dno
	name = "'Do Not Open' decryptor"
	icon_root = "donot"
	crate_type = /obj/item/storage/salvage_crate/dno

/obj/item/salvage_decryptor/bluespace
	name = "bluespace decryptor"
	icon_root = "bluespace"
	crate_type = /obj/item/storage/salvage_crate/bluespace

/obj/item/salvage_decryptor/ancient
	name = "ancient decryptor"
	icon_root = "ancient"
	crate_type = /obj/item/storage/salvage_crate/ancient

/obj/item/salvage_decryptor/deposit
	name = "deposit decryptor"
	icon_root = "deposit"
	crate_type = /obj/item/storage/salvage_crate/deposit

/obj/item/salvage_decryptor/pandora
	name = "'Pandora' decryptor"
	icon_root = "pandora"
	crate_type = /obj/item/storage/salvage_crate/pandora

/obj/item/broken_decryptor
	name = "burned-out salvage decryptor"
	desc = SPAN_WARNING("The board is charred and smells of burnt plastic. It has been rendered useless.")
	icon = 'icons/obj/module.dmi'
	icon_state = "command_broken"
	materials = list(MAT_PLASTIC = 250)
