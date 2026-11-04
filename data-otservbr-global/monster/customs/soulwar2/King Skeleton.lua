local mType = Game.createMonsterType("King Skeleton")
local monster = {}

monster.description = "a King Skeleton"
monster.experience = 90000
monster.outfit = {
	lookType = 2010,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.raceId = 2713
monster.Bestiary = {
	class = "Demon",
	race = BESTY_RACE_DEMON,
	toKill = 5000,
	FirstUnlock = 25,
	SecondUnlock = 3394,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 1,
	Locations = "Sparkling Pools"
	}

monster.health = 80000
monster.maxHealth = 80000
monster.race = "blood"
monster.corpse = 33901
monster.speed = 200
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 0
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "The smell of fear follows you.", yell = false},
	{text = "Your soul will burn.", yell = false}
}

monster.loot = {
	{name = "crystal coin", chance = 70540, maxCount = 10},
	{name = "platinum coin", chance = 90540, maxCount = 50},
	{name = "ultimate health potion", chance = 32220, maxCount = 7},
	{name = "small diamond", chance = 65560, maxCount = 7},
	{name = "gold ingot", chance = 25560},
	{name = "blue crystal splinter", chance = 25560},
	{name = "cyan crystal fragment", chance = 25560},
	{name = "red crystal fragment", chance = 25560},
	{name = "magma boots", chance = 35500},
	{name = "blue gem", chance = 65560},
	{name = "giant sword", chance = 13500},
	{name = "war axe", chance = 9500},
	{name = "mercenary sword", chance = 11500},
	{name = "green crystal fragment", chance = 9500},
	{name = "onyx chip", chance = 7500},
	{ name = "ice rapier", chance = 1550 },
	{ name = "golden sickle", chance = 1440 },
	{ name = "fire axe", chance = 4030 },
	{ name = "devil helmet", chance = 1180 },
	{ name = "golden legs", chance = 440 },
	{ name = "magic plate armor", chance = 130 },
	{ name = "mastermind shield", chance = 480 },
	{ name = "demon shield", chance = 740 },
	{ name = "fire mushroom", chance = 19660, maxCount = 6 },
	{ name = "demon horn", chance = 14920 },
	{ name = "assassin star", chance = 12550, maxCount = 10 },
	{ name = "demonrage sword", chance = 70 },	
	{id = 34109, chance = 5} -- bag you desire
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 900, maxDamage = -1801},
	{name ="combat", interval = 2300, chance = 47, type = COMBAT_DEATHDAMAGE, minDamage = -950, maxDamage = -1860, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 1000, chance = 31, type = COMBAT_EARTHDAMAGE, minDamage = -800, maxDamage = -1935, radius = 4, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -880, maxDamage = -2450, length = 8, spread = 3, effect = CONST_ME_ROOTS, target = false},
	{name ="melee", interval = 2000, chance = 100, minDamage = 300, maxDamage = -801},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -700, maxDamage = -1800, length = 7, spread = 0, effect = CONST_ME_PINK_ENERGY_SPARK, target = false},
	{name ="combat", interval = 3000, chance = 45, type = COMBAT_PHYSICALDAMAGE, minDamage = -1037, maxDamage = -1050, length = 6, spread = 1, effect = CONST_ME_SOUND_PURPLE, target = false},	
}

monster.defenses = {
	defense = 110,
	armor = 120,
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 650, maxDamage = 1200, effect = CONST_ME_MAGIC_RED, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 40},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -20},
	{type = COMBAT_HOLYDAMAGE , percent = -25},
	{type = COMBAT_DEATHDAMAGE , percent = 50}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = true},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)