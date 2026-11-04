local teleport = MoveEvent()

local destination = Position(32091, 32027, 7) -- Coordenadas de destino
local requiredLevel = 800 -- Nivel mínimo requerido

function teleport.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then
        return true
    end

    if player:getLevel() >= requiredLevel then
        player:teleportTo(destination)
        player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
        destination:sendMagicEffect(CONST_ME_TELEPORT)
    else
        player:sendCancelMessage("Necesitas ser al menos nivel " .. requiredLevel .. " para usar este teletransportador.")
        player:teleportTo(fromPosition)
        fromPosition:sendMagicEffect(CONST_ME_POFF)
    end

    return true
end

teleport:type("stepin")
teleport:aid(12345) -- ID de acción único del teleportador
teleport:register()
