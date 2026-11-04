local action = Action()
local config = {
    boss = {
        name = "Dark ferumbras",
        position = Position(33073, 33276, 12),
    },
    infernalDemons = { -- Posiciones donde se invocarán los Infernal Demons
        Position(33065, 33268, 12),
        Position(33076, 33269, 12),
        Position(33083, 33271, 12),
        Position(33079, 33287, 12),
        Position(33083, 33285, 12),
    },
    megaBrachioDemons = { -- Posiciones donde se invocarán los Mega Brachio Demons
        Position(33073, 33276, 12),
        Position(33072, 33275, 12),
        Position(33070, 33274, 12),
        Position(33076, 33273, 12),
    },
    megaCloakOfTerrors = { -- Posiciones donde se invocarán los Mega Cloak of Terrors
        Position(33074, 33274, 12),
        Position(33085, 33272, 12),
        Position(33085, 33281, 12),
        Position(33079, 33281, 12),
        Position(33072, 33273, 12),
    },
    playerPositions = {
        { pos = Position(33043, 33268, 12), teleport = Position(33074, 33263, 12) },
        { pos = Position(33044, 33268, 12), teleport = Position(33073, 33263, 12) },
        { pos = Position(33042, 33268, 12), teleport = Position(33072, 33263, 12) },
        { pos = Position(33043, 33269, 12), teleport = Position(33083, 33270, 12) },
        { pos = Position(33044, 33269, 12), teleport = Position(33083, 33271, 12) },
        { pos = Position(33042, 33269, 12), teleport = Position(33083, 33272, 12) },
        { pos = Position(33043, 33270, 12), teleport = Position(33079, 33279, 12) },
        { pos = Position(33044, 33270, 12), teleport = Position(33078, 33277, 12) },
        { pos = Position(33042, 33270, 12), teleport = Position(33065, 33282, 12) },      
        { pos = Position(33043, 33271, 12), teleport = Position(33063, 33274, 12) },
        { pos = Position(33044, 33271, 12), teleport = Position(33063, 33275, 12) },
        { pos = Position(33042, 33271, 12), teleport = Position(33063, 33276, 12) },
        { pos = Position(33043, 33272, 12), teleport = Position(33068, 33264, 12) },
        { pos = Position(33044, 33272, 12), teleport = Position(33072, 33268, 12) },
        { pos = Position(33042, 33272, 12), teleport = Position(33074, 33271, 12) },		
    },
    specPos = {
        from = Position(33056, 33258, 12),
        to = Position(33092, 33292, 12),
    },
    teleportTimer = 600, -- seconds, 10 minutes (600s)
    cooldownTimer = 8 * 60 * 60, -- 8 hours in seconds
    storage = 10030 -- Needs to be unique, used for player cooldown
}

local function removeMonsterFromArea(fromPos, toPos)
    local exitPosition = Position(33043, 33277, 12)

    for _x = fromPos.x, toPos.x do
        for _y = fromPos.y, toPos.y do
            for _z = fromPos.z, toPos.z do
                local tile = Tile(Position(_x, _y, _z))
                if tile then
                    local creatures = tile:getCreatures()
                    if creatures then
                        for _, creature in ipairs(creatures) do
                            if creature:isMonster() then
                                creature:remove()
                                print("There's a creature, removing it..")
                            elseif creature:isPlayer() then
                                creature:teleportTo(exitPosition)
                                print("There's a player, teleporting them out of the boss room..")
                            end
                        end
                    end
                end
            end
        end
    end
    return false
end

-- Part of teleportation of players, entrance
function isPositionEqual(pos1, pos2)
    return pos1.x == pos2.x and pos1.y == pos2.y and pos1.z == pos2.z
end

function action.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getStorageValue(config.storage) > os.time() then -- Is player cooldown locked?
        local remainingCooldown = player:getStorageValue(config.storage) - os.time()
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You still have a cooldown before you can enter the room again. Time remaining: " .. os.date("!%X", remainingCooldown))
        return true
    end

    local playerOnTile = false
    for _, positionData in ipairs(config.playerPositions) do
        if isPositionEqual(player:getPosition(), positionData.pos) then
            playerOnTile = true
            break
        end
    end

    -- If player is not on tile, return false to avoid spawning monsters and execute script
    if not playerOnTile then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You must stand on one of the tiles to use the lever.")
        return false
    end

    -- Does one of the players have a cooldown?
    local cooldownPlayerOnTile = false
    for _, positionData in ipairs(config.playerPositions) do
        local tile = Tile(positionData.pos)
        for _, creature in ipairs(tile:getCreatures()) do
            if creature:isPlayer() and creature:getStorageValue(config.storage) > os.time() then
                cooldownPlayerOnTile = true
                break
            end
        end
    end

    if cooldownPlayerOnTile then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "One of the players on the tiles has an active cooldown. You cannot enter at the moment.")
        return true
    end

    -- If lever is pressed, and cooldown is active.
    if item.itemid == 8912 then
        player:say("Cling..", TALKTYPE_MONSTER_SAY)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Sorry, this room is currently in use. Please, come back later.")
        return true
    end

    -- If lever time is over or reset
    if item.itemid == 8911 then
        item:transform(8912)
        Game.createMonster(config.boss.name, config.boss.position, true) -- Spawn the boss

        -- Spawn Infernal Demons
        for _, demonPosition in ipairs(config.infernalDemons) do
            Game.createMonster("Infernal Demon", demonPosition, true)
        end

        -- Spawn Mega Brachio Demons
        for _, brachioPosition in ipairs(config.megaBrachioDemons) do
            Game.createMonster("Mega Brachio Demon", brachioPosition, true)
        end

        -- Spawn Mega Cloak of Terrors
        for _, cloakPosition in ipairs(config.megaCloakOfTerrors) do
            Game.createMonster("Mega Cloak of Terror", cloakPosition, true)
        end

        -- Teleport player(s)
        for _, positionData in ipairs(config.playerPositions) do
            local posTile = Tile(positionData.pos)
            local newTeleportPos = positionData.teleport

            local creatures = posTile:getCreatures()
            if creatures then -- make sure getCreatures doesn't return nil
                for _, creature in ipairs(creatures) do
                    if creature:isPlayer() then
                        local playerName = creature:getName()

                        print("Teleporting player(s) into boss room:", playerName)
                        creature:teleportTo(newTeleportPos, true)
                        newTeleportPos:sendMagicEffect(CONST_ME_TELEPORT)

                        -- Set player cooldown
                        creature:setStorageValue(config.storage, os.time() + config.cooldownTimer) -- cooldown timer

                        -- Inform player about the time they have to defeat the boss
                        creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have " .. config.teleportTimer .. " seconds to defeat the boss before you will be teleported out.")
                    end
                end
            end
        end

        addEvent(function() -- Change lever back once time is up
            item:transform(8911)
            -- Kick players, remove mobs from radius
            removeMonsterFromArea(config.specPos.from, config.specPos.to)
            Game.broadcastMessage("The time to defeat Dark ferumbras has ended. The room is now cleared.")
        end, config.teleportTimer * 1000)
    end
    return true
end

action:aid(2620)
action:register()

