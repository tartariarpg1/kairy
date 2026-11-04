local table = 
{
	-- [level] = type = "item", id = {ITEM_ID, QUANTITY}, msg = "MESSAGE"},
	-- [level] = type = "bank", id = {QUANTITY, 0}, msg = "MESSAGE"},
	-- [level] = type = "addon", id = {ID_ADDON_FEMALE, ID_ADDON_MALE}, msg = "MESSAGE"},
	-- [level] = type = "coin", id = {QUANTITY, 0}, msg = "MESSAGE"},
	-- [level] = type = "mount", id = {ID_MOUNT, 0}, msg = "MESSAGE"},

	[20] = {type = "item", id = {3043, 5}, msg = "You win 5 crystal coins for reach the level 20!"},
	[30] = {type = "bank", id = {100000, 0}, msg = "Was deposited in your bank 100000 gold coins!"},
	[40] = {type = "addon", id = {136, 128}, msg = "You win the addon citizen full for reach the level 40!"},
	[60] = {type = "mount", id = {2, 0}, msg = "You win the mount x!"},
	[80] = {type = "bank", id = {150000, 0}, msg = "Was deposited in your bank 150000 gold coins!"},	
	[100] = {type = "item", id = {3043, 20}, msg = "You win 20 crystal coins for reach the level 100!"},
	[150] = {type = "addon", id = {147, 143}, msg = "You win the addon Barbarian full for reach the level 150!"},
	[200] = {type = "item", id = {3043, 50}, msg = "You win 50 crystal coins for reach the level 200!"},	
	[210] = {type = "mount", id = {9, 0}, msg = "You win the mount x!"},	
	[250] = {type = "item", id = {3043, 60}, msg = "You win 60 crystal coins for reach the level 250!"},	
	[300] = {type = "item", id = {60577, 20}, msg = "You win 20 exchange token for reach the level 300!"},	
	[350] = {type = "addon", id = {279, 278}, msg = "You win the addon Brotherhood full for reach the level 350!"},	
	[400] = {type = "mount", id = {48, 0}, msg = "You win the mount x!"},
	[500] = {type = "item", id = {60577, 30}, msg = "You win 30 exchange token for reach the level 500!"},
	[550] = {type = "addon", id = {1858, 1858}, msg = "You win the addon Buuda full for reach the level 550!"},	
	[600] = {type = "addon", id = {1857, 1857}, msg = "You win the addon Strong Tank full for reach the level 600!"},
	[650] = {type = "item", id = {60577, 4}, msg = "You win 5 Bottle Exp X2 for reach the level 650!"},	
	[700] = {type = "addon", id = {1857, 1857}, msg = "You win the addon Strong Tank full for reach the level 600!"},
	[800] = {type = "addon", id = {1857, 1857}, msg = "You win the addon Strong Tank full for reach the level 600!"},	
}

local storage = 15000

local levelReward = CreatureEvent("Level Reward")
function levelReward.onAdvance(player, skill, oldLevel, newLevel)

	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	for level, _ in pairs(table) do
		if newLevel >= level and player:getStorageValue(storage) < level then
			if table[level].type == "item" then	
				player:addItem(table[level].id[1], table[level].id[2])
			elseif table[level].type == "bank" then
				player:setBankBalance(player:getBankBalance() + table[level].id[1])
			elseif table[level].type == "addon" then
				player:addOutfitAddon(table[level].id[1], 3)
				player:addOutfitAddon(table[level].id[2], 3)
			elseif table[level].type == "coin" then
				player:addTibiaCoins(table[level].id[1])
			elseif table[level].type == "mount" then
				player:addMount(table[level].id[1])
			else
				return false
			end

			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, table[level].msg)
			player:setStorageValue(storage, level)
		end
	end

	player:save()

	return true
end

levelReward:register()