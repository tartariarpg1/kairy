-- Version 1.0
-- Simple all-in-one configuration store
local thaisdiamond = Action()

function thaisdiamond.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local totalCost
    local rewardItemId
    local rewardAmount

    -- Determine the action based on the item's action ID (aid)
    if item:getActionId() == 1515 then
        totalCost = 10000000  -- 100,000 gold or 10 crystal coins
        rewardItemId = 45091
        rewardAmount = 1
    elseif item:getActionId() == 1526 then  -- powerfull health potion
        totalCost = 100000   -- 60k or 6cc
        rewardItemId = 60600
        rewardAmount = 100
	elseif item:getActionId() == 1527 then  -- powerfull spirit potion
        totalCost = 100000   -- 350k or 35cc
        rewardItemId = 60599
        rewardAmount = 100
	elseif item:getActionId() == 1528 then  -- powerfull mana potion
        totalCost = 100000   -- 350k or 35cc
        rewardItemId = 60157
        rewardAmount = 100
	elseif item:getActionId() == 1517 then  -- strong health potion
        totalCost = 1000   -- 500k or 50cc
        rewardItemId = 236
        rewardAmount = 100
	elseif item:getActionId() == 1518 then  -- strong mana potion
        totalCost = 1000   -- 50k or 5cc
        rewardItemId = 237
        rewardAmount = 100
	elseif item:getActionId() == 1519 then  -- great health potion
        totalCost = 10000   -- 50k or 5cc
        rewardItemId = 239
        rewardAmount = 100
	elseif item:getActionId() == 1520 then  -- great mana potion
        totalCost = 10000   -- 50k or 5cc
        rewardItemId = 238
        rewardAmount = 100
	elseif item:getActionId() == 1522 then  -- great spirit potion
        totalCost = 10000   -- 50k or 5cc
        rewardItemId = 7642
        rewardAmount = 100
	elseif item:getActionId() == 1521 then  -- ultimate health potion
        totalCost = 30000   -- 50k or 5cc
        rewardItemId = 7643
        rewardAmount = 100	
	elseif item:getActionId() == 1529 then  -- ultimate mana potion
        totalCost = 30000   -- 50k or 5cc
        rewardItemId = 23373
        rewardAmount = 100	
	elseif item:getActionId() == 1530 then  -- supreme health potion
        totalCost = 50000   -- 50k or 5cc
        rewardItemId = 23375
        rewardAmount = 100	
	elseif item:getActionId() == 1531 then  -- ultimate spirit potion
        totalCost = 30000   -- 50k or 5cc
        rewardItemId = 23374
        rewardAmount = 100		
    else
        -- If the action ID is not recognized, do not proceed
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "This item is not configured correctly.")
        return true
    end

    -- Transaction logic assuming getMoney and removeMoney functions
    if player:getMoney() >= totalCost then
        if player:removeMoney(totalCost) then -- Make sure money is removed from player
            player:addItem(rewardItemId, rewardAmount)
            player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have successfully purchased " .. rewardAmount .. " units of item ID " .. rewardItemId .. " for " .. totalCost .. " gold.")
        else
            player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "An error occurred while processing your purchase. Please try again.")
        end
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You do not have enough money to complete this purchase. You need at least " .. totalCost .. " gold.")
    end

    -- Handle item transformation based on current state
    if item.itemid == 2772 then
        item:transform(2773)
    elseif item.itemid == 2773 then
        item:transform(2772)
    end
    
    return true
end

thaisdiamond:aid(1514,1515,1516,1522,1523,1524,1525,1526,1527,1528,1517,1518,1519,1520,1521,1529,1530,1531) -- Register the action id of lever used
thaisdiamond:register()
