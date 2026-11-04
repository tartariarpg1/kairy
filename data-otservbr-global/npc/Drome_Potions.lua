local internalNpcName = "Drome Potions"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 133,
	lookHead = 0,
	lookBody = 114,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 2
}

npcConfig.flags = {
	floorchange = false
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

npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

npcConfig.shop = {
	{ itemName = "kooldown-aid", clientId = 36723, buy = 5000000 },
	{ itemName = "strike enhancement", clientId = 36724, buy = 5000000 },
	{ itemName = "stamina extension", clientId = 36725, buy = 5000000 },
	{ itemName = "charm upgrade", clientId = 36726, buy = 5000000 },
	{ itemName = "wealth duplex", clientId = 36727, buy = 5000000 },
	{ itemName = "bestiary betterment", clientId = 36728, buy = 5000000 },
	{ itemName = "fire resilience", clientId = 36729, buy = 5000000 },
	{ itemName = "ice resilience", clientId = 36730, buy = 5000000 },
	{ itemName = "earth resilience", clientId = 36731, buy = 5000000 },
	{ itemName = "energy resilience", clientId = 36732, buy = 5000000 },
	{ itemName = "holy resilience", clientId = 36733, buy = 5000000 },
	{ itemName = "death resilience", clientId = 36734, buy = 5000000 },
	{ itemName = "physical resilience", clientId = 36735, buy = 5000000 },
	{ itemName = "fire amplification", clientId = 36736, buy = 5000000 },
	{ itemName = "ice amplification", clientId = 36737, buy = 5000000 },
	{ itemName = "earth amplification", clientId = 36738, buy = 5000000 },
	{ itemName = "energy amplification", clientId = 36739, buy = 5000000 },
	{ itemName = "holy amplification", clientId = 36740, buy = 5000000 },
	{ itemName = "death amplification", clientId = 36741, buy = 5000000 },
	{ itemName = "physical amplification", clientId = 36742, buy = 5000000 }

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
npcType.onCheckItem = function(npc, player, clientId, subType)
end

npcType:register(npcConfig)