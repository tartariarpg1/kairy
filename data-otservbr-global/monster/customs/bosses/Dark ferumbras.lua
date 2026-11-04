local mType = Game.createMonsterType("Dark Ferumbras")
local monster = {}

monster.description = "Dark Ferumbras"
monster.experience = 92000
monster.outfit = {
	lookType = 2009,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3500000
monster.maxHealth = 3500000
monster.race = "venom"
monster.corpse = 6078
monster.speed = 160
monster.manaCost = 0

monster.changeTarget = {
	interval = 500,
	chance = 8
}

monster.bosstiary = {
	bossRaceId = 2620,
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
		{name = "Mega Infernal Demon", chance = 12, interval = 1300, count = 7}
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
	{ id = 60186, chance = 8938, maxCount = 10 },	 -- emerald coin
	{ id = 44604, chance = 8938, maxCount = 1 },	 -- greater guardian gem
	{ id = 44613, chance = 8938, maxCount = 1 },	 -- greater mystic gem
	{ id = 44607, chance = 8938, maxCount = 1 },	 -- greater marksman gem	
	{ id = 44610, chance = 8938, maxCount = 1 },	 -- greater sage gem
	{ id = 60648, chance = 8938, maxCount = 2 },	 -- greater sage gem	
	{ id = 39546, chance = 2000, maxCount = 1 },	 -- primal bag	
	{ id = 43860, chance = 2000, maxCount = 1 },	 -- bag you covet	
	{ id = 43898, chance = 1000, maxCount = 1 },	 -- Grand bag you covet	
	{ id = 896, chance = 8938, maxCount = 1 },	 -- firlefanz	
	{name = "bag you desire", chance = 2000},		
	{name = "primal bag", chance = 2000}
}

monster.attacks = {
	{name ="melee", interval = 800, chance = 100, minDamage = 250, maxDamage = -2500},
	{name ="combat", interval = 1000, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = 1200, maxDamage = -2400, range = 4, radius = 6, effect = CONST_ME_SMALLCLOUDS, target = true},
	{name ="combat", interval = 1200, chance = 85, type = COMBAT_PHYSICALDAMAGE, minDamage = 900, maxDamage = -1500, radius = 14, effect = CONST_ME_ELECTRICALSPARK, target = false},
	{name ="combat", interval = 1400, chance = 85, type = COMBAT_HOLYDAMAGE, minDamage = 800, maxDamage = -2500, radius = 14, effect = CONST_ME_HOLYDAMAGE, target = false},
	{name ="combat", interval = 1600, chance = 85, type = COMBAT_EARTHDAMAGE, minDamage = 1500, maxDamage = -5500, radius = 14, effect = CONST_ME_STONE_STORM, target = false},
	{name ="combat", interval = 1800, chance = 85, type = COMBAT_ENERGYDAMAGE, minDamage = 900, maxDamage = -2500, radius = 14, effect = CONST_ME_SLASH, target = false},
	{name ="combat", interval = 2000, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = 1200, maxDamage = -3400, range = 4, radius = 6, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 2200, chance = 50, type = COMBAT_EARTHDAMAGE, minDamage = 1400, maxDamage = -2800, length = 11, spread = 6, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="combat", interval = 2400, chance = 50, type = COMBAT_PHYSICALDAMAGE, minDamage = 800, maxDamage = -2500, length = 11, spread = 6, effect = CONST_ME_GROUNDSHAKER, target = false},
	{name ="combat", interval = 2600, chance = 20, type = COMBAT_PHYSICALDAMAGE, minDamage = 750, maxDamage = -4000, radius = 6, effect = CONST_ME_EXPLOSIONHIT, target = false},
	{name ="combat", interval = 3000, chance = 85, type = COMBAT_PHYSICALDAMAGE, minDamage = 500, maxDamage = -3550, radius = 9, effect = CONST_ME_SOUND_PURPLE, target = false},
}

monster.defenses = {
	defense = 120,
	armor = 100,
	{name ="combat", interval = 800, chance = 10, type = COMBAT_HEALING, minDamage = 4000, maxDamage = 6500, effect = CONST_ME_MAGIC_GREEN, target = false},
	{name ="invisible", interval = 800, chance = 20, effect = CONST_ME_MAGIC_BLUE}
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
