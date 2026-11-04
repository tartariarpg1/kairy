local foods = {
	[49615] = {22, 'Pizza.'}, -- Pizza

}

local food = Action()
function food.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local bloodBrothersStorage = Storage.Quest.U8_4.BloodBrothers
	local itemFood = foods[item.itemid]
	local effect = itemFood[3]
	if not itemFood then
		return false
	end
	local condition = player:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
	if condition and math.floor(condition:getTicks() / 1000 + (itemFood[1] * 12)) >= 1200 then
		player:sendTextMessage(MESSAGE_FAILURE, "You are full.")
		return true
	end
	if item.itemid == 8194 and player:getStorageValue(bloodBrothersStorage.GarlicBread) == 0 then
		player:setStorageValue(bloodBrothersStorage.GarlicBread, 1)
	end
	player:feed(itemFood[1] * 12)
	player:say(itemFood[2], TALKTYPE_MONSTER_SAY)
	-- item:remove(1)
	player:updateSupplyTracker(item)
	player:getPosition():sendSingleSoundEffect(SOUND_EFFECT_TYPE_ACTION_EAT, player:isInGhostMode() and nil or player)
	if effect then
		player:getPosition():sendMagicEffect(effect)
	end
	return true
end

for index, value in pairs(foods) do
	food:id(index)
end

food:register()
