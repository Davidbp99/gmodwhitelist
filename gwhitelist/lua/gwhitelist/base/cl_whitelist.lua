/*---------------------------------------------------------
    CLIENTSIDE.
---------------------------------------------------------*/
if CLIENT then

    net.Receive("gWhitelist", function()
        local t = net.ReadTable()
        chat.AddText(unpack(t))
    end)




end