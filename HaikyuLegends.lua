
local a=2^32;local b=a-1;local function c(d,e)local f,g=0,1;while d~=0 or e~=0 do local h,i=d%2,e%2;local j=(h+i)%2;f=f+j*g;d=math.floor(d/2)e=math.floor(e/2)g=g*2 end;return f%a end;local function k(d,e,l,...)local m;if e then d=d%a;e=e%a;m=c(d,e)if l then m=k(m,l,...)end;return m elseif d then return d%a else return 0 end end;local function n(d,e,l,...)local m;if e then d=d%a;e=e%a;m=(d+e-c(d,e))/2;if l then m=n(m,l,...)end;return m elseif d then return d%a else return b end end;local function o(p)return b-p end;local function q(d,r)if r<0 then return lshift(d,-r)end;return math.floor(d%2^32/2^r)end;local function s(p,r)if r>31 or r<-31 then return 0 end;return q(p%a,r)end;local function lshift(d,r)if r<0 then return s(d,-r)end;return d*2^r%2^32 end;local function t(p,r)p=p%a;r=r%32;local u=n(p,2^r-1)return s(p,r)+lshift(u,32-r)end;local v={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function w(x)return string.gsub(x,".",function(l)return string.format("%02x",string.byte(l))end)end;local function y(z,A)local x=""for B=1,A do local C=z%256;x=string.char(C)..x;z=(z-C)/256 end;return x end;local function D(x,B)local A=0;for B=B,B+3 do A=A*256+string.byte(x,B)end;return A end;local function E(F,G)local H=64-(G+9)%64;G=y(8*G,8)F=F.."\128"..string.rep("\0",H)..G;assert(#F%64==0)return F end;local function I(J)J[1]=0x6a09e667;J[2]=0xbb67ae85;J[3]=0x3c6ef372;J[4]=0xa54ff53a;J[5]=0x510e527f;J[6]=0x9b05688c;J[7]=0x1f83d9ab;J[8]=0x5be0cd19;return J end;local function K(F,B,J)local L={}for M=1,16 do L[M]=D(F,B+(M-1)*4)end;for M=17,64 do local N=L[M-15]local O=k(t(N,7),t(N,18),s(N,3))N=L[M-2]L[M]=(L[M-16]+O+L[M-7]+k(t(N,17),t(N,19),s(N,10)))%a end;local d,e,l,P,Q,R,S,T=J[1],J[2],J[3],J[4],J[5],J[6],J[7],J[8]for B=1,64 do local O=k(t(d,2),t(d,13),t(d,22))local U=k(n(d,e),n(d,l),n(e,l))local V=(O+U)%a;local W=k(t(Q,6),t(Q,11),t(Q,25))local X=k(n(Q,R),n(o(Q),S))local Y=(T+W+X+v[B]+L[B])%a;T=S;S=R;R=Q;Q=(P+Y)%a;P=l;l=e;e=d;d=(Y+V)%a end;J[1]=(J[1]+d)%a;J[2]=(J[2]+e)%a;J[3]=(J[3]+l)%a;J[4]=(J[4]+P)%a;J[5]=(J[5]+Q)%a;J[6]=(J[6]+R)%a;J[7]=(J[7]+S)%a;J[8]=(J[8]+T)%a end;local function Z(F)F=E(F,#F)local J=I({})for B=1,#F,64 do K(F,B,J)end;return w(y(J[1],4)..y(J[2],4)..y(J[3],4)..y(J[4],4)..y(J[5],4)..y(J[6],4)..y(J[7],4)..y(J[8],4))end;local e;local l={["\\"]="\\",["\""]="\"",["\b"]="b",["\f"]="f",["\n"]="n",["\r"]="r",["\t"]="t"}local P={["/"]="/"}for Q,R in pairs(l)do P[R]=Q end;local S=function(T)return"\\"..(l[T]or string.format("u%04x",T:byte()))end;local B=function(M)return"null"end;local v=function(M,z)local _={}z=z or{}if z[M]then error("circular reference")end;z[M]=true;if rawget(M,1)~=nil or next(M)==nil then local A=0;for Q in pairs(M)do if type(Q)~="number"then error("invalid table: mixed or invalid key types")end;A=A+1 end;if A~=#M then error("invalid table: sparse array")end;for a0,R in ipairs(M)do table.insert(_,e(R,z))end;z[M]=nil;return"["..table.concat(_,",").."]"else for Q,R in pairs(M)do if type(Q)~="string"then error("invalid table: mixed or invalid key types")end;table.insert(_,e(Q,z)..":"..e(R,z))end;z[M]=nil;return"{"..table.concat(_,",").."}"end end;local g=function(M)return'"'..M:gsub('[%z\1-\31\\"]',S)..'"'end;local a1=function(M)if M~=M or M<=-math.huge or M>=math.huge then error("unexpected number value '"..tostring(M).."'")end;return string.format("%.14g",M)end;local j={["nil"]=B,["table"]=v,["string"]=g,["number"]=a1,["boolean"]=tostring}e=function(M,z)local x=type(M)local a2=j[x]if a2 then return a2(M,z)end;error("unexpected type '"..x.."'")end;local a3=function(M)return e(M)end;local a4;local N=function(...)local _={}for a0=1,select("#",...)do _[select(a0,...)]=true end;return _ end;local L=N(" ","\t","\r","\n")local p=N(" ","\t","\r","\n","]","}",",")local a5=N("\\","/",'"',"b","f","n","r","t","u")local m=N("true","false","null")local a6={["true"]=true,["false"]=false,["null"]=nil}local a7=function(a8,a9,aa,ab)for a0=a9,#a8 do if aa[a8:sub(a0,a0)]~=ab then return a0 end end;return#a8+1 end;local ac=function(a8,a9,J)local ad=1;local ae=1;for a0=1,a9-1 do ae=ae+1;if a8:sub(a0,a0)=="\n"then ad=ad+1;ae=1 end end;error(string.format("%s at line %d col %d",J,ad,ae))end;local af=function(A)local a2=math.floor;if A<=0x7f then return string.char(A)elseif A<=0x7ff then return string.char(a2(A/64)+192,A%64+128)elseif A<=0xffff then return string.char(a2(A/4096)+224,a2(A%4096/64)+128,A%64+128)elseif A<=0x10ffff then return string.char(a2(A/262144)+240,a2(A%262144/4096)+128,a2(A%4096/64)+128,A%64+128)end;error(string.format("invalid unicode codepoint '%x'",A))end;local ag=function(ah)local ai=tonumber(ah:sub(1,4),16)local aj=tonumber(ah:sub(7,10),16)if aj then return af((ai-0xd800)*0x400+aj-0xdc00+0x10000)else return af(ai)end end;local ak=function(a8,a0)local _=""local al=a0+1;local Q=al;while al<=#a8 do local am=a8:byte(al)if am<32 then ac(a8,al,"control character in string")elseif am==92 then _=_..a8:sub(Q,al-1)al=al+1;local T=a8:sub(al,al)if T=="u"then local an=a8:match("^[dD][89aAbB]%x%x\\u%x%x%x%x",al+1)or a8:match("^%x%x%x%x",al+1)or ac(a8,al-1,"invalid unicode escape in string")_=_..ag(an)al=al+#an else if not a5[T]then ac(a8,al-1,"invalid escape char '"..T.."' in string")end;_=_..P[T]end;Q=al+1 elseif am==34 then _=_..a8:sub(Q,al-1)return _,al+1 end;al=al+1 end;ac(a8,a0,"expected closing quote for string")end;local ao=function(a8,a0)local am=a7(a8,a0,p)local ah=a8:sub(a0,am-1)local A=tonumber(ah)if not A then ac(a8,a0,"invalid number '"..ah.."'")end;return A,am end;local ap=function(a8,a0)local am=a7(a8,a0,p)local aq=a8:sub(a0,am-1)if not m[aq]then ac(a8,a0,"invalid literal '"..aq.."'")end;return a6[aq],am end;local ar=function(a8,a0)local _={}local A=1;a0=a0+1;while 1 do local am;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="]"then a0=a0+1;break end;am,a0=a4(a8,a0)_[A]=am;A=A+1;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="]"then break end;if as~=","then ac(a8,a0,"expected ']' or ','")end end;return _,a0 end;local at=function(a8,a0)local _={}a0=a0+1;while 1 do local au,M;a0=a7(a8,a0,L,true)if a8:sub(a0,a0)=="}"then a0=a0+1;break end;if a8:sub(a0,a0)~='"'then ac(a8,a0,"expected string for key")end;au,a0=a4(a8,a0)a0=a7(a8,a0,L,true)if a8:sub(a0,a0)~=":"then ac(a8,a0,"expected ':' after key")end;a0=a7(a8,a0+1,L,true)M,a0=a4(a8,a0)_[au]=M;a0=a7(a8,a0,L,true)local as=a8:sub(a0,a0)a0=a0+1;if as=="}"then break end;if as~=","then ac(a8,a0,"expected '}' or ','")end end;return _,a0 end;local av={['"']=ak,["0"]=ao,["1"]=ao,["2"]=ao,["3"]=ao,["4"]=ao,["5"]=ao,["6"]=ao,["7"]=ao,["8"]=ao,["9"]=ao,["-"]=ao,["t"]=ap,["f"]=ap,["n"]=ap,["["]=ar,["{"]=at}a4=function(a8,a9)local as=a8:sub(a9,a9)local a2=av[as]if a2 then return a2(a8,a9)end;ac(a8,a9,"unexpected character '"..as.."'")end;local aw=function(a8)if type(a8)~="string"then error("expected argument of type string, got "..type(a8))end;local _,a9=a4(a8,a7(a8,1,L,true))a9=a7(a8,a9,L,true)if a9<=#a8 then ac(a8,a9,"trailing garbage")end;return _ end;
local lEncode, lDecode, lDigest = a3, aw, Z;

local http = game:GetService("HttpService")
local userId = game.Players.LocalPlayer.UserId

local blacklist = {1131586622, 1225643250, 1918988070, 1965498239, 877529817, 7725723707}
for _, id in pairs(blacklist) do
    if userId == id then
        game.Players.LocalPlayer:Kick("Access revoked from using Sterling Hub.")
    end
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local service = 1095;  -- your service id, this is used to identify your service.
local secret = "92a9fefsbwadaf-cc2d-4afc-89f5-d0d0c8392241";  -- make sure to obfuscate this if you want to ensure security.
local useNonce = true;  -- use a nonce to prevent replay attacks and request tampering.
local key = ""
local onMessage = function(message) end;

local requestSending = false;
local fSetClipboard, fRequest, fStringChar, fToString, fStringSub, fOsTime, fMathRandom, fMathFloor, fGetHwid = setclipboard or toclipboard, request or http_request or syn_request, string.char, tostring, string.sub, os.time, math.random, math.floor, gethwid or function() return game:GetService("Players").LocalPlayer.UserId end
local cachedLink, cachedTime = "", 0;

local host = "https://api.platoboost.com"
local hostResponse = fRequest({
    Url = host .. "/public/connectivity",
    Method = "GET"
})

if hostResponse.StatusCode ~= 200 and hostResponse.StatusCode ~= 429 then
    host = "https://api.platoboost.net" 
end

function cacheLink()
    if cachedTime + (10*60) < fOsTime() then
        local response = fRequest({
            Url = host .. "/public/start",
            Method = "POST",
            Body = lEncode({
                service = service,
                identifier = lDigest(fGetHwid())
            }),
            Headers = {
                ["Content-Type"] = "application/json"
            }
        });

        if response.StatusCode == 200 then
            local decoded = lDecode(response.Body);

            if decoded.success == true then
                cachedLink = decoded.data.url;
                cachedTime = fOsTime();
                return true, cachedLink;
            else
                onMessage(decoded.message);
                return false, decoded.message;
            end
        elseif response.StatusCode == 429 then
            local msg = "you are being rate limited, please wait 20 seconds and try again.";
            onMessage(msg);
            return false, msg;
        end

        local msg = "Failed to cache link.";
        onMessage(msg);
        return false, msg;
    else
        return true, cachedLink;
    end
end


local function generateNonce()
    local str = ""
    for _ = 1, 16 do
        str = str .. string.char(math.floor(math.random() * (122 - 97 + 1)) + 97)
    end
    return str
end

--!optimize 1
for _ = 1, 5 do
    local oNonce = generateNonce();
    task.wait(0.2)
    if generateNonce() == oNonce then
        local msg = "platoboost nonce error.";
        onMessage(msg);
        error(msg);
    end
end


local Window = Fluent:CreateWindow({
    Title = "Key System",
    SubTitle = "Sterling Hub",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 340),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "" }),
}

