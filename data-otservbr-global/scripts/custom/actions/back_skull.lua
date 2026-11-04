local removeSkull = Action()

function removeSkull.onUse(player, item, fromPos, target, toPos, isHotkey)
    local playerPos = player:getPosition()
    local tile = Tile(playerPos)
    
    if not tile or not tile:hasFlag(TILESTATE_PROTECTIONZONE) then
        player:sendCancelMessage("You can use only in pz.")
        return true
    end

    -- Verificamos si el jugador tiene una red skull
    if player:getSkull() ~= SKULL_BLACK then
        player:sendCancelMessage("You can only remove a black skull.")
        return true
    end

    player:setSkullTime(1) -- Esto lo puedes ajustar según necesites.
    player:setSkull(SKULL_NONE)
    playerPos:sendMagicEffect(CONST_ME_MORTAREA)
    player:say("Remove Skull!")
    item:remove(1)
    return true
end

removeSkull:id(60569)
removeSkull:register()