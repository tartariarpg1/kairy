local mType = Game.createMonsterType("Candy Horror")
local monster = {}

monster.description = "a Candy Horror"
monster.experience = 65000
monster.outfit = {
    lookType = 1739, -- Puedes cambiar el lookType al ID del sprite que desees
    lookHead = 0,
    lookBody = 0,
    lookLegs = 0,
    lookFeet = 0,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 68000
monster.maxHealth = 68000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 48266
monster.speed = 250
monster.summonCost = 0

monster.changeTarget = {
    interval = 2000,
    chance = 10
}

monster.flags = {
    attackable = true,
    hostile = true,
    summonable = false,
    convinceable = false,
    illusionable = true,
    boss = false,
    pushable = false,
    canPushItems = true,
    canPushCreatures = true,
    targetDistance = 1,
    staticAttackChance = 90,
    healthHidden = false,
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
    {text = "Sweetness overload!", yell = false},
    {text = "Taste my sugar power!", yell = false}
}

monster.immunities = {
    {type = "paralyze", condition = true},
    {type = "outfit", condition = false},
    {type = "invisible", condition = true},
    {type = "bleed", condition = false}
}

monster.elements = {
    {type = COMBAT_PHYSICALDAMAGE, percent = -10},
    {type = COMBAT_ENERGYDAMAGE, percent = 50},
    {type = COMBAT_EARTHDAMAGE, percent = -20},
    {type = COMBAT_FIREDAMAGE, percent = 20},
    {type = COMBAT_LIFEDRAIN, percent = 0},
    {type = COMBAT_MANADRAIN, percent = 0},
    {type = COMBAT_DROWNDAMAGE, percent = 0},
    {type = COMBAT_ICEDAMAGE, percent = 50},
    {type = COMBAT_HOLYDAMAGE , percent = -10},
    {type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.attacks = {
    {name ="melee", interval = 2000, chance = 100, minDamage = -500, maxDamage = -1050},
    {name ="combat", interval = 2000, chance = 15, type = COMBAT_ICEDAMAGE, minDamage = -700, maxDamage = -1400, range = 10, shootEffect = CONST_ANI_ICE, target = true},
    {name ="combat", interval = 1500, chance = 10, type = COMBAT_FIREDAMAGE, minDamage = -850, maxDamage = -2300, radius = 8, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 1600, chance = 85, type = COMBAT_EARTHDAMAGE, minDamage = 500, maxDamage = -1500, radius = 14, effect = CONST_ME_STONE_STORM, target = false},
	{name ="combat", interval = 1800, chance = 85, type = COMBAT_ENERGYDAMAGE, minDamage = 900, maxDamage = -800, radius = 14, effect = CONST_ME_SLASH, target = false},	
    {name ="speed", interval = 1000, chance = 15, speedChange = -500, range = 7, effect = CONST_ME_MAGIC_RED, target = true, duration = 4000}
}

monster.defenses = {
    defense = 35,
    armor = 40,
    {name ="speed", interval = 2000, chance = 15, speedChange = 300, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 5000},
}

monster.loot = {
	{name = "crystal coin", chance = 70540, maxCount = 3},
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
	{id = 34109, chance = 10} -- bag you desire
}

mType:register(monster)
