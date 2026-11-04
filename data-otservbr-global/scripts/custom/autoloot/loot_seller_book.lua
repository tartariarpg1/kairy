local actionId = 60025
local lootBagId = 60024

local function sellItemsFromContainer(player, cont)
    local totalGold = 0
    local toSell = {}

    for i = 0, cont:getSize() - 1 do
        local item = cont:getItem(i)
        if item then
            if item:isContainer() then
                -- Llamar recursivamente a la misma función para los subcontenedores
                sellItemsFromContainer(player, item)
            else
                local price = item:getPrice()
                if price then
                    local itemCount = item:getCount()
                    local itemId = item:getId()
                    if not toSell[itemId] then
                        toSell[itemId] = { count = itemCount, price = price, name = item:getName() }
                    else
                        toSell[itemId].count = toSell[itemId].count + itemCount
                    end
                end
            end
        end
    end

    for itemId, data in pairs(toSell) do
        local totalItemPrice = data.count * data.price
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("Sold %dx %s for %d gold.", data.count, data.name, totalItemPrice))
        
        totalGold = totalGold + totalItemPrice
        player:removeItem(itemId, data.count)
    end

    if totalGold > 0 then
		Bank.credit(player:getName(), totalGold)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format("You sold all of the items from your premium loot pouch for %d gold.", totalGold))
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "There were no sellable items in your premium loot pouch.")
    end
end

local sellLootBag = Action()

function sellLootBag.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local lootBag = player:getItemById(lootBagId, true) -- true para incluir el conteo de items dentro de otros contenedores
    if not lootBag then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You don't have a premium loot pouch in your inventory.")
        return true
    end
	item:transform(animationTransform)
	item:decay()
    sellItemsFromContainer(player, lootBag)

    return true
end

sellLootBag:id(actionId)
sellLootBag:register()
