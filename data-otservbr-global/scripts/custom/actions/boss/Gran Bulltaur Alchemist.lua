local action = Action()
local config = {
    boss = {
        name = "Gran Bulltaur Alchemist",
        position = Position(33210, 33511, 12),
    },
    playerPositions = {
        { pos = Position(33228, 33612, 12), teleport = Position(33209, 33526, 12) },
        { pos = Position(33228, 33611, 12), teleport = Position(33208, 33526, 12) },
        { pos = Position(33228, 33613, 12), teleport = Position(33207, 33526, 12) },
        { pos = Position(33227, 33612, 12), teleport = Position(33206, 33508, 12) },
        { pos = Position(33227, 33611, 12), teleport = Position(33205, 33508, 12) },
        { pos = Position(33227, 33613, 12), teleport = Position(33204, 33508, 12) },
        { pos = Position(33226, 33612, 12), teleport = Position(33218, 33513, 12) },
        { pos = Position(33226, 33611, 12), teleport = Position(33218, 33514, 12) },
        { pos = Position(33226, 33613, 12), teleport = Position(33218, 33515, 12) },
        { pos = Position(33225, 33612, 12), teleport = Position(33199, 33514, 12) },
        { pos = Position(33225, 33611, 12), teleport = Position(33199, 33515, 12) },
        { pos = Position(33225, 33613, 12), teleport = Position(33199, 33516, 12) },		
        { pos = Position(33224, 33612, 12), teleport = Position(33206, 33512, 12) },
        { pos = Position(33224, 33611, 12), teleport = Position(33214, 33517, 12) },
        { pos = Position(33224, 33613, 12), teleport = Position(33214, 33510, 12) },		
    },
    specPos = {
        from = Position(33193, 33501, 12),
        to = Position(33225, 33531, 12),
    },
    teleportTimer = 900, -- seconds, 15 minutes (900s)
    cooldownTimer = 8 * 60 * 60, -- 2 hours in seconds
	storage = 10025 -- Needs to be unique, used for player cooldown
}

local function removeMonsterFromArea(fromPos, toPos)
    local exitPosition = Position(33226, 33615, 12)

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
    if item.itemid == 2773 then
        player:say("Cling..", TALKTYPE_MONSTER_SAY)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Sorry, this room is currently in use. Please, come back later.")
        return true
    end

    -- If lever time is over or reset
    if item.itemid == 2772 then
        item:transform(2773)
        Game.createMonster(config.boss.name, config.boss.position, 1) -- 1 being one mob

        -- teleport player(s)
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
            item:transform(2772)
            -- Kick players, remove mobs from radius
            removeMonsterFromArea(config.specPos.from, config.specPos.to)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Time is up, better luck next time!")
        end, config.teleportTimer * 1000)
    end
    return true
end

action:aid(2614)
action:register()
