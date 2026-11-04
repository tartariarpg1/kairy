local reward_box = Action()
local reward_items = {
    "Eldritch Bow",
    "Eldritch Breeches",
    "Eldritch Claymore",
    "Eldritch Cowl",
    "Eldritch Cuirass",
    "Eldritch Folio",
    "Eldritch Greataxe",
    "Eldritch Hood",
    "Eldritch Quiver",
    "Eldritch Rod",
    "Eldritch Shield",
    "Eldritch Tome",
    "Eldritch Wand",
    "Eldritch Warmace",
    "Gilded Eldritch Bow",
    "Gilded Eldritch Claymore",
    "Gilded Eldritch Greataxe",
    "Gilded Eldritch Rod",
    "Gilded Eldritch Wand",
    "Gilded Eldritch Warmace",

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

reward_box:id(60556)
reward_box:register()