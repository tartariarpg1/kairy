local expscroll = Action()

function expscroll.onUse(cid, item, fromPosition, itemEx, toPosition)
    local player = Player(cid)
    local remainingBoost = player:getXpBoostTime()
    local currentExpBoostTime = player:getXpBoostTime()
    local expBoostCount = player:getStorageValue(GameStore.Storages.expBoostCount)

    if expBoostCount >= 5 then -- Xp boost sólo se puede utilizar 5 veces al día
        player:say('Has alcanzado el límite para hoy, intentalo de nuevo despues de Guardar servidor.', TALKTYPE_MONSTER_SAY)
        return true
    end
    
    if (remainingBoost > 0) then -- Si el jugador todavía tiene un aumento de XP activo, no le permita usar otro.
        player:say('Ya tienes un impulso de XP activo.', TALKTYPE_MONSTER_SAY)
        return true
    end
    
    -- Ajuste para dar 300% de experiencia y duración de 4 horas
    player:setXpBoostPercent(200) -- 100% base + 200% = 300% total
    player:setXpBoostTime(currentExpBoostTime + 14400) -- 14400 segundos = 4 horas
    Item(item.uid):remove(1)
    
    -- Notificar al jugador que usó el boost
    player:say('Tu bonificación de XP 200% ha comenzado y durara 4 horas!', TALKTYPE_MONSTER_SAY)
    
    -- Notificar a todos los jugadores online que se usó un boost
    local players = Game.getPlayers()
    for i = 1, #players do
        players[i]:say(player:getName() .. ' ha activado un boost de experiencia de 200% por 4 horas!', TALKTYPE_BROADCAST)
    end
    
    -- Notificación 5 minutos antes de que el boost termine
    addEvent(function()
        if player:getXpBoostTime() <= 300 then -- Quedan 5 minutos (300 segundos)
            player:say('Tu bonificación de XP esta por terminar en 5 minutos.', TALKTYPE_MONSTER_SAY)
        end
    end, (14400 - 300) * 1000) -- Notificación 5 minutos antes del fin (300 segundos antes)
    
    return true
end

expscroll:id(60794)
expscroll:register()
