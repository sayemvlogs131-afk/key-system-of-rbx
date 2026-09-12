--[[
    ================================================================
    [ SCRIPT INFORMATION ]
    Project: Custom Script
    Author: OYB
    YouTube: https://www.youtube.com/channel/UCAlXXV1Hbvf7WbfXARuVtiQ
    
    [ TERMS AND CONDITIONS ]
    - You ARE allowed to use and modify this script for your own games.
    - You ARE NOT allowed to re-upload, redistribute, or claim 
      ownership of this script.
    - Removing or altering these credits is strictly prohibited.
    
    Copyright (c) 2026 OYB. All rights reserved.
    ================================================================
]]
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")

local Config = {
    -- [1] PlatoBoost Settings
    ServiceId       = 31611, -- Your PlatoBoost Service ID
    PlatoSecret     = "be4e6cf5-c89b-4d05-b6ea-3cf5dc89893b", -- Your PlatoBoost Secret Key

    -- [2] Anti-Bypass / Global Secret Variable
    Secret          = "9080", -- This makes the script ONLY run from the key script. Even if they copy the original obfuscated script to bypass the key, they won't be able to!
    
    -- [3] Scripts & Links
    MainScriptURL   = "https://raw.githubusercontent.com/sayemvlogs131-afk/key-system-of-rbx/refs/heads/main/script.lua", -- The raw URL of your main script
    
    -- [4] Social Media Settings (Set to true to show, false to hide)
    ShowDiscord     = false,
    DiscordURL      = "https://discord.gg/kT55J724BK",
    
    ShowInstagram   = false,
    InstagramURL    = "https://www.instagram.com/oyb0i/",
    
    ShowYoutube     = false,
    YoutubeURL      = "https://www.youtube.com/channel/UCAlXXV1Hbvf7WbfXARuVtiQ",

    -- [5] File System
    KeyFileName     = "Mykey.txt", -- The name of the file where the valid key will be saved for auto-login

    -- [6] GUI Management
    OldGuiName      = "rbx 1.0 hub", -- Name of the old GUI to destroy if it's already open
    MainGuiName     = "rbx 1.0 hub", -- Name of the main script's GUI to check if it's already executing

    -- [7] Hub Information & UI Text
    HubName         = "RBX GET KEY",
    HubDescription  = "RBX 1.0 HUB • 24H KEY SYSTEM",

    -- [8] LootLabs Wrapper
    -- LootLabs is used as an outer content locker around the Platoboost URL.
    -- Put your LootLabs API token here, OR use StaticURL for a pre-created link.
    LootLabs = {
        Enabled = true,
        ApiToken = "",
        StaticURL = "",
        TierId = 2,
        NumberOfTasks = 1,
        Theme = 5,
        Title = "RBX 1.0 HUB KEY"
    }
}

