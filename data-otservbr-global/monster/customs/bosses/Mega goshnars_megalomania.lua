local mType = Game.createMonsterType("Mega Goshnar's Megalomania")
local monster = {}

monster.description = "Mega Goshnar's Megalomania"
monster.experience = 2000000
monster.outfit = {
	lookType = 1337,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 7000000
monster.maxHealth = 7000000
monster.race = "undead"
monster.corpse = 33889
monster.speed = 165

monster.changeTarget = {
	interval = 2000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 2498,
	bossRace = RARITY_NEMESIS,
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
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 95,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summon = {
	maxSummons = 4,
	summons = {
		{name = "Mega brachiodemon", chance = 40, interval = 500, count = 4},
		{name = "Mega Infernal Demon", chance = 50, interval = 500, count = 4}
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Ah that Pain you inflicted! Let me share it with you!", yell = true},
	{text = "You will suffer!", yell = true},
	{text = "I will harvest your soul!", yell = true}
}

monster.loot = {
	{name = "crystal coin", chance = 55000, minCount = 70, maxCount = 275},
	{name = "gold token", chance = 55000, minCount = 1, maxCount = 3},	
	{id = 44839, chance = 1100}, -- cobra chest
	{id = 44836, chance = 900}, -- lion chest	
	{id = 44838, chance = 800}, -- mutant chest	
	{id = 44837, chance = 700}, -- falcon chest
	{ id = 44827, chance = 8938, maxCount = 10 },	 -- emerald coin
	{ id = 44604, chance = 8938, maxCount = 1 },	 -- greater guardian gem
	{ id = 44613, chance = 8938, maxCount = 1 },	 -- greater mystic gem
	{ id = 44607, chance = 8938, maxCount = 1 },	 -- greater marksman gem	
	{ id = 44610, chance = 8938, maxCount = 1 },	 -- greater sage gem
	{ id = 3043, chance = 8938, maxCount = 100 },	 -- greater sage gem	
	{ id = 39546, chance = 700, maxCount = 1 },	 -- primal bag	
	{ id = 43860, chance = 500, maxCount = 1 },	 -- bag you covet	
	{ id = 43898, chance = 500, maxCount = 1 },	 -- Grand bag you covet	
	{ id = 896, chance = 8938, maxCount = 1 }	 -- firlefanz	
}

monster.attacks = {
	{name ="melee", interval = 800, chance = 100, minDamage = 1000, maxDamage = -4000},
	{name ="combat", interval = 800, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -950, maxDamage = -3400, range = 7, radius = 3, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 800, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -1000, maxDamage = -4500, length = 8, spread = 3, effect = CONST_ME_INSECTS, target = false},
	{name ="singlecloudchain", interval = 800, chance = 40, minDamage = -1300, maxDamage = -3500, range = 6, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="combat", interval = 800, chance = 85, type = COMBAT_HOLYDAMAGE, minDamage = 800, maxDamage = -2500, radius = 14, effect = CONST_ME_HOLYDAMAGE, target = false},
	{name ="combat", interval = 800, chance = 85, type = COMBAT_EARTHDAMAGE, minDamage = 900, maxDamage = -1500, radius = 14, effect = CONST_ME_STONE_STORM, target = false},
	{name ="combat", interval = 800, chance = 85, type = COMBAT_ENERGYDAMAGE, minDamage = 900, maxDamage = -2500, radius = 14, effect = CONST_ME_SLASH, target = false},
	{name ="combat", interval = 800, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = 1200, maxDamage = -3400, range = 4, radius = 6, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 800, chance = 50, type = COMBAT_EARTHDAMAGE, minDamage = 1400, maxDamage = -2800, length = 11, spread = 6, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="combat", interval = 800, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = 800, maxDamage = -2500, length = 11, spread = 6, effect = CONST_ME_GROUNDSHAKER, target = false},	
	{name ="combat", interval = 800, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -1300, maxDamage = -3200, length = 10, spread = 0, effect = CONST_ME_BLUE_GHOST, target = false},
}

monster.defenses = {
	defense = 160,
	armor = 160,
	{name ="speed", interval = 1000, chance = 20, speedChange = 100, effect = CONST_ME_MAGIC_RED, target = false, duration = 30000},
	{name ="combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 350, maxDamage = 1250, effect = CONST_ME_MAGIC_BLUE, target = false},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 10},
	{type = COMBAT_EARTHDAMAGE, percent = 15},
	{type = COMBAT_FIREDAMAGE, percent = 5},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 100},
	{type = COMBAT_ICEDAMAGE, percent = 15},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
