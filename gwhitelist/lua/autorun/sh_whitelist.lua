gwhitelist = {} or gwhitelist

--// Console Printing.
function gwhitelist:Print(message) -- just making most text good looking via the console
  local PrefixColor = Color(200, 50, 255)
  if SERVER then
    PrefixColor = Color(100, 70, 255)
  end
  MsgC(Color(255, 255, 255), "[")
  MsgC(PrefixColor, "gWhitelist")
  MsgC(Color(255, 255, 255), "] " .. message)
  MsgC(Color(255, 255, 255), "\n")
end
// Sub-Tables
gwhitelist.config = {} or gwhitelist.config
include("autorun/config.lua") gwhitelist:Print("config.lua loaded") -- it loads the config file.

hook.Add("CheckPassword", "whitelist", function(steamID64)
  if (game.SinglePlayer() == false) then -- to block it to run on any singleplayer games
  if (gwhitelist.config.activegroup == true) and (gwhitelist.config.active == true) then
    return true,gwhitelist:Print("You got gwhitelist.config.activegroup set to true. That means we need to block the gwhitelist.config.active from running")
  end
    if (gwhitelist.config.active == true) then
            local steamid = util.SteamIDFrom64(steamID64)

            if gwhitelist.config.blacklist[steamid] then -- It needs to check the user first if they are on the blacklist. If they are not then it will go down to normal whitelist check
              gwhitelist:Print("(" .. steamid .. ") is on the blacklist, kicking...")

                return false, gwhitelist.config.blacklistmessage
            end

           

            if not gwhitelist.config.whitelist[steamid] then

                gwhitelist:Print("(" .. steamid .. ") is not on the whitelist, kicking...")

                return false, gwhitelist.config.kickmessage
            else -- Just in case you did not mean to have someone on the whitelist. you can get their steamid this way.
               
              return true, gwhitelist:Print("(" .. steamid .. ") is on the whitelist")
            end
        end
    
    end)

hook.Add( "PlayerInitialSpawn", "whitelistgroup", function( ply )
   if (game.SinglePlayer() == false) then -- to block it to run on any singleplayer games
      if (gwhitelist.config.activegroup == true) then
local steamid = ply:SteamID()

 if gwhitelist.config.blacklist[steamid] then -- It needs to check the user first if they are on the blacklist. If they are not then it will go down to normal whitelist check
              gwhitelist:Print("(" .. steamid .. ") is on the blacklist, kicking...")

                ply:Kick(gwhitelist.config.blacklistmessage)
            end-- We need to run the blacklist check first.


 

if (gwhitelist.config.whitelistgroup[ply:GetUserGroup()] == true) then

return true, gwhitelist:Print("(" .. ply:Nick() .. ") is on the whitelist Group: (" .. ply:GetUserGroup() .. ")")
else if not gwhitelist.config.whitelist[steamid] then
  gwhitelist:Print("(" .. ply:Nick() .. ") is not the whitelist. Group: (" .. ply:GetUserGroup() .. ")" )
  ply:Kick(  )
end

end
end
end)
