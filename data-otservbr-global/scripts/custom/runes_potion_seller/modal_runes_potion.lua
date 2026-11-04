local modalLeverShop = Action()
function modalLeverShop.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    player:registerEvent("Potions Modal")

    local title = "Runes And Potion"
    local message = ""

    local window = ModalWindow(1000, title, message)

    window:addButton(101, "50")
    window:addButton(102, "100")
    window:addButton(103, "250")
    window:addButton(104, "Cancel")

    window:addChoice(1, "Animate Dead Rune")
	window:addChoice(2, "Avalanche Rune")
	window:addChoice(3, "Chameleon Rune")
	window:addChoice(4, "Convince Creature Rune")
	window:addChoice(5, "Cure Poison Runes")
	window:addChoice(6, "Disintegrate Rune")
	window:addChoice(7, "Energy Bomb Rune")
	window:addChoice(8, "Energy Field Rune")
	window:addChoice(9, "Energy Wall Rune")
	window:addChoice(10, "Explosion Rune")
	window:addChoice(11, "Fireball Rune")
	window:addChoice(12, "Fire Bomb Rune")
	window:addChoice(13, "Fire Field Rune")
	window:addChoice(14, "Fire Wall Rune")
	window:addChoice(15, "Great Fireball Rune")
	window:addChoice(16, "Great Health Potion")
	window:addChoice(17, "Great Mana Potion")
	window:addChoice(18, "Great Spirit Potion")
	window:addChoice(19, "Health Potion")
	window:addChoice(20, "Icicle Rune")
	window:addChoice(21, "Intense Healing Rune")
	window:addChoice(22, "Magic Wall Rune")
	window:addChoice(23, "Mana Potion")
	window:addChoice(24, "Poison Bomb Rune")
	window:addChoice(25, "Poison Wall Rune")
	window:addChoice(26, "Soulfire Rune")
	window:addChoice(27, "Stone Shower Rune")
	window:addChoice(28, "Supreme Health Potion")
	window:addChoice(29, "Strong Health Potion")
	window:addChoice(30, "Strong Mana Potion")
	window:addChoice(31, "Sudden Death Rune")
	window:addChoice(32, "Thunderstorm Rune")
	window:addChoice(33, "Ultimate Healing Rune")
	window:addChoice(34, "Ultimate Health Potion")
	window:addChoice(35, "Ultimate Mana Potion")
	window:addChoice(36, "Ultimate Spirit Potion")
	window:addChoice(37, "Wild Growth Rune")
	
	

    window:setDefaultEscapeButton(104)

    window:sendToPlayer(player)
    return true
end

modalLeverShop:id(45984)
modalLeverShop:register()