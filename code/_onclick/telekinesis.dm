/*
	Telekinesis

	This needs more thinking out, but I might as well.
*/
#define TK_MAXRANGE 15
#define TK_COOLDOWN 1.5 SECONDS
/*
	Telekinetic attack:

	By default, emulate the user's unarmed attack
*/
/atom/proc/attack_tk(mob/user)
	if(user.stat)
		return
	user.UnarmedAttack(src,0) // attack_hand, attack_paw, etc
	return

/*
	Returns: True if the target is within the 15 tile range of telekinesis and on the same z-level, false otherwise.
*/
/proc/telekinesis_range_check(mob/living/carbon/human/user, atom/target)
	return (get_dist(user, target) <= TK_MAXRANGE && user.z == target.z)

/*
	This is similar to item attack_self, but applies to anything
	that you can grab with a telekinetic grab.

	It is used for manipulating things at range, for example, opening and closing closets.
	There are not a lot of defaults at this time, add more where appropriate.
*/
/atom/proc/attack_self_tk(mob/user)
	return

/obj/attack_tk(mob/user)
	if(user.stat)
		return
	if(anchored)
		..()
		return

	var/obj/item/tk_grab/O = new(src)
	O.form_grab(user, src)

/obj/item/attack_tk(mob/user)
	if(user.stat || !isturf(loc))
		return
	if(HAS_TRAIT(user, TRAIT_TELEKINESIS) && !user.get_active_hand()) // both should already be true to get here
		var/obj/item/tk_grab/O = new(src)
		O.form_grab(user, src)
	else
		warning("Strange attack_tk(): TK([user.dna?.GetSEState(GLOB.teleblock)]) empty hand([!user.get_active_hand()])")


/mob/attack_tk(mob/user)
	return // needs more thinking about

/*
	TK Grab Item (the workhorse of old TK)

	* If you have not grabbed something, do a normal tk attack
	* If you have something, throw it at the target.  If it is already adjacent, do a normal attackby(, params)
	* If you click what you are holding, or attack_self(), do an attack_self_tk() on it.
	* Deletes itself if it is ever not in your hand, or if you should have no access to TK.
*/
/obj/item/tk_grab
	name = "Telekinetic Grab"
	desc = "Magic."
	icon = 'icons/obj/magic.dmi'//Needs sprites
	icon_state = "2"
	flags = NOBLUDGEON | ABSTRACT | DROPDEL
	//item_state = null
	w_class = WEIGHT_CLASS_GIGANTIC
	layer = ABOVE_HUD_LAYER
	plane = ABOVE_HUD_PLANE

	blocks_emissive = FALSE
	var/last_throw = 0
	var/atom/movable/focus = null
	var/mob/living/host = null

/obj/item/tk_grab/Destroy()
	if(focus)
		release_object()
	// Focus is null now
	host = null
	return ..()

/obj/item/tk_grab/dropped(mob/user)
	if(focus && user && loc != user && loc != user.loc) // drop_item() gets called when you tk-attack a table/closet with an item
		if(focus.Adjacent(loc))
			focus.forceMove(loc)
	. = ..()


	//stops TK grabs being equipped anywhere but into hands
/obj/item/tk_grab/equipped(mob/user, slot)
	if(slot & ITEM_SLOT_BOTH_HANDS)
		return
	qdel(src)


/obj/item/tk_grab/attack_self__legacy__attackchain(mob/user)
	if(focus)
		focus.attack_self_tk(user)

/obj/item/tk_grab/override_throw(mob/user, atom/target)
	afterattack__legacy__attackchain(target, user)
	return TRUE

/obj/item/tk_grab/afterattack__legacy__attackchain(atom/target , mob/living/user, proximity, params)
	if(!target || !user)
		return
	if(last_throw + TK_COOLDOWN > world.time)
		return
	if(!host || host != user)
		qdel(src)
		return
	if(!HAS_TRAIT(host, TRAIT_TELEKINESIS))
		qdel(src)
		return
	if(isobj(target) && !isturf(target.loc))
		return

	var/d = get_dist(user, target)
	if(focus)
		d = max(d,get_dist(user,focus)) // whichever is further
	if(d > TK_MAXRANGE || user.z != target.z)
		to_chat(user, "<span class='warning'>Your mind won't reach that far.</span>")
		return

	if(!focus)
		focus_object(target, user)
		return

	if(target == focus)
		target.attack_self_tk(user)
		return // todo: something like attack_self not laden with assumptions inherent to attack_self


	if(isitem(focus) && target.Adjacent(focus) && !user.in_throw_mode)
		var/obj/item/I = focus
		var/resolved = target.attackby__legacy__attackchain(I, user, params)
		if(!resolved && target && I)
			I.afterattack__legacy__attackchain(target,user,1) // for splashing with beakers


	else
		if(focus.buckled_mobs)
			to_chat(user, "<span class='notice'>This object is too heavy to move with something buckled to it!</span>")
			return
		if(length(focus.client_mobs_in_contents))
			to_chat(user, "<span class='notice'>This object is too heavy to move with something inside of it!</span>")
			return
		apply_focus_overlay()
		focus.throw_at(target, 10, 1, user)
		last_throw = world.time

/obj/item/tk_grab/attack__legacy__attackchain(mob/living/M, mob/living/user, def_zone)
	return

/obj/item/tk_grab/is_equivalent(obj/item/I)
	. = ..()
	if(!.)
		return I == focus

/obj/item/tk_grab/proc/focus_object(obj/target, mob/user)
	if(!isobj(target))
		return//Cant throw non objects atm might let it do mobs later
	if(target.anchored || !isturf(target.loc))
		qdel(src)
		return
	focus = target
	update_icon(UPDATE_OVERLAYS)
	apply_focus_overlay()
	// Make it behave like other equipment
	if(isitem(target))
		if(target in user.tkgrabbed_objects)
			// Release the old grab first
			user.drop_item_to_ground(user.tkgrabbed_objects[target])
		user.tkgrabbed_objects[target] = src

/obj/item/tk_grab/proc/release_object()
	if(!focus)
		return
	if(isitem(focus))
		// Delete the key/value pair of item to TK grab
		host.tkgrabbed_objects -= focus
	focus = null
	update_icon(UPDATE_OVERLAYS)

/obj/item/tk_grab/proc/apply_focus_overlay()
	if(!focus)
		return
	new /obj/effect/temp_visual/telekinesis(get_turf(focus))

/obj/item/tk_grab/proc/form_grab(mob/user, obj/target)
	user.put_in_active_hand(src)
	host = user
	focus_object(target, user)


/obj/item/tk_grab/update_overlays()
	. = ..()
	if(focus && focus.icon && focus.icon_state)
		. += icon(focus.icon,focus.icon_state)

#undef TK_COOLDOWN

#undef TK_MAXRANGE
