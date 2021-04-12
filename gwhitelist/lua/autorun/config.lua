--// Made by STEAM_0:1:56187412 (David)

gwhitelist:Print("config for whitelist update loaded")

gwhitelist.config.active = false -- If this is false then whitelist is not active

gwhitelist.config.kickmessage = "Sorry! You're not on the whitelist!" -- 

gwhitelist.config.blacklistmessage = "You are on a blacklist. You can get back on when whitelist is not active unless you got an active ban"

gwhitelist.config.welcomemessage = "Looks like you are whitelisted"

gwhitelist.config.whitelist = { -- list who should be allowed to enter after they entered the server password or at all.
["STEAM_0:0:0"] = true, --//SteamID of any player on a singleplayer server. Keep this here if you dont want the whitelist system to block you from joining singleplayer
}

gwhitelist.config.blacklist = { -- If you got someone that you want to make sure never gets added into the whitelist. Then you can put them below
    -- ["Steamid"] = true, --// Is a special gmod player.


}

--// If you add a users steamid to whitelist and blacklist then the user will be blocked to join.
--// As the blacklist is checked first before the whitelist
