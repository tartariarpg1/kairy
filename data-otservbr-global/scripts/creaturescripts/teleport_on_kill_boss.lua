local tpkillboss = CreatureEvent("tpkillboss")
local enemyNames = {
    [1] = "Bakragore"
}

local function removeTeleport(position)
    local teleportItem = Tile(position):getItemById(1949)
    if teleportItem then
        teleportItem:remove()
        position:sendMagicEffect(CONST_ME_POFF)
        return true
    end
end

local function formatString(s)
    s = string.gsub(s, "[%d%p%c%s]", "")
    s = s:lower()
 
    return s
end

function tpkillboss.onKill(creature, target)
    if not target or not target:isMonster() then
        return true
    end
 
    local f = false
    local t = formatString(target:getName())
    for _, v in ipairs(enemyNames) do
        if t == formatString(v) then
            f = true
        end
    end
 
    if not f then
        return true
    end

    local teleportSpawn = Position(33044, 32395, 15) -- Position for teleport to spawn
    removeTeleport(teleportSpawn)
    teleportSpawn:sendMagicEffect(CONST_ME_TELEPORT)
 
    local item = Game.createItem(1949, 1, teleportSpawn)
    if item:isTeleport() then
        local teleportTo = Position(33023, 32272, 15) -- Teleport destination
        item:setDestination(teleportTo)
    end

    target:say('Take the teleport before it disappear!', TALKTYPE_MONSTER_SAY, 0, 0, teleportSpawn)
    addEvent(removeTeleport, 30000, teleportSpawn)
 
    return true
end
tpkillboss:register()