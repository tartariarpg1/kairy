local callback = EventCallback()

function Player:canReceiveLoot()
	return self:getStamina() > 840
end

-- Función auxiliar para convertir cualquier valor en string (como dump básico)
local function tostringValue(value)
	if type(value) == "table" then
		local str = "{ "
		for k, v in pairs(value) do
			str = str .. tostring(k) .. " = " .. tostringValue(v) .. ", "
		end
		return str .. "}"
	end
	return tostring(value)
end

function callback.monsterOnDropLoot(monster, corpse)
	local player = Player(corpse:getCorpseOwner())
	local factor = 1.0
	local msgSuffix = ""

	if player and player:canReceiveLoot() then
		local config = player:calculateLootFactor(monster)
		factor = config.factor
		msgSuffix = config.msgSuffix
	end

	local mType = monster:getType()
	if not mType then
		print("monsterOnDropLoot: monster has no type")
		return
	end

	local charm = player and player:getCharmMonsterType(CHARM_GUT)
	local gut = charm and charm:raceId() == mType:raceId()

	local lootTable = mType:generateLootRoll({ factor = factor, gut = gut }, {})
	if not lootTable then
		print("monsterOnDropLoot: failed to generate loot table for monster:", monster:getName())
		return
	end

	-- Revisión de cada ítem antes de agregarlos al corpse
	for i, entry in ipairs(lootTable) do
		if type(entry) == "number" then
			print("[Loot Error] Monster:", monster:getName(), " - Invalid loot entry (number):", entry)
		elseif type(entry.item) == "userdata" and entry.item:isItem() then
			print("[Loot Info] Monster:", monster:getName(), " - Adding item:", entry.item:getId(), "x", entry.count or 1)
		else
			print("[Loot Warning] Monster:", monster:getName(), " - Unexpected loot entry: ", tostringValue(entry))
		end
	end

	-- Agregar loot al corpse de forma segura
	local success, err = pcall(function()
		corpse:addLoot(lootTable)
	end)
	if not success then
		print("[Loot Fatal Error] Monster:", monster:getName(), " - addLoot failed:", err)
	end

	-- Sufijo por charms
	for _, item in ipairs(lootTable) do
		if item.gut then
			msgSuffix = msgSuffix .. " (active charm bonus)"
		end
	end

	local existingSuffix = corpse:getAttribute(ITEM_ATTRIBUTE_LOOTMESSAGE_SUFFIX) or ""
	corpse:setAttribute(ITEM_ATTRIBUTE_LOOTMESSAGE_SUFFIX, existingSuffix .. msgSuffix)
end

callback:register("monsterOnDropLoot")
