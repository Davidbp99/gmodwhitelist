 /*---------------------------------------------------------
    Server Sided.
---------------------------------------------------------*/
 if SERVER then
 util.AddNetworkString("gWhitelist") 



hook.Add("CheckPassword", "gWhitelist.RunSteamIDCheck", function(steamID64)
	--
	if game.SinglePlayer() then return end -- to block it to run on any singleplayer games

	--
	if (gWhitelist.Config.ActiveGroup == true) and (gWhitelist.Config.Active == true) then
		return true,gWhitelist:Print("You got gWhitelist.Config.ActiveGroup set to true. That means we need to block the gWhitelist.Config.Active from running")
	end
	
	--
    if (gWhitelist.Config.Active == true) then
        local steamid = util.SteamIDFrom64(steamID64)

        if gWhitelist.Config.Blacklist[steamid] then -- It needs to check the user first if they are on the blacklist. If they are not then it will go down to normal whitelist check
            gWhitelist:Print("(" .. steamid .. ") is on the blacklist, kicking...")
            return false, gWhitelist.Config.Global..gWhitelist.Config.BlackListMessage
        end

        if !gWhitelist.Config.Whitelist[steamid] then
            gWhitelist:Print("(" .. steamid .. ") is not on the whitelist, kicking...")
            return false, gWhitelist.Config.Global..gWhitelist.Config.KickMessage
        else -- Just in case you did not mean to have someone on the whitelist. you can get their steamid this way. 
            return true, gWhitelist:Print("(" .. steamid .. ") is on the whitelist")
        end
	end
    
end)

hook.Add( "PlayerInitialSpawn", "gWhitelist.RunsWhitelistGroup", function( ply )

	if game.SinglePlayer() then return end -- to block it to run on any singleplayer games
	local steamid = ply:SteamID()
	
	if (gWhitelist.Config.ActiveGroup == true) then
		if gWhitelist.Config.Blacklist[steamid] then -- It needs to check the user first if they are on the blacklist. If they are not then it will go down to normal whitelist check
			 gWhitelist:Print("(" .. steamid .. ") is on the blacklist, kicking...")
				ply:Kick(gWhitelist.Config.Global..gWhitelist.Config.BlackListMessage)
		end 
		-- We need to run the blacklist check first.
	end
	 

	if (gWhitelist.Config.WhitelistGroup[ply:GetUserGroup()] == true) then
		return true, gWhitelist:Print("(" .. ply:Nick() .. ") is on the whitelist Group: (" .. ply:GetUserGroup() .. ")")
	elseif !gWhitelist.Config.Whitelist[steamid] then
		gWhitelist:Print("(" .. ply:Nick() .. ") is not the whitelist. Group: (" .. ply:GetUserGroup() .. ")" )
		ply:Kick(gWhitelist.Config.Global..gWhitelist.Config.NotonWhitelistGroup)
	end

end)

hook.Add("PlayerSay", "gWhitelist.EnableOrDisableWhitelist", function(ply, text)
    if text:lower() == gWhitelist.Config.Command and (gWhitelist.Config.WhitelistCommandAccess[ply:GetUserGroup()] == true) then
        if gWhitelist.Config.Active == false then
            gWhitelist.Config.Active = true
            gWhitelist.Config.ActiveGroup = false -- you can't have both true sadly.
            net.Start("gWhitelist")

            net.WriteTable({Color(200, 50, 150), "gWhitelist | ", ply:Nick() .. " Have turned whitelist mode"})

            net.Broadcast()
   
            return ""
        elseif gWhitelist.Config.Active == true then
            gWhitelist.Config.Active = false
            net.Start("gWhitelist")

            net.WriteTable({Color(200, 50, 150), "gWhitelist | ", ply:Nick() .. " Have turned off whitelist mode"})

            net.Broadcast()
            return ""
        end
    end
end)

hook.Add("PlayerSay", "gWhitelist.EnableOrDisableWhitelistGroup", function(ply, text)
    if text:lower() == gWhitelist.Config.commandGroup and (gWhitelist.Config.WhitelistCommandGroupAccess[ply:GetUserGroup()] == true) then
        if gWhitelist.Config.ActiveGroup == false then
            gWhitelist.Config.ActiveGroup = true
            gWhitelist.Config.Active = false -- as you can't have both on sadly
            net.Start("gWhitelist")

            net.WriteTable({Color(200, 50, 150), "gWhitelist | ", ply:Nick() .. " Have turned whitelist user group on"})

            net.Broadcast()
   
            return ""
        elseif gWhitelist.Config.ActiveGroup == true then
            gWhitelist.Config.Active = false
            net.Start("gWhitelist")

            net.WriteTable({Color(200, 50, 150), "gWhitelist | ", ply:Nick() .. " Have turned off whitelist user group on"})

            net.Broadcast()
            return ""
        end
    end
end)

end