-------------------------------------------------------------------------------
--! LIBRARIES (JSON & CRYPTOGRAPHY) - DO NOT MODIFY
-------------------------------------------------------------------------------
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return q(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(p,r)+lshift(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(x,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),s(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=k(n(Q,R),n(o(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+d)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%a end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return w(y(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(l[T]or string.format("u%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(_,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local j={["nil"]=B,["table"]=v,["string"]=g,["number"]=a1,["boolean"]=tostring}e=function(M,z)local x=type(M)local a2=j[x]if a2 then return a2(M,z)end;error("unexpected type '"..x.."'")end;local a3=function(M)return e(M)end;local a4;local N=function(...)local _={}for a0=1,select("#",...)do _[select(a0,...)]=true end;return _ end;local L=N(" ","\t","\r","\n")local p=N(" ","\t","\r","\n","]","}",",")local a5=N("\\","/",'"',"b","f","n","r","t","u")local m=N("true","false","null")local a6={["true"]=true,["false"]=false,["null"]=nil}local a7=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]~=ab then return a0 end end;return#a8+1 end;local ac=function(a8,a9,J)local ad=1;local ae=1;for a0=1,a9-1 do ae=ae+1;if a8:sub(a0,a0)=="\n"then ad=ad+1;ae=1 end end;error(string.format("%s at line %d col %d",J,ad,ae))end;local af=function(A)local a2=math.floor;if A<=0x7f then return string.char(A)elseif A<=0x7ff then return string.char(a2(A/64)+192,A%64+128)elseif A<=0xffff then return string.char(a2(A/4096)+224,a2(A%4096/64)+128,A%64+128)elseif A<=0x10ffff then return string.char(a2(A/262144)+240,a2(A%262144/4096)+128,a2(A%4096/64)+128,A%64+128)end;error(string.format("invalid unicode codepoint '%x'",A))end;local ag=function(ah)local ai=tonumber(ah:sub(1,4),16)local aj=tonumber(ah:sub(7,10),16)if aj then return af((ai-0xd800)*0x400+aj-0xdc00+0x10000)else return af(ai)end end;local ak=function(a8,a0)local _=""local al=a0+1;local Q=al;while al<=#a8 do local am=a8:byte(al)if am<32 then ac(a8,al,"control character in string")elseif am==92 then _=_..a8:sub(Q,al-1)al=al+1;local T=a8:sub(al,al)if T=="u"then local an=a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",al+1)or a8:match("^%x%x%x%x",al+1)or ac(a8,al-1,"invalid unicode escape in string")_=_..ag(an)al=al+#an else if not a5[T]then ac(a8,al-1,"invalid escape char '"..T.."' in string")end;_=_..P[T]end;Q=al+1 elseif am==34 then _=_..a8:sub(Q,al-1)return _,al+1 end;al=al+1 end;ac(a8,a0,"expected closing quote for string")end;local ao=function(a8,a0)local am=a7(a8,a0,p)local ah=a8:sub(a0,am-1)local A=tonumber(ah)if not A then ac(a8,a0,"invalid number '"..ah.."'")end;return A,am end;local ap=function(a8,a0)local am=a7(a8,a0,p)local aq=a8:sub(a0,am-1)if not m[aq]then ac(a8,a0,"invalid literal '"..aq.."'")end;return a6[aq],am end;local ar=function(a8,a0)local _={}local A=1;a0=a0+1;while 1 do local am;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="]"then a0=a0+1;break end;am,a0=a4(a8,a0)_[A]=am;A=A+1;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="]"then break end;if as~=","then ac(a8,a0,"expected ']' or ','")end end;return _,a0 end;local at=function(a8,a0)local _={}a0=a0+1;while 1 do local au,M;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="}"then a0=a0+1;break end;if a8:sub(a0,a0)~='"'then ac(a8,a0,"expected string for key")end;au,a0=a4(a8,a0)a0=a7(a8,a0,L,true)if a8:sub(a0,a0)~=":"then ac(a8,a0,"expected ':' after key")end;a0=a7(a8,a0+1,L,true)M,a0=a4(a8,a0)_[au]=M;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="}"then break end;if as~=","then ac(a8,a0,"expected '}' or ','")end end;return _,a0 end;local av={['"']=ak,["0"]=ao,["1"]=ao,["2"]=ao,["3"]=ao,["4"]=ao,["5"]=ao,["6"]=ao,["7"]=ao,["8"]=ao,["9"]=ao,["-"]=ao,["t"]=ap,["f"]=ap,["n"]=ap,["["]=ar,["{"]=at}a4=function(a8,a9)local as=a8:sub(a9,a9)local a2=av[as]if a2 then return a2(a8,a9)end;ac(a8,a9,"unexpected character '"..as.."'")end;local aw=function(a8)if type(a8)~="string"then error("expected argument of type string, got "..type(a8))end;local _,a9=a4(a8,a7(a8,1,L,true))a9=a7(a8,a9,L,true)if a9<=#a8 then ac(a8,a9,"trailing garbage")end;return _ end;
local lEncode, lDecode, lDigest = a3, aw, Z;

-------------------------------------------------------------------------------
--! CORE FUNCTIONS (REQUESTS & VERIFICATION)
-------------------------------------------------------------------------------

local useNonce = true 

local function safeRequest(options)
    local req = request or http_request or syn_request or (http and http.request )
    if not req then return nil, "HTTP requests not supported" end
    local success, response = pcall(function() return req(options) end)
    if success and type(response) == "table" then 
        return response 
    else 
       
        return nil, "Connection Error: " .. tostring(response or "Unknown") 
    end
end

local fSetClipboard = setclipboard or toclipboard
local function CopyToClipboard(value)
    if type(fSetClipboard) ~= "function" then
        return false
    end
    local ok = pcall(fSetClipboard, value)
    return ok
end
local fStringChar, fToString, fOsTime, fMathRandom, fMathFloor = string.char, tostring, os.time, math.random, math.floor
local fGetHwid = gethwid or function() return game:GetService("RbxAnalyticsService"):GetClientId() end

-- ==================== KEY FILE STORAGE (FIXED) ====================
-- Some executors expose writefile/readfile/isfile only partially.
-- Never let a storage failure make a valid key look like an invalid key.
local function SaveKeyToFile(key)
    key = tostring(key or "")
    if key == "" then
        return false, "Empty key"
    end

    if type(writefile) ~= "function" then
        return false, "writefile is unavailable in this executor"
    end

    local ok, err = pcall(function()
        writefile(Config.KeyFileName, key)
    end)

    if not ok then
        return false, "writefile failed: " .. tostring(err)
    end

    -- Verify the file was actually written when readfile is available.
    if type(readfile) == "function" then
        local readOk, saved = pcall(function()
            return readfile(Config.KeyFileName)
        end)
        if not readOk then
            return false, "Saved, but readback failed: " .. tostring(saved)
        end
        if tostring(saved or "") ~= key then
            return false, "Saved, but readback did not match"
        end
    end

    return true, "Saved"
end

local function LoadSavedKey()
    if type(isfile) ~= "function" then
        return nil, "isfile is unavailable in this executor"
    end
    if type(readfile) ~= "function" then
        return nil, "readfile is unavailable in this executor"
    end

    local existsOk, exists = pcall(function()
        return isfile(Config.KeyFileName)
    end)
    if not existsOk then
        return nil, "isfile failed: " .. tostring(exists)
    end
    if not exists then
        return nil, "No saved key file"
    end

    local readOk, saved = pcall(function()
        return readfile(Config.KeyFileName)
    end)
    if not readOk then
        return nil, "readfile failed: " .. tostring(saved)
    end

    saved = tostring(saved or "")
    saved = saved:gsub("^%s+", ""):gsub("%s+$", "")
    if saved == "" then
        return nil, "Saved key file is empty"
    end

    return saved, nil
end

local cachedLink, cachedTime = "", 0
local host = "https://api.platoboost.com"


local function trim(value)
    return tostring(value or ""):gsub("^%s+", ""):gsub("%s+$", "")
end

local function CreateLootLabsLink(destinationUrl)
    if type(Config.LootLabs) ~= "table" or not Config.LootLabs.Enabled then
        return false, "LootLabs is disabled"
    end

    local staticUrl = trim(Config.LootLabs.StaticURL)
    if staticUrl ~= "" then
        return true, staticUrl
    end

    local token = trim(Config.LootLabs.ApiToken)
    if token == "" then
        return false, "Add your LootLabs API token in Config.LootLabs.ApiToken"
    end

    local title = trim(Config.LootLabs.Title)
    if title == "" then title = "RBX 1.0 HUB KEY" end
    if #title > 30 then title = title:sub(1, 30) end

    local tier = math.clamp(tonumber(Config.LootLabs.TierId) or 2, 1, 4)
    local tasks = math.clamp(tonumber(Config.LootLabs.NumberOfTasks) or 1, 1, 5)
    local theme = math.clamp(tonumber(Config.LootLabs.Theme) or 1, 1, 5)

    local response, err = safeRequest({
        Url = "https://creators.lootlabs.gg/api/public/content_locker",
        Method = "POST",
        Body = lEncode({
            title = title,
            url = destinationUrl,
            tier_id = tier,
            number_of_tasks = tasks,
            theme = theme
        }),
        Headers = {
            ["Content-Type"] = "application/json",
            ["Authorization"] = "Bearer " .. token
        }
    })

    if not response then
        return false, err or "LootLabs request failed"
    end

    local statusCode = tonumber(response.StatusCode or response.Status)
    if statusCode and statusCode >= 400 then
        return false, "LootLabs HTTP " .. tostring(statusCode)
    end

    local body = response.Body or response.body
    if not body or body == "" then
        return false, "LootLabs returned an empty response"
    end

    local decodedOk, decoded = pcall(lDecode, body)
    if not decodedOk or type(decoded) ~= "table" then
        return false, "LootLabs returned invalid JSON"
    end

    if decoded.type == "created" and type(decoded.message) == "table" then
        local lootUrl = trim(decoded.message.loot_url)
        if lootUrl ~= "" then return true, lootUrl end
    end

    local message = type(decoded.message) == "string" and decoded.message or "LootLabs did not return a link"
    return false, message
end

local function checkConnectivity( )
    local response, err = safeRequest({Url = host .. "/public/connectivity", Method = "GET"})
    if not response or (response.StatusCode ~= 200 and response.StatusCode ~= 429) then
        host = "https://api.platoboost.net"
        local fallbackResponse, fallbackErr = safeRequest({Url = host .. "/public/connectivity", Method = "GET"})
        if not fallbackResponse then
            return false 
        end
    end
    return true
end

local function generateNonce()
    local str = ""
    for _ = 1, 16 do str = str .. fStringChar(fMathFloor(fMathRandom() * (122 - 97 + 1)) + 97) end
    return str
end

local function cacheLink()
    local isConnected = checkConnectivity()
    if not isConnected then
        return false, "Delta/Network Error! Use VPN or change Executor."
    end
    
    if cachedTime + (10*60) < fOsTime() then
        local response, err = safeRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({service = Config.ServiceId, identifier = lDigest(fGetHwid())}),
            Headers = {["Content-Type"] = "application/json"}
        })
        if response and response.StatusCode == 200 then
            local decoded = lDecode(response.Body)
            if decoded.success then
                cachedLink = decoded.data.url
                cachedTime = fOsTime()
                return true, cachedLink
            end
        end
        return false, err or "Server Unreachable"
    end
    return true, cachedLink
end

local function redeemKey(key)
    local nonce = generateNonce()
    local body = {identifier = lDigest(fGetHwid()), key = key}
    if useNonce then body.nonce = nonce end
    
    local response, err = safeRequest({
        Url = host .. "/public/redeem/" .. fToString(Config.ServiceId),
        Method = "POST",
        Body = lEncode(body),
        Headers = {["Content-Type"] = "application/json"}
    })
    
    if response and response.StatusCode == 200 then
        local decoded = lDecode(response.Body)
        if decoded.success and decoded.data.valid then
            if useNonce then
                if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. Config.PlatoSecret) then 
                    local saved, saveErr = SaveKeyToFile(key)
                    return true, saved and "Success" or ("Success (save unavailable: " .. tostring(saveErr) .. ")")
                end
                return false, "Integrity Check Failed"
            end
            local saved, saveErr = SaveKeyToFile(key)
            return true, saved and "Success" or ("Success (save unavailable: " .. tostring(saveErr) .. ")")
        end
        return false, decoded.message or "Invalid Key"
    end
    return false, err or "Server Error"
end

-------------------------------------------------------------------------------
--! GUI & MAIN SCRIPT EXECUTION
-------------------------------------------------------------------------------

local function StartMainScript()
    local player = game:GetService("Players").LocalPlayer
    local pGui = player:WaitForChild("PlayerGui")
    
    if pGui:FindFirstChild(Config.OldGuiName) then 
        pGui[Config.OldGuiName]:Destroy() 
        task.wait(0.1)
    end
    
    _G[Config.Secret] = true 
    
    loadstring(game:HttpGet(Config.MainScriptURL))()
end

local function CreateGUI()
    local player = Players.LocalPlayer
    if not player then
        return nil
    end

    -- Prefer PlayerGui. Only fall back to CoreGui when PlayerGui cannot be used.
    local targetParent = nil
    pcall(function()
        targetParent = player:FindFirstChildOfClass("PlayerGui")
    end)
    if not targetParent then
        pcall(function()
            targetParent = player:WaitForChild("PlayerGui", 5)
        end)
    end
    if not targetParent then
        pcall(function()
            targetParent = CoreGui
        end)
    end
    if not targetParent then
        return nil
    end

    local old = targetParent:FindFirstChild("RBX_GetKey")
    if old then old:Destroy() end

    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "RBX_GetKey"
    ScreenGui.ResetOnSpawn = false
    ScreenGui.IgnoreGuiInset = true
    ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    ScreenGui.DisplayOrder = 100000
    ScreenGui.Parent = targetParent

    local viewport = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(900, 650)
    local isMobile = UserInputService.TouchEnabled and viewport.X <= 650
    local baseW = isMobile and 340 or 430
    local baseH = isMobile and 500 or 455

    local backdrop = Instance.new("Frame")
    backdrop.Size = UDim2.fromScale(1, 1)
    backdrop.BackgroundColor3 = Color3.fromRGB(3, 4, 8)
    backdrop.BorderSizePixel = 0
    backdrop.Parent = ScreenGui

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(3, 4, 8)),
        ColorSequenceKeypoint.new(0.48, Color3.fromRGB(11, 13, 22)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(3, 4, 8))
    })
    gradient.Rotation = 25
    gradient.Parent = backdrop

    local dotFolder = Instance.new("Folder")
    dotFolder.Name = "AmbientDots"
    dotFolder.Parent = backdrop
    local dots = {}
    for i = 1, 22 do
        local dot = Instance.new("Frame")
        local s = math.random(2, 4)
        dot.Size = UDim2.fromOffset(s, s)
        dot.Position = UDim2.fromScale(math.random(), math.random())
        dot.BackgroundColor3 = Color3.fromRGB(100, 110, 135)
        dot.BackgroundTransparency = 0.88
        dot.BorderSizePixel = 0
        Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
        dot.Parent = dotFolder
        dots[#dots + 1] = {frame = dot, x = math.random(), y = math.random(), speed = 0.02 + math.random() * 0.03}
    end

    local card = Instance.new("Frame")
    card.Name = "Card"
    card.Size = UDim2.fromOffset(baseW, baseH)
    card.Position = UDim2.new(0.5, -baseW / 2, 0.5, -baseH / 2)
    card.BackgroundColor3 = Color3.fromRGB(10, 11, 16)
    card.BorderSizePixel = 0
    card.ClipsDescendants = true
    card.Active = true
    card.Parent = backdrop
    Instance.new("UICorner", card).CornerRadius = UDim.new(0, 20)

    local cardStroke = Instance.new("UIStroke", card)
    cardStroke.Thickness = 1.4
    cardStroke.Color = Color3.fromRGB(55, 60, 75)
    cardStroke.Transparency = 0.12

    local scale = Instance.new("UIScale", card)
    scale.Scale = 0.92
    SafeCall(function()
        TweenService:Create(scale, TweenInfo.new(0.38, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Scale = 1}):Play()
    end)

    local topGlow = Instance.new("Frame", card)
    topGlow.Size = UDim2.new(1, 0, 0, 4)
    topGlow.BackgroundColor3 = Color3.fromRGB(90, 110, 255)
    topGlow.BorderSizePixel = 0

    local close = Instance.new("TextButton", card)
    close.Size = UDim2.fromOffset(34, 34)
    close.Position = UDim2.new(1, -44, 0, 13)
    close.BackgroundColor3 = Color3.fromRGB(24, 26, 34)
    close.Text = "×"
    close.TextColor3 = Color3.fromRGB(190, 195, 210)
    close.Font = Enum.Font.GothamBold
    close.TextSize = 21
    close.AutoButtonColor = false
    Instance.new("UICorner", close).CornerRadius = UDim.new(0, 10)

    local brand = Instance.new("Frame", card)
    brand.Size = UDim2.fromOffset(58, 58)
    brand.Position = UDim2.new(0.5, -29, 0, 22)
    brand.BackgroundColor3 = Color3.fromRGB(22, 25, 36)
    Instance.new("UICorner", brand).CornerRadius = UDim.new(0, 17)
    local brandStroke = Instance.new("UIStroke", brand)
    brandStroke.Color = Color3.fromRGB(75, 90, 130)
    brandStroke.Transparency = 0.35

    local brandText = Instance.new("TextLabel", brand)
    brandText.Size = UDim2.fromScale(1, 1)
    brandText.BackgroundTransparency = 1
    brandText.Text = "RBX"
    brandText.TextColor3 = Color3.fromRGB(240, 245, 255)
    brandText.Font = Enum.Font.GothamBlack
    brandText.TextSize = 17

    local title = Instance.new("TextLabel", card)
    title.Size = UDim2.new(1, -70, 0, 35)
    title.Position = UDim2.new(0, 35, 0, 88)
    title.BackgroundTransparency = 1
    title.Text = "RBX GET KEY"
    title.TextColor3 = Color3.fromRGB(248, 249, 255)
    title.Font = Enum.Font.GothamBlack
    title.TextSize = isMobile and 24 or 27
    title.TextXAlignment = Enum.TextXAlignment.Center

    local subtitle = Instance.new("TextLabel", card)
    subtitle.Size = UDim2.new(1, -54, 0, 38)
    subtitle.Position = UDim2.new(0, 27, 0, 122)
    subtitle.BackgroundTransparency = 1
    subtitle.Text = "Get your 24-hour access key below"
    subtitle.TextColor3 = Color3.fromRGB(145, 150, 168)
    subtitle.Font = Enum.Font.Gotham
    subtitle.TextSize = 13
    subtitle.TextXAlignment = Enum.TextXAlignment.Center

    local divider = Instance.new("Frame", card)
    divider.Size = UDim2.new(1, -60, 0, 1)
    divider.Position = UDim2.new(0, 30, 0, 162)
    divider.BackgroundColor3 = Color3.fromRGB(35, 38, 50)
    divider.BorderSizePixel = 0

    local info = Instance.new("TextLabel", card)
    info.Size = UDim2.new(1, -60, 0, 38)
    info.Position = UDim2.new(0, 30, 0, 177)
    info.BackgroundTransparency = 1
    info.Text = "Tap GET KEY to receive your access link.\nComplete the locker, then paste your 24H key below."
    info.TextColor3 = Color3.fromRGB(160, 166, 184)
    info.Font = Enum.Font.GothamSemibold
    info.TextSize = 11
    info.TextWrapped = true
    info.TextXAlignment = Enum.TextXAlignment.Center

    local getBtn = Instance.new("TextButton", card)
    getBtn.Size = UDim2.new(1, -60, 0, 52)
    getBtn.Position = UDim2.new(0, 30, 0, 225)
    getBtn.BackgroundColor3 = Color3.fromRGB(70, 83, 135)
    getBtn.Text = "GET KEY"
    getBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    getBtn.Font = Enum.Font.GothamBlack
    getBtn.TextSize = isMobile and 13 or 14
    getBtn.AutoButtonColor = false
    Instance.new("UICorner", getBtn).CornerRadius = UDim.new(0, 13)
    local getStroke = Instance.new("UIStroke", getBtn)
    getStroke.Color = Color3.fromRGB(105, 120, 190)
    getStroke.Transparency = 0.15

    local hint = Instance.new("TextLabel", card)
    hint.Size = UDim2.new(1, -60, 0, 24)
    hint.Position = UDim2.new(0, 30, 0, 284)
    hint.BackgroundTransparency = 1
    hint.Text = "The link is copied automatically"
    hint.TextColor3 = Color3.fromRGB(105, 112, 132)
    hint.Font = Enum.Font.Gotham
    hint.TextSize = 10
    hint.TextXAlignment = Enum.TextXAlignment.Center

    local input = Instance.new("TextBox", card)
    input.Size = UDim2.new(1, -60, 0, 44)
    input.Position = UDim2.new(0, 30, 0, 318)
    input.BackgroundColor3 = Color3.fromRGB(18, 20, 28)
    input.TextColor3 = Color3.fromRGB(248,250,255)
    input.PlaceholderColor3 = Color3.fromRGB(95,100,118)
    input.PlaceholderText = "Paste your 24H key here"
    input.Text = ""
    input.Font = Enum.Font.GothamSemibold
    input.TextSize = 13
    input.TextXAlignment = Enum.TextXAlignment.Center
    input.ClearTextOnFocus = false
    input.MaxVisibleGraphemes = 64
    input.TextTruncate = Enum.TextTruncate.AtEnd
    Instance.new("UICorner", input).CornerRadius = UDim.new(0, 11)
    local inputStroke = Instance.new("UIStroke", input)
    inputStroke.Color = Color3.fromRGB(44, 48, 62)
    inputStroke.Transparency = 0.1

    local verify = Instance.new("TextButton", card)
    verify.Size = UDim2.new(1, -60, 0, 42)
    verify.Position = UDim2.new(0, 30, 0, 374)
    verify.BackgroundColor3 = Color3.fromRGB(32, 36, 46)
    verify.Text = "VERIFY & UNLOCK"
    verify.TextColor3 = Color3.fromRGB(255,255,255)
    verify.Font = Enum.Font.GothamBlack
    verify.TextSize = 12
    verify.AutoButtonColor = false
    Instance.new("UICorner", verify).CornerRadius = UDim.new(0, 11)

    local status = Instance.new("TextLabel", card)
    status.Name = "StatusLabel"
    status.Size = UDim2.new(1, -60, 0, isMobile and 38 or 30)
    status.Position = UDim2.new(0, 30, 1, isMobile and -44 or -38)
    status.BackgroundTransparency = 1
    status.Text = "Ready • tap GET KEY"
    status.TextColor3 = Color3.fromRGB(130, 136, 152)
    status.Font = Enum.Font.GothamSemibold
    status.TextSize = 10
    status.TextWrapped = true
    status.TextXAlignment = Enum.TextXAlignment.Center

    if isMobile then
        getBtn.Position = UDim2.new(0, 30, 0, 225)
        input.Position = UDim2.new(0, 30, 0, 318)
        verify.Position = UDim2.new(0, 30, 0, 374)
    end

    local busy = false

    local function setStatus(text, color)
        status.Text = tostring(text or "")
        status.TextColor3 = color or Color3.fromRGB(130, 136, 152)
    end

    local function copyLink(link)
        link = trim(link)
        if link == "" then
            setStatus("No link was returned.", Color3.fromRGB(255, 105, 105))
            return false
        end
        local ok = CopyToClipboard(link)
        if ok then
            setStatus("Link copied! Open it in your browser to continue.", Color3.fromRGB(112, 225, 165))
            return true
        end
        setStatus("Clipboard is unavailable in this executor.", Color3.fromRGB(255, 180, 90))
        return false
    end

    local function getKeyLink()
        if busy then return end
        busy = true
        getBtn.Text = "CREATING..."
        setStatus("Preparing your LootLabs → Platoboost key link...", Color3.fromRGB(180, 190, 215))

        task.spawn(function()
            -- One-button flow: create the Platoboost session first, then wrap it
            -- inside LootLabs so the same GET KEY action uses both systems.
            local platoOk, platoLink = cacheLink()
            local ok, link
            if platoOk then
                ok, link = CreateLootLabsLink(platoLink)
            else
                ok, link = false, platoLink
            end

            if ok then
                copyLink(link)
            else
                setStatus(tostring(link or "Could not create the key link."), Color3.fromRGB(255, 110, 110))
            end

            getBtn.Text = "GET KEY"
            busy = false
        end)
    end

    local function verifyKey()
        if busy then return end
        local key = trim(input.Text)
        if key == "" then
            setStatus("Paste your key first.", Color3.fromRGB(255, 180, 90))
            return
        end

        busy = true
        verify.Text = "VERIFYING..."
        setStatus("Checking your key with Platoboost...", Color3.fromRGB(180, 190, 215))

        task.spawn(function()
            local ok, msg = redeemKey(key)
            if ok then
                setStatus("Verified! Launching RBX 1.0 HUB...", Color3.fromRGB(112, 225, 165))
                task.wait(0.35)
                if ScreenGui and ScreenGui.Parent then ScreenGui:Destroy() end
                StartMainScript()
            else
                setStatus(msg or "Invalid or expired key.", Color3.fromRGB(255, 100, 100))
                verify.Text = "VERIFY & UNLOCK"
                busy = false
            end
        end)
    end

    close.Activated:Connect(function()
        if ScreenGui and ScreenGui.Parent then ScreenGui:Destroy() end
    end)

    getBtn.Activated:Connect(getKeyLink)
    verify.Activated:Connect(verifyKey)
    input.FocusLost:Connect(function(enterPressed)
        if enterPressed then verifyKey() end
    end)

    local animConn = RunService.RenderStepped:Connect(function()
        if not ScreenGui or not ScreenGui.Parent then
            pcall(function() animConn:Disconnect() end)
            return
        end
        gradient.Rotation = (gradient.Rotation + 0.08) % 360
        local t = tick()
        for _, d in ipairs(dots) do
            if d.frame and d.frame.Parent then
                local y = (d.y + t * d.speed) % 1
                local x = (d.x + math.sin(t * 0.4 + d.speed * 50) * 0.02) % 1
                d.frame.Position = UDim2.fromScale(x, y)
            end
        end
    end)

    local viewportConn
    pcall(function()
        local cam = workspace.CurrentCamera
        if cam then
            viewportConn = cam:GetPropertyChangedSignal("ViewportSize"):Connect(function()
                if not ScreenGui or not ScreenGui.Parent then return end
                local v = cam.ViewportSize
                local mobile = UserInputService.TouchEnabled and v.X <= 650
                local w = mobile and 340 or 430
                local h = mobile and 500 or 455
                card.Size = UDim2.fromOffset(w, h)
                card.Position = UDim2.new(0.5, -w/2, 0.5, -h/2)
            end)
        end
    end)

    ScreenGui.Destroying:Connect(function()
        pcall(function() animConn:Disconnect() end)
        pcall(function() if viewportConn then viewportConn:Disconnect() end end)
    end)

    -- Auto-login from the validated persistent key file.
    local savedKey, loadErr = LoadSavedKey()
    if savedKey then
        input.Text = savedKey
        setStatus("Saved key found • verifying automatically...", Color3.fromRGB(120, 190, 255))
        task.spawn(function()
            local ok = redeemKey(savedKey)
            if ok then
                setStatus("Auto-login successful. Launching...", Color3.fromRGB(112, 225, 165))
                task.wait(0.3)
                if ScreenGui and ScreenGui.Parent then ScreenGui:Destroy() end
                StartMainScript()
            else
                setStatus("Saved key is expired or invalid. Enter a new key.", Color3.fromRGB(255, 175, 90))
            end
        end)
    elseif loadErr and loadErr ~= "No saved key file" then
        setStatus("Key file unavailable: " .. tostring(loadErr), Color3.fromRGB(255, 175, 90))
    end

end

local player = Players.LocalPlayer
if not player then return end
local pGui = player:WaitForChild("PlayerGui")

if pGui:FindFirstChild(Config.MainGuiName) then
    StartMainScript() 
    return
end

CreateGUI()
