local textFloat = GlobalEvent("textFloat")

local effects = {
    {position = Position(32353, 32238, 7), text = 'Teleports', effect = 21},
	{position = Position(32353, 32242, 7), text = 'Bosses y quests', effect = 38},
	{position = Position(32353, 32240, 7), text = 'Bosses y trainers', effect = 38},
    {position = Position(32353, 32236, 7), text = 'NPCS', effect = 242},
    {position = Position(32350, 32233, 7), text = 'Mejora de los Dioses', effect = 242},
	{position = Position(32369, 32236, 7), text = 'Zona de nivel 800 Busca La ciudad', effect = 242},
	{position = Position(32089, 32025, 7), text = 'Teleports Hunts', effect = 242},
	{position = Position(32095, 32221, 7), text = 'Teleports Hunts', effect = 242},
	{position = Position(32093, 32025, 7), text = 'Dawnport', effect = 242},	
}

function textFloat.onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end

textFloat:interval(5000)
textFloat:register()
