gWhitelist = {}
gWhitelist.Config = {}

local addonname = "gWhitelist"

local printmsg1 = "||-- "..addonname.." Loaded File: "
local printmsg2 = " --successfully --||"
local function client(file)
	if SERVER then AddCSLuaFile(file) end

	if CLIENT then
		print(printmsg1.. file.. printmsg2)
		return include(file)
	end
end

local function server(file)
	if SERVER then
		print(printmsg1.. file.. printmsg2)
		return include(file)
	end
end

local function shared(file)
	return client(file) or server(file)
end

local function AddFile(fil, dir)
    if string.StartWith(fil,"sv_") then
        server(dir..fil)
    end
    if string.StartWith(fil,"cl_") then
        client(dir..fil)
    end
    if string.StartWith(fil, "sh_") then
        shared(dir..fil)
    end
end


local rootDir = "gwhitelist/base"

local function IncludeDir(dir)
    dir = dir .. "/"
    local File, Directory = file.Find(dir.."*", "LUA")

    for k, v in ipairs(File) do
        if string.EndsWith(v, ".lua") then
            AddFile(v, dir)
        end
    end
    
    for k, v in ipairs(Directory) do
        IncludeDir(dir..v)
    end

end
IncludeDir(rootDir)