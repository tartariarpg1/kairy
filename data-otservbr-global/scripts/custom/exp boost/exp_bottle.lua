local expscroll = Action()

function expscroll.onUse(cid, item, fromPosition, itemEx, toPosition)
    local player = Player(cid)
    local remainingBoost = player:getXpBoostTime()
    local currentExpBoostTime = player:getXpBoostTime()
    local expBoostCount = player:getStorageValue(GameStore.Storages.expBoostCount)

    if expBoostCount >= 5 then -- Xp boost sólo se puede utilizar 5 veces al día
        player:say('Has alcanzado el límite para hoy, inténtalo de nuevo después de Guardar servidor.', TALKTYPE_MONSTER_SAY)
        return true
    end
    
    if (remainingBoost > 0) then -- Si el jugador todavía tiene un aumento de XP activo, no le permita usar otro.
        player:say('Ya tienes un impulso de XP activo.', TALKTYPE_MONSTER_SAY)
        return true
    end
    
    player:setXpBoostPercent(100)
    player:setXpBoostTime(currentExpBoostTime + 3600)
    Item(item.uid):remove(1)
    player:say('Tu hora de bonificación XP x2 ha comenzado!', TALKTYPE_MONSTER_SAY)
    return true
end

expscroll:id(60577)
expscroll:register()