// ADDING A NEW BOUNTY
// new /datum/supply_bounty(TYPE, IS_EXACT, QUANTITY, REWARD, EXTRA REWARD)
#define SUPPLY_BOUNTY_QUANTITY_ONE 1
#define SUPPLY_BOUNTY_QUANTITY_LOW 3
#define SUPPLY_BOUNTY_QUANTITY_MEDIUM 5
#define SUPPLY_BOUNTY_QUANTITY_HIGH 10
#define SUPPLY_BOUNTY_QUANTITY_BULK 25

#define SUPPLY_BOUNTY_REWARD_CHEAP 25
#define SUPPLY_BOUNTY_REWARD_LOW 50
#define SUPPLY_BOUNTY_REWARD_MEDIUM 75
#define SUPPLY_BOUNTY_REWARD_HIGH 100
#define SUPPLY_BOUNTY_REWARD_GRAND 200
/// List of all bounty datums.
GLOBAL_LIST_INIT(supply_bounties, list(
	/// MARK: GENERAL
	new /datum/supply_bounty(/obj/item/folder, 				FALSE, 			SUPPLY_BOUNTY_QUANTITY_MEDIUM, 		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/pen, 				FALSE, 			SUPPLY_BOUNTY_QUANTITY_MEDIUM, 		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/paper_bin, 			FALSE, 			SUPPLY_BOUNTY_QUANTITY_LOW, 		SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/stamp/granted, 		FALSE, 			SUPPLY_BOUNTY_QUANTITY_ONE, 		SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/stamp/denied, 		FALSE, 			SUPPLY_BOUNTY_QUANTITY_ONE, 		SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/toner, 				FALSE, 			SUPPLY_BOUNTY_QUANTITY_LOW, 		SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/camera_film,			FALSE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/camera,				FALSE,			SUPPLY_BOUNTY_QUANTITY_ONE,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/taperecorder,			FALSE,			SUPPLY_BOUNTY_QUANTITY_ONE,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/storage/fancy/cigarettes,				FALSE,			SUPPLY_BOUNTY_QUANTITY_MEDIUM,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/paicard,				FALSE,			SUPPLY_BOUNTY_QUANTITY_ONE,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/food/chips
	new /datum/supply_bounty(/obj/item/food/twimsts
	new /datum/supply_bounty(/obj/item/food/sosjerky
	new /datum/supply_bounty(/obj/item/food/no_raisin
	new /datum/supply_bounty(/obj/item/food/pistachios
	new /datum/supply_bounty(/obj/item/food/spacetwinkie
	new /datum/supply_bounty(/obj/item/food/cheesiehonkers
	new /datum/supply_bounty(/obj/item/food/tastybread
	new /datum/supply_bounty(/obj/item/food/deluxe_chocolate_bar
	new /datum/supply_bounty(/obj/item/food/stroopwafel
	new /datum/supply_bounty(/obj/item/food/chinese/chowmein
	new /datum/supply_bounty(/obj/item/food/chinese/tao
	new /datum/supply_bounty(/obj/item/food/chinese/sweetsourchickenball
	new /datum/supply_bounty(/obj/item/food/chinese/newdles
	new /datum/supply_bounty(/obj/item/food/chinese/rice
	new /datum/supply_bounty(/obj/item/food/fortunecookie

	// MARK: SUPPLY
	new /datum/supply_bounty(/obj/item/wrench, 				TRUE, 			SUPPLY_BOUNTY_QUANTITY_HIGH, 		SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/supply_bounty(/obj/item/crowbar, 			TRUE, 			SUPPLY_BOUNTY_QUANTITY_HIGH, 		SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/supply_bounty(/obj/item/screwdriver, 		TRUE, 			SUPPLY_BOUNTY_QUANTITY_HIGH, 		SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/supply_bounty(/obj/item/wirecutters, 		TRUE, 			SUPPLY_BOUNTY_QUANTITY_HIGH, 		SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/supply_bounty(/obj/item/multitool, 			TRUE, 			SUPPLY_BOUNTY_QUANTITY_HIGH, 		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/wrench,				TRUE,			SUPPLY_BOUNTY_QUANTITY_HIGH,		SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/supply_bounty(/obj/item/stack/wrapping_paper, TRUE,			SUPPLY_BOUNTY_QUANTITY_ONE,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/storage/toolbox,		FALSE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/rcs,					TRUE,			SUPPLY_BOUNTY_QUANTITY_ONE,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/hand_labeler,		TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/stack/tape_roll,		TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/pickaxe,				FALSE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/shovel,				TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/extinguisher/mini,	TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/resonator,			FALSE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_HIGH),
	new /datum/supply_bounty(/obj/item/mining_scanner,		FALSE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/stack/sheet/animalhide,		TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/stack/sheet/sinew,			TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/stack/sheet/bone,			TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/gps,					TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/organ/internal/regenerative_core,	TRUE,	SUPPLY_BOUNTY_QUANTITY_ONE,	SUPPLY_BOUNTY_REWARD_HIGH), // good luck shipping these on time
	new /datum/supply_bounty(/obj/item/wormhole_jaunter,			TRUE,	SUPPLY_BOUNTY_QUANTITY_ONE,			SUPPLY_BOUNTY_REWARD_HIGH),
	new /datum/supply_bounty(/obj/item/stack/marker_beacon,			TRUE,	SUPPLY_BOUNTY_QUANTITY_ONE,			SUPPLY_BOUNTY_REWARD_MEDIUM),


	// MARK: SERVICE
	new /datum/supply_bounty(/obj/item/soap,				FALSE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/supply_bounty(/obj/item/soap/syndie,			FALSE,			SUPPLY_BOUNTY_QUANTITY_ONE,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/mop,					TRUE,			SUPPLY_BOUNTY_QUANTITY_ONE,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/mop/advanced,		FALSE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(/obj/item/caution,				TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/push_broom,			TRUE,			SUPPLY_BOUNTY_QUANTITY_ONE,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/supply_bounty(obj/item/reagent_containers/glass/bucket, TRUE, SUPPLY_BOUNTY_QUANTITY_MEDIUM,		SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/supply_bounty(/obj/item/reagent_containers/spray, TRUE,		SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/gin,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/whiskey,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/tequila,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/vodka,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/vermouth,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/rum,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/wine,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bag/goonbag,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/cognac,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/kahlua,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/beer,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/ale,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/cans/synthanol,	TRUE,	SUPPLY_BOUNTY_QUANTITY_MEDIUM,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/orangejuice,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/tomatojuice,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/limejuice,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/bottle/cream,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/cans/tonic,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/cans/cola,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/cans/electrolytes,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/cans/sodawater,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/cans/ginger_ale,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/drinkingglass,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/drinkingglass/shotglass,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/supply_bounty(/obj/item/reagent_containers/drinks/ice,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/seeds/aloe
	new /datum/supply_bounty(/obj/item/seeds/ambrosia
	new /datum/supply_bounty(/obj/item/seeds/apple
	new /datum/supply_bounty(/obj/item/seeds/bamboo
	new /datum/supply_bounty(/obj/item/seeds/banana
	new /datum/supply_bounty(/obj/item/seeds/berry
	new /datum/supply_bounty(/obj/item/seeds/cabbage
	new /datum/supply_bounty(/obj/item/seeds/carrot
	new /datum/supply_bounty(/obj/item/seeds/cassava
	new /datum/supply_bounty(/obj/item/seeds/cherry
	new /datum/supply_bounty(/obj/item/seeds/chanter
	new /datum/supply_bounty(/obj/item/seeds/chili
	new /datum/supply_bounty(/obj/item/seeds/cocoapod
	new /datum/supply_bounty(/obj/item/seeds/coffee
	new /datum/supply_bounty(/obj/item/seeds/comfrey
	new /datum/supply_bounty(/obj/item/seeds/corn
	new /datum/supply_bounty(/obj/item/seeds/cotton
	new /datum/supply_bounty(/obj/item/seeds/nymph
	new /datum/supply_bounty(/obj/item/seeds/eggplant
	new /datum/supply_bounty(/obj/item/seeds/garlic
	new /datum/supply_bounty(/obj/item/seeds/glowshroom
	new /datum/supply_bounty(/obj/item/seeds/grape
	new /datum/supply_bounty(/obj/item/seeds/grass
	new /datum/supply_bounty(/obj/item/seeds/harebell
	new /datum/supply_bounty(/obj/item/seeds/lemon
	new /datum/supply_bounty(/obj/item/seeds/lettuce
	new /datum/supply_bounty(/obj/item/seeds/lime
	new /datum/supply_bounty(/obj/item/seeds/mint
	new /datum/supply_bounty(/obj/item/seeds/olive
	new /datum/supply_bounty(/obj/item/seeds/onion
	new /datum/supply_bounty(/obj/item/seeds/orange
	new /datum/supply_bounty(/obj/item/seeds/peanuts
	new /datum/supply_bounty(/obj/item/seeds/pineapple
	new /datum/supply_bounty(/obj/item/seeds/plum
	new /datum/supply_bounty(/obj/item/seeds/poppy
	new /datum/supply_bounty(/obj/item/seeds/potato
	new /datum/supply_bounty(/obj/item/seeds/pumpkin
	new /datum/supply_bounty(/obj/item/seeds/wheat/rice
	new /datum/supply_bounty(/obj/item/seeds/soya
	new /datum/supply_bounty(/obj/item/seeds/sugarcane
	new /datum/supply_bounty(/obj/item/seeds/sunflower
	new /datum/supply_bounty(/obj/item/seeds/tea
	new /datum/supply_bounty(/obj/item/seeds/tobacco
	new /datum/supply_bounty(/obj/item/seeds/tomato
	new /datum/supply_bounty(/obj/item/seeds/tower
	new /datum/supply_bounty(/obj/item/seeds/watermelon
	new /datum/supply_bounty(/obj/item/seeds/wheat
	new /datum/supply_bounty(/obj/item/seeds/whitebeet
	new /datum/supply_bounty(/obj/item/seeds/cannabis
	new /datum/supply_bounty(/obj/item/seeds/amanita
	new /datum/supply_bounty(/obj/item/seeds/fungus
	new /datum/supply_bounty(/obj/item/seeds/liberty
	new /datum/supply_bounty(/obj/item/seeds/nettle
	new /datum/supply_bounty(/obj/item/seeds/plump
	new /datum/supply_bounty(/obj/item/seeds/reishi
	new /datum/supply_bounty(/obj/item/seeds/starthistle
	new /datum/supply_bounty(/obj/item/food/grown/banana
	new /datum/supply_bounty(/obj/item/food/grown/potato
	new /datum/supply_bounty(/obj/item/food/grown/tomato
	new /datum/supply_bounty(/obj/item/food/grown/ambrosia
	new /datum/supply_bounty(/obj/item/food/grown/ambrosia/deus
	new /datum/supply_bounty(/obj/item/food/grown/poppy
	new /datum/supply_bounty(/obj/item/food/grown/harebell
	new /datum/supply_bounty(/obj/item/food/rations/liquidfood
	new /datum/supply_bounty(/obj/item/food/sliced/bread/food
	// MARK: FOODS
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(
	new /datum/supply_bounty(


	// MARK: SCIENCE


	// MARK: MEDICAL
	new /datum/medical_bounty(/obj/item/scalpel, 			TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/scalpel/laser, 			TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/scalpel/laser/manager, 			TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/cautery,				TRUE, 			SUPPLY_BOUNTY_QUANTITY_LOW, 		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/hemostat,			TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/retractor,			TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/fix_o_vein,			TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/surgicaldrill,		TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/circular_saw,		TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW, 		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/bonegel,				TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/bonesetter,			TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/dissector,			TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/surgical_drapes,		TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/stack/medical/burn_pack	TRUE,		SUPPLY_BOUNTY_QUANTITY_MEDIUM,		SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/medical_bounty(/obj/item/stack/medical/bruise_pack	FALSE,	SUPPLY_BOUNTY_QUANTITY_MEDIUM,		SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/medical_bounty(/obj/item/stack/medical/ointment		FALSE,	SUPPLY_BOUNTY_QUANTITY_MEDIUM,		SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/medical_bounty(/obj/item/reagent_containers/syringe/charcoal		TRUE, 	SUPPLY_BOUNTY_QUANTITY_HIGH,		SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/medical_bounty(/obj/item/reagent_containers/hypospray/autoinjector/epinephrine	TRUE,	SUPPLY_BOUNTY_QUANTITY_HIGH,	SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/medical_bounty(/obj/item/stack/medical/splint		TRUE		SUPPLY_BOUNTY_QUANTITY_HIGH,		SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/medical_bounty(/obj/item/stack/medical/suture,	TRUE,		SUPPLY_BOUNTY_QUANTITY_MEDIUM,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/stack/medical/suture/emergency,	TRUE,	SUPPLY_BOUNTY_QUANTITY_HIGH,	SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/medical_bounty(/obj/item/stack/medical/suture/medicated, TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/stack/medical/suture/regen_mesh/advanced	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/stack/medical/suture/regen_mesh,	TRUE,	SUPPLY_BOUNTY_QUANTITY_MEDIUM,	SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/medical_bounty(/obj/item/reagent_containers/syringe,	TRUE,	SUPPLY_BOUNTY_QUANTITY_HIGH,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/reagent_containers/glass/beaker,	FALSE,	SUPPLY_BOUNTY_QUANTITY_HIGH,	SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/reagent_containers/bottle,		TRUE,	SUPPLY_BOUNTY_QUANTITY_HIGH,	SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/medical_bounty(/obj/item/reagent_containers/dropper,		TRUE,	SUPPLY_BOUNTY_QUANTITY_HIGH,	SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/medical_bounty(/obj/item/reagent_containers/hypospray		FALSE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/healthanalyzer,		FALSE,			SUPPLY_BOUNTY_QUANTITY_HIGH,		SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/medical_bounty(/obj/item/sensor_device,		TRUE,				SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/medical_bounty(/obj/item/pinpointer/crew,		TRUE,				SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_MEDIUM),

	// MARK: SECURITY
	new /datum/security_bounty(/obj/item/melee/baton,		TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/security_bounty(/obj/item/restraint/handcuffs,	TRUE,		SUPPLY_BOUNTY_QUANTITY_HIGH,		SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/security_bounty(/obj/item/restraints/handcuffs/cable/zipties, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW,	SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/security_bounty(/obj/item/food/donut)			TRUE,			SUPPLY_BOUNTY_QUANTITY_HIGH,		SUPPLY_BOUNTY_REWARD_LOW), // not filed under service because it's funny
	new /datum/security_bounty(/obj/item/flash				TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/security_bounty(/obj/item/reagent_containers/spray/pepper,	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/security_bounty(/obj/item/flashlight/seclite		TRUE,		SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/security_bounty(/obj/item/ammo_box/magazine/detective/speedcharger)	TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,	SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/security_bounty(/obj/item/flamethrower	TRUE,			SUPPLY_BOUNTY_QUANTITY_MEDIUM,			SUPPLY_BOUNTY_REWARD_HIGH)
	new /datum/security_bounty(/obj/item/ammo_casing/shotgun/beanbag		TRUE,	SUPPLY_BOUNTY_QUANTITY_HIGH,	SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/security_bounty(/obj/item/ammo_casing/shotgun/rubbershot		TRUE,	SUPPLY_BOUNTY_QUANTITY_HIGH,	SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/security_bounty(/obj/item/ammo_casing/shotgun/dart			TRUE,	SUPPLY_BOUNTY_QUANTITY_HIGH,	SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/security_bounty(/obj/item/ammo_casing/shotgun/incendiary		TRUE,	SUPPLY_BOUNTY_QUANTITY_HIGH,	SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/security_bounty(/obj/item/ammo_casing/shotgun/laserslug		TRUE,	SUPPLY_BOUNTY_QUANTITY_HIGH,	SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/security_bounty(/obj/item/forensics/swab		TRUE,			SUPPLY_BOUNTY_QUANTITY_LOW,			SUPPLY_BOUNTY_REWARD_MEDIUM),
	new /datum/security_bounty(/obj/item/forensics/sample_kit		TRUE,		SUPPLY_BOUNTY_QUANTITY_ONE,		SUPPLY_BOUNTY_REWARD_HIGH),
	new /datum/security_bounty(/obj/item/forensics/sample_kit/powder			TRUE,		SUPPLY_BOUNTY_QUANTITY_ONE,		SUPPLY_BOUNTY_REWARD_HIGH),
	new /datum/security_bounty(/obj/item/gun/projectile/shotgun/automatic/combat,	TRUE,	SUPPLY_BOUNTY_QUANTITY_ONE,		SUPPLY_BOUNTY_REWARD_HIGH),
	new /datum/security_bounty(/obj/item/gun/projectile/shotgun/riot			TRUE,	SUPPLY_BOUNTY_QUANTITY_ONE,		SUPPLY_BOUNTY_REWARD_HIGH),
	new /datum/security_bounty(/obj/item/gun/energy/laser	TRUE,		SUPPLY_BOUNTY_QUANTITY_ONE,				SUPPLY_BOUNTY_REWARD_HIGH),
	new /datum/security_bounty(/obj/item/gun/energy/gun		TRUE,		SUPPLY_BOUNTY_QUANTITY_ONE,				SUPPLY_BOUNTY_REWARD_HIGH),
	new /datum/security_bounty(/obj/item/gun/energy/laser/practice,			TRUE,	SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_MEDIUM)
	new /datum/security_bounty(/obj/item/ammo_box/c45		TRUE,		SUPPLY_BOUNTY_QUANTITY_LOW,				SUPPLY_BOUNTY_REWARD_HIGH),
	new /datum/security_bounty(/obj/item/ammo_box/c9mm		TRUE,		SUPPLY_BOUNTY_QUANTITY_LOW,				SUPPLY_BOUNTY_REWARD_HIGH),
	new /datum/security_bounty(/obj/item/ammo_box/c10mm		TRUE,		SUPPLY_BOUNTY_QUANTITY_LOW,				SUPPLY_BOUNTY_REWARD_HIGH),
	new /datum/security_bounty(/obj/item/ammo_box/b357		TRUE,		SUPPLY_BOUNTY_QUANTITY_LOW,				SUPPLY_BOUNTY_REWARD_HIGH),
	new /datum/security_bounty(/obj/item/ammo_box/foambox/sniper/riot		TRUE,		SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_HIGH),
	new /datum/security_bounty(/obj/item/ammo_box/foambox/riot				TRUE,		SUPPLY_BOUNTY_QUANTITY_LOW,		SUPPLY_BOUNTY_REWARD_HIGH),
	new /datum/security_bounty(/obj/item/ammo_casing/caseless/foam_dart/sniper/riot,		TRUE,		SUPPLY_BOUNTY_QUANTITY_MEDIUM,		SUPPLY_BOUNTY_REWARD_CHEAP),
	new /datum/security_bounty(/obj/item/ammo_casing/caseless/foam_dart/riot,			TRUE,		SUPPLY_BOUNTY_QUANTITY_MEDIUM,		SUPPLY_BOUNTY_REWARD_CHEAP),
))

#undef SUPPLY_BOUNTY_QUANTITY_ONE
#undef SUPPLY_BOUNTY_QUANTITY_LOW
#undef SUPPLY_BOUNTY_QUANTITY_MEDIUM
#undef SUPPLY_BOUNTY_QUANTITY_HIGH
#undef SUPPLY_BOUNTY_QUANTITY_BULK

#undef SUPPLY_BOUNTY_REWARD_CHEAP
#undef SUPPLY_BOUNTY_REWARD_LOW
#undef SUPPLY_BOUNTY_REWARD_MEDIUM
#undef SUPPLY_BOUNTY_REWARD_HIGH
#undef SUPPLY_BOUNTY_REWARD_GRAND
