local mType = Game.createMonsterType("Vegeta SSj4")
local monster = {}

monster.description = "a Vegeta SSj4"
monster.experience = 120000
monster.outfit = {
	lookType = 2063,
	lookHead = 93,
	lookBody = 50,
	lookLegs = 102,
	lookFeet = 5,
	lookAddons = 3,
	lookMount = 0
}

monster.raceId = 2093
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

monster.health = 50000
monster.maxHealth = 50000
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
	{text = "Yo te Protegere Papa", yell = false},
	{text = "E venido del Futuro", yell = false}
}

monster.loot = {
	{name = "crystal coin", chance = 70540, maxCount = 3},
	{id = 60648, chance = 5, maxCount = 1},
	{id = 60186, chance = 5, maxCount = 1},
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
	{id = 34109, chance = 5} -- bag you desire
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 900, maxDamage = -1801},
	{name ="combat", interval = 2300, chance = 47, type = COMBAT_DEATHDAMAGE, minDamage = -950, maxDamage = -2860, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 1000, chance = 31, type = COMBAT_EARTHDAMAGE, minDamage = -800, maxDamage = -2935, radius = 4, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -880, maxDamage = -2450, length = 8, spread = 3, effect = CONST_ME_ROOTS, target = false},
	{name ="melee", interval = 2000, chance = 100, minDamage = 900, maxDamage = -1801},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -700, maxDamage = -2800, length = 7, spread = 0, effect = CONST_ME_PINK_ENERGY_SPARK, target = false},
	{name ="combat", interval = 3000, chance = 45, type = COMBAT_PHYSICALDAMAGE, minDamage = -1037, maxDamage = -2050, length = 6, spread = 1, effect = CONST_ME_SOUND_PURPLE, target = false},	
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