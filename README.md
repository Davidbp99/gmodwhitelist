# gmodwhitelist
Need easy to use whitelist system? That just you with file access can enable, disable, blacklist and whitelist users? Then you have got to the correct place.

## Where do I active the whitelist?
Go to the easy to use config file and look for:

```lua
gwhitelist.config.active = false -- If this is false then whitelist is not active <- turn this to true to turn it on
```

## Maybe FAQ

### Even if my password to join my server gets leaked it will block users?
Yes it will block anyone that you don't have on the whitelist group.

```lua
gwhitelist.config.whitelist = { -- list who should be allowed to enter after they entered the server password or at all.
["STEAM_0:0:0"] = true, --//SteamID of any player on a singleplayer server. Keep this here if you dont want the whitelist system to block you from joining singleplayer
}
```

### What happens if I remove STEAM_0:0:0 
If you are on a server then nothing will happen. But if you remove it and try and make a singleplayer game (you selecting a map, gamemode and presses start) then it will block you.

### can I blacklist people?
Yes

```lua
gwhitelist.config.blacklist = { -- If you got someone that you want to make sure never gets added into the whitelist. Then you can put them below
    -- ["Steamid"] = true, --// Is a special gmod player.


}
```
