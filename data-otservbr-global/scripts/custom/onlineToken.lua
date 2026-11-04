local config = {
    storage = 20000,
    pointItemId = 60186,
    pointsPerHour = 1,
    checkDuplicateIps = true
}

local onlinePointsEvent = GlobalEvent("GainPointPerHour")

function onlinePointsEvent.onThink(interval)
    local players = Game.getPlayers()
    if #players == 0 then
        return true
    end

    local ipCount = {}
    for _, player in pairs(players) do
        local ip = player:getIp()
        if ip ~= 0 then
            ipCount[ip] = (ipCount[ip] or 0) + 1
        end
    end

    for _, player in pairs(players) do
        local ip = player:getIp()
        if ip ~= 0 then
            if ipCount[ip] > 2 then
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Para recibir tus Online Coin, no debe haber mas de 2 jugadores simultaneamente en linea con la misma IP.")
            else
                local seconds = math.max(0, player:getStorageValue(config.storage))
                if seconds >= 1800 then
                    player:setStorageValue(config.storage, 0)
                    local item = player:addItem(config.pointItemId, config.pointsPerHour)
                    if item then
                        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Has recibido x1 Online Coin por estar en linea durante media hora.")
                    end
                else
                    player:setStorageValue(config.storage, seconds + math.ceil(interval / 1000))
                end
            end
        end
    end
    return true
end

onlinePointsEvent:interval(10000)
onlinePointsEvent:register()
