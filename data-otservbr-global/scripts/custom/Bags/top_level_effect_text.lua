local config = {
    interval = 15 * 1000, -- 15 segundos
    effects = {
        level = { text = "[TOP LEVEL Mexirevit]", effect = CONST_ME_AVATAR_APPEAR },
        sword = { text = "[TOP SWORD Mexirevit]", effect = CONST_ME_HITAREA },
        axe = { text = "[TOP AXE Mexirevit]", effect = CONST_ME_HITAREA },
        club = { text = "[TOP CLUB Mexirevit]", effect = CONST_ME_HITAREA },
        magic = { text = "[TOP MAGIC LEVEL Mexirevit]", effect = CONST_ME_MAGIC_GREEN },
        distance = { text = "[TOP DISTANCE Mexirevit]", effect = CONST_ME_HITAREA }
    }
}

local event = GlobalEvent("TopLevelEffect")

local function getTopPlayer(skillColumn)
    local query = string.format("SELECT name FROM players WHERE group_id < 2 ORDER BY %s DESC LIMIT 1;", skillColumn)
    local resultId = db.storeQuery(query)
    if not resultId then
        return nil
    end

    local playerName = result.getString(resultId, "name")
    result.free(resultId)

    if playerName then
        local player = Player(playerName)
        if player then -- Asegurarse de que player no es nil
            return player
        end
    end
    return nil
end

function event.onThink(interval)
    local topPlayers = {
        level = getTopPlayer("level"),
        sword = getTopPlayer("skill_sword"),
        axe = getTopPlayer("skill_axe"),
        club = getTopPlayer("skill_club"),
        magic = getTopPlayer("maglevel"),
        distance = getTopPlayer("skill_dist")
    }

    for skill, player in pairs(topPlayers) do
        if player then
            local position = player:getPosition()
            position:sendMagicEffect(config.effects[skill].effect)
            player:say(config.effects[skill].text, TALKTYPE_MONSTER_SAY, false, nil, position)
        end
    end

    return true
end

event:interval(config.interval)
event:register()
