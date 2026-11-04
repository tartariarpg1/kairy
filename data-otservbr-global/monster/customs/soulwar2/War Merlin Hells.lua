local mType = Game.createMonsterType("War Merlin Hells")
local monster = {}

monster.description = "a War Merlin Hells"
monster.experience = 55500
monster.outfit = {
	lookType = 2046,
	lookHead = 105,
	lookBody = 10,
	lookLegs = 85,
	lookFeet = 135,
	lookAddons = 3,
	lookMount = 2032
}

monster.raceId = 2600
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
monster.corpse = 18247
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
	{name = "crystal coin", chance = 27000, maxCount = 8},
    {name = "red crystal fragment", chance = 4000},
    {name = "gemmed figurine", chance = 4000},
    {name = "green crystal shard", chance = 3000},
	{name = "cyan crystal fragment", chance = 3000},
	{name = "small emerald", chance = 8000, maxCount = 2},
	{name = "small amethyst", chance = 8000, maxCount = 2},
    {name = "lightning boots", chance = 1880},
	{name = "spellbook of mind control", chance = 3000},
    {name = "stone skin amulet", chance = 1880},
    {name = "cyan crystal fragment", chance = 4100},
    {name = "warrior's axe", chance = 3000},
    {name = "dream blossom staff", chance = 4100},
    {name = "terra boots", chance = 3000},
	{id = 43895, chance = 10},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 900, maxDamage = -1801},
	{name ="combat", interval = 2300, chance = 47, type = COMBAT_DEATHDAMAGE, minDamage = -950, maxDamage = -1860, radius = 4, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 1000, chance = 31, type = COMBAT_EARTHDAMAGE, minDamage = -800, maxDamage = -1935, radius = 4, effect = CONST_ME_HITBYPOISON, target = false},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -880, maxDamage = -2450, length = 8, spread = 3, effect = CONST_ME_ROOTS, target = false},
	{name ="melee", interval = 2000, chance = 100, minDamage = 300, maxDamage = -801},
	{name ="combat", interval = 1000, chance = 10, type = COMBAT_ENERGYDAMAGE, minDamage = -400, maxDamage = -800, length = 7, spread = 0, effect = CONST_ME_PINK_ENERGY_SPARK, target = false},
	{name ="combat", interval = 3000, chance = 45, type = COMBAT_PHYSICALDAMAGE, minDamage = -1037, maxDamage = -1050, length = 6, spread = 1, effect = CONST_ME_SOUND_PURPLE, target = false},	
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
