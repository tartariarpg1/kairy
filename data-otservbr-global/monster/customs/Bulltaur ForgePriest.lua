local mType = Game.createMonsterType("Bulltaur ForgePriest")
local monster = {}

monster.description = "a Bulltaur ForgePriest"
monster.experience = 58500
monster.outfit = {
	lookType = 1719,
	lookHead = 85,
	lookBody = 1,
	lookLegs = 85,
	lookFeet = 105,
	lookAddons = 3,
	lookMount = 0
}

monster.raceId = 2277
monster.Bestiary = {
	class = "Mammal",
	race = BESTY_RACE_MAMMAL,
	toKill = 5000,
	FirstUnlock = 50,
	SecondUnlock = 500,
	CharmsPoints = 100,
	Stars = 3,
	Occurrence = 0,
	Locations = "Sea Serpent Area and Seacrest Grounds."
}

monster.health = 38000
monster.maxHealth = 38000
monster.race = "blood"
monster.corpse = 44717
monster.speed = 215
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
	{text = "Shwooosh!", yell = false},
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
	{name = "spellbook of mind control", chance = 3000},
    {name = "stone skin amulet", chance = 1880},
    {name = "cyan crystal fragment", chance = 4100},
    {name = "warrior's axe", chance = 3000},
    {name = "dream blossom staff", chance = 4100},
    {name = "terra boots", chance = 3000},
	{id = 39546, chance = 10},
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 320, maxDamage = -1050, condition = {type = CONDITION_POISON, totalDamage = 65, interval = 1000}},
	{name ="combat", interval = 3000, chance = 7, type = COMBAT_LIFEDRAIN, minDamage = -575, maxDamage = -1750, range = 1, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_ENERGYDAMAGE, minDamage = -860, maxDamage = -1600, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 3000, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = -960, maxDamage = -1600, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = false},
	{name ="speed", interval = 1000, chance = 12, speedChange = -650, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 60000},
	{name ="drunk", interval = 1000, chance = 8, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false}

}

monster.defenses = {
	defense = 76,
	armor = 76,
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 30},
	{type = COMBAT_ENERGYDAMAGE, percent = 0},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 20},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -5},
	{type = COMBAT_HOLYDAMAGE , percent = -5},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
