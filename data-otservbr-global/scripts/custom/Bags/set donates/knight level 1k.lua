local reward_box = Action()
local reward_items = {
    "eternal night demon helmet",
    "eternal night demon plate",
    "eternal night demon legs",
    "eternal night demon boots",
    "eternal night demon shield",	
}

function reward_box.onUse(player, item, fromPos, target, toPos, isHotkey)
    local all_items_added = true

    -- Iterar sobre la lista de artículos y añadirlos al jugador
    for _, item_name in ipairs(reward_items) do
        local it = ItemType(item_name)
        if it then
            -- Añadir el ítem al jugador con tier 10
            if not player:addItem(it:getId(), 1, false, 0, CONST_SLOT_WHEREEVER, 10) then
                all_items_added = false
                break
            end
        end
    end

    item:remove(1)

    if not all_items_added then
        player:say("You don't have enough capacity or free slots for set de level 1000 tier 10.", TALKTYPE_MONSTER_SAY)
        return true
    end

    player:say("Congratulations! You have received set de level 1000 tier 10!", TALKTYPE_MONSTER_SAY)
    player:getPosition():sendMagicEffect(CONST_ME_CRAPS)

    -- Mensaje global a todos los jugadores
    Game.broadcastMessage(string.format("%s has received set de level 1000 tier 10 from the donate knight chest!", player:getName()), MESSAGE_EVENT_ADVANCE)

    return true
end

reward_box:id(60451)
reward_box:register()
