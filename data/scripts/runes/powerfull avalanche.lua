local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICEAREA)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ICE)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 3.6) + 20
	local max = (level / 7) + (maglevel * 8.0) + 25
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local rune = Spell("rune")

function rune.onCastSpell(creature, var, isHotkey)
	return combat:execute(creature, var)
end

rune:id(115)
rune:group("attack")
rune:name("powerfull avalanche")
rune:castSound(SOUND_EFFECT_TYPE_SPELL_OR_RUNE)
rune:impactSound(SOUND_EFFECT_TYPE_SPELL_AVALANCHE_RUNE)
rune:runeId(3162)
rune:allowFarUse(true)
rune:charges(4)
rune:level(30)
rune:magicLevel(40)
rune:cooldown(2 * 1000)
rune:groupCooldown(1 * 1000)
rune:register()