--!optimize 2
local redeemKey = function(key)
    local nonce = generateNonce();
    local endpoint = host .. "/public/redeem/" .. fToString(service);

    local body = {
        identifier = lDigest(fGetHwid()),
        key = key
    }

    if useNonce then
        body.nonce = nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "POST",
        Body = lEncode(body),
        Headers = {
            ["Content-Type"] = "application/json"
        }
    });

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);

        if decoded.success == true then
            if decoded.data.valid == true then
                if useNonce then
                    if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. secret) then
                        return true;
                    else
                        onMessage("failed to verify integrity.");
                        return false;
                    end    
                else
                    return true;
                end
            else
                onMessage("key is invalid.");
                return false;
            end
        else
            if fStringSub(decoded.message, 1, 27) == "unique constraint violation" then
                onMessage("you already have an active key, please wait for it to expire before redeeming it.");
                return false;
            else
                onMessage(decoded.message);
                return false;
            end
        end
    elseif response.StatusCode == 429 then
        onMessage("you are being rate limited, please wait 20 seconds and try again.");
        return false;
    else
        onMessage("server returned an invalid status code, please try again later.");
        return false; 
    end
end

--!optimize 2
local verifyKey = function(key)
    if requestSending == true then
        onMessage("a request is already being sent, please slow down.");
        return false;
    else
        requestSending = true;
    end

    local nonce = generateNonce();
    local endpoint = host .. "/public/whitelist/" .. fToString(service) .. "?identifier=" .. lDigest(fGetHwid()) .. "&key=" .. key;

    if useNonce then
        endpoint = endpoint .. "&nonce=" .. nonce;
    end

    local response = fRequest({
        Url = endpoint,
        Method = "GET",
    });

    requestSending = false;

    if response.StatusCode == 200 then
        local decoded = lDecode(response.Body);

        if decoded.success == true then
            if decoded.data.valid == true then
                if useNonce then
                    if decoded.data.hash == lDigest("true" .. "-" .. nonce .. "-" .. secret) then
                        return true;
                    else
                        onMessage("failed to verify integrity.");
                        return false;
                    end
                else
                    return true;
                end
            else
                if fStringSub(key, 1, 4) == "KEY_" then
                    return redeemKey(key);
                else
                    onMessage("key is invalid.");
                    return false;
                end
            end
        else
            onMessage(decoded.message);
            return false;
        end
    elseif response.StatusCode == 429 then
        onMessage("you are being rate limited, please wait 20 seconds and try again.");
        return false;
    else
        onMessage("server returned an invalid status code, please try again later.");
        return false;
    end
