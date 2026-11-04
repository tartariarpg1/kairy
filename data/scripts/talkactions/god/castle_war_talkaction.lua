local castlewar = TalkAction("/opencastle")
function castlewar.onSay(player, words, param)
	if not player:getGroup():getAccess() or player:getAccountType() < ACCOUNT_TYPE_GOD then
		player:sendCancelMessage("No tienes permiso para usar este comando.")
		return false
	end

	if Castle:isOpen() then
		player:sendCancelMessage("El evento ya está abierto.")
		return false
	end

	Castle:open()
	broadcastMessage("[Castle War] El evento ha sido abierto manualmente por un administrador.", MESSAGE_EVENT_ADVANCE)
	return false
end

castlewar:separator(" ")
castlewar:groupType("god")
castlewar:register()
