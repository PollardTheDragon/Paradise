#define SCAN_OVERLAY_COLD "salvage_scanner_cold"
#define SCAN_OVERLAY_WARM "salvage_scanner_warm"
#define SCAN_OVERLAY_HOT "salvage_scanner_hot"

// MARK: Salvage Scanner
/obj/item/salvage_scanner
	name = "salvage scanner"
	desc = "A handheld monitor that scans the surrounding area for salvage."
	icon = 'icons/obj/salvage/salvage_tools.dmi'
	icon_state = "salvage_scanner"
	base_icon_state = "salvage"
	flags = CONDUCT
	slot_flags = ITEM_SLOT_PDA | ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_SMALL
	force = 5
	throwforce = 8 // You try getting domed with a metal handheld computer. Shit hurts.
	materials = list(MAT_METAL=500)
	new_attack_chain = TRUE
	/// Are we actively scanning for salvage?
	var/scanning
	/// How close is the closest scanned object?
	var/scan_distance
	/// Current overlay type
	var/scan_overlay = SCAN_OVERLAY_COLD

/obj/item/salvage_scanner/Destroy()
	STOP_PROCESSING(SSfastprocess, src)
	return ..()

/obj/item/salvage_scanner/process()
	scan_distance = 250 // Really high value to start
	var/off_z = TRUE
	var/new_icon
	for(var/atom/A in GLOB.salvage_objects)
		if(A.z != z)
			continue
		off_z = FALSE
		var/dist = get_dist(get_turf(A), get_turf(src))
		if(scan_distance < dist)
			continue
		scan_distance = dist
		if(dist > 7)
			new_icon = SCAN_OVERLAY_COLD
			continue
		if(dist > 3)
			new_icon = SCAN_OVERLAY_WARM
			continue
		new_icon = SCAN_OVERLAY_HOT
		break // It can't get any warmer, stop the loop
	if(off_z)
		new_icon = SCAN_OVERLAY_COLD
	if(new_icon != icon_state)
		icon_state = new_icon
		update_appearance(UPDATE_ICON_STATE)

/obj/item/salvage_scanner/activate_self(mob/user)
	..()
	toggle_state()
	add_fingerprint(user)
	return ITEM_INTERACT_COMPLETE

/obj/item/salvage_scanner/proc/toggle_state(mob/user)
	to_chat(user, SPAN_NOTICE("You turn [src] [scanning ? "off" : "on"]."))
	scanning = !scanning
	if(!scanning)
		STOP_PROCESSING(SSfastprocess, src)
		icon_state = "salvage_scanner"
		update_appearance(UPDATE_ICON_STATE)
		return
	START_PROCESSING(SSfastprocess, src)

//MARK: Salvage Detector
/obj/item/salvage_detector
	name = "salvage detector"
	desc = "A device resembling a metal detector that is fine-tuned to locate and extract valuable salvage."
	icon = 'icons/obj/salvage/salvage_tools.dmi'
	icon_state = "salvage_sniffer"
	flags = CONDUCT
	slot_flags = ITEM_SLOT_BELT
	force = 7
	throwforce = 7
	materials = list(MAT_METAL=2000)
	new_attack_chain = TRUE
	/// How fast do we scan
	var/scan_time = 6 SECONDS
	/// The installed decryptor chip
	var/decryptor

/obj/item/salvage_detector/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_BIT_ATTACH, PROC_REF(add_bit))
	RegisterSignal(src, COMSIG_CLICK_ALT, PROC_REF(remove_bit))

/obj/item/salvage_detector/attack_obj(obj/attacked_obj, mob/living/user, params)
	if(user.a_intent != INTENT_HELP)
		return ..()
	if(attacked_obj.has_salvage)
		extract_salvage(attacked_obj, user)
	return FALSE

/obj/item/salvage_detector/add_bit(atom/source, obj/item/smithed_item/tool_bit/bit, mob/user)
	. = ..()
	scan_time = scan_time * bit.speed_mod

/obj/item/salvage_detector/remove_bit(atom/source, mob/user)

	var/obj/item/smithed_item/tool_bit/old_bit = attached_bits[1]
	scan_time = scan_time / old_bit.speed_mod
	. = ..()

/obj/item/salvage_detector/item_interaction(mob/living/user, obj/item/used, list/modifiers)
	// POLTODO: Salvage Decryptors
	. = ..()

/obj/item/salvage_detector/proc/extract_salvage(obj/target, mob/living/user)
	playsound(get_turf(src), 'sound/items/metal_detector.ogg', 40, FALSE)
	target.visible_message(
		SPAN_NOTICE("[user] starts to scan [target]."),
		SPAN_NOTICE("You start to scan [target]."),
		SPAN_NOTICE("You hear electronic beeping.")
	)
	if(!do_after_once(user, 6 SECONDS, TRUE, target = target))
		to_chat(user, SPAN_NOTICE("You fail to scan [target]."))
		return
	if(!target.has_salvage)
		to_chat(user, SPAN_WARNING("Whatever salvage [target] had is gone!"))
		return
	to_chat("You scan [target] and find a piece of salvage!")
	var/obj/item/storage/salvage_crate/salvage = new()
	user.put_in_hands(salvage)
	for(var/obj/item/smithed_item/tool_bit/bit in attached_bits)
		bit.damage_bit(rand(5, 10)) // Bits don't last long in this thing. Scan wisely.
	target.has_salvage = FALSE
	GLOB.salvage_objects -= target

// MARK: Salvage Decryptor

#undef SCAN_OVERLAY_COLD
#undef SCAN_OVERLAY_WARM
#undef SCAN_OVERLAY_HOT