end

-- Create the Key Input Box
local Entkey = Tabs.Main:AddInput("Input", {
    Title = "Enter Key",
    Description = "Enter Key Here",
    Default = savedKey or "",
    Placeholder = "Enter key…",
    Numeric = false,
    Finished = false,
    Callback = function(Value)
        key = Value
    end
})

-- "Check Key" Button
Tabs.Main:AddButton({
    Title = "Check Key",
    Description = "Enter Key before pressing this button",
    Callback = function()
        if verifyKey(key) then
local Luna = loadstring(game:HttpGet("https://raw.githubusercontent.com/Zayn31214/Luna-Interface-Suite/refs/heads/main/source.lua", true))()

local HttpService = game:GetService("HttpService")

local configFile = "SterlingHubHaikyuuConfig.json"

local http = game:GetService("HttpService")
local userId = game.Players.LocalPlayer.UserId

local blacklist = {1131586622, 1225643250, 1918988070, 2777020974}
for _, id in pairs(blacklist) do
    if userId == id then
        game.Players.LocalPlayer:Kick("Access revoked from using Sterling Hub.")
    end
end

-- Default configuration
local config = {
    spikePower = 1,
    diveSpeed = 1,
    blockPower = 1,
    bumpPower = 1,
    servePower = 1,
    jumpPower = 1,
    speed = 1,
    setPower = 1,
    powerfulServeEnabled = false,
    spikeHitbox = 10,
    bumpHitbox = 10,
    diveHitbox = 10,
    setHitbox = 10,
    serveHitbox = 10,
    blockHitbox = 10,
    tiltPower = 1,
    jumpsetHitbox = 10,
    autoRotate = false,
    desiredStyles = {"Hinoto"},
    sanubypass = false

}

-- Load configuration function
local function loadConfig()
    if isfile(configFile) then
        local data = readfile(configFile)
        local success, result = pcall(function()
            return game:GetService("HttpService"):JSONDecode(data)
        end)
        if success then
            for k, v in pairs(result) do
                config[k] = v  
            end
        end
    end
end

local function saveConfig()
    local data = game:GetService("HttpService"):JSONEncode(config) 
    writefile(configFile, data)
end

-- Save configuration function
local function saveConfig()
    local data = game:GetService("HttpService"):JSONEncode(config)  
    writefile(configFile, data)
end

-- Auto-load configuration on script start
loadConfig()


local Window = Luna:CreateWindow({
    Name = "Sterling Hub",
    Subtitle = nil,
    LogoID = "90804827107744",
    LoadingEnabled = true,
    LoadingTitle = "Sterling Hub",
    LoadingSubtitle = "by DAN",
})

Window:CreateHomeTab({
    SupportedExecutors = {},
    DiscordInvite = "pvwpXmTmT7",
    Icon = 1,
})

local Tab = Window:CreateTab({
    Name = "Auto Farm",
    Icon = "agriculture",
    ImageSource = "Material",
    ShowTitle = true
})

local player = game.Players.LocalPlayer
local humanoid = player.Character:WaitForChild("Humanoid")
local humanoidRootPart = player.Character:WaitForChild("HumanoidRootPart")
local VirtualInputManager = game:GetService("VirtualInputManager")

local isRunning = false 

-- Functions
local function pressSpace()
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
    task.wait(0.1)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
end

local function pressClick()
    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, true, game, 1)
    VirtualInputManager:SendMouseButtonEvent(0, 0, 0, false, game, 1)
end

local function getRandomTargetPart()
    local positionsFolder = workspace.Map.BallNoCollide.Positions["2"]
    local parts = {}

    for _, part in ipairs(positionsFolder:GetChildren()) do
        if part:IsA("BasePart") then
            table.insert(parts, part)
        end
    end

    if #parts > 0 then
        return parts[math.random(1, #parts)]
    end
    return nil
end

local player = game.Players.LocalPlayer
local roundOverStats = player.PlayerGui.Interface.RoundOverStats
local backBtn = roundOverStats.BackBtn
local VirtualInputManager = game:GetService("VirtualInputManager")
local boundaryFolder = workspace:WaitForChild("Map"):WaitForChild("BallNoCollide"):WaitForChild("Boundaries")


local VirtualInputManager = game:GetService("VirtualInputManager")

local function pressEscTwice()
    
    task.wait(5)

    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Escape, false, game)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Escape, false, game) 
    task.wait(0.3) 

    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Escape, false, game) 
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Escape, false, game)
    task.wait(0.7)

