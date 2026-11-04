local chests = {
	[4005] = { itemid = 60024, count = 1 },
	[4006] = { itemid = 60042, count = 1 },
	[4007] = { itemid = 37110, count = 10 },
	[4008] = { itemid = 60668, count = 1 },
	[4009] = { itemid = 60577, count = 1 },	
	[4010] = { itemid = 60640, count = 1 },	
	[4011] = { itemid = 43898, count = 1 },	---Gran Bag You Covet
	[4012] = { itemid = 34109, count = 1 },	---Bag you Desire
	[4013] = { itemid = 60030, count = 3 },	---Bottle Exp X3
	[4014] = { itemid = 60705, count = 1 },	---black egg	
	[4015] = { itemid = 3309, count = 1 },	---thunder hammer
	[4016] = { itemid = 3288, count = 1 },	---magic sword
	[4017] = { itemid = 3319, count = 1 },	---stonecutter axe
	[4018] = { itemid = 12603, count = 1 },	---wand of dimensions
}

local demonOakChest = Action()

function demonOakChest.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if chests[item.uid] then
		local chest = chests[item.uid]
		local storageKey = 10000 + item.uid -- Usamos una clave única basada en el UID del cofre
		
		-- Verifica si el jugador ya ha recogido este cofre
		if player:getStorageValue(storageKey) > 0 then
			player:sendTextMessage(MESSAGE_STATUS_SMALL, "You have already taken this reward.")
			return true
		end
		
		local itemType = ItemType(chest.itemid)
		if itemType then
			local article = itemType:getArticle()
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have found " .. (#article > 0 and article .. " " or "") .. itemType:getName() .. ".")
		end

		player:addItem(chest.itemid, chest.count)

		-- Marca que el jugador ya ha tomado este cofre
		player:setStorageValue(storageKey, 1)
	end
	return true
end

for unique, itemInfo in pairs(chests) do
	demonOakChest:uid(unique)
end

demonOakChest:register()
