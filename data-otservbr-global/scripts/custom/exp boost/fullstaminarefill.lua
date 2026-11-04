local config = {
timeToUse = 5,
storage = 983987,


}
local function getMinutes(seconds)
    return math.floor(seconds/60)
end


local fullstaminarefill = Action()
function fullstaminarefill.onUse(player, item, ...)
    local stamina = player:getStamina()
    if stamina >= 2520 then
        player:sendCancelMessage("You have a full stamina.")
        return true
    end
	if player:getStorageValue(config.storage) > os.time() then
        print(player:getStorageValue(config.storage))
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You need wait more %d minutes to Use this again!", getMinutes(player:getStorageValue(config.storage) - os.time())))
        return false
    end
    player:setStamina(math.min(2520, stamina + 2520))
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    player:sendCancelMessage("You have regenerate Full stamina.")
	player:setStorageValue(config.storage, os.time() + config.timeToUse * 60 * 60)
    item:remove(1)
    return true
end

fullstaminarefill:id(60578)
fullstaminarefill:register()