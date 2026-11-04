-- Comando para cambiar el tipo de daño de la runa
local changerune = TalkAction("!changerune")

function changerune.onSay(player, words, param)
    local type = param:lower()
    changeRuneDamageType(player, type)
    return true
end

changerune:groupType("normal")
changerune:register()