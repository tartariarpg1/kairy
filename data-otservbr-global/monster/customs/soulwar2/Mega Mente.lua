
local mType = Game.createMonsterType("Mega Mente")
local monster = {}

monster.description = "a Mega Mente"
monster.experience = 70960
monster.outfit = {
	lookType = 1593,
	lookHead = 85,
	lookBody = 1,
	lookLegs = 85,
	lookFeet = 105,
	lookAddons = 3,
	lookMount = 0
}

monster.raceId = 2608
monster.Bestiary = {
	class = "Elemental",
	race = BESTY_RACE_ELEMENTAL,
	toKill = 5000,
	FirstUnlock = 100,
	SecondUnlock = 1000,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 1,
	Locations = "Great Pearl Fan Reef"
}

monster.health = 43000
monster.maxHealth = 43000
monster.race = "blood"
monster.corpse = 5995
monster.speed = 182
monster.manaCost = 0
monster.maxSummons = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 100,
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
	canPushCreatures = true,
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
	{text = "Gruugl...", yell = false},
}

monster.loot = {
	{name = "Crystal Coin", chance = 22310, minCount = 1, maxCount = 5},
	{name = "Ultimate Mana Potion", chance = 12890, minCount = 1, maxCount = 2},
	{name = "Yellow Gem", chance = 2820},
	{id = 282, chance = 2450}, -- Giant Shimmering Pearl (Green)
	{name = "Slightly Rusted Legs", chance = 2420},
	{name = "Knight Legs", chance = 2360},
	{id = 3039, chance = 2190}, -- Red Gem
	{name = "Warrior's Shield", chance = 1760},
	{id = 23533, chance = 1110}, -- Ring of Red Plasma
	{name = "Fire Sword", chance = 770},
}

monster.attacks = {
	{name ="melee", interval = 1000, chance = 100, minDamage = 0, maxDamage = -2150},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -750, maxDamage = -1500, radius = 8, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -550, maxDamage = -1600, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -800, maxDamage = -1750, length = 8, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_DEATHDAMAGE, minDamage = -750, maxDamage = -1000, range = 7, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 1000, chance = 18, type = COMBAT_FIREDAMAGE, minDamage = -750, maxDamage = -1100, radius = 3, effect = CONST_ME_FIREAREA, target = false},
	{name ="combat", interval = 1000, chance = 22, type = COMBAT_DEATHDAMAGE, minDamage = -750, maxDamage = -1050, radius = 4, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 1000, chance = 24, type = COMBAT_FIREDAMAGE, minDamage = -750, maxDamage = -1650, radius = 4, effect = CONST_ME_EXPLOSIONAREA, target = false},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -700, maxDamage = -1250, length = 8, effect = CONST_ME_EXPLOSIONHIT, target = false},	
}

monster.defenses = {
	defense = 110,
	armor = 84,
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
