local config = {
	[23538] = { name = "vortexion", mountId = 94, tameMessage = "You receive the permission to ride a sparkion." },
	[23684] = { name = "neon sparkid", mountId = 98, tameMessage = "You receive the permission to ride a neon sparkid." },
	[23685] = { name = "vortexion", mountId = 99, tameMessage = "You receive the permission to ride a vortexion." },
	[32629] = { name = "haze", mountId = 162, achievement = "Nothing but Hot Air", tameMessage = "You are now versed to ride the haze!" },
	[60704] = { name = "white scorpion", mountId = 254, tameMessage = "You are now versed to white scorpion!" },
	[60705] = { name = "black scorpion", mountId = 251, tameMessage = "You are now versed to black scorpion!" },
	[60706] = { name = "Purple Scorpion", mountId = 252, tameMessage = "You are now versed to Purple Scorpion!" },
	[60707] = { name = "Red scorpion", mountId = 253, tameMessage = "You are now versed to Red scorpion!" },	
	[60020] = { name = "Pink Fire Horse", mountId = 249, tameMessage = "You are now versed to Pink Fire Horse!" },
	[60021] = { name = "Yellow Fire Horse", mountId = 250, tameMessage = "You are now versed to Yellow Fire Horse!" },
	[60237] = { name = "Celestial Horse", mountId = 232, tameMessage = "You are now versed to Celestial Horse!" },		
	[60642] = { name = "Warrior Turtle", mountId = 234, tameMessage = "You are now versed to Warrior Turtle!" },
	[60643] = { name = "Armadure Dino", mountId = 236, tameMessage = "You are now versed to Armadure Dino!" },	
	[60641] = { name = "Black Crow", mountId = 237, tameMessage = "You are now versed to Black Crow!" },	
	[60640] = { name = "Warrior Condor", mountId = 233, tameMessage = "You are now versed to Warrior Condor!" },
	[60637] = { name = "Armoured Tigger", mountId = 244, tameMessage = "You are now versed to Armoured Tigger!" },	
}

local usableItemMounts = Action()

function usableItemMounts.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if not player:isPremium() then
		player:sendCancelMessage(RETURNVALUE_YOUNEEDPREMIUMACCOUNT)
		return true
	end

	local useItem = config[item.itemid]
	if player:hasMount(useItem.mountId) then
		return false
	end

	if useItem.achievement then
		player:addAchievement(useItem.achievement)
	end

	if table.contains({ 23538, 23684, 23685, 60704, 60705, 60706, 60707, 60020, 60021, 60237, 60642, 60641, 60643, 60640, 60637 }, item.itemid) then
		player:addAchievementProgress("Vortex Tamer", 3)
	end

	player:addMount(useItem.mountId)
	player:addAchievement("Natural Born Cowboy")
	player:say(useItem.tameMessage, TALKTYPE_MONSTER_SAY)
	item:remove(1)
	return true
end

for k, v in pairs(config) do
	usableItemMounts:id(k)
end

usableItemMounts:register()
