local reward_box = Action()
local reward_items = {

    "Falcon Coif",
    "Falcon Circlet",
    "Falcon Plate",
    "Falcon Greaves",
    "Falcon Rod",
    "Falcon Wand",
    "Falcon Longsword",
    "Falcon Mace",
    "Falcon Battleaxe",
    "Falcon Bow",
    "Falcon Escutcheon",

}

function reward_box.onUse(player, item, fromPos, target, toPos, isHotkey)
	local rand_it = reward_items[math.random(#reward_items)]
	local it = ItemType(rand_it)
	if not it then return true end
	item:remove(1)
	if not player:addItem(it:getId(), 1, false) then
		player:say("you don't have enough capacity or free slots.", TALKTYPE_MONSTER_SAY)
		return true
	end
	player:say(string.format("Luck has been cast! You won a %s", rand_it:upper()), TALKTYPE_MONSTER_SAY)
	player:getPosition():sendMagicEffect(CONST_ME_CRAPS)
    return true
end

reward_box:id(60546)
reward_box:register()