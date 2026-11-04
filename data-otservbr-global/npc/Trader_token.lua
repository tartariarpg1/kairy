local internalNpcName = "Trader Token"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 150
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 2098,
	lookHead = 96,
	lookBody = 65,
	lookLegs = 0,
	lookFeet = 96,
	lookAddons = 2
}

npcConfig.flags = {
	floorchange = false
}

npcConfig.currency = 60186

npcConfig.shop = {
	{ itemName = "cobra box", clientId = 60544, buy = 50},
	{ itemName = "eldritch box", clientId = 60556, buy = 100},
	{ itemName = "falcon box", clientId = 60546, buy = 150},
	{ itemName = "lion box", clientId = 60550, buy = 120},
	{ itemName = "primal bag", clientId = 39546, buy = 200},	
	{ itemName = "AllSkillBoost", clientId = 60156, buy = 100},
	{ itemName = "primal bag", clientId = 39546, buy = 200},
	{ itemName = "bag you covet", clientId = 43895, buy = 800},
	{ itemName = "the supreme cube", clientId = 31633, buy = 350},
	{ itemName = "kooldown-aid", clientId = 36723, buy = 5 },
	{ itemName = "stamina extension", clientId = 36725, buy = 5 },
	{ itemName = "charm upgrade", clientId = 36726, buy = 5 },
	{ itemName = "wealth duplex", clientId = 36727, buy = 5 },
	{ itemName = "bestiary betterment", clientId = 36728, buy = 5 },	
	{ itemName = "infernatus backpack", clientId = 60058, buy = 150 },		
	{ itemName = "skeleton backpack", clientId = 60065, buy = 150 },		
	{ itemName = "birthday backpack", clientId = 60057, buy = 150 },		
	{ itemName = "Unicornio backpack", clientId = 60042, buy = 150 },	
	{ itemName = "arboreal backpack", clientId = 60073, buy = 350 },
	{ itemName = "arcanomancer backpack", clientId = 60072, buy = 350 },	
	{ itemName = "spiritthorn backpack", clientId = 60071, buy = 350 },	
	{ itemName = "alicorn backpack", clientId = 60070, buy = 350 },	
	{ itemName = "premium loot pouch", clientId = 60024, buy = 150 },	
	{ itemName = "loot seller book", clientId = 60025, buy = 3500 },		
	{ itemName = "exalted core", clientId = 37110, buy = 20 },
	{ itemName = "Bottle Exp X2", clientId = 60577, buy = 100 },		
	{ itemName = "Bottle Exp X3", clientId = 60030, buy = 150 },		
	{ itemName = "Tier Upgrader 50%", clientId = 60667, buy = 300 },
	{ itemName = "terramorfo backpack", clientId = 60061, buy = 650 },
	{ itemName = "eternal night demon backpack", clientId = 60280, buy = 650 },	
	{ itemName = "eternal night moon backpack", clientId = 60247, buy = 650 },	
	{ itemName = "eternal night root backpack", clientId = 60256, buy = 650 },
	{ itemName = "Addon doll", clientId = 60171, buy = 50 },
	{ itemName = "Mount Doll", clientId = 60170, buy = 50 },	
	{ itemName = "Mexirevit sudden death rune", clientId = 60603, buy = 50 },
	{ itemName = "Mexirevit avalanche rune", clientId = 3162, buy = 50 },
	{ itemName = "Mexirevit arrow", clientId = 60601, buy = 50 },
	{ itemName = "Mexirevit bolt", clientId = 60602, buy = 50 }

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

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = 'Troco tokens de eventos aqui' },
	{ text = 'Aqui voce pode trocar os tokens dos eventos..' },
	{ text = 'Tokens! Somente Tokens!' }
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

local charge = {}

