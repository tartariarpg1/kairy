local outfits = {
 
    -- Config
        dollID = 60848, -- Change this to your dolls or items, item ID
     
        -- Main Window Messages (The first window the player sees)
        mainTitle = "Choose an outfit",
        mainMsg = "You will recieve both addons aswell as the outfit you choose.",
     
        -- Already Owned Window (The window that appears when the player already owns the addon)
        ownedTitle = "Whoops!",
        ownedMsg = "You already have this addon. Please choose another.",
     
        -- No Doll in Backpack (The window that appears when the player doesnt have the doll in their backpack)
        dollTitle = "Whoops!",
        dollMsg = "The addon doll must be in your backpack.",
    -- End Config

    -- Outfit Table
        [1] = {name = "Batman", male = 2107, female = 2107},
        [2] = {name = "Deidara", male = 2106, female = 2106},
        [3] = {name = "Charizard", male = 2105, female = 2105},
        [4] = {name = "Goku Sj3", male = 2103, female = 2103},
        [5] = {name = "Vegeta", male = 2101, female = 2101},
        [6] = {name = "Mago Supremo", male = 2096, female = 2097},
        [7] = {name = "Nobleman Hammerstile", male = 2060, female = 2061},
        [8] = {name = "Nobleman Warrior", male = 2059, female = 2058},
        [9] = {name = "General Swordman", male = 2056, female = 2057},
        [10] = {name = "Druid Warrior", male = 2054, female = 2054},
        [11] = {name = "Batakko Warrior", male = 2053, female = 2053},
        [12] = {name = "Magician Elementalist", male = 2052, female = 2052},
        [13] = {name = "King Revolucionario", male = 2048, female = 2049},
        [14] = {name = "Undead Spectral", male = 2046, female = 2047},
        [15] = {name = "King Warrior", male = 2045, female = 244},
        [16] = {name = "Skull Face", male = 2038, female = 2039},
        [17] = {name = "Warriro Battleaxe", male = 2036, female = 2037},

    }

local addonsDollModal = TalkAction("!addonvip")

    function addonsDollModal.onSay(player, words, param)
        player:sendAddonWindow(outfits)
        return true
    end

addonsDollModal:separator(" ")
addonsDollModal:groupType("normal")
addonsDollModal:register()