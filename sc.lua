local _0x1=game:GetService("\80\108\97\121\101\114\115")
local _0x2=game:GetService("\85\115\101\114\73\110\112\117\116\83\101\114\118\105\99\101")
local _0x3=game:GetService("\82\101\112\108\105\99\97\116\101\100\83\116\111\114\97\103\101")
local _0x5=_0x1.LocalPlayer
local _0x6=_0x3:WaitForChild("\69\118\101\110\116")
local _0xW={11967105381,11945987565,11812468167,12053991216,11806663077,1274805828}
local _0xAcc=false
for _,_0xV in ipairs(_0xW)do if _0x5.UserId==_0xV then _0xAcc=true break end end
if not _0xAcc then _0x5:Kick("\65\99\99\101\115\111\32\100\101\110\101\103\97\100\111")return end

local _0x7=true
local _0x8=false
local _0x9=false
local _0xa=0
local _0xb=(1/100)
local _0xT=Vector3.new(0,0,0)
local _0xH=false
local _0xC=nil
local _0xD=nil
local _0xE=false

local function _0xF(_0x10)
    if not _0x10 or not _0x10:IsA("\84\111\111\108")then return nil,false end
    local _0x11=_0x10.Name:lower()
    if _0x11:find("\104\101\101\108")or _0x11:find("\99\104\97\105\114")or _0x11:find("\116\104\114\111\119")or _0x11:find("\116\97\99\111\110")or _0x11:find("\115\105\108\108\111\110")or _0x11:find("\108\97\117\110\99\104")then return "\84\104\114\111\119\87\101\97\112\111\110",true end
    if _0x11:find("\102\105\115\116")or _0x11:find("\112\117\110\111")or _0x11:find("\112\117\110\99\104")then return "\72\105\116\70\105\115\116",false end
    if _0x11:find("\112\104\111\110\101")or _0x11:find("\116\101\108\101\102\111\110\111")or _0x11:find("\102\108\97\115\104")then return "\70\76\65\83\72",false end
    return "\72\105\116",false
end

local function _0x12()
    local _0x13=_0x5.Character
    local _0x14=_0x13 and _0x13:FindFirstChildOfClass("\84\111\111\108")
    if _0x14~=_0xC then
        _0xC=_0x14
        local _0x15,_0x16=_0xF(_0x14)
        _0xD=_0x15
        _0xE=_0x16
    end
end

local function _0x17()
    if _0xH then return _0xT end
    local _0x18=_0x5.Character
    local _0x19=_0x18 and _0x18:FindFirstChild("\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116")
    if _0x19 then return _0x19.Position+_0x19.CFrame.LookVector*20 end
    return Vector3.new(0,0,0)
end

local function _0x1A(_0x1B,_0x1C,_0x1D)
    local _0x1E=tick()
    if _0x1E-_0xa<_0xb then return end
    _0xa=_0x1E
    if _0x1D then
        return
    elseif _0x1C=="\70\76\65\83\72"then
        pcall(_0x1B.Activate,_0x1B)
    else
        pcall(function() _0x6:FireServer({Event=_0x1C,ClientHitbox={}}) end)
    end
end

local function _0x1F()
    if _0x9 then return end
    _0x9=true
    task.spawn(function()
        while _0x9 do
            if _0x7 and _0x8 then
                _0x12()
                if _0xC and _0xC.Parent and _0xD then _0x1A(_0xC,_0xD,_0xE) end
            end
            task.wait(_0xb)
        end
    end)
end

local function _0x20() _0x9=false end

_0x2.TouchStarted:Connect(function(_0x21,_0x22)
    if _0x22 then return end
    _0xT=_0x21.Position
    _0xH=true
    if not _0x7 then return end
    _0x8=true
    _0x1F()
end)

_0x2.TouchEnded:Connect(function(_0x23,_0x24)
    if _0x24 then return end
    _0x8=false
    _0x20()
end)

_0x2.InputBegan:Connect(function(_0x25,_0x26)
    if not _0x7 then return end
    if _0x25.UserInputType==Enum.UserInputType.Touch then
        _0xT=_0x25.Position
        _0xH=true
        _0x8=true
        _0x1F()
    end
end)

_0x2.InputEnded:Connect(function(_0x27)
    if _0x27.UserInputType==Enum.UserInputType.Touch then
        _0x8=false
        _0x20()
    end
end)

_0x2.InputBegan:Connect(function(_0x28,_0x29)
    if _0x29 or not _0x7 then return end
    if _0x28.UserInputType==Enum.UserInputType.Gamepad1 and _0x28.KeyCode==Enum.KeyCode.ButtonR2 then
        _0x8=true
        _0x1F()
    elseif _0x28.UserInputType==Enum.UserInputType.MouseButton1 then
        _0x8=true
        _0x1F()
    end
end)

_0x2.InputEnded:Connect(function(_0x2A)
    if _0x2A.UserInputType==Enum.UserInputType.Gamepad1 and _0x2A.KeyCode==Enum.KeyCode.ButtonR2 then
        _0x8=false
        _0x20()
    elseif _0x2A.UserInputType==Enum.UserInputType.MouseButton1 then
        _0x8=false
        _0x20()
    end
end)

_0x2.InputBegan:Connect(function(_0x2B,_0x2C)
    if _0x2C then return end
    if _0x2B.KeyCode==Enum.KeyCode.RightShift then
        _0x7=not _0x7
        if not _0x7 then _0x8=false _0x20() end
    end
end)