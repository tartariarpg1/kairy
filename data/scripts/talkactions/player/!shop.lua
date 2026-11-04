local config = {
    tokenId = 60186, -- ID del token de intercambio
    items = {
        { id = 60544, name = "cobra box", price = 50 },
        { id = 60556, name = "eldritch box", price = 100 },
        { id = 60546, name = "falcon box", price = 150 },
        { id = 60550, name = "lion box", price = 120 },
        { id = 39546, name = "primal bag", price = 200 },
        { id = 60156, name = "AllSkillBoost", price = 100 },
        { id = 43895, name = "bag you covet", price = 800 },
        { id = 31633, name = "the supreme cube", price = 350 },
        { id = 36723, name = "kooldown-aid", price = 5 },
        { id = 36725, name = "stamina extension", price = 5 },
        { id = 36726, name = "charm upgrade", price = 5 },
        { id = 36727, name = "wealth duplex", price = 5 },
        { id = 36728, name = "bestiary betterment", price = 5 },
        { id = 60058, name = "infernatus backpack", price = 150 },
        { id = 60065, name = "skeleton backpack", price = 150 },
        { id = 60057, name = "birthday backpack", price = 150 },
        { id = 60042, name = "Unicornio backpack", price = 150 },
        { id = 60073, name = "arboreal backpack", price = 350 },
        { id = 60072, name = "arcanomancer backpack", price = 350 },
        { id = 60071, name = "spiritthorn backpack", price = 350 },
        { id = 60070, name = "alicorn backpack", price = 350 },
        { id = 60024, name = "premium loot pouch", price = 150 },
        { id = 60025, name = "loot seller book", price = 3500 },
        { id = 37110, name = "exalted core", price = 20 },
        { id = 60577, name = "Bottle Exp X2", price = 100 },
        { id = 60030, name = "Bottle Exp X3", price = 150 },
        { id = 60667, name = "Tier Upgrader 50%", price = 300 },
        { id = 60061, name = "terramorfo backpack", price = 650 },
        { id = 60280, name = "eternal night demon backpack", price = 650 },
        { id = 60247, name = "eternal night moon backpack", price = 650 },
        { id = 60256, name = "eternal night root backpack", price = 650 },
        { id = 60171, name = "Addon doll", price = 50 },
        { id = 60170, name = "Mount Doll", price = 50 },
        { id = 60603, name = "Mexirevit sudden death rune", price = 50 },
        { id = 3162, name = "Mexirevit avalanche rune", price = 50 },
        { id = 60601, name = "Mexirevit arrow", price = 50 },
        { id = 60602, name = "Mexirevit bolt", price = 50 }
    }
}

local function sendItemPurchaseModal(player)
    local window = ModalWindow:new() -- Ajusta este método según la plataforma
    window:setTitle("Compra de Items")
    window:setMessage("Elige un item para comprar:")

    for _, item in ipairs(config.items) do
        local itemName = ItemType(item.id):getName()
        local price = item.price
        window:addChoice(string.format("%s - %d Tokens", itemName, price), function()
            if player:getItemCount(config.tokenId) < price then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "No tienes suficientes tokens para comprar este item.")
                return
            end

            if player:getFreeCapacity() < ItemType(item.id):getWeight() then
                player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Necesitas más espacio en tu mochila.")
                return
            end

            -- Descontar los tokens del jugador
            player:removeItem(config.tokenId, price)

            -- Crear el item y añadirlo al inventario del jugador
            local newItem = Item(item.id, 1)
            player:addItem(newItem)

            player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, string.format("Has comprado %s por %d tokens.", itemName, price))
        end)
    end

    window:addButton("Comprar")
    window:addButton("Cerrar")
    window:setDefaultEnterButton("Comprar")
    window:setDefaultEscapeButton("Cerrar")
    window:sendToPlayer(player)
end

local tokenShopCommand = TalkAction("!tokens")
function tokenShopCommand.onSay(player, words, param)
    sendItemPurchaseModal(player)
    return true
end

tokenShopCommand:separator(" ")
tokenShopCommand:groupType("normal")
tokenShopCommand:register()