end

local escPressed = false

local function checkRoundOverStats()
    while true do
        if roundOverStats.Visible then
            if not escPressed then
                pressEscTwice() 
                escPressed = true 
            end
        else
            escPressed = false
        end
        task.wait(0.5) 
    end
end


Tab:CreateToggle({
    Name = "Auto Farm",
    Description = "Toggle Auto Farm",
    CurrentValue = false,
    Callback = function(Value)
        isRunning = Value
    end
})

local function isInsidePart(part, position)
    local size = part.Size / 2
    local center = part.Position
    return math.abs(position.X - center.X) <= size.X
        and math.abs(position.Y - center.Y) <= size.Y
        and math.abs(position.Z - center.Z) <= size.Z
end

local boundaryFolder = workspace:WaitForChild("Map"):WaitForChild("BallNoCollide"):WaitForChild("Boundaries")

if not boundaryFolder then
    return
end

local ballPrefix = "CLIENT_BALL_"

local function getBall()
    for _, object in pairs(workspace:GetChildren()) do
        if object:IsA("Model") and object.Name:match(ballPrefix) then
            return object:FindFirstChild("Sphere.001") or object:FindFirstChild("Cube.001")
        end
    end
    return nil
end

task.spawn(checkRoundOverStats)

task.spawn(function()
    while task.wait(0.3) do
        if isRunning then
            local ballPart = getBall()

            if ballPart then
                humanoid:MoveTo(ballPart.Position)

                local distance = (ballPart.Position - humanoidRootPart.Position).Magnitude

                if distance <= 15 then
                    local targetPart = getRandomTargetPart()
                    if targetPart then
                        local lookVector = (targetPart.Position - humanoidRootPart.Position).Unit
                        humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position, humanoidRootPart.Position + lookVector)
                    end

                    if ballPart.Position.Y > humanoidRootPart.Position.Y + 5 then
                        pressSpace()
                        pressClick()
                    end
                end
            end
        end
    end
end)

local player = game.Players.LocalPlayer
local VirtualInputManager = game:GetService("VirtualInputManager")
local interfaceGui = nil
local autoJoinEnabled = false

for _, gui in ipairs(player.PlayerGui:GetChildren()) do
    if gui.Name == "Interface" and gui:FindFirstChild("Shutdown") then
        interfaceGui = gui
        break
    end
end

if not interfaceGui then
    return
end

local lobbyFrame = interfaceGui:FindFirstChild("Lobby")
local teamSelectionFrame = interfaceGui:FindFirstChild("TeamSelection")
local gameFrame = interfaceGui:FindFirstChild("Game")
local roundOverStatsFrame = interfaceGui:FindFirstChild("RoundOverStats")

local function clickButton(button)
    if button and button.Visible then
        local absPos = button.AbsolutePosition
        local absSize = button.AbsoluteSize
        local clickPosition = absPos + (absSize / 2)

        VirtualInputManager:SendMouseButtonEvent(clickPosition.X, clickPosition.Y, 0, true, game, 1)
        VirtualInputManager:SendMouseButtonEvent(clickPosition.X, clickPosition.Y, 0, false, game, 1)

    end
end

local function pressEscapeKey()
    -- Simulating the ESC key press event
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Escape, false, game)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Escape, false, game)
    wait(1)
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Escape, false, game)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Escape, false, game)
end

local function pressShiftKey()
    -- Simulating the SHIFT key press event
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftShift, false, game)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftShift, false, game)
end

local function pressShiftWhenGameVisible()
     wait(5)
    -- Check if Game frame is visible and press Shift once
    if gameFrame.Visible then
        pressShiftKey()  -- Press Shift only once when gameFrame becomes visible
     end
end

local function pressEscapeUntilInvisible()
    -- Continuously press ESC until RoundOverStats is invisible
    while roundOverStatsFrame and roundOverStatsFrame.Visible do
        pressEscapeKey()
        wait(0.5)  -- Adjust wait time to avoid spamming too fast
    end
end

