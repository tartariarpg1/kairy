local mType = Game.createMonsterType("Terrario")
local monster = {}

monster.description = "Terrario"
monster.experience = 42000
monster.outfit = {
	lookType = 1596,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 4500000
monster.maxHealth = 4500000
monster.race = "venom"
monster.corpse = 6078
monster.speed = 560
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.bosstiary = {
	bossRaceId = 2615,
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
	maxSummons = 10,
	summons = {
		{name = "Mega Feral Werecrocodile", chance = 12, interval = 1000, count = 10},
		{name = "Mega Weretiger", chance = 12, interval = 1200, count = 10},		
		{name = "Mega White Weretiger", chance = 12, interval = 1300, count = 10},			
		{name = "Mega Werecrocodile", chance = 12, interval = 1400, count = 10}		
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
	{name = "crystal coin", chance = 55000, minCount = 70, maxCount = 275},
	{name = "gold token", chance = 55000, minCount = 1, maxCount = 3},	
	{name = "crystal coin", chance = 55000, minCount = 70, maxCount = 275},
	{name = "gold token", chance = 55000, minCount = 1, maxCount = 3},	
	{id = 60544, chance = 1100}, -- cobra chest
	{id = 60550, chance = 900}, -- lion chest	
	{id = 60556, chance = 800}, -- mutant chest	
	{id = 60546, chance = 700}, -- falcon chest
	{ id = 22118, chance = 8938, maxCount = 10 },	 -- emerald coin
	{ id = 44604, chance = 8938, maxCount = 1 },	 -- greater guardian gem
	{ id = 44613, chance = 8938, maxCount = 1 },	 -- greater mystic gem
	{ id = 44607, chance = 8938, maxCount = 1 },	 -- greater marksman gem	
	{ id = 44610, chance = 8938, maxCount = 1 },	 -- greater sage gem
	{ id = 60648, chance = 8938, maxCount = 2 },	 -- greater sage gem
	{ id = 43860, chance = 2000, maxCount = 1 },	 -- bag you covet	
	{ id = 43898, chance = 1000, maxCount = 1 },	 -- Grand bag you covet	
	{ id = 896, chance = 8938, maxCount = 1 },	 -- firlefanz	
	{name = "bag you desire", chance = 2000},		
	{name = "primal bag", chance = 2000}
}

monster.attacks = {
	{name ="melee", interval = 800, chance = 100, minDamage = 1000, maxDamage = -4000},
	{name ="combat", interval = 1200, chance = 30, type = COMBAT_PHYSICALDAMAGE, minDamage = -950, maxDamage = -3400, range = 7, radius = 3, shootEffect = CONST_ANI_DEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 1400, chance = 10, type = COMBAT_DEATHDAMAGE, minDamage = -1000, maxDamage = -4500, length = 8, spread = 3, effect = CONST_ME_INSECTS, target = false},
	{name ="singlecloudchain", interval = 800, chance = 40, minDamage = -1300, maxDamage = -3500, range = 6, effect = CONST_ME_ENERGYHIT, target = true},
	{name ="big death wave", interval = 1000, chance = 35, minDamage = -3000, maxDamage = -7000, target = false},	
	{name ="combat", interval = 1300, chance = 85, type = COMBAT_HOLYDAMAGE, minDamage = 800, maxDamage = -2500, radius = 14, effect = CONST_ME_HOLYDAMAGE, target = false},
	{name ="combat", interval = 3000, chance = 85, type = COMBAT_EARTHDAMAGE, minDamage = 900, maxDamage = -1500, radius = 14, effect = CONST_ME_STONE_STORM, target = false},
	{name ="combat", interval = 1000, chance = 85, type = COMBAT_ENERGYDAMAGE, minDamage = 900, maxDamage = -2500, radius = 14, effect = CONST_ME_SLASH, target = false},
	{name ="combat", interval = 1200, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = 1200, maxDamage = -3400, range = 4, radius = 6, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 1500, chance = 50, type = COMBAT_EARTHDAMAGE, minDamage = 1400, maxDamage = -2800, length = 11, spread = 6, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="combat", interval = 2500, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = 800, maxDamage = -2500, length = 11, spread = 6, effect = CONST_ME_GROUNDSHAKER, target = false},	
}

monster.defenses = {
	defense = 120,
	armor = 100,
	{name ="combat", interval = 2000, chance = 10, type = COMBAT_HEALING, minDamage = 900, maxDamage = 3500, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="invisible", interval = 4000, chance = 20, effect = CONST_ME_MAGIC_BLUE}
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
