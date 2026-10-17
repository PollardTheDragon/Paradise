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

/obj/structure/salvage_bench/item_interaction(mob/living/user, obj/item/used, list/modifiers)
	if(user.a_intent != INTENT_HELP)
		return ..()
	if(istype(used, /obj/item/salvage_decryptor_schematic))
		if(salvage_decryptor_schematic)
			to_chat(user, SPAN_NOTICE("[src] already has an open schematic! Remove that first!"))
			return
		if(used.flags & NODROP || !user.transfer_item_to(used, src))
			to_chat(user, SPAN_WARNING("[used] is stuck to your hand!"))
			return ITEM_INTERACT_COMPLETE
		decryptor_schematic = used
		to_chat(user, SPAN_WARNING("You roll [used] out on [src]."))
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
	/// Icon state used in salvage bench overlays
	var/overlay_state
	/// What decryptor do we make
	var/decryptor_type
	/// What materials do we need to assemble the decryptor
	var/list/required_items = list()

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