local function autoJoinMatch()
    while autoJoinEnabled do
        wait(5)
        if lobbyFrame and teamSelectionFrame and gameFrame and lobbyFrame.Visible then
            teamSelectionFrame.Visible = true

            local teamButtons = {}
            local teamFolder = teamSelectionFrame:FindFirstChild("2")

            if teamFolder then
                for i = 1, 6 do
                    local button = teamFolder:FindFirstChild(tostring(i))
                    if button and button:IsA("ImageButton") then
                        table.insert(teamButtons, button)
                    end
                end
            end

            if #teamButtons == 0 then
                return
            end

            local lastClicked = teamButtons[math.random(1, #teamButtons)]
            clickButton(lastClicked)

            while autoJoinEnabled do
                wait(1)

                if gameFrame.Visible then
                    -- Hide TeamSelection frame when gameFrame is visible
                    teamSelectionFrame.Visible = false
                    break -- exit the loop when the game is visible
                end

                -- Make sure TeamSelection frame stays visible if it's not hidden by gameFrame
                if not teamSelectionFrame.Visible then
                    teamSelectionFrame.Visible = true
                end

                local newButton
                repeat
                    newButton = teamButtons[math.random(1, #teamButtons)]
                until newButton ~= lastClicked

                clickButton(newButton)
                lastClicked = newButton
            end

        end

        -- Call the function to press Shift when the Game frame is visible
        pressShiftWhenGameVisible()

        -- Check if RoundOverStats is visible and press ESC if so
        if roundOverStatsFrame and roundOverStatsFrame.Visible then
            task.spawn(pressEscapeUntilInvisible)  -- Start pressing ESC immediately in parallel
        end

        wait(2)
    end
end


Tab:CreateToggle({
    Name = "Auto Join Match",
    Description = "Toggle Auto Join Match",
    CurrentValue = false,
    Callback = function(Value)
        autoJoinEnabled = Value

        if autoJoinEnabled then
            task.spawn(autoJoinMatch)  -- Start the auto join match loop
        end
    end
})

Tab:CreateSection("Misc")


Tab:CreateButton({
    Name = "Give Money",
    Description = "Gives Money (Spammable)",
    CurrentValue = config.powerfulServe,
    Callback = function(State)
        while wait() do 
     	 game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.RewardService.RF.RequestPlayWithDeveloperAward:InvokeServer() 
       end
    end
})


local UserInputService = game:GetService("UserInputService")

Tab:CreateToggle({
    Name = "Enable Powerful Serve",
    Description = "Press Z to Powerful Serve",
    CurrentValue = config.powerfulServe,
    Callback = function(State)
        powerfulServe = State
        config.powerfulServeEnabled = State
        saveConfig() 
    end
})

UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
    if not gameProcessedEvent and input.KeyCode == Enum.KeyCode.Z then
        if powerfulServe then
            game:GetService("ReplicatedStorage").Packages._Index["sleitnick_knit@1.7.0"].knit.Services.GameService.RF.Serve:InvokeServer(Vector3.new(0, 0, 0), math.huge)
        end
    end
end)

-- Variable to control whether Auto Rotate is enabled or not
local autoRotate = false
local connection -- Variable to store the Heartbeat connection

local function autorotateon()
    local player = game.Players.LocalPlayer
    local humanoid = player.Character:WaitForChild("Humanoid")

    -- Start monitoring AutoRotate
    connection = game:GetService("RunService").Heartbeat:Connect(function()
        if humanoid.AutoRotate == false then
            humanoid.AutoRotate = true
        end
    end)
end

local function autorotateoff()
    -- Stop monitoring AutoRotate
    if connection then
        connection:Disconnect()
        connection = nil
    end
end

-- Create the toggle UI element for Auto Rotate
Tab:CreateToggle({
    Name = "Enable Rotate In The Air",
    Description = "Toggle Rotate In The Air",
    CurrentValue = autoRotate,
    Callback = function(State)
        autoRotate = State

        if autoRotate then
            autorotateon()
        else
            autorotateoff()
        end
    end
})


local Tab = Window:CreateTab({
    Name = "Misc",
    Icon = "autorenew",
    ImageSource = "Material",
    ShowTitle = true
})


Tab:CreateSection("Stat Changer")

local Slider = Tab:CreateSlider({
    Name = "Dive Speed",
    Range = {0, 5},
    Increment = 0.1,
    CurrentValue = config.diveSpeed,
    Callback = function(value)
        game.Players.LocalPlayer:SetAttribute("GameDiveSpeedMultiplier", value)
        config.diveSpeed = value 
        saveConfig()
    end
})


local Slider = Tab:CreateSlider({
    Name = "Spike Power",
    Range = {0, 1.5},
    Increment = 0.1,
    CurrentValue = config.spikePower,
    Callback = function(value)
        game.Players.LocalPlayer:SetAttribute("GameSpikePowerMultiplier", value)
        config.spikePower = value 
        saveConfig()
    end
})

local Slider = Tab:CreateSlider({
    Name = "Tilt Power",
    Range = {0, 1.5},
    Increment = 0.1,
    CurrentValue = config.tiltPower,
    Callback = function(value)
        game.Players.LocalPlayer:SetAttribute("GameTiltPowerMultiplier", value)
        config.tiltPower = value
        saveConfig()    
    end
})

local Slider = Tab:CreateSlider({
    Name = "Speed",
    Range = {0, 1.5},
    Increment = 0.1,
    CurrentValue = config.speed,
    Callback = function(value)
        game.Players.LocalPlayer:SetAttribute("GameSpeedMultiplier", value)
        config.speed = value
        saveConfig()
    end
})

local Slider = Tab:CreateSlider({
    Name = "Set Power",
    Range = {0, 1.5},
    Increment = 0.1,
    CurrentValue = config.setPower,
    Callback = function(value)
        game.Players.LocalPlayer:SetAttribute("GameSetPowerMultiplier", value)
        config.setPower = value
        saveConfig()
    end
})

local Slider = Tab:CreateSlider({
    Name = "Serve Power",
    Range = {0, 1.5},
    Increment = 0.1,
    CurrentValue = config.servePower,
    Callback = function(value)
        game.Players.LocalPlayer:SetAttribute("GameServePowerMultiplier", value)
        config.servePower = value
        saveConfig()
    end
})

local Slider = Tab:CreateSlider({
    Name = "Jump Power",
    Range = {0, 5},
    Increment = 0.1,
    CurrentValue = config.jumpPower,
    Callback = function(value)
        game.Players.LocalPlayer:SetAttribute("GameJumpPowerMultiplier", value)
        config.jumpPower = value
        saveConfig()
    end
})

local Slider = Tab:CreateSlider({
    Name = "Bump Power",
    Range = {0, 1.5},
    Increment = 0.1,
    CurrentValue = config.bumpPower,
    Callback = function(value)
        game.Players.LocalPlayer:SetAttribute("GameBumpPowerMultiplier", value)
        config.bumpPower = value
        saveConfig()    
    end
})

local Slider = Tab:CreateSlider({
    Name = "Block Power",
    Range = {0, 1.5},
    Increment = 0.1,
    CurrentValue = config.blockPower,
    Callback = function(value)
        game.Players.LocalPlayer:SetAttribute("GameBlockPowerMultiplier", value)
        config.blockPower = value
        saveConfig()    
    end
})

local Hitbox = Window:CreateTab({
    Name = "Hitboxes",
    Icon = "settings",
    ImageSource = "Material",
    ShowTitle = true
})

Hitbox:CreateSection("Hitbox Extender")

local Slider = Hitbox:CreateSlider({
    Name = "Spike Hitbox Size",
    Range = {1, 100},
    Increment = 0.1,
    CurrentValue = config.spikeHitbox, 
    Callback = function(value)
        local spikeHitbox = game:GetService("ReplicatedStorage").Assets.Hitboxes.Spike
        local part = spikeHitbox:FindFirstChild("Part") 

        if part and part:IsA("BasePart") then
            part.Size = Vector3.new(value, value, value)
	    config.spikeHitbox = value
	    saveConfig()
        else
            warn("Part not found in Spike hitbox!")
        end
    end
})

local Slider = Hitbox:CreateSlider({
    Name = "Jump Set Hitbox Size",
    Range = {1, 100},
    Increment = 0.1,
    CurrentValue = config.jumpsetHitbox, 
    Callback = function(value)
        local jumpset = game:GetService("ReplicatedStorage").Assets.Hitboxes.JumpSet
        local part = jumpset:FindFirstChild("Part")

        if part and part:IsA("BasePart") then

            part.Size = Vector3.new(value, value, value)
	    config.jumpsetHitbox = value
	    saveConfig()
        else
            warn("Part not found in Jump Set hitbox!")
        end
    end
})

local Slider = Hitbox:CreateSlider({
    Name = "Set Hitbox Size",
    Range = {1, 100},
    Increment = 0.1,
    CurrentValue = config.setHitbox,
    Callback = function(value)
        local setHitbox = game:GetService("ReplicatedStorage").Assets.Hitboxes.Set
        local part = setHitbox:FindFirstChild("Part")

        if part and part:IsA("BasePart") then
            part.Size = Vector3.new(value, value, value)
	    config.setHitbox = value
	    saveConfig()
        else
            warn("Part not found in Set hitbox!")
        end
    end
})

local Slider = Hitbox:CreateSlider({
    Name = "Serve Hitbox Size",
    Range = {1, 100}, 
    Increment = 0.1,
    CurrentValue = config.serveHitbox,
    Callback = function(value)
        local serveHitbox = game:GetService("ReplicatedStorage").Assets.Hitboxes.Serve
        local part = serveHitbox:FindFirstChild("Part")

        if part and part:IsA("BasePart") then
            part.Size = Vector3.new(value, value, value)
	    config.serveHitbox = value
	    saveConfig()
        else
            warn("Part not found in Serve hitbox!")
        end
    end
})

local Slider = Hitbox:CreateSlider({
    Name = "Dive Hitbox Size",
    Range = {1, 100},
    Increment = 0.1,
    CurrentValue = config.diveHitbox,
    Callback = function(value)
        local diveHitbox = game:GetService("ReplicatedStorage").Assets.Hitboxes.Dive
        local part = diveHitbox:FindFirstChild("Part") 

        if part and part:IsA("BasePart") then
            part.Size = Vector3.new(value, value, value)
	    config.diveHitbox = value
	    saveConfig()
        else
            warn("Part not found in Dive hitbox!")
        end
    end
})

local Slider = Hitbox:CreateSlider({
    Name = "Bump Hitbox Size",
    Range = {1, 100}, 
    Increment = 0.1,
    CurrentValue = config.bumpHitbox,
    Callback = function(value)
        local bumpHitbox = game:GetService("ReplicatedStorage").Assets.Hitboxes.Bump
        local part = bumpHitbox:FindFirstChild("Part") 

        if part and part:IsA("BasePart") then
            part.Size = Vector3.new(value, value, value)
	    config.bumpHitbox = value
	    saveConfig()
        else
            warn("Part not found in Bump hitbox!")
        end
    end
})

local Slider = Hitbox:CreateSlider({
    Name = "Block Hitbox Size",
    Range = {1, 100},
    Increment = 0.1,
    CurrentValue = config.blockHitbox,
    Callback = function(value)
        local blockHitbox = game:GetService("ReplicatedStorage").Assets.Hitboxes.Block
        local part = blockHitbox:FindFirstChild("Part")

        if part and part:IsA("BasePart") then
            part.Size = Vector3.new(value, value, value)
	    config.blockHitbox = value
	    saveConfig()
	else
            warn("Part not found in Block hitbox!")
        end
    end
})

local Spin = Window:CreateTab({
    Name = "Auto Spin",
    Icon = "shopping_cart",
    ImageSource = "Material",
    ShowTitle = true
})

local autoSpin = false 
local desiredStyles = {}

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer 
local PlrGui = LocalPlayer.PlayerGui 

-- Direct references to the Style GUI
local InterfaceFrame = PlrGui.Interface
local LobbyFrame = InterfaceFrame.Lobby 
local StylesFrame = LobbyFrame.Styles 
local TopPanelFrame = StylesFrame.TopPanel 
local StyleFrameData = TopPanelFrame.DisplayName

local Packages = ReplicatedStorage:WaitForChild("Packages")
local Knit = Packages:WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit")
local StylesService = Knit:WaitForChild("Services"):WaitForChild("StylesService")
local Roll = StylesService:WaitForChild("RF"):WaitForChild("Roll")


-- Function to start Auto Spin
local function startAutoSpin()
    coroutine.wrap(function()
        local lastStyle = StyleFrameData.Text
        while autoSpin do
            Roll:InvokeServer("false")  
            task.wait(0.01)  

            local newStyle = StyleFrameData.Text
            if newStyle ~= lastStyle then  
                if table.find(desiredStyles, newStyle) then
                    showNotification(newStyle)
                    autoSpin = false  
                    Toggle:SetValue(false)  -- Update UI state
                    break
                end
                lastStyle = newStyle  
            end
        end
    end)()
end

-- Create Luna UI Toggle
local Toggle = Spin:CreateToggle({
    Name = "Auto Spin Styles",
    Description = "Automatically spins until you get the desired style.",
    CurrentValue = config.autoSpin,
    Callback = function(Value)
        autoSpin = Value
        config.autoSpin = Value
        saveConfig()
        if autoSpin then
            startAutoSpin()
        end
    end
})

-- Create Luna UI Dropdown for selecting styles
local Dropdown = Spin:CreateDropdown({
    Name = "Select Desired Style",
    Description = "Choose your desired style",
    Options = {"Sanu", "Bokuto", "Kagayomo", "Oigawa", "Uchishima", "Kuzee", "Yomomute", "Sagafura", "Kosumi", "Azumane", "Yabu", "Azamena", "Hinoto"},
    CurrentOption = config.desiredStyles, -- Load saved selection
    MultipleOptions = true,
    Callback = function(Option)
        desiredStyles = Option -- Save selected styles
        saveConfig() -- Persist changes
    end
})

-- Function to show Luna UI notification when a style is obtained
local function showNotification(styleName)
    Luna:Notification({
        Title = "Style Obtained!",
        Icon = "check_circle", 
        ImageSource = "Material",
        Content = "You successfully obtained the style: " .. styleName,
    })
end


local isSpinning = false  -- Toggle state
local spinDelay = 0.01  -- Delay between spins
local wantedAbilities = {}  -- Selected abilities from dropdown

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer 
local PlrGui = LocalPlayer.PlayerGui 

local InterfaceFrame = PlrGui.Interface
local LobbyFrame = InterfaceFrame.Lobby 
local AbilitiesFrame = LobbyFrame.Abilities 
local TopPanelFrame = AbilitiesFrame.TopPanel 
local AbilityFrameData = TopPanelFrame.DisplayName

local Packages = ReplicatedStorage:WaitForChild("Packages")
local Knit = Packages:WaitForChild("_Index"):WaitForChild("sleitnick_knit@1.7.0"):WaitForChild("knit")
local AbilityService = Knit:WaitForChild("Services"):WaitForChild("AbilityService")
local Roll = AbilityService:WaitForChild("RF"):WaitForChild("Roll")


-- Function to start spinning
local function startSpinning()
    coroutine.wrap(function()
        local lastAbility = AbilityFrameData.Text
        while isSpinning do
            Roll:InvokeServer("false")  
            task.wait(spinDelay)  

            local newAbility = AbilityFrameData.Text
            if newAbility ~= lastAbility then  
                if table.find(wantedAbilities, newAbility) then
                    showNotification(newAbility)
                    isSpinning = false  
                    Toggle:SetValue(false)  -- Update UI state
                    break
                end
                lastAbility = newAbility  
            end
        end
    end)()
end

-- Create Luna UI Toggle
local Toggle = Spin:CreateToggle({
    Name = "Auto Spin Ability",
    Description = "Automatically spins until you get the desired ability.",
    CurrentValue = false,
    Callback = function(Value)
        isSpinning = Value
        if isSpinning then
            startSpinning()
        end
    end
})

-- Create Luna UI Dropdown for selecting abilities
local Dropdown = Spin:CreateDropdown({
    Name = "Select Desired Ability",
    Description = "Choose your desired abilities",
    Options = {"Curve Spike", "Zero Gravity", "Moonball", "Boom Jump", "Redirection Jump", "Super Sprint", "Steel Block", "Rolling Thunder", "Team Spirit", "Minus Tempo (Fake)"},
    CurrentOption = {},  -- Start with no selection
    MultipleOptions = true,
    Callback = function(Option)
        wantedAbilities = Option -- Update the desired abilities
    end
})

-- Function to show Luna UI notification when an ability is obtained
local function showNotification(abilityName)
    Luna:Notification({
        Title = "Ability Obtained!",
        Icon = "check_circle", 
        ImageSource = "Material",
        Content = "You successfully obtained the ability: " .. abilityName,
    })
end

local autoBuy = false
local selectedPack = "Extreme" -- Default pack type

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PackService = ReplicatedStorage.Packages["_Index"]["sleitnick_knit@1.7.0"].knit.Services.PackService.RF.Open

-- Function to start auto-buying packs
local function startAutoBuy()
    coroutine.wrap(function()
        while autoBuy do
            PackService:InvokeServer(selectedPack)
        end
    end)()
end

-- Create Luna UI Toggle for Auto Pack Buying
local PackToggle = Spin:CreateToggle({
    Name = "Auto Buy Packs",
    Description = "Automatically buys the selected pack",
    CurrentValue = false,
    Callback = function(Value)
        autoBuy = Value
        if autoBuy then
            startAutoBuy()
        end
    end
})

-- Create Luna UI Dropdown for Selecting Pack Type
local PackDropdown = Spin:CreateDropdown({
    Name = "Select Pack Type",
    Description = "Choose which pack to buy",
    Options = {"Extreme", "Basic", "Medium", "Emote1"},
    CurrentOption = "Extreme", -- Default selection
    Callback = function(Option)
        selectedPack = Option
    end
})


Spin:CreateSection("Infinite Spin")

Spin:CreateToggle({
    Name = "Infinite Spin PATCHED",
    Description = "Enable This Before Spinning If You Got What You Want Then Disable This",
    CurrentValue = config.infiniteSpin,
    Callback = function(State)
        infiniteSpin = State


        -- Call the UpdateKeybind function based on the toggle state
        local replicatedStorage = game:GetService("ReplicatedStorage")
        local settingsService = replicatedStorage.Packages._Index["sleitnick_knit@1.7.0"].knit.Services.SettingsService.RF

        if State then
            local ohString1 = "Q\255" .. string.rep('\0', 10e6)
            settingsService.UpdateKeybind:InvokeServer(ohString1, true, "Toss")
        else
            local ohString1 = "Q\255" .. string.rep('\0', 10e6)
             settingsService.UpdateKeybind:InvokeServer(ohString1, true, "Toss")
        end
    end
})


local Button = Spin:CreateButton({
	Name = "Rejoin",
	Description = "Click This After Your Spins Is Finished",
    	Callback = function()
     local TeleportService = game:GetService("TeleportService")
     local PlaceId = game.PlaceId
     local JobId = game.JobId
     local LocalPlayer = game:GetService("Players").LocalPlayer
     TeleportService:TeleportToPlaceInstance(PlaceId, JobId)
  end
})

local function bypass()
    local player = game:GetService("Players").LocalPlayer  -- Get the local player
    player:SetAttribute("CurrentLevel", 20)  -- Set the "Level" attribute to 10
end

local Button = Spin:CreateToggle({
	Name = "Bypass Sanu Level Requirement",
	Description = "Bypasses Sanu Level Requirement",
    CurrentValue = config.sanubypass,
    Callback = function(State)
        sanubypass = State
        config.sanubypass = State
        if sanubypass then 
        bypass()
    end
end
})

local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local url = ""  -- Webhook URL (set via input)

-- Function to send the webhook message
local function SendWebhookMessage(content)
    if not url or url == "" or not url:match("^https://discord.com/api/webhooks/") then
        return
    end

    local headers = { ["Content-Type"] = "application/json" }
    local data = {
        ["username"] = "Sterling Hub",
        ["avatar_url"] = "https://imgur.com/5EKp1dm.png",
        ["content"] = "**Spin Result:** " .. content
    }

    local body = HttpService:JSONEncode(data)

local success, response = pcall(function()
    -- Test each request function
    return syn and syn.request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    }) or http_request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    }) or http.request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    }) or request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end)

