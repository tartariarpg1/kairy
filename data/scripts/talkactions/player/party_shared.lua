local partyInfo = TalkAction("!party")

function partyInfo.onSay(player, words, param)
    local party = player:getParty()
    if not party then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not in a party.")
        return true
    end

    local leader = party:getLeader()
    local members = party:getMembers()
    local memberCount = party:getMemberCount()
    local sharedExpActive = party:isSharedExperienceActive() and "active" or "inactive"

    local message = "Party Leader: " .. leader:getName() .. "\nMembers:"

    for _, member in ipairs(members) do
        local vocation = member:getVocation():getName()
        message = message .. "\n- " .. member:getName() .. " (" .. vocation .. ")"
    end

    message = message .. "\nTotal Members: " .. memberCount
    message = message .. "\nShared Experience: " .. sharedExpActive

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, message)
    return true
end

partyInfo:groupType("normal")
partyInfo:register()


local leaveParty = TalkAction("!leaveparty")

function leaveParty.onSay(player, words, param)
    local party = player:getParty()
    if not party then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not in a party.")
        return true
    end

    if party:getLeader() == player then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You cannot leave the party as the leader. Disband the party instead.")
        return true
    end

    party:removeMember(player)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have left the party.")
    return true
end

leaveParty:groupType("normal")
leaveParty:register()


local party = TalkAction("!shareparty")

function party.onSay(player, words, param)
     local party = player:getParty()
    if not party then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not part of a party.")
        return false
    end

    if party:getLeader() ~= player then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You are not the leader of the party.")
        return false
    end

    if party:isSharedExperienceActive() then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Party share is already activated.")
        return false
    end

    party:setSharedExperience(true)

    return false
end
party:groupType("normal")
party:register()


local onPartyDeath = CreatureEvent("onPartyDeath")

function onPartyDeath.onDeath(player, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)
    if player:isPlayer() then
        local party = player:getParty()
        if party then
            party:removeMember(player)
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have left the party.")
        end
    end
    return true
end

onPartyDeath:register()


local loginParty = CreatureEvent("loginParty")

function loginParty.onLogin(player)
    player:registerEvent("onPartyDeath")
    return true
end

loginParty:register()