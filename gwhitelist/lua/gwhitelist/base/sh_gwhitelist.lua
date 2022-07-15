--// Made by STEAM_0:1:56187412 (David)
--// Console Printing.
local PrefixColor = Color(200, 50, 255)
function gWhitelist:Print(message) -- just making most text good looking via the console

	if SERVER then
		PrefixColor = Color(100, 70, 255)
	end
  
	MsgC(Color(255, 255, 255), "[")
	MsgC(PrefixColor, "gWhitelist")
	MsgC(Color(255, 255, 255), "] " .. message)
	MsgC(Color(255, 255, 255), "\n")
end



gWhitelist.Config.Command = "/whitelistmode"
gWhitelist.Config.CommandGroup = "/whitelistmodegroup"
gWhitelist.Config.Active = true -- If this is false then whitelist is not active. If you got gWhitelist.Config.ActiveGroup set to true then this won't run. As the group is checked on another hook
gWhitelist.Config.ActiveGroup = false -- If this is false then whitelistgroup is not active.

gWhitelist.Config.Global = "[gWhitelist] "
gWhitelist.Config.KickMessage = "Sorry! You're not on the whitelist!" -- 

gWhitelist.Config.BlackListMessage = "You are on a blacklist. You can get back on when whitelist is not active unless you got an active ban"

gWhitelist.Config.NotonWhitelistGroup = "You are not on the whitelist or your group is not on the whitelist"

gWhitelist.Config.WelcoMessage = "Looks like you are whitelisted"
gWhitelist.Config.WhitelistCommandAccess = {
--["superadmin"] = true,

}

gWhitelist.Config.WhitelistCommandGroupAccess = {
--["superadmin"] = true,

}

gWhitelist.Config.Whitelist = { -- list who should be allowed to enter after they entered the server password or at all.

--["STEAM_0:0:0"] = true, --//SteamID of any player on a singleplayer server. Keep this here if you dont want the whitelist system to block you from joining singleplayer (not needed as we got game.SinglePlayer() checking the game )
}

gWhitelist.Config.WhitelistGroup = {
--["superadmin"] = true,


}

gWhitelist.Config.Blacklist = { -- If you got someone you want to be sure you don't add by mistake to the whitelist. Then add their steamid below (just as above).
--["steamid"] = true,
}

-- // If you add a users steamid to whitelist and blacklist then the user will be blocked to join. 
-- // This works as well if the user is part of the group but is on the blacklist. It will deny them to join then.
--// As the blacklist is checked first before the whitelist

