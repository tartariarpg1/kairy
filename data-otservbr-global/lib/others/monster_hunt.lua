MONSTER_HUNT = {
    list = {"Mega Demon", "Mega Infernal Demon", "Mega Falcon Paladin", "Ades", "Ultra Mega Demon"},
    days = {
        ["Friday"] = {"22:00"},
        ["Saturday"] = {"22:00"},
        ["Sunday"] = {"22:00"},
        ["Monday"] = {"22:00"},
        ["Tuesday"] = {"22:00"},
        ["Wednesday"] = {"22:00"},
        ["Thursday"] = {"22:00"},
    },
    messages = {
        prefix = "[Monster Hunt] ",
        warnInit = "El evento comenzará en %d minuto%s. Su objetivo será matar la mayor cantidad de monstruos posible. El ganador se lleva 300 TCs.",
        init = "El monstruo del evento es %s. Tienes cuatro horas para matar la mayor cantidad posible.",
        warnEnd = "Faltan %d minuto%s para que termine el evento. ¡Apresúrate!",
        final = "El jugador %s fue el ganador del evento! ¡Felicidades!",
        noWinner = "No hubo ganadores en el evento.",
        reward = "Recibiste 300 tibia coins, 1 bag you desire, 100 exchange tokens!",
        kill = "Has matado %d %s para el evento monster hunt.",
        status = "El monstruo del evento es %s. Has matado %d %s hasta ahora.",
        leaderboard = "Top 10 jugadores:\n%s",  -- Mensaje de ranking
    },
    rewards = {
        {id = 22118, count = 300}, -- Tibia Coins
        {id = 60186, count = 100}, -- Exchange Tokens
        {id = 34109, count = 1},   -- Bag
    },
    storages = {
        monster = 891641, 
        player = 891642,
    },
    players = {},
}

function MONSTER_HUNT:initEvent()
    Game.setStorageValue(MONSTER_HUNT.storages.monster, 0)
    Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.warnInit:format(5, "s"), MESSAGE_ADMINISTRATOR)
    
    -- Mensajes de advertencia antes del inicio del evento
    addEvent(function()
        Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.warnInit:format(3, "s"), MESSAGE_ADMINISTRATOR)
    end, 2 * 60 * 1000) -- 3 minutos antes

    addEvent(function()
        Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.warnInit:format(1, ""), MESSAGE_ADMINISTRATOR)
    end, 4 * 60 * 1000) -- 1 minuto antes
    
    -- Anuncio del inicio del evento
    addEvent(function()
        local rand = math.random(#MONSTER_HUNT.list)
        Game.setStorageValue(MONSTER_HUNT.storages.monster, rand)
        Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.init:format(MONSTER_HUNT.list[rand]), MESSAGE_ADMINISTRATOR)
        
        -- Mensajes de advertencia durante el evento
        addEvent(function()
            Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. "Faltan 3 horas para que termine el evento.", MESSAGE_ADMINISTRATOR)
        end, 1 * 60 * 60 * 1000) -- 1 hora después
        
        addEvent(function()
            Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. "Faltan 2 horas para que termine el evento.", MESSAGE_ADMINISTRATOR)
        end, 2 * 60 * 60 * 1000) -- 2 horas después
        
        addEvent(function()
            Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. "Faltan 1 hora para que termine el evento.", MESSAGE_ADMINISTRATOR)
        end, 3 * 60 * 60 * 1000) -- 3 horas después
        
        -- Mensaje final del evento
        addEvent(function()
            if #MONSTER_HUNT.players == 0 then
                Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.noWinner, MESSAGE_ADMINISTRATOR)
                Game.setStorageValue(MONSTER_HUNT.storages.monster, -1)
                return
            end
            table.sort(MONSTER_HUNT.players, function(a, b) return a[2] > b[2] end)
            local player = Player(MONSTER_HUNT.players[1][1])
            if player then
                Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.final:format(player:getName()), MESSAGE_ADMINISTRATOR)
                player:setStorageValue(MONSTER_HUNT.storages.player, -1)
                for _, reward in ipairs(MONSTER_HUNT.rewards) do
                    local item = Game.createItem(reward.id, reward.count)
                    player:addItemEx(item)
                    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.reward)
                    player:getPosition():sendMagicEffect(30)
                end
            end
            for _, playerData in pairs(MONSTER_HUNT.players) do
                local player = Player(playerData[1])
                if player then
                    player:setStorageValue(MONSTER_HUNT.storages.player, 0)
                end
            end
            MONSTER_HUNT.players = {}
            Game.setStorageValue(MONSTER_HUNT.storages.monster, -1)
        end, 4 * 60 * 60 * 1000) -- 4 horas después
    
    end, 5 * 60 * 1000) -- Inicio del evento 5 minutos después del mensaje de inicialización
    
    return true
