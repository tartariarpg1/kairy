local mType = Game.createMonsterType("training monk")
local monster = {}
monster.name = "training monk"
monster.description = "a training monk"
monster.experience = 0
monster.outfit = {
	lookType = 1685,
	lookHead = 150,
	lookBody = 10,
	lookLegs = 35,
	lookFeet = 18,
	lookAddons = 0,
	lookMount = 0
}
 
monster.health = 200000
monster.maxHealth = 200000
monster.race = "blood"
monster.corpse = 24676
monster.speed = 0
monster.summonCost = 0 
monster.maxSummons = 0

monster.changeTarget = {
	interval = 60000,
	chance = 0
}

monster.flags = {
	isSummonable = false,
	isAttackable = true,
	isHostile = true,
	isConvinceable = false,
	isPushable = false,
	isBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 50,
	targetdistance = 1,
	runHealth = 0,
	isHealthHidden = false,
	canwalkonenergy = false,
	canwalkonfire = false,
	canwalkonpoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = 0}
}


monster.defenses = {
	defense = 0,
	armor = 0,
	{name ="combat", interval = 2000, chance = 80, minDamage = 10000, maxDamage = 20000, type = COMBAT_HEALING, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="outfit", interval = 4000, chance = 1, effect = CONST_ME_MAGIC_RED, target = false, duration = 3000, outfitMonster = "many faces"},
	{name ="outfit", interval = 4000, chance = 3, effect = CONST_ME_MAGIC_RED, target = false, duration = 3000, outfitMonster = "infernal demon"},
	{name ="outfit", interval = 4000, chance = 5, effect = CONST_ME_MAGIC_RED, target = false, duration = 3000, outfitMonster = "brachiodemon"},
	{name ="outfit", interval = 4000, chance = 10, effect = CONST_ME_MAGIC_RED, target = false, duration = 3000, outfitMonster = "bony sea devil"}
	
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
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
