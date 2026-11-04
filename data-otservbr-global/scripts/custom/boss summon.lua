local conf = {
    item = 30317,
    bosses = {"Ferumbras", "Morgaroth", "Morshabaal", "Terrario", "King Zelos"}
}

local createBoss = Action()

function showBossSelection(player)
    local window = ModalWindow(1000, "Choose a Boss", "Select the boss you want to summon.")
    for i, boss in ipairs(conf.bosses) do
        window:addChoice(i, boss)
    end
    window:addButton(100, "Select")
    window:addButton(101, "Cancel")
    window:setDefaultEnterButton(100)
    window:setDefaultEscapeButton(101)
    window:sendToPlayer(player)
end

function createBoss.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if player:getItemCount(conf.item) >= 1 then
        showBossSelection(player)
    end
    return true
end

createBoss:id(conf.item)
createBoss:register()

local modalWindowHandler = CreatureEvent("ModalWindowHandler")

function modalWindowHandler.onModalWindow(player, modalWindowId, buttonId, choiceId)
    if modalWindowId == 1000 then
        if buttonId == 100 then -- Select button
            local boss = conf.bosses[choiceId]
            if boss then
                local pos = player:getPosition()
                Game.createMonster(boss, pos, true, true)
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, boss.." summoned!")
                player:removeItem(conf.item, 1)
            end
        end
    end
    return true
end

modalWindowHandler:register()
