local mType = Game.createMonsterType("Mega Werecrocodile")
local monster = {}

monster.description = "a Mega Werecrocodile"
monster.experience = 49900
monster.outfit = {
	lookType = 1647,
	lookHead = 76,
	lookBody = 117,
	lookLegs = 38,
	lookFeet = 58,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 15280
monster.maxHealth = 15280
monster.race = "undead"
monster.corpse = 43754
monster.speed = 115
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.raceId = 2604
monster.Bestiary = {
	class = "Reptile",
	race = BESTY_RACE_REPTILE,
	toKill = 2500,
	FirstUnlock = 25,
	SecondUnlock = 1000,
	CharmsPoints = 50,
	Stars = 3,
	Occurrence = 0,
	Locations = "Sanctuary."
	}

monster.strategiesTarget = {
	nearest = 80,
	health = 10,
	damage = 10,
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
	runHealth = 800,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = true,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {

}

monster.loot = {
	{name = "crystal coin", chance = 100000, maxCount = 3},
	{name = "platinum coin", chance = 100000, maxCount = 5},
	{name = "Crown Legs", chance = 5980},
	{name = "blue robe", chance = 730},
	{name = "brown crystal splinter", chance = 3000},
	{id = 43916, chance = 1000},
	{id = 39546, chance = 10, maxCount = 1},	
	{id = 43729, chance = 2000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 500, maxDamage = -1900, effect = CONST_ME_DRAWBLOOD},
	{name ="combat", interval = 6000, chance = 9, type = COMBAT_DEATHDAMAGE, minDamage = -1500, maxDamage = -300, radius = 3, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 6000, chance = 13, type = COMBAT_ICEDAMAGE, minDamage = -1050, maxDamage = -400, length = 4, spread = 0, effect = CONST_ME_ICEATTACK, target = false},
	}

monster.defenses = {
	defense = 82,
	armor = 82
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 25},
	{type = COMBAT_ENERGYDAMAGE, percent = -5},
	{type = COMBAT_EARTHDAMAGE, percent = 20},
	{type = COMBAT_FIREDAMAGE, percent = 35},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = -15},
	{type = COMBAT_HOLYDAMAGE , percent = -20},
	{type = COMBAT_DEATHDAMAGE , percent = 60}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
