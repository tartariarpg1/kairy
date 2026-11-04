local config = {
    currency = 60648, -- Craft Eternal (moneda que necesitas para hacer craft)

    Craft = {
        [39149] = {newItem = 60257, cost = 100}, -- eternal night shadow headguard
        [34094] = {newItem = 60258, cost = 100}, -- eternal night shadow tabard
        [43881] = {newItem = 60259, cost = 100}, -- eternal night shadow greaves
        [34098] = {newItem = 60260, cost = 100}, -- eternal night shadow boots
        [39148] = {newItem = 60267, cost = 100}, -- eternal night demon helmet
        [39147] = {newItem = 60268, cost = 100}, -- eternal night demon plate
        [43876] = {newItem = 60269, cost = 100}, -- eternal night demon legs
        [34097] = {newItem = 60270, cost = 100}, -- eternal night demon boots
        [39153] = {newItem = 60248, cost = 100}, -- eternal night root mask
        [34096] = {newItem = 60249, cost = 100}, -- eternal night root robe
        [34093] = {newItem = 60250, cost = 100}, -- eternal night root pants
        [43887] = {newItem = 60251, cost = 100}, -- eternal night root galoshes
        [39151] = {newItem = 60239, cost = 100}, -- eternal night moon crown
        [34095] = {newItem = 60240, cost = 100}, -- eternal night moon mantle
        [34092] = {newItem = 60241, cost = 100}, -- eternal night moon legs
        [34099] = {newItem = 60242, cost = 100}, -- eternal night moon galoshes
        [34099] = {newItem = 60271, cost = 100}, -- eternal night demon shield
        [39154] = {newItem = 60252, cost = 100}, -- eternal night root spellbook  
        [39152] = {newItem = 60243, cost = 100}  -- eternal night moon spellbook
    }
}

local Craft = Action()

function Craft.onUse(player, item)
    showCraftList(player)
    return true
end

function showCraftList(player)
    local menu = ModalWindow{
        title = "Craft Items",
        message = "Select the item you want to Craft or View details:"
    }

    for i, info in pairs(config.Craft) do
        local itemName = ItemType(i):getName()
        local newItemName = ItemType(info.newItem):getName()
        local currencyPlural = ItemType(config.currency):getPluralName():lower()

        menu:addChoice(string.format("%s -> %s (Necesitas: %d %s)", itemName, newItemName, info.cost, currencyPlural), function (player, button, choice)
            if button.name == "Select" then
                showCraftDetails(player, i, info)
                return
            elseif button.name == "Craft" then
                if player:getItemCount(config.currency) < info.cost then
                    player:sendCancelMessage("Necesitas " .. info.cost .. " " .. currencyPlural .. " para craftear un " .. newItemName .. ".")
                    player:getPosition():sendMagicEffect(CONST_ME_POFF)
                    return false
                end

                if player:getItemCount(i) < 1 then
                    player:sendCancelMessage("No tienes el item " .. itemName .. " para craftear.")
                    player:getPosition():sendMagicEffect(CONST_ME_POFF)
                    return false
                end

                player:removeItem(config.currency, info.cost)
                player:removeItem(i, 1)
                player:addItem(info.newItem, 1)
                player:getPosition():sendMagicEffect(234) -- Efecto de crafteo exitoso
                applyCraftingEffects(player) -- Llamar a la función para mostrar efectos
                player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Has crafteado " .. newItemName .. ".")
            end
        end)
    end

    menu:addButton("Select")
    menu:addButton("Craft")
    menu:addButton("Cerrar")
    menu:sendToPlayer(player)
end

function showCraftDetails(player, itemId, info)
    local itemName = ItemType(itemId):getName()
    local newItemName = ItemType(info.newItem):getName()
    local currencyPlural = ItemType(config.currency):getPluralName():lower()
    local message = string.format(
        "Para craftear %s necesitas:\n- %d %s\n- %s", 
        newItemName, info.cost, currencyPlural, itemName
    )

    local detailWindow = ModalWindow{
        title = "Detalles de Craft",
        message = message
    }

    detailWindow:addChoice(string.format("Ver %s", newItemName), function()
        showItemDescription(player, info.newItem)
    end)

    detailWindow:addChoice(string.format("Ver %d %s", info.cost, currencyPlural), function()
        showItemDescription(player, config.currency)
    end)

    detailWindow:addChoice(string.format("Ver %s", itemName), function()
        showItemDescription(player, itemId)
    end)

    detailWindow:addButton("Return", function()
        showCraftList(player) -- Regresa al listado de crafteo
    end)
    detailWindow:sendToPlayer(player)
end

-- Nueva función para mostrar la descripción del ítem seleccionado de forma ordenada
function showItemDescription(player, itemId)
    local itemName = ItemType(itemId):getName()
    local itemDescription = ItemType(itemId):getDescription()
    
    local orderedDescription = string.format(
        "Descripcion del item:\nNombre: %s\nDescripcion: %s",
        itemName, itemDescription
    )

    player:showTextDialog(itemId, orderedDescription)
end

-- Nueva función para aplicar efectos al crafteo
function applyCraftingEffects(player)
    local position = player:getPosition()
    
    -- Ejemplo de efectos a mostrar
    position:sendMagicEffect(234)
    position:sendMagicEffect(233)
    position:sendMagicEffect(195)
    position:sendMagicEffect(50) -- Efecto de desaparición
    
    -- Puedes añadir más efectos aquí, o incluso un bucle para crear más efectos
end

Craft:id(60167)
Craft:register()