local chargeItem = {

}

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	if not player or not playerId then
		return false
	end

	if MsgContains(message, 'token') or MsgContains(message, 'tokens') then
		npcHandler:say("If you have any {silver} tokens with you, let's have a look! Maybe I can offer you something in exchange.", npc, creature)
	elseif MsgContains(message, 'information') then
		npcHandler:say("With pleasure. <bows> I trade {token}s. There are several ways to obtain the {token}s I am interested in - killing certain bosses, for example. In exchange for a certain amount of tokens, I can offer you some first-class items.", npc, creature)
	elseif MsgContains(message, 'talk') then
		npcHandler:say({"Why, certainly! I'm always up for some small talk. ...",
						 "The weather continues just fine here, don't you think? Just the day for a little walk around the town! ...",
						 "Actually, I haven't been around much yet, but I'm looking forward to exploring the city once I've finished trading {token}s."}, npc, creature)
	elseif MsgContains(message, 'silver') then
		npc:openShopWindow(creature)
		npcHandler:say({"Here's the deal, " .. player:getName() .. ". For 100 of your silver tokens, I can offer you some first-class torso armor. These armors provide a solid boost to your main attack skill, as well as ...",
		"some elemental protection of your choice! I also sell a magic shield potion for one silver token. So these are my offers."}, npc, creature)
	elseif MsgContains(message, 'enchant') then
		npcHandler:say({"The following items can be enchanted: {pendulet}, {sleep shawl}, {blister ring}, {theurgic amulet}, {ring of souls}. ...",
						"For sufficient silver tokens you can also enchant: {spiritthorn ring}, {alicorn ring}, {arcanomancer sigil}, {arboreal ring}, {turtle amulet}. Make you choice!"}, npc, creature)
		npcHandler:setTopic(playerId, 1)
	elseif isInArray({'pendulet', 'sleep shawl', 'blister ring', 'theurgic amulet', 'ring of souls', 'turtle amulet'}, message:lower()) and npcHandler:getTopic(playerId) == 1 then
		npcHandler:say("Should I enchant the item " .. message .. " for 2 ".. ItemType(npc:getCurrency()):getPluralName():lower() .."?", npc, creature)
		charge = message:lower()
		npcHandler:setTopic(playerId, 2)
	elseif isInArray({'spiritthorn ring', 'alicorn ring', 'arcanomancer sigil', 'arboreal ring'}, message:lower()) and npcHandler:getTopic(playerId) == 1 then
		npcHandler:say("Should I enchant the item " .. message .. " for 5 ".. ItemType(npc:getCurrency()):getPluralName():lower() .."?", npc, creature)
		charge = message:lower()
		npcHandler:setTopic(playerId, 2)
	elseif npcHandler:getTopic(playerId) == 2 then
		if MsgContains(message, 'yes') then
			if not chargeItem[charge] then
				npcHandler:say("Sorry, you don't have an unenchanted ".. charge ..".", npc, creature)
			else
				if (player:getItemCount(npc:getCurrency()) >= 2) and (player:getItemCount(chargeItem[charge].noChargeID) >= 1) then
					player:removeItem(npc:getCurrency(), 2)
					player:removeItem(chargeItem[charge].noChargeID, 1)
					local itemAdd = player:addItem(chargeItem[charge].ChargeID, 1)
					npcHandler:say("Ah, excellent. Here is your " .. itemAdd:getName():lower() .. ".", npc, creature)
				else
					npcHandler:say("Sorry, friend, but one good turn deserves another. Bring enough ".. ItemType(npc:getCurrency()):getPluralName():lower() .." and it's a deal.", npc, creature)
				end
				npcHandler:setTopic(playerId, 0)
			end
		elseif MsgContains(message, 'no') then
			npcHandler:say("Alright, come back if you have changed your mind.", npc, creature)
			npcHandler:setTopic(playerId, 0)
		end
	elseif MsgContains(message, 'addon') then
		if player:hasOutfit(846, 0) or player:hasOutfit(845, 0) then
			npcHandler:say("Ah, very good. Now choose your addon: {first} or {second}.", npc, creature)
			npcHandler:setTopic(playerId, 3)
		else
			npcHandler:say("Sorry, friend, but one good turn deserves another. You need to obtain the rift warrior outfit first.", npc, creature)
		end
	elseif isInArray({'first', 'second'}, message:lower()) and npcHandler:getTopic(playerId) == 3 then
		if message:lower() == 'first' then
			if not(player:hasOutfit(846, 1)) and not(player:hasOutfit(845, 1)) then
				if player:removeItem(22516, 100) then
					npcHandler:say("Ah, excellent. Obtain the first addon for your rift warrior outfit.", npc, creature)
					player:addOutfitAddon(846, 1)
					player:addOutfitAddon(845, 1)
					if (player:hasOutfit(846, 1) or player:hasOutfit(845, 1)) and (player:hasOutfit(846, 2) or player:hasOutfit(845, 2)) then
						player:addAchievement("Rift Warrior")
					end
				else
					npcHandler:say("Sorry, friend, but one good turn deserves another. Bring enough ".. ItemType(npc:getCurrency()):getPluralName():lower() .." and it's a deal.", npc, creature)
				end
			else
				npcHandler:say("Sorry, friend, you already have the first Rift Warrior addon.", npc, creature)
			end
		elseif message:lower() == 'second' then
			if not(player:hasOutfit(846, 2)) and not(player:hasOutfit(845, 2)) then
				if player:removeItem(22516, 100) then
					npcHandler:say("Ah, excellent. Obtain the second addon for your rift warrior outfit.", npc, creature)
					player:addOutfitAddon(846, 2)
					player:addOutfitAddon(845, 2)
					if (player:hasOutfit(846, 1) or player:hasOutfit(845, 1)) and (player:hasOutfit(846, 2) or player:hasOutfit(845, 2)) then
						player:addAchievement("Rift Warrior")
					end
				else
					npcHandler:say("Sorry, friend, but one good turn deserves another. Bring enough ".. ItemType(npc:getCurrency()):getPluralName():lower() .." and it's a deal.", npc, creature)
				end
			else
				npcHandler:say("Sorry, friend, you already have the second Rift Warrior addon.", npc, creature)
			end
		end
		npcHandler:setTopic(playerId, 0)
	end
	return true
end

npcHandler:setMessage(MESSAGE_GREET, "Blessings, Player! How may I be of service? Do you wish to trade some {token}s, or would you like some {information} or {talk}? Should I {enchant} certain items for you?")
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)

-- npcType registering the npcConfig table
npcType:register(npcConfig)
