/obj/item/kitchen/knife/smithed
	name = "debug smithed knife"
	desc = "This is bad. If you see me, notify development."
	icon = 'icons/obj/smithing.dmi'
	icon_state = "debug"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_BELT
	/// The quality of the item
	var/datum/smith_quality/quality
	/// The material of the item
	var/datum/smith_material/material
	/// Base Speed modifier
	var/base_speed_mod = 0
	/// Speed modifier
	var/speed_mod = 1.0
	/// Base productivity modifier
	var/base_productivity_mod = 0
	/// Productivity mod
	var/productivity_mod = 1.0
	/// damage increase
	var/force_increase = 0
	/// throw damage increase
	var/throw_force_increase = 0
	/// throw embed chance increase
	var/embed_chance_increase = 0
	/// Handle wrappings
	var/wrap_type

/obj/item/kitchen/knife/smithed/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_BIT_ATTACH, PROC_REF(add_bit))
	RegisterSignal(src, COMSIG_CLICK_ALT, PROC_REF(remove_bit))
	set_name()
	set_stats()

/obj/item/kitchen/knife/smithed/proc/set_name()
	if(!quality)
		return
	if(!material)
		name = "[quality.name] " + name
		return
	name = "[quality.name] [material.name] [initial(name)]"

/obj/item/kitchen/knife/smithed/proc/set_stats()
	speed_mod = 1 + (base_speed_mod * quality.stat_mult * material.tool_speed_mult)
	productivity_mod = 1 + (base_productivity_mod * quality.stat_mult * material.tool_productivity_mult)
	force_increase = initial(force_increase) * quality.force_increase * material.force_increase
	throw_force_increase = initial(throw_force_increase) * quality.throw_force_increase * material.throw_force_increase
	embed_chance_increase = initial(embed_chance_increase) * quality.embed_chance_increase * material.embed_chance_increase
	// Now we adjust the item's actual stats
	force = initial(force) + force_increase
	throwforce = initial(throwforce) + throw_force_increase
	embed_chance = initial(embed_chance) + embed_chance_increase
	// We adjust bit productivity and similar stats here because they are one and the same
	bit_productivity_mod = initial(bit_productivity_mod) * productivity_mod
	toolspeed = initial(toolspeed) * speed_mod

	// Color
	color = material.color_tint
	// Radioactive baby
	if((material == /datum/smith_material/uranium || istype(material, /datum/smith_material/uranium)) && quality)
		var/datum/component/inherent_radioactivity/radioactivity = AddComponent(/datum/component/inherent_radioactivity, 100 * quality.stat_mult, 0, 0, 1.5)
		START_PROCESSING(SSradiation, radioactivity)

/obj/item/kitchen/knife/smithed/proc/attach_wrapping(/datum/handle_wrapping/wrap)
	force += wrap.force_increase
	throwforce += wrap.throw_force_increase
	toolspeed += wrap.speed_mod
	bit_productivity_mod += wrap.productivity_mod
	embed_chance += wrap.embed_chance_increase

/obj/item/kitchen/knife/smithed/item_interaction(mob/living/user, obj/item/used, list/modifiers)
	. = ..()
	if(!isstack(used))
		return ITEM_INTERACT_COMPLETE
	var/item/stack/stacked_item = used
	var/wrap_type
	switch(stacked_item.type)
		if(/obj/item/stack/cable_coil)
			wrap_type = /datum/handle_wrapping/cable
		if(/obj/item/stack/sheet/cloth)
			wrap_type = /datum/handle_wrapping/cloth
		if(/obj/item/stack/sheet/durathread)
			wrap_type = /datum/handle_wrapping/durathread
		if(/obj/item/stack/sheet/leather)
			wrap_type = /datum/handle_wrapping/leather
		if(/obj/item/stack/sheet/animalhide/goliath_hide)
			wrap_type = /datum/handle_wrapping/goliath_hide
		else
			return ITEM_INTERACT_COMPLETE
	if(do_after_once(user, 10 SECONDS, target = src))
		if(stacked_item.use(5))
			attach_wrapping(wrap_type)
			return ITEM_INTERACT_COMPLETE

/obj/item/kitchen/knife/smithed/utility
	name = "utility knife"
	desc = "A custom-made knife designed for general purpose use."
	icon_state = "utility_knife"
	base_speed_mod = 0.25
	base_productivity_mod = 0.25

/obj/item/kitchen/knife/smithed/thrown
	name = "throwing knife"
	desc = "A lightweight, balanced throwing knife. The sharp blade enhances the chance to embed."
	icon_state = "throwing_knife"
	base_speed_mod = -0.25
	base_productivity_mod = -0.25
	throw_force_increase = 6 // 16 throw force at standard, 22 throw force at masterwork
	embed_chance_increase = 25 // +25% chance to embed at standard, +50% at masterwork

/obj/item/kitchen/knife/smithed/combat
	name = "combat knife"
	desc = "A heavyweight, toothed-edge combat knife. The thick blade is designed to rip and tear, and it has an integrated bayonet mount."
	icon_state = "combat_knife"
	base_productivity_mod = -0.25
	force_increase = 6 // 16 force at standard, 22 force at masterwork
	embed_chance_increase = 5
	bayonet = TRUE