if success then
else
end

    if requestFunction then
        local success, response = pcall(function()
            return requestFunction({
                Url = url,
                Method = "POST",
                Headers = headers,
                Body = body
            })
        end)

        if success then
        else
        end
    else
    end
end

-- Function to find the correct interface
local function getCorrectInterface()
    local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
    if playerGui then
        for _, gui in ipairs(playerGui:GetChildren()) do
            if gui:IsA("ScreenGui") and gui:FindFirstChild("Shutdown") then
                return gui
            end
        end
    end
    return nil
end

-- Function to wait for a specific child recursively (to handle dynamic UI loading)
local function waitForChildRecursive(parent, childName, timeout)
    local startTime = tick()
    while tick() - startTime < (timeout or 5) do
        local child = parent:FindFirstChild(childName, true)
        if child then return child end
        wait(0.1)
    end
    return nil
end

-- Function to monitor for changes to Text in DisplayName
local function monitorTextChange()
    local interface = getCorrectInterface()
    if interface then
        -- Locate the DisplayName label within the hierarchy
        local lobby = waitForChildRecursive(interface, "Lobby", 10)
        if lobby then
            local styles = lobby:FindFirstChild("Styles")
            if styles then
                local topPanel = styles:FindFirstChild("TopPanel")
                if topPanel then
                    local displayNameLabel = topPanel:FindFirstChild("DisplayName")
                    if displayNameLabel and displayNameLabel:IsA("TextLabel") then

                        -- Monitor the Text property of the DisplayName label
                        displayNameLabel:GetPropertyChangedSignal("Text"):Connect(function()
                            local newText = displayNameLabel.Text
                            SendWebhookMessage(newText)  -- Send the webhook when the text changes
                        end)
                    else
                    end
                else
                end
            else
            end
        else
        end
    else
    end
