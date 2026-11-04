local mType = Game.createMonsterType("Gran Bulltaur Alchemist")
local monster = {}

monster.description = "Gran Bulltaur Alchemist"
monster.experience = 3000000
monster.outfit = {
	lookType = 1718,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 10000000
monster.maxHealth = 10000000
monster.race = "blood"
monster.corpse = 37704
monster.speed = 530
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10
}

monster.bosstiary = {
	bossRaceId = 2622,
	bossRace = RARITY_NEMESIS
	--storageCooldown = Storage.Quest.U12_70.AdventuresOfGalthen.MegasylvanYseldaTimer
}

monster.summon = {
	maxSummons = 5,
	summons = {
		{name = "Bulltaur Brute", chance = 10, interval = 800, count = 5},
		{name = "Bulltaur Alchemist", chance = 10, interval = 800, count = 5},
		{name = "Bulltaur ForgePriest", chance = 10, interval = 800, count = 5}
	}
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
	staticAttackChance = 70,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
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
	{text = "Revenge for my little brother!", yell = false},
	{text = "You are starting to annoy me!", yell = false},
	{text = "I will restore our family honor!", yell = false}
}

monster.summons = {
}

monster.loot = {
	{id = 34109, chance = 100000}, -- ferumbras' hat	
	{id = 39546, chance = 100000}, -- ferumbras' hat		
	{id = 3043, chance = 98000, maxCount = 484}, -- gold coin
	{id = 22118, chance = 98000, maxCount = 10}, -- gold coin	
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
	{ id = 896, chance = 8938, maxCount = 1 },	 -- firlefanz	
} 

monster.attacks = {
	{name ="melee", interval = 900, chance = 100, minDamage = 250, maxDamage = -3500},
    {name ="combat", interval = 900, chance = 85, type = COMBAT_EARTHDAMAGE, minDamage = 500, maxDamage = -2550, radius = 11, effect = CONST_ME_SMALLPLANTS, target = false},
	{name ="combat", interval = 900, chance = 85, type = COMBAT_PHYSICALDAMAGE, minDamage = 600, maxDamage = -3550, radius = 6, effect = CONST_ME_GROUNDSHAKER, target = false},
	{name ="combat", interval = 900, chance = 50, type = COMBAT_EARTHDAMAGE, minDamage = 500, maxDamage = -4700, length = 8, spread = 6, effect = CONST_ME_GREEN_RINGS, target = false},
	{name ="combat", interval = 900, chance = 50, type = COMBAT_EARTHDAMAGE, minDamage = 800, maxDamage = -5400, length = 11, effect = CONST_ME_PLANTATTACK, target = false},
	{name ="combat", interval = 900, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = 1500, maxDamage = -6250, range = 5, shootEffect = CONST_ANI_SMALLEARTH, effect = CONST_ME_PLANTATTACK, target = true},
}

monster.defenses = {
	defense = 160,
	armor = 160,
	{name ="combat", interval = 1000, chance = 15, type = COMBAT_HEALING, minDamage = 5000, maxDamage = 10000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="combat", interval = 1000, chance = 25, type = COMBAT_HEALING, minDamage = 2000, maxDamage = 3000, effect = CONST_ME_MAGIC_BLUE, target = false},
	{name ="speed", interval = 1000, chance = 8, speedChange = 1901, effect = CONST_ME_MAGIC_RED, target = false, duration = 5000},
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 5},
	{type = COMBAT_EARTHDAMAGE, percent = 0},
	{type = COMBAT_FIREDAMAGE, percent = 5},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 0},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = true},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "drunk", condition = true},
	{type = "bleed", condition = false}
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)
