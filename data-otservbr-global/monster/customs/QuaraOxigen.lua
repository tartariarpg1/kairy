local mType = Game.createMonsterType("QuaraOxigen")
local monster = {}

monster.description = "a QuaraOxigen"
monster.experience = 66000
monster.outfit = {
    lookType = 1758, -- Puedes cambiar el lookType al ID del sprite que desees
    lookHead = 0,
    lookBody = 94,
    lookLegs = 0,
    lookFeet = 94,
    lookAddons = 0,
    lookMount = 0
}

monster.health = 68000
monster.maxHealth = 68000
monster.runHealth = 0
monster.race = "undead"
monster.corpse = 45971
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
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1000, maxDamage = -2000 },
	{ name = "combat", interval = 1000, chance = 15, type = COMBAT_PHYSICALDAMAGE, minDamage = -700, maxDamage = -1680, range = 7, shootEffect = CONST_ANI_EARTHARROW, target = false },
	{ name = "combat", interval = 1000, chance = 10, type = COMBAT_LIFEDRAIN, minDamage = -800, maxDamage = -1575, length = 5, spread = 0, effect = CONST_ME_POISONAREA, target = false },
	{ name = "combat", interval = 1000, chance = 12, type = COMBAT_PHYSICALDAMAGE, minDamage = -600, maxDamage = -1880, range = 7, radius = 3, effect = CONST_ME_GROUNDSHAKER, target = false },
}

monster.defenses = {
    defense = 35,
    armor = 40,
    {name ="speed", interval = 2000, chance = 15, speedChange = 300, effect = CONST_ME_MAGIC_BLUE, target = false, duration = 5000},
}

monster.loot = {
    { name = "crystal Coin", chance = 100000, maxCount = 5 },
    { name = "Platinum Coin", chance = 74200, maxCount = 6 },
    { name = "Strong Health Potion", chance = 33550, maxCount = 1 },
    { name = "Frazzle Tongue", chance = 10180, maxCount = 1 },
    { name = "Frazzle Skin", chance = 7620, maxCount = 1 },
    { name = "Onyx Chip", chance = 6370, maxCount = 3 },
    { name = "Yellow Gem", chance = 5580, maxCount = 1 },
    { name = "Gummy Rotworm", chance = 4660, maxCount = 2 },
    { name = "Red Crystal Fragment", chance = 3479, maxCount = 1 },
    { name = "Raspberry", chance = 1440, maxCount = 2 },
    { name = "Melon", chance = 1310, maxCount = 1 },
    { name = "Lime Tart", chance = 1120, maxCount = 1 },
    { name = "Assassin Dagger", chance = 390, maxCount = 1 }
}

mType:register(monster)
