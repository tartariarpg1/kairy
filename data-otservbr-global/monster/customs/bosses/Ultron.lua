local mType = Game.createMonsterType("Ultron")
local monster = {}

monster.description = "Ultron"
monster.experience = 82000
monster.outfit = {
	lookType = 1716,
	lookHead = 105,
	lookBody = 90,
	lookLegs = 20,
	lookFeet = 10,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 3500000
monster.maxHealth = 3500000
monster.race = "venom"
monster.corpse = 6078
monster.speed = 860
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.bosstiary = {
	bossRaceId = 2613,
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
	runHealth = 4500,
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
		{name = "Mega Falcon Knight", chance = 12, interval = 1500, count = 4}
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
	{name ="melee", interval = 800, chance = 85, minDamage = -2500, maxDamage = -3500},
	{name ="combat", interval = 1200, chance = 35, type = COMBAT_EARTHDAMAGE, minDamage = -3000, maxDamage = -4000, length = 10, spread = 3, effect = CONST_ME_CARNIPHILA, target = false},
	{name ="combat", interval = 1300, chance = 45, type = COMBAT_FIREDAMAGE, minDamage = -3000, maxDamage = -5000, length = 10, spread = 3, effect = CONST_ME_HITBYFIRE, target = false},
	{name ="big death wave", interval = 2000, chance = 35, minDamage = -3000, maxDamage = -7000, target = false},
	{name ="combat", interval = 1500, chance = 40, type = COMBAT_ENERGYDAMAGE, effect = CONST_ME_ENERGYHIT, minDamage = -3500, maxDamage = -4000, range = 4, target = false},
	{name ="combat", interval = 1880, chance = 45, type = COMBAT_EARTHDAMAGE, shootEffect = CONST_ANI_POISON, effect = CONST_ANI_EARTH, minDamage = -1500, maxDamage = -4000, range = 4, target = false},
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
