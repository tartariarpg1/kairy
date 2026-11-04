local potionsModal = CreatureEvent("Potions Modal")
function potionsModal.onModalWindow(player, modalWindowId, buttonId, choiceId)
	player:unregisterEvent("Potions Modal")

	local id_Potions = {3203, 3161, 3178, 3177, 3153, 3197, 3149, 3164, 3166, 3200, 3189, 3192, 3188, 3190, 3191, 239, 238, 7642, 266, 3158, 3152, 3180, 268, 3173, 3176, 3195, 3175, 23375, 236, 237, 3155, 3202, 3160, 7643, 23373, 23374, 3156} -- id das potions
	local price = {375, 57, 210, 80, 65, 26, 203, 38, 85, 31, 30, 147, 28, 61, 57, 225, 144, 228, 50, 30, 95, 116, 56, 85, 52, 46, 37, 625, 115, 93, 135, 47, 175, 379, 438, 438, 160} -- price 1x
	local cap = {2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70, 2.70} -- capacity

	if modalWindowId == 1000 then
		if buttonId == 103 then -- botão de compra de 1 item (potion)
			if player:getMoney() >= price[choiceId]*250 then
				if player:getFreeCapacity() >= cap[choiceId]*250 then
				player:removeMoney(price[choiceId]*250)
				player:addItem(id_Potions[choiceId],1*250)
				player:getPosition():sendMagicEffect(15)
				--player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You bought")
				else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you do not have enough capacity.")
				player:getPosition():sendMagicEffect(10)
				end
			else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you do not have enough money.")
			end
		end

		if buttonId == 101 then -- botão de compra de 1 item (potion)
			if player:getMoney() >= price[choiceId]*50 then
				if player:getFreeCapacity() >= cap[choiceId]*50 then
				player:removeMoney(price[choiceId]*50)
				player:addItem(id_Potions[choiceId],1*50)
				player:getPosition():sendMagicEffect(15)
				--player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You bought 50x potions")
				else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you do not have enough capacity.")
				player:getPosition():sendMagicEffect(10)
				end
			else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you do not have enough money.")
			end
		end

		if buttonId == 102 then -- botão de compra de 1 item (potion)
			if player:getMoney() >= price[choiceId]*100 then
				if player:getFreeCapacity() >= cap[choiceId]*100 then
				player:removeMoney(price[choiceId]*100)
				player:addItem(id_Potions[choiceId],1*100)
				player:getPosition():sendMagicEffect(15)
				--player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You bought 100x potions")
				else
				player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you do not have enough capacity.")
				player:getPosition():sendMagicEffect(10)
				end
			else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "you do not have enough money.")
			end
		end
	end
end

potionsModal:register()