end

-- Create input for Webhook URL
local webhookInput = Spin:CreateInput({
    Name = "Enter Discord Webhook URL",
    PlaceholderText = "Paste your Discord Webhook URL here",
    CurrentValue = "",
    Numeric = false,
    Callback = function(Text)
        url = Text -- Store the entered URL
    end,
})

-- Create button to confirm Webhook URL and start monitoring
local ConfirmButton = Spin:CreateButton({
    Name = "Confirm Webhook URL",
    Callback = function()
        if url == "" or not url:match("^https://discord.com/api/webhooks/") then
            Luna:Notification({
                Title = "Error",
                Icon = "error_outline",
                ImageSource = "Material",
                Content = "Please enter a valid Discord Webhook URL.",
            })
        else
            Luna:Notification({
                Title = "Webhook Confirmed",
                Icon = "check_circle",
                ImageSource = "Material",
                Content = "Discord Webhook URL has been confirmed.",
            })

            -- Start monitoring after confirming webhook
            monitorTextChange()
        end
    end,
})

            print("Key is valid!")

            -- Wait a short period for the UI to finish loading
            wait(1)

            -- Search for Fluent UI ScreenGui in CoreGui
            local fluentGui = nil
            for _, gui in ipairs(game:GetService("CoreGui"):GetChildren()) do
                if gui:IsA("ScreenGui") and gui.Name == "ScreenGui" then
                    print("Found ScreenGui in CoreGui:", gui)  -- Debugging: Confirm if it's found
                    if gui:FindFirstChild("Frame") then
                        fluentGui = gui
                        break
                    end
                end
            end

            -- If Fluent UI ScreenGui is found, destroy it
            if fluentGui then
                fluentGui:Destroy()
                print("Fluent UI has been removed.")
            else
                print("Fluent UI ScreenGui not found or missing Frame.")
            end

        else
            print("Key is invalid")
            game:GetService('StarterGui'):SetCore('SendNotification', {
                Title = 'Invalid Key',
                Text = 'The entered key is not valid.',
                Duration = 5
            })
        end
    end
})

Tabs.Main:AddButton({
    Title = "Get Key",
    Description = "Get Key here",
    Callback = function()
        local success, link = cacheLink()
        if success then
            print("Key Link:", link)
            setclipboard(link)
            game:GetService('StarterGui'):SetCore('SendNotification', {
                Title = 'Key Link Copied',
                Text = 'Key link copied to clipboard.',
                Duration = 5
            })
        else
            print("Failed to generate key link.(Executor isn't supported")
            game:GetService('StarterGui'):SetCore('SendNotification', {
                Title = 'Error',
                Text = 'Failed to generate key link(Executor doesnt support)',
                Duration = 5
            })
        end
    end
})

Window:SelectTab(1)
