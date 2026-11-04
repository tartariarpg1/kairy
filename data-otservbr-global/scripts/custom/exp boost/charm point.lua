local charmScroll = Action()

function charmScroll.onUse(cid, item, fromPosition, itemEx, toPosition)
    local player = Player(cid)
    local maxCharmBoosts = 10 -- Máximo número de usos al día
    local charmBoostCount = player:getStorageValue(GameStore.Storages.charmBoostCount) or 0

    -- Asegúrate de que el contador de boosts esté en un estado válido
    if charmBoostCount >= maxCharmBoosts then
        player:say('Has alcanzado el límite de usos para hoy. Inténtalo de nuevo después de reiniciar el servidor.', TALKTYPE_MONSTER_SAY)
        return true
    end

    -- Añade puntos de encanto
    local charmPoints = 400 -- Puedes ajustar la cantidad de puntos de encanto que se otorgan aquí
    player:addCharmPoints(charmPoints)
    player:setStorageValue(GameStore.Storages.charmBoostCount, charmBoostCount + 1)

    -- Elimina el objeto de scroll
    Item(item.uid):remove(1)
    
    -- Envía un mensaje al jugador
    player:say('¡Has recibido ' .. charmPoints .. ' puntos de encanto!', TALKTYPE_MONSTER_SAY)
    player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA) -- Efecto visual

    return true
end

charmScroll:id(60152) -- Asegúrate de que el ID coincida con el objeto del scroll
charmScroll:register()
