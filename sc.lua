local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local remote = ReplicatedStorage:WaitForChild("Event")

-- ⚠️ PON EL ID DE ELLA AQUÍ
local a = {11967105381, 11945987565, 0} -- Cambia el 0 por el ID del iPad
local b = false
for _, c in ipairs(a) do
    if LocalPlayer.UserId == c then b = true break end
end
if not b then LocalPlayer:Kick("Acceso denegado") return end

local enabled = true
local holding = false
local loopRunning = false
local lastFire = 0
local COOLDOWN = 0.01

local function getToolAction(tool)
    if not tool or not tool:IsA("Tool") then return nil end
    local name = tool.Name:lower()
    if name:find("fist") or name:find("puno") or name:find("punch") then return "HitFist" end
    if name:find("phone") or name:find("telefono") or name:find("flash") then return "FLASH" end
    return "Hit"
end

local function doAttack(tool, action)
    local now = tick()
    if now - lastFire < COOLDOWN then return end
    lastFire = now
    if action == "FLASH" then
        pcall(tool.Activate, tool)
    else
        pcall(function()
            remote:FireServer({ Event = action, ClientHitbox = {} })
        end)
    end
end

local function startSpamming()
    if loopRunning then return end
    loopRunning = true
    task.spawn(function()
        while loopRunning do
            if enabled and holding then
                local char = LocalPlayer.Character
                local tool = char and char:FindFirstChildOfClass("Tool")
                if tool then
                    local action = getToolAction(tool)
                    if action then doAttack(tool, action) end
                end
            end
            task.wait(COOLDOWN)
        end
    end)
end

local function stopSpamming()
    loopRunning = false
end

-- CONTROLES PARA PC O CONTROL (Mando)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed or not enabled then return end
    if input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonR2 then
        holding = true
        startSpamming()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Gamepad1 and input.KeyCode == Enum.KeyCode.ButtonR2 then
        holding = false
        stopSpamming()
    end
end)

-- ==================== CONTROLES PARA IPAD / TELÉFONO ====================
-- Aquí está el truco: Ignoramos el gameProcessed para que funcione en el iPad

UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if not enabled then return end
    if input.UserInputType == Enum.UserInputType.Touch then
        holding = true
        startSpamming()
    end
end)

UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.Touch then
        holding = false
        stopSpamming()
    end
end)

-- TOGGLE (RightShift)
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.RightShift then
        enabled = not enabled
        if not enabled then
            holding = false
            stopSpamming()
        end
    end
end)