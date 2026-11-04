local monsterHuntInfoCommand = TalkAction("!monstereventinfo")

function monsterHuntInfoCommand.onSay(player, words, param)
    local monsterId = Game.getStorageValue(MONSTER_HUNT.storages.monster)
    
    if monsterId <= 0 or monsterId > #MONSTER_HUNT.list then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "No hay un evento de monstruos activo en este momento.")
        return true
    end

    local monsterName = MONSTER_HUNT.list[monsterId]
    local kills = player:getStorageValue(MONSTER_HUNT.storages.player) or 0
    
    -- Información del evento
    local statusMessage = string.format(
        "El monstruo del evento es %s.\nHas matado %d %s hasta ahora.",
        monsterName,
        kills,
        monsterName
    )
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
        local leaderboardMessage = "Top 10 jugadores:\n" .. table.concat(leaderboard, "\n")
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, leaderboardMessage)
    else
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "No hay jugadores participando en el evento actualmente.")
    end
    
    return true
end

monsterHuntInfoCommand:groupType("normal")
monsterHuntInfoCommand:register()
