--// Made by STEAM_0:1:56187412 (David)

gwhitelist:Print("config for whitelist update loaded")

gwhitelist.config.active = true -- If this is false then whitelist is not active. If you got gwhitelist.config.activegroup set to true then this won't run. As the group is checked on another hook
gwhitelist.config.activegroup = false -- If this is false then whitelistgroup is not active.

gwhitelist.config.kickmessage = "Sorry! You're not on the whitelist!" -- 

gwhitelist.config.blacklistmessage = "You are on a blacklist. You can get back on when whitelist is not active unless you got an active ban"

gwhitelist.config.notonwhitelistgroup = "You are not on the whitelist or your group is not on the whitelist"

gwhitelist.config.welcomemessage = "Looks like you are whitelisted"

gwhitelist.config.whitelist = { -- list who should be allowed to enter after they entered the server password or at all.

--["STEAM_0:0:0"] = true, --//SteamID of any player on a singleplayer server. Keep this here if you dont want the whitelist system to block you from joining singleplayer (not needed as we got if (game.SinglePlayer() == false) then)
}

gwhitelist.config.whitelistgroup = {
--["superadmin"] = true,


}

gwhitelist.config.blacklist = { -- If you got someone you want to be sure you don't add by mistake to the whitelist. Then add their steamid below (just as above).
--["steamid"] = true,
}

-- // If you add a users steamid to whitelist and blacklist then the user will be blocked to join. 
-- // This works as well if the user is part of the group but is on the blacklist. It will deny them to join then.
--// As the blacklist is checked first before the whitelist