end

function MONSTER_HUNT:endEvent()
    Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.warnEnd:format(5, "s"), MESSAGE_ADMINISTRATOR)
    
    -- Mensajes de advertencia antes del fin del evento
    addEvent(function()
        Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.warnEnd:format(3, "s"), MESSAGE_ADMINISTRATOR)
    end, 2 * 60 * 1000) -- 3 minutos antes
    
    addEvent(function()
        Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.warnEnd:format(1, ""), MESSAGE_ADMINISTRATOR)
    end, 4 * 60 * 1000) -- 1 minuto antes
    
    -- Mensaje final del evento
    addEvent(function()
        if #MONSTER_HUNT.players == 0 then
            Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.noWinner, MESSAGE_ADMINISTRATOR)
            Game.setStorageValue(MONSTER_HUNT.storages.monster, -1)
            return
        end
        table.sort(MONSTER_HUNT.players, function(a, b) return a[2] > b[2] end)
        local player = Player(MONSTER_HUNT.players[1][1])
        if player then
            Game.broadcastMessage(MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.final:format(player:getName()), MESSAGE_ADMINISTRATOR)
            player:setStorageValue(MONSTER_HUNT.storages.player, -1)
            for _, reward in ipairs(MONSTER_HUNT.rewards) do
                local item = Game.createItem(reward.id, reward.count)
                player:addItemEx(item)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, MONSTER_HUNT.messages.prefix .. MONSTER_HUNT.messages.reward)
                player:getPosition():sendMagicEffect(30)
            end
        end
        for _, playerData in pairs(MONSTER_HUNT.players) do
            local player = Player(playerData[1])
            if player then
                player:setStorageValue(MONSTER_HUNT.storages.player, 0)
            end
        end
        MONSTER_HUNT.players = {}
        Game.setStorageValue(MONSTER_HUNT.storages.monster, -1)
    end, 5 * 60 * 1000) -- 5 minutos después del fin del evento
    
    return true
end

function onSay(player, words, param)
    if words == "!monsterevent" then
        local monsterId = Game.getStorageValue(MONSTER_HUNT.storages.monster)
        if monsterId <= 0 or monsterId > #MONSTER_HUNT.list then
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "No hay un evento de monstruos activo en este momento.")
            return true
        end

        local monsterName = MONSTER_HUNT.list[monsterId]
        local kills = player:getStorageValue(MONSTER_HUNT.storages.player) or 0
        
        -- Mostrar información del evento
        local statusMessage = MONSTER_HUNT.messages.status:format(monsterName, kills, monsterName)
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, statusMessage)
        
        -- Mostrar leaderboard de jugadores
        if #MONSTER_HUNT.players > 0 then
            table.sort(MONSTER_HUNT.players, function(a, b) return a[2] > b[2] end)
            local leaderboard = {}
            for i, playerData in ipairs(MONSTER_HUNT.players) do
                local playerInList = Player(playerData[1])
                if playerInList then
                    table.insert(leaderboard, string.format("%d. %s - %d kills", i, playerInList:getName(), playerData[2]))
                end
                if i >= 10 then break end  -- Solo mostrar los 10 primeros jugadores
            end
            local leaderboardMessage = MONSTER_HUNT.messages.leaderboard:format(table.concat(leaderboard, "\n"))
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, leaderboardMessage)
        else
            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "No hay jugadores participando en el evento actualmente.")
        end
        
        return true
    end
    return false
end
