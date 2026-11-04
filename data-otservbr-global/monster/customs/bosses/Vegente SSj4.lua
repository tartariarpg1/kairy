local mType = Game.createMonsterType("Vegente SSj4")
local monster = {}

monster.description = "Vegente SSj4"
monster.experience = 2000000
monster.outfit = {
	lookType = 2063,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 30000000
monster.maxHealth = 30000000
monster.race = "undead"
monster.corpse = 33889
monster.speed = 165

monster.changeTarget = {
	interval = 2000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 2635,
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
	{id = 3043, chance = 55000, minCount = 70, maxCount = 275}, --Crystal Coin
	{id = 60544, chance = 1100}, -- cobra chest
	{id = 60550, chance = 900}, -- lion chest	
	{id = 60556, chance = 800}, -- Eldritch chest	
	{id = 60546, chance = 700}, -- falcon chest
	{ id = 60186, chance = 8938, maxCount = 10 },	 -- exchange token
	{ id = 60669, chance = 8938, maxCount = 1 },	 -- Tier Upgrader 100%
	{ id = 60667, chance = 8938, maxCount = 1 },	 -- Tier Upgrader 50%
	{ id = 60668, chance = 8938, maxCount = 1 },	 -- Tier Upgrader 70%	
	{ id = 60548, chance = 700, maxCount = 1 },	 -- gold mystery box
	{ id = 22118, chance = 8938, maxCount = 100 },	 -- tibia coin	
	{ id = 39546, chance = 5000, maxCount = 1 },	 -- primal bag	
	{ id = 43860, chance = 5000, maxCount = 1 },	 -- bag you covet	
	{ id = 43898, chance = 3000, maxCount = 1 },	 -- Grand bag you covet	
	{ id = 34109, chance = 8938, maxCount = 1 }	 -- bag you desire			
}

monster.attacks = {
	{name ="melee", interval = 800, chance = 100, minDamage = 1000, maxDamage = -4000},
	{name ="combat", interval = 1000, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -950, maxDamage = -3400, range = 7, radius = 15, shootEffect = 263, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 1200, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -1000, maxDamage = -4500, length = 8, spread = 8, effect = 264, target = false},
	{name ="singlecloudchain", interval = 6000, chance = 40, minDamage = -1300, maxDamage = -1500, range = 6, effect = CONST_ME_ENERGYHIT, target = true},
    {name ="combat", interval = 1300, chance = 85, type = COMBAT_ENERGYDAMAGE, minDamage = 900, maxDamage = -4550, radius = 6, effect = 244, target = false},
	{name ="combat", interval = 1500, chance = 85, type = COMBAT_ICEDAMAGE, minDamage = 650, maxDamage = -4550, radius = 10, effect = CONST_ME_WATERSPLASH, target = false},
	{name ="combat", interval = 1800, chance = 85, type = COMBAT_ICEDAMAGE, minDamage = 1350, maxDamage = -5550, radius = 11, effect = CONST_ME_ICEAREA, target = false},
	{name ="combat", interval = 2000, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = 900, maxDamage = -2500, length = 11, spread = 6, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="combat", interval = 800, chance = 50, type = COMBAT_ICEDAMAGE, minDamage = 800, maxDamage = -3500, length = 11, spread = 6, effect = CONST_ME_GIANTICE, target = false},
	{name ="combat", interval = 1200, chance = 50, type = COMBAT_HOLYDAMAGE, minDamage = 1000, maxDamage = -4500, length = 11, effect = CONST_ME_GIANTICE, target = false},	
	{name ="combat", interval = 1500, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -1300, maxDamage = -3200, length = 10, spread = 0, effect = CONST_ME_BLUE_GHOST, target = false},
}

monster.defenses = {
	defense = 160,
	armor = 160,
	{name ="speed", interval = 800, chance = 20, speedChange = 100, effect = CONST_ME_MAGIC_RED, target = false, duration = 30000},
	{name ="combat", interval = 800, chance = 25, type = COMBAT_HEALING, minDamage = 3500, maxDamage = 12500, effect = CONST_ME_MAGIC_BLUE, target = false},
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
