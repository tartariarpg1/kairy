local outfits = {
    ["citizen"] = {136, 128}
}

local storage = 32943

local addonDollCoin = Action()
function addonDollCoin.onUse(player, item, fromPosition, itemEx, toPosition, isHotkey)
    if player:getStorageValue(storage) > 0 then
        player:sendCancelMessage("Ya tienes el addon..")
		player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    for a, b in pairs(outfits) do
        player:addOutfitAddon(b[1], 3)
        player:addOutfitAddon(b[2], 3)
    end
    
	player:addOutfitAddon(136, 1)
	player:addOutfitAddon(128, 1)
    player:sendCancelMessage("Ya tienes el addon.")
    player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
	player:setStorageValue(storage, 1)
	item:remove(1)
    return true
end

addonDollCoin:id(44808)
addonDollCoin:register()