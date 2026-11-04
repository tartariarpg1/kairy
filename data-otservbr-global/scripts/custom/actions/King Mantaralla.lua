local action = Action()
local config = {
    boss = {
        name = "King Mantaralla",
        position = Position(33688, 31097, 11),
    },
    QuaraOxigen = { -- Posiciones donde se invocarán los Infernal Demons
        Position(33680, 31095, 11),
        Position(33691, 31094, 11),
        Position(33685, 31097, 11),
    },
    QuaraArmy = { -- Posiciones donde se invocarán los Mega Brachio Demons
        Position(33690, 31100, 11),
        Position(33687, 31101, 11),
    },
    QuaraOxigen = { -- Posiciones donde se invocarán los Mega Cloak of Terrors
        Position(33688, 31094, 11),
        Position(33691, 31101, 11),
        Position(33692, 31104, 11),
        Position(33685, 31092, 11),
        Position(33692, 31105, 11),
    },
    playerPositions = {
        { pos = Position(33717, 31098, 11), teleport = Position(33689, 31099, 11) },
        { pos = Position(33716, 31099, 11), teleport = Position(33688, 31090, 11) },
        { pos = Position(33717, 31099, 11), teleport = Position(33694, 31092, 11) },
        { pos = Position(33718, 31099, 11), teleport = Position(33681, 31095, 11) },
        { pos = Position(33716, 31100, 11), teleport = Position(33694, 31096, 11) },
        { pos = Position(33717, 31100, 11), teleport = Position(33682, 31091, 11) },
        { pos = Position(33716, 31101, 11), teleport = Position(33686, 31105, 11) },
        { pos = Position(33717, 31101, 11), teleport = Position(33692, 31107, 11) },
        { pos = Position(33718, 31101, 11), teleport = Position(33696, 31107, 11) },
        { pos = Position(33741, 31327, 14), teleport = Position(33695, 31102, 11) },		
    },
    specPos = {
        from = Position(33673, 31082, 11),
        to = Position(33707, 31113, 11),
    },
    teleportTimer = 600, -- seconds, 10 minutes (600s)
    cooldownTimer = 8 * 60 * 60, -- 8 hours in seconds
    storage = 10032 -- Needs to be unique, used for player cooldown
}

local function removeMonsterFromArea(fromPos, toPos)
    local exitPosition = Position(33745, 31330, 14)

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
        for _, QuaraOxigenPosition in ipairs(config.QuaraOxigen) do
            Game.createMonster("QuaraOxigen", QuaraOxigenPosition, true)
        end

        -- Spawn Mega Brachio Demons
        for _, QuaraArmyPosition in ipairs(config.QuaraArmy) do
            Game.createMonster("QuaraArmy", QuaraArmyPosition, true)
        end

        -- Spawn Mega Cloak of Terrors
        for _, QuaraOxigenPosition in ipairs(config.QuaraOxigen) do
            Game.createMonster("QuaraOxigen", QuaraOxigenPosition, true)
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
            Game.broadcastMessage("The time to defeat King Mantaralla has ended. The room is now cleared.")
        end, config.teleportTimer * 1000)
    end
    return true
end

action:aid(2623)
action:register()

