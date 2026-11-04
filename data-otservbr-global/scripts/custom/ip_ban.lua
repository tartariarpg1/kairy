 
local bannedIPs = {
    "38.41.4.210",
	
    -- Agrega más IPs baneadas según sea necesario
}
 
 
local function isIPBanned(ip)
    for _, bannedIP in ipairs(bannedIPs) do
        if ip == bannedIP then
            return true
        end
    end
    return false
end
 
local ipBanLogin = CreatureEvent("ipBanLogin")
 
function ipBanLogin.onLogin(player)
 
	local ipAddress = Game.convertIpToString(player:getIp())
 
    if isIPBanned(ipAddress) then
		player:popupFYI("Your IP address has been banned from this server.")
        return false
    end
 
	return true
end
 
ipBanLogin:register()