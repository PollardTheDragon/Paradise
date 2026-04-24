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
	// MARK: BOTANY
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
	// MARK: MEATS (CHEF)
	new /datum/supply_bounty(/obj/item/food/burger/mcrib, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/burrito, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/chimichanga, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/bbqribs, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/bacon, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/meatsteak/chicken, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/cutlet, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/goliath_steak, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/meatkebab, FALSE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/meatsteak, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sausage, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/syntikebab, FALSE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/telebacon, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/wingfangchu, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/meat/patty, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/meatball, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/taco, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/meatbread, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/meatpie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/turkey, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/xemeatpie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/xenomeatbread, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/enchiladas, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/meatbun, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/monkeysdelight, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	// MARK: DESSERTS (CHEF)
	new /datum/supply_bounty(/obj/item/food/friedbanana, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/popsicle/ant, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/popsicle/bananatop, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/popsicle/berrycream, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/berryicecreamsandwich, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/popsicle/berrytop, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/cornuto, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/popsicle/frozenpineapple, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/honkdae, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/icecreamsandwich, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/popsicle, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/popsicle/licoricecream, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/popsicle/orangecream, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/peanutbuttermochi, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/popsicle/pineappletop, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/popsicle/sea_salt, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/apple, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/berry, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/bluecherry, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/cherry, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/cola, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/fruitsalad, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/grape, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/honey, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/lemon, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/lime, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/mime, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/orange, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/pineapple, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/rainbow, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/snowcone/spacemountain, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/spacefreezy, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/frozen/sundae, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/applecake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/applepie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/appletart, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/bananacake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/beary_pie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/berry_muffin, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/berryclafoutis, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/birthdaycake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/blumpkin_pie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/booberry_muffin, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/braincake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/cannoli, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/carrotcake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/cheesecake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/cherry_cupcake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/cherry_cupcake/blue, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/cherrypie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/chocolate_cornet, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/chocolate_lava_tart, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/chocolatecake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/clowncake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/storage/bag/tray/cookies_tray, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/fortunecookie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/french_silk_pie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/frosty_pie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/grape_tart, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/hardware_cake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/holy_cake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/honey_bun, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/lemoncake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/liars_cake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/limecake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/mime_tart, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/moffin, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/mothmallow, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/muffin, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/oatmeal_cookie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/orangecake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/peanut_butter_cookie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/pie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/plaincake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/plum_cake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/plump_pie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/plumphelmetbiscuit, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/pound_cake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/pumpkin_spice_cake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/pumpkinpie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/raisin_cookie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/slime_cake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/spaceman_cake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/storage/bag/tray/cookies_tray/sugarcookie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/tofupie, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/vanilla_berry_cake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/vanilla_cake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/amanitajelly, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/candiedapple, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/dulce_de_batata, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/friedbanana, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/popcorn, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/ricepudding, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/tapioca_pudding, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	// MARK: BREADS (CHEF)
	new /datum/supply_bounty(/obj/item/food/tortilla, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/baguette, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/bananabread, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/banarnarbread, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/bread, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/bun, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/cracker, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/creamcheesebread, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/croissant, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/flatbread, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/sliceable/tofubread, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/poppypretzel, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/tapiocaflatbread, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	// MARK: BREAKFAST (CHEF)
	new /datum/supply_bounty(/obj/item/food/burger/mcguffin, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/omelette, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/rofflewaffles, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/waffles, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/friedegg, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/benedict,, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/boiledegg, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/pancake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/pancake/berry_pancake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/pancake/choc_chip_pancake, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	// MARK: SEAFOOD (CHEF)
	new /datum/supply_bounty(/obj/item/food/fried_shrimp, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/fish_skewer, FALSE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/fishfingers, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/picoss_kebab, FALSE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/fried_shrimp, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/salmonsteak, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/shrimp_skewer, FALSE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/boiled_shrimp, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/cubancarp, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	new /datum/supply_bounty(/obj/item/food/fishandchips, TRUE, SUPPLY_BOUNTY_QUANTITY_LOW, SUPPLY_BOUNTY_REWARD_LOW),
	// MARK: SUSHI (CHEF)
	// 2+3+18=something just put lines here and go down the list in cooking_defines.dm
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
