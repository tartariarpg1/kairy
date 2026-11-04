local mType = Game.createMonsterType("Grand Chagorz")
local monster = {}

monster.description = "Grand Chagorz"
monster.experience = 3850000
monster.outfit = {
	lookType = 1665,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"RottenBloodBossDeath",
}

monster.bosstiary = {
	bossRaceId = 2640,
	bossRace = RARITY_ARCHFOE,
}

monster.health = 450000
monster.maxHealth = 450000
monster.race = "undead"
monster.corpse = 44024
monster.speed = 250
monster.manaCost = 0

monster.changeTarget = {
	interval = 10000,
	chance = 20,
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
	staticAttackChance = 98,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.summon = {
	maxSummons = 8,
	summons = {
		{ name = "Mushroom", chance = 30, interval = 3000, count = 3 },
		{ name = "Walking Pillar", chance = 30, interval = 2000, count = 3 },
		{ name = "Oozing Corpus", chance = 30, interval = 1000, count = 2 },		
	},
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "The light... that... drains!", yell = false },
	{ text = "RAAAR!", yell = false },
	{ text = "WILL ... PUNISH ... YOU!", yell = false },
	{ text = "Darkness ... devours!", yell = false },
}

monster.loot = {
	{ name = "crystal coin", chance = 5441, maxCount = 108 },
	{ name = "mastermind potion", chance = 5530, maxCount = 28 },
	{ name = "supreme health potion", chance = 5044, maxCount = 154 },
	{ name = "giant sapphire", chance = 10546, maxCount = 1 },
	{ name = "ultimate mana potion", chance = 5752, maxCount = 107 },
	{ name = "violet gem", chance = 13217, maxCount = 4 },
	{ id = 3039, chance = 13465, maxCount = 1 }, -- red gem
	{ name = "yellow gem", chance = 14071, maxCount = 1 },
	{ name = "blue gem", chance = 11156, maxCount = 3 },
	{ name = "bullseye potion", chance = 6792, maxCount = 21 },
	{ name = "giant amethyst", chance = 11603, maxCount = 1 },
	{ name = "giant topaz", chance = 12280, maxCount = 1 },
	{ name = "green gem", chance = 8348, maxCount = 1 },
	{ id = 43854, chance = 360, maxCount = 1 },
	{ id = 43855, chance = 360, maxCount = 1 },	
	{ name = "ultimate spirit potion", chance = 10934, maxCount = 18 },
	{ name = "white gem", chance = 9600, maxCount = 3 },
	{ id = 43898, chance = 360 }, -- Bag you covet	
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = -1300, maxDamage = -3250 },
	{ name = "combat", interval = 1000, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -1500, maxDamage = -3900, radius = 4, effect = CONST_ME_GREEN_RINGS, target = false },
	{ name = "combat", interval = 1200, chance = 20, type = COMBAT_DEATHDAMAGE, minDamage = -1000, maxDamage = -3900, range = 4, radius = 4, effect = 18, target = true },
	{ name = "combat", interval = 1300, chance = 20, type = COMBAT_EARTHDAMAGE, minDamage = -1000, maxDamage = -4200, length = 10, spread = 0, effect = CONST_ME_POFF, target = false },
	{ name = "combat", interval = 1100, chance = 20, type = COMBAT_LIFEDRAIN, minDamage = -1500, maxDamage = -4900, length = 10, spread = 0, effect = 31, target = false },
	{ name = "speed", interval = 2000, chance = 20, speedChange = -600, radius = 7, effect = CONST_ME_MAGIC_GREEN, target = false, duration = 20000 },
}

monster.defenses = {
	defense = 105,
	armor = 105,
	{ name = "combat", interval = 3000, chance = 10, type = COMBAT_HEALING, minDamage = 700, maxDamage = 1500, effect = 236, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 15 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 15 },
	{ type = COMBAT_EARTHDAMAGE, percent = 15 },
	{ type = COMBAT_FIREDAMAGE, percent = 15 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 15 },
	{ type = COMBAT_HOLYDAMAGE, percent = 15 },
	{ type = COMBAT_DEATHDAMAGE, percent = 15 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType.onThink = function(monster, interval) end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature) end

mType.onMove = function(monster, creature, fromPosition, toPosition) end

mType.onSay = function(monster, creature, type, message) end

mType:register(monster)
