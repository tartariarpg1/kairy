local mType = Game.createMonsterType("Grand Earth Elemental")
local monster = {}

monster.description = "Grand Earth Elemental"
monster.experience = 37000000
monster.outfit = {
	lookType = 2111,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 39500000
monster.maxHealth = 39500000
monster.race = "venom"
monster.corpse = 6078
monster.speed = 160
monster.manaCost = 0

monster.changeTarget = {
	interval = 500,
	chance = 8
}

monster.bosstiary = {
	bossRaceId = 2646,
	bossRace = RARITY_NEMESIS
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
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 2500,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.summon = {
	maxSummons = 7,
	summons = {
		{ name = "Terra Elemental", chance = 30, interval = 3000, count = 3 },
		{ name = "Angel Elemental", chance = 30, interval = 2000, count = 3 },
		{ name = "Jarvis", chance = 30, interval = 1000, count = 2 },
	}
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "NO ONE WILL STOP ME THIS TIME!", yell = true},
	{text = "THE POWER IS MINE!", yell = true},
	{text = "I returned from death and you dream about defeating me?", yell = false},
	{text = "Witness the first seconds of my eternal world domination!", yell = false},
	{text = "Even in my weakened state I will crush you all!", yell = false}
}

monster.loot = {
	{id = 60544, chance = 11433}, -- cobra chest
	{id = 60550, chance = 11433}, -- lion chest	
	{id = 60556, chance = 11433}, -- Eldritch chest	
	{id = 60546, chance = 11433}, -- falcon chest
	{ id = 44827, chance = 11433, maxCount = 10 },	 -- emerald coin
	{ id = 44604, chance = 11433, maxCount = 1 },	 -- greater guardian gem
	{ id = 44613, chance = 11433, maxCount = 1 },	 -- greater mystic gem
	{ id = 44607, chance = 11433, maxCount = 1 },	 -- greater marksman gem	
	{ id = 44610, chance = 11433, maxCount = 1 },	 -- greater sage gem
	{ id = 3043, chance = 11433, maxCount = 100 },	 -- greater sage gem	
	{ id = 39546, chance = 11433, maxCount = 1 },	 -- primal bag	
	{ id = 43860, chance = 11433, maxCount = 1 },	 -- bag you covet	
	{ id = 43898, chance = 11433, maxCount = 1 },	 -- Grand bag you covet	
	{ id = 22118, chance = 8938, maxCount = 30 },	 -- firlefanz	
	{ name = "supreme health potion", chance = 8938, maxCount = 300 },
	{ name = "ultimate mana potion", chance = 11433, maxCount = 300 },
	{ name = "ultimate spirit potion", chance = 11433, maxCount = 300 },
	{ name = "berserk potion", chance = 10938, maxCount = 90 },
	{ name = "bullseye potion", chance = 10938, maxCount = 90 },
	{ name = "mastermind potion", chance = 10938, maxCount = 30 },
	{ name = "blue gem", chance = 10570, maxCount = 10 },
	{ name = "giant amethyst", chance = 10570, maxCount = 10 },
	{ name = "giant emerald", chance = 10570, maxCount = 10 },
	{ name = "giant ruby", chance = 10570, maxCount = 10 },
	{ name = "giant sapphire", chance = 10570, maxCount = 10 },
	{ name = "giant topaz", chance = 10570, maxCount = 10 },
	{ name = "violet gem", chance = 10970, maxCount = 10 },
	{ name = "yellow gem", chance = 10970, maxCount = 10 },	
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 1800, maxDamage = -3500},
    {name ="combat", interval = 2500, chance = 85, type = COMBAT_ENERGYDAMAGE, minDamage = 2000, maxDamage = -5550, radius = 6, effect = CONST_ME_PURPLEENERGY, target = false},
	{name ="combat", interval = 1500, chance = 85, type = COMBAT_ICEDAMAGE, minDamage = 1500, maxDamage = -4550, radius = 6, effect = CONST_ME_WATERSPLASH, target = false},
	{name ="combat", interval = 2000, chance = 85, type = COMBAT_ICEDAMAGE, minDamage = 1350, maxDamage = -3550, radius = 11, effect = CONST_ME_ICEAREA, target = false},
	{name ="combat", interval = 2500, chance = 50, type = COMBAT_EARTHDAMAGE, minDamage = 1300, maxDamage = -2500, length = 11, spread = 6, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="combat", interval = 3000, chance = 50, type = COMBAT_ICEDAMAGE, minDamage = 3500, maxDamage = -6500, length = 11, spread = 6, effect = CONST_ME_GIANTICE, target = false},
	{name ="combat", interval = 3000, chance = 50, type = COMBAT_ICEDAMAGE, minDamage = 1000, maxDamage = -4500, length = 11, effect = CONST_ME_GIANTICE, target = false},
}

monster.defenses = {
	defense = 120,
	armor = 100,
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 10000, maxDamage = 30000, effect = CONST_ME_MAGIC_GREEN, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 100},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 90},
	{type = COMBAT_LIFEDRAIN, percent = 100},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 20},
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
