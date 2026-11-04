local function getItemAttributes(item)
    -- Inicializa los atributos vacíos
    local attributes = ""
    local itemType = ItemType(item.itemid)

    -- Obtiene el ataque y la defensa desde el itemType
    local defense = itemType:getDefense() or 0
    local attack = itemType:getAttack() or 0

    -- Agrega defensa y ataque a los atributos del ítem
    attributes = attributes .. "\n  - Defense: " .. defense
    attributes = attributes .. "\n  - Attack: " .. attack

    return attributes
end

local function isEquipmentOrWeapon(item)
    local itemType = ItemType(item.itemid)
    -- Cambia estos métodos según cómo determines si un ítem es un equipo o un arma
    return itemType:isWeapon() or itemType:isArmor()
end

local function getEquippedAttributes(target)
    local totalDefense = 0
    local totalAttack = 0
    
    for i = 1, 10 do
        local item = target:getSlotItem(i)
        if item and item.itemid > 0 then
            local itemType = ItemType(item.itemid)
            -- Sumar defensa y ataque desde item.xml
            totalDefense = totalDefense + (itemType:getDefense() or 0)
            totalAttack = totalAttack + (itemType:getAttack() or 0)
        end
    end
    
    return totalDefense, totalAttack
end

local function getItemsInContainer(container, sep)
    local text = ""
    local tsep = ""
    for i = 1, sep do
        tsep = tsep .. "-"
    end
    tsep = tsep .. ">"
    for slot = 0, container:getSize() - 1 do
        local item = container:getItem(slot)
        if not item:isContainer() then
            if item.type > 0 then
                text = text .. "\n" .. tsep .. ItemType(item.itemid):getName()
                text = text .. getItemAttributes(item)
            end
        end
    end
    return text
end

local spy = TalkAction("/spy")

function spy.onSay(player, words, param)
    -- create log
    logCommand(player, words, param)

    if param == "" then
        player:sendCancelMessage("Write the name of the character to be spied.")
        return true
    end

    local target = Player(param)

    if target and target:isPlayer() then
        local slotName = { "Helmet", "Amulet", "Backpack", "Armor", "Right Hand", "Left Hand", "Legs", "Boots", "Ring", "Arrow" }
        local equippedWeaponsAndArmorText = "Equipped Weapons and Armor of " .. target:getName()
        local equippedOtherItemsText = "Equipped Other Items of " .. target:getName()
        local backpackItemsText = "\n\nItems in Backpack of " .. target:getName()

        -- Primero se listan los ítems equipados
        for i = 1, 10 do
            local item = target:getSlotItem(i)
            if item and item.itemid > 0 then
                local itemType = ItemType(item.itemid)
                if item:isContainer() then
                    equippedWeaponsAndArmorText = equippedWeaponsAndArmorText .. "\n" .. slotName[i] .. ": " .. itemType:getName() .. getItemsInContainer(item, 1)
                else
                    -- Verifica si el ítem es un arma o armadura
                    if isEquipmentOrWeapon(item) then
                        equippedWeaponsAndArmorText = equippedWeaponsAndArmorText .. "\n" .. slotName[i] .. ": " .. itemType:getName()
                        equippedWeaponsAndArmorText = equippedWeaponsAndArmorText .. getItemAttributes(item)
                    else
                        equippedOtherItemsText = equippedOtherItemsText .. "\n" .. slotName[i] .. ": " .. itemType:getName()
                        equippedOtherItemsText = equippedOtherItemsText .. getItemAttributes(item)
                    end
                end
            else
                equippedWeaponsAndArmorText = equippedWeaponsAndArmorText .. "\n" .. slotName[i] .. ": Empty"
                equippedOtherItemsText = equippedOtherItemsText .. "\n" .. slotName[i] .. ": Empty"
            end
        end

        -- Ahora se listan los ítems en la mochila
        local backpack = target:getSlotItem(3)  -- Asumiendo que el índice 3 es la mochila
        if backpack and backpack:isContainer() then
            backpackItemsText = backpackItemsText .. getItemsInContainer(backpack, 1)
        else
            backpackItemsText = backpackItemsText .. "Backpack is empty."
        end
        
        -- Calcula el ataque y defensa total de los ítems equipados
        local totalDefense, totalAttack = getEquippedAttributes(target)

        -- Añade los totales al texto
        equippedWeaponsAndArmorText = equippedWeaponsAndArmorText .. "\n\nTotal Defense: " .. totalDefense
        equippedWeaponsAndArmorText = equippedWeaponsAndArmorText .. "\nTotal Attack: " .. totalAttack
        
        -- Combina el texto para mostrar
        player:showTextDialog(6528, equippedWeaponsAndArmorText .. "\n\n" .. equippedOtherItemsText .. backpackItemsText)
    else
        player:sendCancelMessage("This player is offline or doesn't exist.")
    end
    return true
end

spy:separator(" ")
spy:groupType("gamemaster")
spy:register()
