local action = Action()
local config = {
    boss = {
        name = "Terrario",
        position = Position(33200, 33259, 11),
    },
    playerPositions = {
        { pos = Position(33179, 33259, 12), teleport = Position(33200, 33261, 11) },
        { pos = Position(33180, 33260, 12), teleport = Position(33201, 33266, 11) },
        { pos = Position(33179, 33260, 12), teleport = Position(33200, 33266, 11) },
        { pos = Position(33178, 33260, 12), teleport = Position(33199, 33266, 11) },
        { pos = Position(33180, 33261, 12), teleport = Position(33198, 33266, 11) },
        { pos = Position(33179, 33261, 12), teleport = Position(33198, 33255, 11) },
        { pos = Position(33178, 33261, 12), teleport = Position(33497, 33404, 12) },
        { pos = Position(33180, 33262, 12), teleport = Position(33195, 33261, 11) },	
        { pos = Position(33179, 33262, 12), teleport = Position(33204, 33262, 11) },	
        { pos = Position(33178, 33262, 12), teleport = Position(33202, 33266, 11) },
        { pos = Position(33180, 33263, 12), teleport = Position(33195, 33261, 11) },	
        { pos = Position(33179, 33263, 12), teleport = Position(33204, 33262, 11) },	
        { pos = Position(33178, 33263, 12), teleport = Position(33202, 33266, 11) },		
		
    },
    specPos = {
        from = Position(33190, 33251, 11),
        to = Position(33209, 33270, 11),
    },
    teleportTimer = 900, -- seconds, 15 minutes (900s)
    cooldownTimer = 8 * 60 * 60, -- 2 hours in seconds
	storage = 10024 -- Needs to be unique, used for player cooldown
}

local function removeMonsterFromArea(fromPos, toPos)
    local exitPosition = Position(33180, 33266, 12)

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
    if item.itemid == 30409 then
        player:say("Cling..", TALKTYPE_MONSTER_SAY)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Sorry, this room is currently in use. Please, come back later.")
        return true
    end

    -- If lever time is over or reset
    if item.itemid == 30408 then
        item:transform(30409)
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
            item:transform(30408)
            -- Kick players, remove mobs from radius
            removeMonsterFromArea(config.specPos.from, config.specPos.to)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Time is up, better luck next time!")
        end, config.teleportTimer * 1000)
    end
    return true
end

action:aid(2613)
action:register()
