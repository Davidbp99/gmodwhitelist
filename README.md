# gmodwhitelist
Need easy to use whitelist system? Then you got to the correct spot

## What is gWhitelist?
gWhitelist is an addon that blocks users to join or fully connect to the server if you got it activated (view config on how to activate it). It is used to have a more private beta or have the server in dev mode without the pain that someone might crack or leak the password to the server. gWhitelist is not a job whitelist system

## Where do I active the whitelist?
Go to the easy to use config file and look for:

```lua
gWhitelist.Config.Command = "/whitelistmode"
gWhitelist.Config.CommandGroup = "/whitelistmodegroup"

gwhitelist.config.active = false -- If this is false then whitelist is not active. If you got gwhitelist.config.activegroup set to true then this won't run. As the group is checked on another hook

gwhitelist.config.activegroup = false -- If this is false then whitelistgroup is not active.
```
Set one of them to true or use the commands you can find in the same file :)
## Kick Message
In the config file you can set what users will be told if they try and connect and is not on the whitelist or is on the blacklist.

![image](https://user-images.githubusercontent.com/40523727/114456064-ba8f5c80-9bdc-11eb-81b0-444d5641dd7f.png)
![image](https://user-images.githubusercontent.com/40523727/114458001-f62b2600-9bde-11eb-97f6-22db9f3abf4e.png)


## Console Prints
The Console will display if someone is being kicked and as well display the group (if you are using the group check).
It will as well display if someone can connect and provide you with the steamid of who is connected (something the console should already do)
![image](https://user-images.githubusercontent.com/40523727/114455846-7a2fde80-9bdc-11eb-96b1-0d1988983cb1.png)

## Fail Safe
As running two whitelist checks at the same time will just end up chaos. There is a failsafe that blocks gwhitelist.config.active to run if gwhitelist.config.activegroup is set to true
![image](https://user-images.githubusercontent.com/40523727/114455983-9f245180-9bdc-11eb-8dd5-cb16e00856f7.png)


## Maybe FAQ

### Even if my password to join my server gets leaked it will block users?
Yes it will block anyone that you don't have on the whitelist group.

```lua
gwhitelist.config.whitelist = { -- list who should be allowed to enter after they entered the server password or at all.
["STEAM_0:0:0"] = true, --//SteamID of any player on a singleplayer server. Keep this here if you dont want the whitelist system to block you from joining singleplayer
}
```

### can I blacklist people?
Yes

```lua
gwhitelist.config.blacklist = { -- If you got someone that you want to make sure never gets added into the whitelist. Then you can put them below
    -- ["Steamid"] = true, --// Is a special gmod player.


}
```

### can I whitelist a group instead of steamids?
Yes you can. In the config file you need to do two things.
```lua
gwhitelist.config.active = false <- have this set to false
gwhitelist.config.activegroup = true <- have this set to true

gwhitelist.config.whitelistgroup = {
["superadmin"] = true,


}


```
### I added a group to gwhitelist.config.whitelistgroup. But I got a user in that group I don't want to connect when whitelist is activated. What can I do?
Okay go to the blacklist section on your config and add the users you don't want on the server while whitelist is on.

```lua
gwhitelist.config.blacklist = { -- If you got someone that you want to make sure never gets added into the whitelist. Then you can put them below
    -- ["Steamid"] = true, --// Is a special gmod player.


}
```
