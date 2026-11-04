local internalNpcName = "Addon Items"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 129,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 3,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "General goods and paperware for sale!" },
}

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if MsgContains(message, "football") then
		npcHandler:say("Do you want to buy a football for 111 gold?", npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif MsgContains(message, "yes") then
		if npcHandler:getTopic(playerId) == 1 then
			local player = Player(creature)
			if player:getMoney() + player:getBankBalance() >= 111 then
				npcHandler:say("Here it is.", npc, creature)
				player:addItem(2990, 1)
				player:removeMoneyBank(111)
			else
				npcHandler:say("You don't have enough money.", npc, creature)
			end
			npcHandler:setTopic(playerId, 0)
		end
	end
	return true
end

-- Basic
keywordHandler:addKeyword({ "job" }, StdModule.say, { npcHandler = npcHandler, text = "I am selling equipment of all kinds. Do you need anything?" })
keywordHandler:addKeyword({ "king" }, StdModule.say, { npcHandler = npcHandler, text = "The king supports Tibia's economy a lot." })
keywordHandler:addAliasKeyword({ "tibianus" })
keywordHandler:addKeyword({ "magic" }, StdModule.say, { npcHandler = npcHandler, text = "Magic? Ask a sorcerer or druid about that." })
keywordHandler:addKeyword({ "name" }, StdModule.say, { npcHandler = npcHandler, text = "I am Gorn. My goods are known all over Tibia." })
keywordHandler:addKeyword({ "time" }, StdModule.say, { npcHandler = npcHandler, text = "It is exactly |TIME|. Maybe you want to buy a watch?" })
keywordHandler:addKeyword({ "druids" }, StdModule.say, { npcHandler = npcHandler, text = "This druids are nice people, you will find them in the east of the town." })
keywordHandler:addKeyword({ "knights" }, StdModule.say, { npcHandler = npcHandler, text = "Even the strong knights need my equipment on their travels though Tibia." })
keywordHandler:addKeyword({ "sorcerers" }, StdModule.say, { npcHandler = npcHandler, text = "You can find him in the sorcerer guild." })
keywordHandler:addKeyword({ "elane" }, StdModule.say, { npcHandler = npcHandler, text = "She's the leader of the paladin guild." })
keywordHandler:addKeyword({ "baxter" }, StdModule.say, { npcHandler = npcHandler, text = "Old Baxter was a rowdy, once. In our youth we shared some adventures and women." })
keywordHandler:addKeyword({ "bozo" }, StdModule.say, { npcHandler = npcHandler, text = "Bah! Go away with this bozoguy." })
keywordHandler:addKeyword({ "frodo" }, StdModule.say, { npcHandler = npcHandler, text = "Frodo is a jolly fellow." })
keywordHandler:addKeyword({ "ferumbras" }, StdModule.say, { npcHandler = npcHandler, text = "We had a clash or two in the old days." })
keywordHandler:addKeyword({ "gregor" }, StdModule.say, { npcHandler = npcHandler, text = "Even the strong knights need my equipment on their travels though Tibia." })
keywordHandler:addKeyword({ "lynda" }, StdModule.say, { npcHandler = npcHandler, text = "That's a pretty one." })
keywordHandler:addKeyword({ "mcronald" }, StdModule.say, { npcHandler = npcHandler, text = "I hardly know the McRonalds." })
keywordHandler:addKeyword({ "muriel" }, StdModule.say, { npcHandler = npcHandler, text = "You can find him in the sorcerer guild." })
keywordHandler:addKeyword({ "oswald" }, StdModule.say, { npcHandler = npcHandler, text = "This Oswald has not enough to work and too much time to spread rumours." })
keywordHandler:addKeyword({ "quentin" }, StdModule.say, { npcHandler = npcHandler, text = "He advices newcomers to buy at my store. I love that guy!" })
keywordHandler:addKeyword({ "sam" }, StdModule.say, { npcHandler = npcHandler, text = "Strong as an ox, could armwrestle a minotaur, I bet." })
keywordHandler:addKeyword({ "xodet" }, StdModule.say, { npcHandler = npcHandler, text = "He owns the magic shop here. But be aware: The prices are enormous." })
npcHandler:setMessage(MESSAGE_GREET, "Oh, please come in, |PLAYERNAME|. What do you need?")
npcHandler:setMessage(MESSAGE_FAREWELL, "Good bye.")
npcHandler:setMessage(MESSAGE_WALKAWAY, "Good bye.")
npcHandler:setMessage(MESSAGE_SENDTRADE, "Of course, just browse through my wares. {Footballs} have to be purchased separately.")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "banana staff", clientId = 3348, buy = 50000 },
	{ itemName = "boots of haste", clientId = 3079, buy = 40000 },
	{ itemName = "medusa shield", clientId = 3436, buy = 15000 },
	{ itemName = "crown legs", clientId = 3382, buy = 15000 },
	{ itemName = "dragon scale mail", clientId = 3386, buy = 70000 },
	{ itemName = "ring of the sky", clientId = 3006, buy = 10000 },
	{ itemName = "piece of royal steel", clientId = 5887, buy = 100000 },
	{ itemName = "lizard leather", clientId = 5876, buy = 1500 },
	{ itemName = "green dragon leather", clientId = 5877, buy = 1500 },
	{ itemName = "minotaur leather", clientId = 5878, buy = 1500 },
	{ itemName = "iron ore", clientId = 5880, buy = 1500 },
	{ itemName = "ape fur", clientId = 5883, buy = 1500 },
	{ itemName = "spirit container", clientId = 5884, buy = 100000 },
	{ itemName = "flask of warrior's sweat", clientId = 5885, buy = 100000 },
	{ itemName = "spool of yarn", clientId = 5886, buy = 10000 },
	{ itemName = "piece of hell steel", clientId = 5888, buy = 100000 },
	{ itemName = "piece of draconian steel", clientId = 5889, buy = 100000 },
	{ itemName = "chicken feather", clientId = 5890, buy = 1500 },
	{ itemName = "enchanted chicken wing", clientId = 5891, buy = 50000 },
	{ itemName = "huge chunk of crude iron", clientId = 5892, buy = 100000 },
	{ itemName = "perfect behemoth fang", clientId = 5893, buy = 3000 },
	{ itemName = "bat wing", clientId = 5894, buy = 1500 },
	{ itemName = "fish fin", clientId = 5895, buy = 1500 },
	{ itemName = "bear paw", clientId = 5896, buy = 1500 },
	{ itemName = "wolf paw", clientId = 5897, buy = 1500 },
	{ itemName = "bonelord eye", clientId = 5898, buy = 2000 },
	{ itemName = "turtle shell", clientId = 5899, buy = 2000 },
	{ itemName = "honeycomb", clientId = 5902, buy = 1500 },
	{ itemName = "magic sulphur", clientId = 5904, buy = 3000 },
	{ itemName = "vampire dust", clientId = 5905, buy = 3000 },
	{ itemName = "demon dust", clientId = 5906, buy = 3000 },
	{ itemName = "white piece of cloth", clientId = 5909, buy = 1500 },
	{ itemName = "green piece of cloth", clientId = 5910, buy = 1500 },
	{ itemName = "red piece of cloth", clientId = 5911, buy = 1500 },
	{ itemName = "blue piece of cloth", clientId = 5912, buy = 1500 },
	{ itemName = "brown piece of cloth", clientId = 5913, buy = 1500 },
	{ itemName = "yellow piece of cloth", clientId = 5914, buy = 1500 },
	{ itemName = "dragon claw", clientId = 5919, buy = 1000000 },
	{ itemName = "heaven blossom", clientId = 5921, buy = 1500 },
	{ itemName = "holy orchid", clientId = 5922, buy = 1500 },
	{ itemName = "damaged steel helmet", clientId = 5924, buy = 50000 },
	{ itemName = "hardened bone", clientId = 5925, buy = 1500 },
	{ itemName = "behemoth claw", clientId = 5930, buy = 3000 },
	{ itemName = "griffinclaw container", clientId = 5937, buy = 100000 },
	{ itemName = "red dragon leather", clientId = 5948, buy = 1500 },
	{ itemName = "winning lottery ticket", clientId = 5958, buy = 100000 },
	{ itemName = "legion helmet", clientId = 3374, buy = 100000 },
	{ itemName = "tribal mask", clientId = 3403, buy = 50000 },
	{ itemName = "lizard scale", clientId = 5881, buy = 1500 },
	{ itemName = "mandrake", clientId = 5014, buy = 1000000 },
	{ itemName = "nose ring", clientId = 5804, buy = 1000000 },
	{ itemName = "peg leg", clientId = 6126, buy = 1500 },
	{ itemName = "eye patch", clientId = 6098, buy = 1500 },
	{ itemName = "hook", clientId = 6097, buy = 1500 },
	{ itemName = "Brutus Bloodbeard's hat", clientId = 6099, buy = 1000000 },
	{ itemName = "Lethal Lissy's shirt", clientId = 6100, buy = 1000000 },
	{ itemName = "Ron the Ripper's sabre", clientId = 6101, buy = 1000000 },
	{ itemName = "Deadeye Devious' eye patch", clientId = 6102, buy = 1000000 },
	{ itemName = "ankh", clientId = 3077, buy = 1500 },
	{ itemName = "sniper gloves", clientId = 5875, buy = 1000000 },
	{ itemName = "soul stone", clientId = 5809, buy = 1000000 },
	{ itemName = "plague bell", clientId = 12787, buy = 1000000 },
	{ itemName = "plague mask", clientId = 12786, buy = 1000000 },
	{ itemName = "sturdy book", clientId = 28792, buy = 1000000 },
	{ itemName = "epaulette", clientId = 28793, buy = 1000000 },
	{ itemName = "gnomish voucher type CA1", clientId = 16256, buy = 1000000 },
	{ itemName = "gnomish voucher type CA2", clientId = 16257, buy = 1000000 },
	{ itemName = "ice shield", clientId = 30168, buy = 1000000 },
	{ itemName = "pomegranate", clientId = 30169, buy = 100000 },
	{ itemName = "elemental spikes", clientId = 12803, buy = 1000000 },
	{ itemName = "mage's cap", clientId = 12599, buy = 1000000 },
	{ itemName = "porcelain mask", clientId = 25088, buy = 100000 },
	{ itemName = "colourful feathers", clientId = 25089, buy = 3000 },
	{ itemName = "vampiric crest", clientId = 9041, buy = 100000 },
	{ itemName = "Jaul's Pearl", clientId = 14021, buy = 1000000 },
	{ itemName = "Tanjis' Sight", clientId = 14022, buy = 1000000 },
	{ itemName = "Obujos' Shell", clientId = 14023, buy = 1000000 },
	{ itemName = "small golden anchor", clientId = 14019, buy = 100000 },
	{ itemName = "document of the officer", clientId = 769, buy = 100000 },
	{ itemName = "document of the leader", clientId = 770, buy = 10000 },
	{ itemName = "shard", clientId = 7290, buy = 50000 },
	{ itemName = "silver token", clientId = 22516, buy = 10000 },
	{ itemName = "gold token", clientId = 22721, buy = 20000 },
	{ itemName = "voodoo doll", clientId = 3002, buy = 1000000 },
	{ itemName = "pirate voodoo doll", clientId = 5810, buy = 50000 },
	{ itemName = "staff", clientId = 6107, buy = 1000000 },
	{ itemName = "gnomish voucher type MA1", clientId = 16253, buy = 100000 },
	{ itemName = "gnomish voucher type MA2", clientId = 16254, buy = 100000 },
	{ itemName = "tribal crest", clientId = 10198, buy = 100000 },
	{ itemName = "serpent crest", clientId = 10199, buy = 100000 },
	{ itemName = "sedge hat", clientId = 11700, buy = 100000 },
	{ itemName = "old cape", clientId = 11701, buy = 100000 }
}
-- On buy npc shop message
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end
-- On sell npc shop message
npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_INFO_DESCR, string.format("Sold %ix %s for %i gold.", amount, name, totalCost))
end
-- On check npc shop message (look item)
npcType.onCheckItem = function(npc, player, clientId, subType) end

npcType:register(npcConfig)