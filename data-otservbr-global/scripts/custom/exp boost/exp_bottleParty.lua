local expscroll = Action()

function expscroll.onUse(cid, item, fromPosition, itemEx, toPosition)
    local player = Player(cid)
    local party = player:getParty()
    if not party then
        player:say("You need to be in a party to use this item.", TALKTYPE_MONSTER_SAY)
        return true
    end

    local remainingBoost = player:getXpBoostTime()
    local currentExpBoostTime = player:getXpBoostTime()
    local expBoostCount = player:getStorageValue(GameStore.Storages.expBoostCount)

    if expBoostCount >= 3 then
        player:say('You have reached the limit for today, try again after Server Save.', TALKTYPE_MONSTER_SAY)
        return true
    end

    if remainingBoost > 0 then
        player:say('You already have an active XP boost.', TALKTYPE_MONSTER_SAY)
        return true
    end

    for i, partyMember in pairs(party:getMembers()) do
        partyMember:setXpBoostPercent(100)
        partyMember:setXpBoostTime(currentExpBoostTime + 14400)
    end

    Item(item.uid):remove(1)
    player:say('Your 4 hour of bonus XP x2 has started for you and your party!', TALKTYPE_MONSTER_SAY)
    return true
end

expscroll:id(45221)
expscroll:register()