local item = Action()

function item.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Verificar si el objetivo es un ítem válido
    if not target or not target:isItem() then
        player:sendCancelMessage("You need to use this item on a valid item.")
        return true
    end

    -- Verificar si el ítem usado es el item de mejora (ID 60669)
    if item:getId() ~= 60669 then
        player:sendCancelMessage("This item cannot be used for upgrading.")
        return true
    end

    -- Verificar si el jugador tiene el ítem de mejora en su inventario
    if player:getItemCount(60669) < 1 then
        player:sendCancelMessage("You do not have the upgrade item in your inventory.")
        return true
    end

    -- Asumimos que el nivel de tier se guarda como un atributo en el ítem
    local itemTier = target:getAttribute("tier") or 1 -- Obtener el nivel del ítem, default a 1 si no existe

    -- Verificar si el ítem ya está en el tier máximo (10)
    if itemTier >= 10 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "El ítem ya ha alcanzado el tier máximo de 10. No se puede mejorar más.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF) -- Efecto para indicar que no se puede mejorar más
        return true
    end

    -- Calcular el costo de mejora
    local baseCost = 35000000
    local cost = baseCost * (2 ^ (itemTier - 1)) -- Doble del costo por cada incremento de tier

    -- Verificar si el jugador tiene suficiente dinero en el banco
    local bankBalance = player:getBankBalance()
    if bankBalance < cost then
        local needed = cost - bankBalance
        player:sendCancelMessage("No tienes suficiente dinero en el banco. Necesitas " .. needed .. " gold coins más.")
        return true
    end

    -- Restar el costo de mejora del banco del jugador
    player:setBankBalance(bankBalance - cost)
    
    -- Informar al jugador del dinero descontado
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Has pagado " .. cost .. " gold coins para mejorar el ítem.")
    
    -- Éxito garantizado: aumenta 1 nivel de tier
    local newTier = itemTier + 1
    target:setAttribute("tier", newTier)
    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
    
    -- Enviar mensaje global
    Game.broadcastMessage(player:getName() .. " ha mejorado un ítem a tier " .. newTier .. ".", MESSAGE_EVENT_ADVANCE)
    
    -- Eliminar el ítem de mejora (ID 60669) del inventario del jugador
    player:removeItem(60669, 1)
    
    return true
end

item:id(60669) -- ID del ítem que se usa para mejorar
item:register()
