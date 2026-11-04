local mType = Game.createMonsterType("War Dragon")
local monster = {}

monster.description = "a War Dragon"
monster.experience = 43500
monster.outfit = {
	lookType = 1708,
	lookHead = 85,
	lookBody = 1,
	lookLegs = 85,
	lookFeet = 105,
	lookAddons = 3,
	lookMount = 0
}

monster.raceId = 2269
monster.Bestiary = {
	class = "Vermin",
	race = BESTY_RACE_VERMIN,
	toKill = 5000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 100,
	Stars = 5,
	Occurrence = 1,
	Locations = "Monster Graveyard"
}

monster.health = 30100
monster.maxHealth = 30100
monster.race = "venom"
monster.corpse = 44658
monster.speed = 205
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
	{text = "Hizzzzz!", yell = false},
}

monster.loot = {
	{name = "crystal coin", chance = 27000, maxCount = 5},
    {name = "red crystal fragment", chance = 4000},
    {name = "gemmed figurine", chance = 4000},
    {name = "green crystal shard", chance = 3000},
	{name = "cyan crystal fragment", chance = 3000},
	{name = "small emerald", chance = 8000, maxCount = 2},
	{name = "small amethyst", chance = 8000, maxCount = 2},
    {name = "lightning boots", chance = 1880},
	{id = 32018, chance = 4500, maxCount = 1},
	{name = "spellbook of mind control", chance = 3000},
    {name = "stone skin amulet", chance = 1880},
    {name = "cyan crystal fragment", chance = 4100},
    {name = "warrior's axe", chance = 3000},
    {name = "dream blossom staff", chance = 4100},
    {name = "terra boots", chance = 3000},
	{id = 39546, chance = 10},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 900, maxDamage = -1801},
	{name ="combat", interval = 2300, chance = 47, type = COMBAT_DEATHDAMAGE, minDamage = -950, maxDamage = -1860, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 3000, chance = 31, type = COMBAT_EARTHDAMAGE, minDamage = -1800, maxDamage = -2535, radius = 4, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -880, maxDamage = -2450, length = 8, spread = 3, effect = CONST_ME_ROOTS, target = false}
}

monster.defenses = {
	defense = 110,
	armor = 77,
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = -15},
	{type = COMBAT_ENERGYDAMAGE, percent = -10},
	{type = COMBAT_EARTHDAMAGE, percent = 10},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 40}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
