
local config = 
{
	itemID = 44969
}

local forgeExaltation = Action()
function forgeExaltation.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:openForge()
	return true
end
forgeExaltation:id(config.itemID)
forgeExaltation:register()