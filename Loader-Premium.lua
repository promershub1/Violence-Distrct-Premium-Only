--[[
    Arqel Key System — Promers-Style Build
    Original by Cobru (Cobruhehe, .cobru)
    UI restyled to match Promers Hub (monochrome white/grey aesthetic)
    License: MIT
]]

repeat task.wait() until game:IsLoaded()

local cloneref = cloneref or function(obj) return obj end
local gethui   = gethui   or function() return cloneref(game:GetService("CoreGui")) end

-- services
local TweenService     = cloneref(game:GetService("TweenService"))
local UserInputService = cloneref(game:GetService("UserInputService"))
local HttpService      = cloneref(game:GetService("HttpService"))
local Workspace        = cloneref(game:GetService("Workspace"))
local RunService       = cloneref(game:GetService("RunService"))
local Lighting         = cloneref(game:GetService("Lighting"))
local Players          = cloneref(game:GetService("Players"))
local hui              = gethui()

if getgenv().ArqelLoaded and hui:FindFirstChild("ArqelKeySystem") then
    return getgenv().Arqel
end
if getgenv().ArqelLoaded and hui:FindFirstChild("ArqelKeylessSystem") then
    return getgenv().Arqel
end

getgenv().ArqelLoaded = true
getgenv().ArqelClosed = false

local Arqel = {}

-- ============================================================
-- APPEARANCE
-- ============================================================
Arqel.Appearance = {
    Title    = "Arqel",
    Subtitle = "Enter your key to continue",
    Icon     = "rbxassetid://95721401302279",
    IconSize = UDim2.new(0, 30, 0, 30),
}

-- ============================================================
-- LINKS
-- ============================================================
Arqel.Links = {
    GetKey  = "",
    Discord = "",
}

-- ============================================================
-- STORAGE
-- ============================================================
Arqel.Storage = {
    FileName = "Arqel_Key",
    Remember = true,
    AutoLoad = true,
}

-- ============================================================
-- OPTIONS
-- ============================================================
Arqel.Options = {
    Keyless   = nil,
    KeylessUI = false,
    Blur      = true,
    Draggable = true,
    NoGetKey  = true,
}

-- ============================================================
-- THEME (Promers Monochrome)
-- ============================================================
Arqel.Theme = {
    Accent         = Color3.fromRGB(255, 255, 255),
    AccentHover    = Color3.fromRGB(220, 220, 220),
    Background     = Color3.fromRGB(15, 15, 15),
    BackgroundDeep = Color3.fromRGB(10, 10, 10),
    Header         = Color3.fromRGB(13, 13, 13),
    Input          = Color3.fromRGB(25, 25, 25),
    InputHover     = Color3.fromRGB(40, 40, 40),
    Text           = Color3.fromRGB(255, 255, 255),
    TextDim        = Color3.fromRGB(145, 145, 145),
    Success        = Color3.fromRGB(80, 220, 120),
    Error          = Color3.fromRGB(255, 80, 80),
    Warning        = Color3.fromRGB(255, 200, 60),
    StatusIdle     = Color3.fromRGB(180, 180, 180),
    Discord        = Color3.fromRGB(88, 101, 242),
    DiscordHover   = Color3.fromRGB(114, 137, 218),
    Divider        = Color3.fromRGB(45, 45, 45),
    Pending        = Color3.fromRGB(60, 60, 60),
    Border         = Color3.fromRGB(60, 60, 60),
    BorderLight    = Color3.fromRGB(85, 85, 85),
    SectionGradA   = Color3.fromRGB(22, 22, 22),
    SectionGradB   = Color3.fromRGB(12, 12, 12),
    ButtonBg       = Color3.fromRGB(35, 35, 35),
    ButtonBgHover  = Color3.fromRGB(55, 55, 55),
    ButtonGradA    = Color3.fromRGB(45, 45, 45),
    ButtonGradB    = Color3.fromRGB(20, 20, 20),
}

-- ============================================================
-- CALLBACKS
-- ============================================================
Arqel.Callbacks = {
    OnVerify  = nil,
    OnSuccess = nil,
    OnFail    = nil,
    OnClose   = nil,
}

Arqel.Changelog = {}

-- ============================================================
-- SHOP
-- ============================================================
Arqel.Shop = {
    Enabled    = false,
    Icon       = "",
    Title      = "Get Premium Access",
    Subtitle   = "Instant delivery • 24/7 support",
    ButtonText = "Buy",
    Link       = "",
}

-- ============================================================
-- INTERNAL
-- ============================================================
local Internal = {
    Junkie           = nil,
    BlurEffect       = nil,
    NotificationList = {},
    ValidateFunction = nil,
    IsJunkieMode     = false,
    IconsLoaded      = false,
}

-- ============================================================
-- ICONS
-- ============================================================
local IconBaseURL = "https://raw.githubusercontent.com/Cobruhehe/expert-octo-doodle/main/Icons/"

local IconFiles = {
    key       = "lucide--key.png",
    shield    = "lucide--shield-minus.png",
    check     = "prime--check-square.png",
    copy      = "flowbite--clipboard-outline.png",
    discord   = "qlementine-icons--discord-16.png",
    alert     = "mdi--alert-octagon-outline.png",
    lock      = "lucide--user-lock.png",
    loading   = "nonicons--loading-16.png",
    close     = "material-symbols--dangerous-outline.png",
    changelog = "ant-design--sync-outlined.png",
    logo      = "rrjlGmac.png",
    user      = "U.png",
    clock     = "Clock.png",
    cart      = "Cart.png",
    nogetkey  = "lucide--lock.png",
}

local FallbackIcons = {
    key       = "rbxassetid://96510194465420",
    shield    = "rbxassetid://89965059528921",
    check     = "rbxassetid://76078495178149",
    copy      = "rbxassetid://125851897718493",
    discord   = "rbxassetid://83278450537116",
    alert     = "rbxassetid://140438367956051",
    lock      = "rbxassetid://114355063515473",
    loading   = "rbxassetid://116535712789945",
    close     = "rbxassetid://6022668916",
    changelog = "rbxassetid://138133190015277",
    logo      = "rbxassetid://95721401302279",
    user      = "rbxassetid://77400125196692",
    clock     = "rbxassetid://87505349362628",
    cart      = "rbxassetid://114754518183872",
    nogetkey  = "rbxassetid://119765975153029",
}

local CachedIcons    = {}
local FolderName     = "Arqel"
local IconsFolder    = "Icons"
local DefaultLogoAsset = "rbxassetid://95721401302279"

-- ============================================================
-- HELPERS
-- ============================================================
local function isMobile()
    return UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
end

local function getScale()
    local viewport = Workspace.CurrentCamera.ViewportSize
    return math.clamp(math.min(viewport.X, viewport.Y) / 900, 0.65, 1.3)
end

local function hasFileSystem()
    local ok1 = pcall(function() return type(writefile) == "function" end)
    local ok2 = pcall(function() return type(readfile) == "function" end)
    local ok3 = pcall(function() return type(isfile) == "function" end)
    local ok4 = pcall(function() return type(makefolder) == "function" end)
    local ok5 = pcall(function() return type(isfolder) == "function" end)
    return ok1 and ok2 and ok3 and ok4 and ok5
end

local fileSystemSupported = hasFileSystem()

local function getFileName()
    return FolderName .. "/" .. Arqel.Storage.FileName .. ".txt"
end

local function saveKey(key)
    if not fileSystemSupported or not Arqel.Storage.Remember then return false end
    return pcall(function() writefile(getFileName(), key) end)
end

local function loadKey()
    if not fileSystemSupported then return nil end
    local ok, content = pcall(function()
        if isfile(getFileName()) then return readfile(getFileName()) end
        return nil
    end)
    if ok and content and content ~= "" then return content end
    return nil
end

local function clearKey()
    if not fileSystemSupported then return false end
    return pcall(function() delfile(getFileName()) end)
end

local function ensureFolders()
    if not fileSystemSupported then return false end
    pcall(function()
        if not isfolder(FolderName) then makefolder(FolderName) end
        if not isfolder(FolderName .. "/" .. IconsFolder) then
            makefolder(FolderName .. "/" .. IconsFolder)
        end
    end)
    return true
end

local function getIconPath(iconName)
    return FolderName .. "/" .. IconsFolder .. "/" .. IconFiles[iconName]
end

local function isIconCached(iconName)
    if not fileSystemSupported then return false end
    local success, result = pcall(function()
        return isfile(getIconPath(iconName))
    end)
    return success and result
end

local function downloadIcon(iconName)
    if not fileSystemSupported then
        CachedIcons[iconName] = FallbackIcons[iconName]
        return false
    end
    local path = getIconPath(iconName)
    if isIconCached(iconName) then
        local success = pcall(function()
            CachedIcons[iconName] = getcustomasset(path)
        end)
        if success then return true end
    end
    local success = pcall(function()
        local response = game:HttpGet(IconBaseURL .. IconFiles[iconName])
        if #response < 100 then error("Invalid") end
        writefile(path, response)
        CachedIcons[iconName] = getcustomasset(path)
    end)
    if not success then
        CachedIcons[iconName] = FallbackIcons[iconName]
    end
    return success
end

local function getIcon(iconName)
    return CachedIcons[iconName] or FallbackIcons[iconName]
end

local function getLogoIcon()
    if Arqel.Appearance.Icon == DefaultLogoAsset then return getIcon("logo") end
    return Arqel.Appearance.Icon
end

local function shouldDownloadLogo()
    return Arqel.Appearance.Icon == DefaultLogoAsset
end

local function getShopIcon()
    if Arqel.Shop.Icon == "" then return getLogoIcon() end
    return Arqel.Shop.Icon
end

local function isShopEnabled()
    return Arqel.Shop.Enabled
end

local function allIconsCached()
    if not fileSystemSupported then return false end
    local iconNames = {"key", "shield", "check", "copy", "discord", "alert", "lock",
                       "loading", "close", "changelog", "user", "clock", "cart", "nogetkey"}
    if shouldDownloadLogo() then table.insert(iconNames, "logo") end
    for _, name in ipairs(iconNames) do
        if not isIconCached(name) then return false end
    end
    return true
end

local function loadAllIconsFromCache()
    ensureFolders()
    local iconNames = {"key", "shield", "check", "copy", "discord", "alert", "lock",
                       "loading", "close", "changelog", "user", "clock", "cart", "nogetkey"}
    if shouldDownloadLogo() then table.insert(iconNames, "logo") end
    for _, name in ipairs(iconNames) do downloadIcon(name) end
    Internal.IconsLoaded = true
end

local function getExecutorName()
    local success, name = pcall(identifyexecutor)
    if success and name then return tostring(name) end
    return "Unknown"
end

local function getDeviceType()
    local touch    = UserInputService.TouchEnabled
    local keyboard = UserInputService.KeyboardEnabled
    local gamepad  = UserInputService.GamepadEnabled
    if gamepad and not keyboard and not touch then return "Console"
    elseif touch and not keyboard then return "Mobile"
    elseif keyboard and touch then return "PC & Touch"
    elseif keyboard then return "PC"
    else return "Unknown" end
end

local function getHWID()
    local hwid = nil
    pcall(function() if gethwid then hwid = gethwid() end end)
    if not hwid then
        pcall(function() if getgenv().HWID then hwid = getgenv().HWID end end)
    end
    if not hwid then
        pcall(function() if game.RobloxHWID then hwid = tostring(game.RobloxHWID) end end)
    end
    if not hwid then
        local player = cloneref(Players.LocalPlayer)
        hwid = HttpService:GenerateGUID(false):gsub("-", ""):sub(1, 32)
        if player then hwid = tostring(player.UserId) .. hwid:sub(1, 20) end
    end
    return hwid or "N/A"
end

local function generateHiddenDots(availableWidth, charWidth)
    charWidth = charWidth or 5
    local count = math.floor(availableWidth / charWidth)
    count = math.max(count, 8)
    return string.rep("•", count)
end

local function formatTime12()
    local hour = tonumber(os.date("%H"))
    local min  = os.date("%M")
    local sec  = os.date("%S")
    local period = "AM"
    if hour >= 12 then period = "PM" end
    if hour > 12 then hour = hour - 12 end
    if hour == 0 then hour = 12 end
    return string.format("%d:%s:%s %s", hour, min, sec, period)
end

local function formatDate()
    return os.date("%b %d, %Y")
end

local function enableBlur()
    if not Arqel.Options.Blur then return end
    local existing = Lighting:FindFirstChild("ArqelKeySystemBlur")
    if existing then existing:Destroy() end
    Internal.BlurEffect = Instance.new("BlurEffect")
    Internal.BlurEffect.Name   = "ArqelKeySystemBlur"
    Internal.BlurEffect.Size   = 0
    Internal.BlurEffect.Parent = Lighting
    TweenService:Create(Internal.BlurEffect,
        TweenInfo.new(0.4, Enum.EasingStyle.Quart),
        { Size = 24 }):Play()
end

local function disableBlur()
    if Internal.BlurEffect and Internal.BlurEffect.Parent then
        TweenService:Create(Internal.BlurEffect,
            TweenInfo.new(0.3, Enum.EasingStyle.Quart),
            { Size = 0 }):Play()
        task.delay(0.3, function()
            if Internal.BlurEffect and Internal.BlurEffect.Parent then
                Internal.BlurEffect:Destroy()
                Internal.BlurEffect = nil
            end
        end)
    else
        local existing = Lighting:FindFirstChild("ArqelKeySystemBlur")
        if existing then existing:Destroy() end
        Internal.BlurEffect = nil
    end
end

local function fullCleanup()
    getgenv().ArqelLoaded = false
    getgenv().ArqelClosed = true
    disableBlur()
    local gui1 = hui:FindFirstChild("ArqelKeySystem")
    local gui2 = hui:FindFirstChild("ArqelKeylessSystem")
    local gui3 = hui:FindFirstChild("ArqelLoadingScreen")
    if gui1 then gui1:Destroy() end
    if gui2 then gui2:Destroy() end
    if gui3 then gui3:Destroy() end
end

local function setupDragging(header, main)
    if not Arqel.Options.Draggable then return end
    local dragging, dragStart, startPos, dragInput

    header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
           or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = main.Position
            dragInput = input
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    if dragInput == input then dragging = false; dragInput = nil end
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if not dragging or not dragInput then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                      startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        elseif input.UserInputType == Enum.UserInputType.Touch then
            if input == dragInput then
                local delta = input.Position - dragStart
                main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                                          startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            end
        end
    end)
end

local function validateKey(key, validateFunc)
    if not validateFunc or not key or key == "" then return false end
    local success, result = pcall(validateFunc, key)
    if not success then return false end
    if type(result) == "table" then return result.valid == true end
    if type(result) == "boolean" then return result end
    return false
end

-- ============================================================
-- DOOR OVERLAY
-- ============================================================
local function CreateDoorOverlay(parentFrame, width, height)
    local overlay = Instance.new("Frame")
    overlay.Name = "DoorOverlay"
    overlay.Size = UDim2.new(1, 0, 1, 0)
    overlay.BackgroundTransparency = 1
    overlay.ClipsDescendants = true
    overlay.ZIndex = 50
    overlay.Parent = parentFrame

    local leftDoor = Instance.new("Frame")
    leftDoor.Name = "LeftDoor"
    leftDoor.Size = UDim2.new(0.5, 0, 1, 0)
    leftDoor.Position = UDim2.new(0, 0, 0, 0)
    leftDoor.BackgroundColor3 = Arqel.Theme.Header
    leftDoor.BorderSizePixel = 0
    leftDoor.ZIndex = 51
    leftDoor.Parent = overlay

    local rightDoor = Instance.new("Frame")
    rightDoor.Name = "RightDoor"
    rightDoor.Size = UDim2.new(0.5, 0, 1, 0)
    rightDoor.Position = UDim2.new(0.5, 0, 0, 0)
    rightDoor.BackgroundColor3 = Arqel.Theme.Header
    rightDoor.BorderSizePixel = 0
    rightDoor.ZIndex = 51
    rightDoor.Parent = overlay

    local logoSize = math.min(width, height) * 0.28
    local logoImage = Instance.new("ImageLabel")
    logoImage.Name = "DoorLogo"
    logoImage.Size = UDim2.new(0, logoSize, 0, logoSize)
    logoImage.Position = UDim2.new(0.5, 0, 0.5, 0)
    logoImage.AnchorPoint = Vector2.new(0.5, 0.5)
    logoImage.BackgroundTransparency = 1
    logoImage.Image = getLogoIcon()
    logoImage.ImageColor3 = Arqel.Theme.Text
    logoImage.ScaleType = Enum.ScaleType.Fit
    logoImage.ZIndex = 54
    logoImage.Parent = overlay

    local halfWidth = math.ceil(width / 2)

    local function openDoors(callback)
        TweenService:Create(logoImage, TweenInfo.new(0.2, Enum.EasingStyle.Quart),
            { ImageTransparency = 1 }):Play()
        task.wait(0.25)
        TweenService:Create(leftDoor,
            TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
            { Position = UDim2.new(0, -halfWidth, 0, 0) }):Play()
        TweenService:Create(rightDoor,
            TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
            { Position = UDim2.new(1, 0, 0, 0) }):Play()
        task.wait(0.45)
        overlay.Visible = false
        if callback then callback() end
    end

    local function closeDoors(callback)
        overlay.Visible = true
        leftDoor.Position  = UDim2.new(0, -halfWidth, 0, 0)
        rightDoor.Position = UDim2.new(1, 0, 0, 0)
        logoImage.ImageTransparency = 1
        TweenService:Create(leftDoor,
            TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            { Position = UDim2.new(0, 0, 0, 0) }):Play()
        TweenService:Create(rightDoor,
            TweenInfo.new(0.35, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
            { Position = UDim2.new(0.5, 0, 0, 0) }):Play()
        task.wait(0.38)
        TweenService:Create(logoImage,
            TweenInfo.new(0.25, Enum.EasingStyle.Quart),
            { ImageTransparency = 0 }):Play()
        task.wait(0.3)
        if callback then callback() end
    end

    return { overlay = overlay, open = openDoors, close = closeDoors }
end

-- ============================================================
-- LOADING SCREEN
-- ============================================================
local function ShowLoadingScreen(onComplete)
    local completed = false
    local oldGui = hui:FindFirstChild("ArqelLoadingScreen")
    if oldGui then oldGui:Destroy() end
    local oldBlur = Lighting:FindFirstChild("ArqelLoadingBlur")
    if oldBlur then oldBlur:Destroy() end

    local blurEffect = Instance.new("BlurEffect")
    blurEffect.Name = "ArqelLoadingBlur"
    blurEffect.Size = 0
    blurEffect.Parent = Lighting

    local gui = Instance.new("ScreenGui")
    gui.Name = "ArqelLoadingScreen"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = hui

    local mobile = isMobile()

    local loadingScreen = Instance.new("Frame")
    loadingScreen.Size = UDim2.new(1, 0, 1, 0)
    loadingScreen.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    loadingScreen.BackgroundTransparency = 1
    loadingScreen.BorderSizePixel = 0
    loadingScreen.Parent = gui

    local linesContainer = Instance.new("Frame")
    linesContainer.Size = UDim2.new(1, 0, 1, 0)
    linesContainer.BackgroundTransparency = 1
    linesContainer.Parent = loadingScreen

    local longLines = {}
    local linePositions = {0.15, 0.35, 0.65, 0.85}
    for i = 1, 4 do
        local line = Instance.new("Frame")
        line.Size = UDim2.new(0.3, 0, 0, mobile and 2 or 3)
        line.Position = UDim2.new(1.3, 0, linePositions[i], 0)
        line.BackgroundColor3 = Arqel.Theme.Text
        line.BackgroundTransparency = 1
        line.BorderSizePixel = 0
        line.Parent = linesContainer
        Instance.new("UICorner", line).CornerRadius = UDim.new(1, 0)
        longLines[i] = line
    end

    local shipSize = mobile and 18 or 28
    local shipContainer = Instance.new("Frame")
    shipContainer.Size = UDim2.new(0, mobile and 100 or 150, 0, mobile and 30 or 50)
    shipContainer.Position = UDim2.new(0.5, 0, 0.35, 0)
    shipContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    shipContainer.BackgroundTransparency = 1
    shipContainer.Parent = loadingScreen

    local shipBody = Instance.new("Frame")
    shipBody.Size = UDim2.new(0, shipSize, 0, shipSize)
    shipBody.Position = UDim2.new(0.5, 10, 0.5, 0)
    shipBody.AnchorPoint = Vector2.new(0.5, 0.5)
    shipBody.BackgroundColor3 = Arqel.Theme.Text
    shipBody.BackgroundTransparency = 1
    shipBody.BorderSizePixel = 0
    shipBody.Parent = shipContainer
    Instance.new("UICorner", shipBody).CornerRadius = UDim.new(1, 0)

    local pointSize = mobile and 10 or 16
    local shipPoint = Instance.new("Frame")
    shipPoint.Size = UDim2.new(0, pointSize, 0, pointSize)
    shipPoint.Position = UDim2.new(1, 2, 0.5, 0)
    shipPoint.AnchorPoint = Vector2.new(0, 0.5)
    shipPoint.BackgroundColor3 = Arqel.Theme.Text
    shipPoint.BackgroundTransparency = 1
    shipPoint.BorderSizePixel = 0
    shipPoint.Rotation = 45
    shipPoint.Parent = shipBody
    Instance.new("UICorner", shipPoint).CornerRadius = UDim.new(0, 3)

    local trails = {}
    local trailConfigs = {
        {y = 0.20, width = mobile and 45 or 70},
        {y = 0.38, width = mobile and 60 or 95},
        {y = 0.62, width = mobile and 55 or 85},
        {y = 0.80, width = mobile and 40 or 65},
    }
    for i, config in ipairs(trailConfigs) do
        local trail = Instance.new("Frame")
        trail.Size = UDim2.new(0, config.width, 0, mobile and 2 or 3)
        trail.Position = UDim2.new(0.5, -15, config.y, 0)
        trail.AnchorPoint = Vector2.new(1, 0.5)
        trail.BackgroundColor3 = Arqel.Theme.Text
        trail.BackgroundTransparency = 1
        trail.BorderSizePixel = 0
        trail.Parent = shipContainer
        local gradient = Instance.new("UIGradient", trail)
        gradient.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.3, 0.5),
            NumberSequenceKeypoint.new(1, 0),
        })
        Instance.new("UICorner", trail).CornerRadius = UDim.new(1, 0)
        trails[i] = { frame = trail, config = config }
    end

    local phasesContainer = Instance.new("Frame")
    phasesContainer.Size = UDim2.new(0, mobile and 200 or 280, 0, mobile and 150 or 180)
    phasesContainer.Position = UDim2.new(0.5, 0, 0.62, 0)
    phasesContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    phasesContainer.BackgroundTransparency = 1
    phasesContainer.Parent = loadingScreen

    local phasesLayout = Instance.new("UIListLayout", phasesContainer)
    phasesLayout.Padding = UDim.new(0, mobile and 8 or 12)
    phasesLayout.SortOrder = Enum.SortOrder.LayoutOrder
    phasesLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    phasesLayout.VerticalAlignment = Enum.VerticalAlignment.Center

    local phases = {}
    local phaseNames = {"Initializing", "Creating folders", "Downloading assets",
                        "Preparing interface", "Ready"}
    local phaseTextSize = mobile and 14 or 18

    for i, name in ipairs(phaseNames) do
        local row = Instance.new("Frame")
        row.Size = UDim2.new(1, 0, 0, mobile and 22 or 28)
        row.BackgroundTransparency = 1
        row.LayoutOrder = i
        row.Parent = phasesContainer

        local indicator = Instance.new("TextLabel")
        indicator.Size = UDim2.new(0, mobile and 22 or 28, 0, mobile and 22 or 28)
        indicator.BackgroundTransparency = 1
        indicator.Text = "○"
        indicator.TextColor3 = Arqel.Theme.Pending
        indicator.TextSize = phaseTextSize
        indicator.Font = Enum.Font.ArimoBold
        indicator.TextTransparency = 1
        indicator.Parent = row

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, mobile and -28 or -35, 1, 0)
        label.Position = UDim2.new(0, mobile and 28 or 35, 0, 0)
        label.BackgroundTransparency = 1
        label.Text = name
        label.TextColor3 = Arqel.Theme.Pending
        label.TextSize = phaseTextSize
        label.Font = Enum.Font.ArimoBold
        label.TextXAlignment = Enum.TextXAlignment.Left
        label.TextTransparency = 1
        label.Parent = row

        phases[i] = { indicator = indicator, label = label }
    end

    local animationRunning = true
    local currentPhase = 0
    local pulseThread = nil

    local function animateLongLines()
        local speeds = {0.8, 1.0, 0.7, 0.9}
        while animationRunning do
            for i, line in ipairs(longLines) do
                task.spawn(function()
                    line.Position = UDim2.new(1.3, 0, linePositions[i], 0)
                    line.BackgroundTransparency = 0.5
                    TweenService:Create(line,
                        TweenInfo.new(speeds[i], Enum.EasingStyle.Linear),
                        { Position = UDim2.new(-0.4, 0, linePositions[i], 0),
                          BackgroundTransparency = 0.9 }):Play()
                end)
            end
            task.wait(0.5)
        end
    end

    local function animateTrails()
        while animationRunning do
            for _, trail in ipairs(trails) do
                local newWidth = trail.config.width + math.random(-12, 12)
                TweenService:Create(trail.frame,
                    TweenInfo.new(0.12, Enum.EasingStyle.Quad),
                    { Size = UDim2.new(0, newWidth, 0, mobile and 2 or 3),
                      BackgroundTransparency = 0.1 + math.random() * 0.3 }):Play()
            end
            task.wait(0.1)
        end
    end

    local function animateShipShake()
        while animationRunning do
            local shakeAmount = mobile and 2 or 3
            TweenService:Create(shipContainer,
                TweenInfo.new(0.04, Enum.EasingStyle.Linear),
                { Position = UDim2.new(0.5, math.random(-shakeAmount, shakeAmount),
                                      0.35, math.random(-1, 1)) }):Play()
            task.wait(0.04)
        end
    end

    local function setPhase(num)
        if pulseThread then task.cancel(pulseThread); pulseThread = nil end
        for i = 1, 5 do
            local p = phases[i]
            if i < num then
                p.indicator.Text = "●"
                TweenService:Create(p.indicator, TweenInfo.new(0.2),
                    { TextColor3 = Arqel.Theme.Success, TextTransparency = 0 }):Play()
                TweenService:Create(p.label, TweenInfo.new(0.2),
                    { TextColor3 = Arqel.Theme.Success }):Play()
            elseif i == num then
                p.indicator.Text = "●"
                p.indicator.TextTransparency = 0
                TweenService:Create(p.indicator, TweenInfo.new(0.2),
                    { TextColor3 = Arqel.Theme.Accent }):Play()
                TweenService:Create(p.label, TweenInfo.new(0.2),
                    { TextColor3 = Arqel.Theme.Text }):Play()
                currentPhase = num
                pulseThread = task.spawn(function()
                    while currentPhase == num do
                        TweenService:Create(p.indicator, TweenInfo.new(0.4),
                            { TextTransparency = 0.5 }):Play()
                        task.wait(0.4)
                        if currentPhase ~= num then break end
                        TweenService:Create(p.indicator, TweenInfo.new(0.4),
                            { TextTransparency = 0 }):Play()
                        task.wait(0.4)
                    end
                end)
            else
                p.indicator.Text = "○"
                p.indicator.TextColor3 = Arqel.Theme.Pending
                p.label.TextColor3 = Arqel.Theme.Pending
            end
        end
    end

    task.spawn(function()
        TweenService:Create(blurEffect, TweenInfo.new(0.6), { Size = 24 }):Play()
        TweenService:Create(loadingScreen, TweenInfo.new(0.5),
            { BackgroundTransparency = 0.25 }):Play()
        task.wait(0.3)

        TweenService:Create(shipBody,
            TweenInfo.new(0.4, Enum.EasingStyle.Back),
            { BackgroundTransparency = 0 }):Play()
        TweenService:Create(shipPoint,
            TweenInfo.new(0.4, Enum.EasingStyle.Back),
            { BackgroundTransparency = 0 }):Play()

        task.spawn(animateLongLines)
        task.spawn(animateTrails)
        task.spawn(animateShipShake)
        task.wait(0.2)

        for i = 1, 5 do
            task.delay((i - 1) * 0.08, function()
                TweenService:Create(phases[i].indicator, TweenInfo.new(0.25),
                    { TextTransparency = 0 }):Play()
                TweenService:Create(phases[i].label, TweenInfo.new(0.25),
                    { TextTransparency = 0 }):Play()
            end)
        end
        task.wait(0.5)

        setPhase(1); task.wait(0.3)
        setPhase(2); ensureFolders()
        task.wait(0.25)
        setPhase(3)

        local iconNames = {"key", "shield", "check", "copy", "discord", "alert", "lock",
                           "loading", "close", "changelog", "user", "clock", "cart", "nogetkey"}
        if shouldDownloadLogo() then table.insert(iconNames, "logo") end
        for _, name in ipairs(iconNames) do
            downloadIcon(name)
            task.wait(0.06)
        end
        Internal.IconsLoaded = true

        setPhase(4); task.wait(0.25)
        setPhase(5); task.wait(0.5)

        animationRunning = false
        if pulseThread then task.cancel(pulseThread) end

        TweenService:Create(loadingScreen, TweenInfo.new(0.5),
            { BackgroundTransparency = 1 }):Play()
        TweenService:Create(shipBody, TweenInfo.new(0.3),
            { BackgroundTransparency = 1 }):Play()
        TweenService:Create(shipPoint, TweenInfo.new(0.3),
            { BackgroundTransparency = 1 }):Play()
        for _, trail in pairs(trails) do
            TweenService:Create(trail.frame, TweenInfo.new(0.3),
                { BackgroundTransparency = 1 }):Play()
        end
        for _, line in pairs(longLines) do
            TweenService:Create(line, TweenInfo.new(0.3),
                { BackgroundTransparency = 1 }):Play()
        end
        for i = 1, 5 do
            TweenService:Create(phases[i].indicator, TweenInfo.new(0.25),
                { TextTransparency = 1 }):Play()
            TweenService:Create(phases[i].label, TweenInfo.new(0.25),
                { TextTransparency = 1 }):Play()
        end
        TweenService:Create(blurEffect, TweenInfo.new(0.3), { Size = 0 }):Play()
        task.wait(0.5)
        gui:Destroy()
        blurEffect:Destroy()
        if onComplete then onComplete() end
        completed = true
    end)

    while not completed do task.wait(0.05) end
end

local function EnsureIconsReady(callback)
    if allIconsCached() then
        loadAllIconsFromCache()
        if callback then callback() end
    else
        ShowLoadingScreen(callback)
    end
end

-- ============================================================
-- NOTIFICATION SYSTEM
-- ============================================================
function Arqel:Notify(title, message, duration, iconType)
    duration = duration or 5
    iconType = iconType or "info"

    local scale  = getScale()
    local width  = math.clamp(320 * scale, 260, 380)
    local height = math.clamp(80 * scale, 75, 105)

    local notifGui = Instance.new("ScreenGui")
    notifGui.ResetOnSpawn = false
    notifGui.DisplayOrder = 999999
    notifGui.Parent = hui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, width, 0, height)
    frame.Position = UDim2.new(1, width + 20, 1, -15)
    frame.AnchorPoint = Vector2.new(1, 1)
    frame.BackgroundColor3 = Arqel.Theme.Header
    frame.BorderSizePixel = 0
    frame.Parent = notifGui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Arqel.Theme.BorderLight
    stroke.Thickness = 1
    stroke.Transparency = 0.5
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local progressBg = Instance.new("Frame")
    progressBg.Size = UDim2.new(1, 0, 0, 2)
    progressBg.Position = UDim2.new(0, 0, 1, -2)
    progressBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    progressBg.BorderSizePixel = 0
    progressBg.Parent = frame

    local progressBar = Instance.new("Frame")
    progressBar.Size = UDim2.new(1, 0, 1, 0)
    progressBar.BackgroundColor3 = Arqel.Theme.Accent
    progressBar.BorderSizePixel = 0
    progressBar.Parent = progressBg

    local iconSize = height - 35
    local icon = Instance.new("ImageLabel")
    icon.Size = UDim2.new(0, iconSize, 0, iconSize)
    icon.Position = UDim2.new(0, 14, 0.5, -2)
    icon.AnchorPoint = Vector2.new(0, 0.5)
    icon.BackgroundTransparency = 1
    icon.ScaleType = Enum.ScaleType.Fit
    icon.Parent = frame

    local iconMap = {
        success  = {"check",   Arqel.Theme.Success},
        error    = {"alert",   Arqel.Theme.Error},
        warning  = {"alert",   Arqel.Theme.Warning},
        shield   = {"shield",  Arqel.Theme.Accent},
        info     = {"shield",  Arqel.Theme.Accent},
        key      = {"key",     Arqel.Theme.Accent},
        copy     = {"copy",    Arqel.Theme.Success},
        discord  = {"discord", Arqel.Theme.Discord},
        close    = {"close",   Arqel.Theme.Error},
        nogetkey = {"nogetkey", Arqel.Theme.TextDim},
    }
    if iconMap[iconType] then
        icon.Image = getIcon(iconMap[iconType][1])
        icon.ImageColor3 = iconMap[iconType][2]
    else
        icon.Image = getLogoIcon()
        icon.ImageColor3 = Arqel.Theme.Text
    end

    local textX = 14 + iconSize + 14

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -(textX + 14), 0, 24)
    titleLabel.Position = UDim2.new(0, textX, 0, 12)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextSize = math.clamp(15 * scale, 13, 18)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.TextColor3 = Arqel.Theme.Text
    titleLabel.Text = title
    titleLabel.TextTruncate = Enum.TextTruncate.AtEnd
    titleLabel.Parent = frame

    local messageLabel = Instance.new("TextLabel")
    messageLabel.Size = UDim2.new(1, -(textX + 14), 0, 22)
    messageLabel.Position = UDim2.new(0, textX, 0, 38)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Font = Enum.Font.Gotham
    messageLabel.TextSize = math.clamp(13 * scale, 11, 15)
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextColor3 = Arqel.Theme.TextDim
    messageLabel.Text = message
    messageLabel.TextTruncate = Enum.TextTruncate.AtEnd
    messageLabel.Parent = frame

    local id = tick() .. HttpService:GenerateGUID(false)
    table.insert(Internal.NotificationList, { id = id, frame = frame, gui = notifGui, height = height })

    local function restack()
        local yOffset = 0
        for i = #Internal.NotificationList, 1, -1 do
            local n = Internal.NotificationList[i]
            if n and n.frame and n.frame.Parent then
                TweenService:Create(n.frame,
                    TweenInfo.new(0.3, Enum.EasingStyle.Quart),
                    { Position = UDim2.new(1, -15, 1, -15 - yOffset) }):Play()
                yOffset = yOffset + n.height + 12
            end
        end
    end

    TweenService:Create(frame, TweenInfo.new(0.4, Enum.EasingStyle.Quart),
        { Position = UDim2.new(1, -15, 1, -15) }):Play()
    task.wait(0.1)
    restack()

    local function dismiss()
        for i, n in ipairs(Internal.NotificationList) do
            if n.id == id then table.remove(Internal.NotificationList, i); break end
        end
        TweenService:Create(frame,
            TweenInfo.new(0.3, Enum.EasingStyle.Quart),
            { Position = UDim2.new(1, width + 20, frame.Position.Y.Scale,
                                   frame.Position.Y.Offset) }):Play()
        task.wait(0.3)
        notifGui:Destroy()
        restack()
    end

    TweenService:Create(progressBar,
        TweenInfo.new(duration, Enum.EasingStyle.Linear),
        { Size = UDim2.new(0, 0, 1, 0) }):Play()
    task.delay(duration, dismiss)

    local clickBtn = Instance.new("TextButton")
    clickBtn.Size = UDim2.new(1, 0, 1, 0)
    clickBtn.BackgroundTransparency = 1
    clickBtn.Text = ""
    clickBtn.Parent = frame
    clickBtn.MouseButton1Click:Connect(dismiss)
end

-- ============================================================
-- CHANGELOG PANEL
-- ============================================================
local function CreateChangelogPanel(parent, windowWidth, panelHeight, panelWidth, mainFrame, gap)
    panelWidth = panelWidth or 220
    local isOpen = false

    local panel = Instance.new("Frame")
    panel.Name = "ChangelogPanel"
    panel.Size = UDim2.new(0, 0, 0, panelHeight)
    panel.Position = UDim2.new(1, gap, 0, 0)
    panel.BackgroundColor3 = Arqel.Theme.Background
    panel.BorderSizePixel = 0
    panel.ClipsDescendants = true
    panel.Parent = mainFrame
    Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 12)

    local panelStroke = Instance.new("UIStroke", panel)
    panelStroke.Color = Arqel.Theme.BorderLight
    panelStroke.Thickness = 1
    panelStroke.Transparency = 1
    panelStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local panelHeader = Instance.new("Frame")
    panelHeader.Size = UDim2.new(1, 0, 0, 50)
    panelHeader.BackgroundColor3 = Arqel.Theme.Header
    panelHeader.BorderSizePixel = 0
    panelHeader.Parent = panel
    Instance.new("UICorner", panelHeader).CornerRadius = UDim.new(0, 12)

    local panelHeaderFix = Instance.new("Frame")
    panelHeaderFix.Size = UDim2.new(1, 0, 0, 8)
    panelHeaderFix.Position = UDim2.new(0, 0, 1, -8)
    panelHeaderFix.BackgroundColor3 = Arqel.Theme.Header
    panelHeaderFix.BorderSizePixel = 0
    panelHeaderFix.Parent = panelHeader

    local panelHeaderLine = Instance.new("Frame")
    panelHeaderLine.Size = UDim2.new(1, 0, 0, 1)
    panelHeaderLine.Position = UDim2.new(0, 0, 1, 0)
    panelHeaderLine.BackgroundColor3 = Arqel.Theme.Accent
    panelHeaderLine.BackgroundTransparency = 0.6
    panelHeaderLine.BorderSizePixel = 0
    panelHeaderLine.Parent = panelHeader

    local panelHeaderIcon = Instance.new("ImageLabel")
    panelHeaderIcon.Size = UDim2.new(0, 16, 0, 16)
    panelHeaderIcon.Position = UDim2.new(0, 12, 0.5, 0)
    panelHeaderIcon.AnchorPoint = Vector2.new(0, 0.5)
    panelHeaderIcon.BackgroundTransparency = 1
    panelHeaderIcon.Image = getIcon("changelog")
    panelHeaderIcon.ImageColor3 = Arqel.Theme.Accent
    panelHeaderIcon.ScaleType = Enum.ScaleType.Fit
    panelHeaderIcon.Parent = panelHeader

    local panelTitle = Instance.new("TextLabel")
    panelTitle.Size = UDim2.new(1, -65, 1, 0)
    panelTitle.Position = UDim2.new(0, 34, 0, 0)
    panelTitle.BackgroundTransparency = 1
    panelTitle.Text = "Changelog"
    panelTitle.TextColor3 = Arqel.Theme.Text
    panelTitle.TextSize = 16
    panelTitle.Font = Enum.Font.GothamBold
    panelTitle.TextXAlignment = Enum.TextXAlignment.Left
    panelTitle.Parent = panelHeader

    local panelClose = Instance.new("ImageButton")
    panelClose.Size = UDim2.new(0, 20, 0, 20)
    panelClose.Position = UDim2.new(1, -14, 0.5, 0)
    panelClose.AnchorPoint = Vector2.new(1, 0.5)
    panelClose.BackgroundTransparency = 1
    panelClose.Image = getIcon("close")
    panelClose.ImageColor3 = Arqel.Theme.TextDim
    panelClose.ScaleType = Enum.ScaleType.Fit
    panelClose.Parent = panelHeader
    panelClose.MouseEnter:Connect(function()
        TweenService:Create(panelClose, TweenInfo.new(0.15),
            { ImageColor3 = Arqel.Theme.Error }):Play()
    end)
    panelClose.MouseLeave:Connect(function()
        TweenService:Create(panelClose, TweenInfo.new(0.15),
            { ImageColor3 = Arqel.Theme.TextDim }):Play()
    end)

    local scrollFrame = Instance.new("ScrollingFrame")
    scrollFrame.Size = UDim2.new(1, 0, 1, -55)
    scrollFrame.Position = UDim2.new(0, 0, 0, 55)
    scrollFrame.BackgroundTransparency = 1
    scrollFrame.BorderSizePixel = 0
    scrollFrame.ScrollBarThickness = 4
    scrollFrame.ScrollBarImageColor3 = Arqel.Theme.Accent
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
    scrollFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
    scrollFrame.Parent = panel

    local scrollPadding = Instance.new("UIPadding", scrollFrame)
    scrollPadding.PaddingLeft   = UDim.new(0, 10)
    scrollPadding.PaddingRight  = UDim.new(0, 10)
    scrollPadding.PaddingTop    = UDim.new(0, 5)
    scrollPadding.PaddingBottom = UDim.new(0, 5)

    local contentLayout = Instance.new("UIListLayout", scrollFrame)
    contentLayout.Padding = UDim.new(0, 10)
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder

    for i, update in ipairs(Arqel.Changelog) do
        local entry = Instance.new("Frame")
        entry.Size = UDim2.new(1, 0, 0, 0)
        entry.AutomaticSize = Enum.AutomaticSize.Y
        entry.BackgroundTransparency = 1
        entry.LayoutOrder = i * 2
        entry.Parent = scrollFrame

        local entryLayout = Instance.new("UIListLayout", entry)
        entryLayout.Padding = UDim.new(0, 5)

        local versionLabel = Instance.new("TextLabel")
        versionLabel.Size = UDim2.new(1, 0, 0, 22)
        versionLabel.BackgroundTransparency = 1
        versionLabel.Text = update.Version .. " • " .. update.Date
        versionLabel.TextColor3 = Arqel.Theme.Accent
        versionLabel.TextSize = 14
        versionLabel.Font = Enum.Font.GothamBold
        versionLabel.TextXAlignment = Enum.TextXAlignment.Left
        versionLabel.LayoutOrder = 1
        versionLabel.Parent = entry

        for j, change in ipairs(update.Changes) do
            local changeLabel = Instance.new("TextLabel")
            changeLabel.Size = UDim2.new(1, 0, 0, 0)
            changeLabel.AutomaticSize = Enum.AutomaticSize.Y
            changeLabel.BackgroundTransparency = 1
            changeLabel.Text = " • " .. change
            changeLabel.TextColor3 = Arqel.Theme.TextDim
            changeLabel.TextSize = 12
            changeLabel.Font = Enum.Font.Gotham
            changeLabel.TextXAlignment = Enum.TextXAlignment.Left
            changeLabel.TextWrapped = true
            changeLabel.LayoutOrder = j + 1
            changeLabel.Parent = entry
        end

        if i < #Arqel.Changelog then
            local divWrapper = Instance.new("Frame")
            divWrapper.Size = UDim2.new(1, 0, 0, 2)
            divWrapper.BackgroundTransparency = 1
            divWrapper.LayoutOrder = i * 2 + 1
            divWrapper.Parent = scrollFrame

            local div = Instance.new("Frame")
            div.Size = UDim2.new(1, 0, 0, 2)
            div.BackgroundColor3 = Arqel.Theme.Divider
            div.BorderSizePixel = 0
            div.Parent = divWrapper
        end
    end

    local function toggle(changelogIcon, container, currentContainerWidth)
        isOpen = not isOpen
        if isOpen then
            TweenService:Create(panelStroke, TweenInfo.new(0.2),
                { Transparency = 0.4 }):Play()
            TweenService:Create(panel,
                TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                { Size = UDim2.new(0, panelWidth, 0, panelHeight) }):Play()
            TweenService:Create(container,
                TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                { Size = UDim2.new(0, currentContainerWidth + gap + panelWidth, 0, panelHeight) }):Play()
            if changelogIcon then
                TweenService:Create(changelogIcon, TweenInfo.new(0.3),
                    { Rotation = 180 }):Play()
            end
        else
            TweenService:Create(panelStroke, TweenInfo.new(0.2),
                { Transparency = 1 }):Play()
            TweenService:Create(panel,
                TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                { Size = UDim2.new(0, 0, 0, panelHeight) }):Play()
            TweenService:Create(container,
                TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                { Size = UDim2.new(0, currentContainerWidth, 0, panelHeight) }):Play()
            if changelogIcon then
                TweenService:Create(changelogIcon, TweenInfo.new(0.3),
                    { Rotation = 0 }):Play()
            end
        end
    end

    panelClose.MouseButton1Click:Connect(function()
        if isOpen then toggle(nil, parent, windowWidth) end
    end)

    return panel, toggle, function() return isOpen end, panelWidth
end

-- ============================================================
-- USER INFO PANEL
-- ============================================================
local function CreateUserInfoPanel(parent, windowWidth, panelHeight, panelWidth, mainFrame, gap, startOpen)
    panelWidth = panelWidth or 180
    local isOpen = startOpen or false
    local isCompact     = panelHeight < 300
    local avatarSize    = isCompact and 42 or 55
    local fieldHeight   = isCompact and 24 or 28
    local titleSize     = isCompact and 8  or 9
    local valueSize     = isCompact and 10 or 11
    local welcomeSize   = isCompact and 11 or 12
    local spacing       = isCompact and 3  or 5

    local panel = Instance.new("Frame")
    panel.Name = "UserInfoPanel"
    panel.Size = UDim2.new(0, isOpen and panelWidth or 0, 0, panelHeight)
    panel.Position = UDim2.new(0, -(gap), 0, 0)
    panel.AnchorPoint = Vector2.new(1, 0)
    panel.BackgroundColor3 = Arqel.Theme.Background
    panel.BorderSizePixel = 0
    panel.ClipsDescendants = true
    panel.Parent = mainFrame
    Instance.new("UICorner", panel).CornerRadius = UDim.new(0, 12)

    local panelStroke = Instance.new("UIStroke", panel)
    panelStroke.Color = Arqel.Theme.BorderLight
    panelStroke.Thickness = 1
    panelStroke.Transparency = isOpen and 0.4 or 1
    panelStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local panelHeader = Instance.new("Frame")
    panelHeader.Size = UDim2.new(1, 0, 0, 50)
    panelHeader.BackgroundColor3 = Arqel.Theme.Header
    panelHeader.BorderSizePixel = 0
    panelHeader.Parent = panel
    Instance.new("UICorner", panelHeader).CornerRadius = UDim.new(0, 12)

    local panelHeaderFix = Instance.new("Frame")
    panelHeaderFix.Size = UDim2.new(1, 0, 0, 8)
    panelHeaderFix.Position = UDim2.new(0, 0, 1, -8)
    panelHeaderFix.BackgroundColor3 = Arqel.Theme.Header
    panelHeaderFix.BorderSizePixel = 0
    panelHeaderFix.Parent = panelHeader

    local panelHeaderLine = Instance.new("Frame")
    panelHeaderLine.Size = UDim2.new(1, 0, 0, 1)
    panelHeaderLine.Position = UDim2.new(0, 0, 1, 0)
    panelHeaderLine.BackgroundColor3 = Arqel.Theme.Accent
    panelHeaderLine.BackgroundTransparency = 0.6
    panelHeaderLine.BorderSizePixel = 0
    panelHeaderLine.Parent = panelHeader

    local panelHeaderIcon = Instance.new("ImageLabel")
    panelHeaderIcon.Size = UDim2.new(0, 16, 0, 16)
    panelHeaderIcon.Position = UDim2.new(0, 12, 0.5, 0)
    panelHeaderIcon.AnchorPoint = Vector2.new(0, 0.5)
    panelHeaderIcon.BackgroundTransparency = 1
    panelHeaderIcon.Image = getIcon("user")
    panelHeaderIcon.ImageColor3 = Arqel.Theme.Accent
    panelHeaderIcon.ScaleType = Enum.ScaleType.Fit
    panelHeaderIcon.Parent = panelHeader

    local panelTitle = Instance.new("TextLabel")
    panelTitle.Size = UDim2.new(1, -65, 1, 0)
    panelTitle.Position = UDim2.new(0, 34, 0, 0)
    panelTitle.BackgroundTransparency = 1
    panelTitle.Text = "User Info"
    panelTitle.TextColor3 = Arqel.Theme.Text
    panelTitle.TextSize = 16
    panelTitle.Font = Enum.Font.GothamBold
    panelTitle.TextXAlignment = Enum.TextXAlignment.Left
    panelTitle.Parent = panelHeader

    local panelClose = Instance.new("ImageButton")
    panelClose.Size = UDim2.new(0, 20, 0, 20)
    panelClose.Position = UDim2.new(1, -14, 0.5, 0)
    panelClose.AnchorPoint = Vector2.new(1, 0.5)
    panelClose.BackgroundTransparency = 1
    panelClose.Image = getIcon("close")
    panelClose.ImageColor3 = Arqel.Theme.TextDim
    panelClose.ScaleType = Enum.ScaleType.Fit
    panelClose.Parent = panelHeader
    panelClose.MouseEnter:Connect(function()
        TweenService:Create(panelClose, TweenInfo.new(0.15),
            { ImageColor3 = Arqel.Theme.Error }):Play()
    end)
    panelClose.MouseLeave:Connect(function()
        TweenService:Create(panelClose, TweenInfo.new(0.15),
            { ImageColor3 = Arqel.Theme.TextDim }):Play()
    end)

    local contentFrame = Instance.new("Frame")
    contentFrame.Size = UDim2.new(1, 0, 1, -55)
    contentFrame.Position = UDim2.new(0, 0, 0, 55)
    contentFrame.BackgroundTransparency = 1
    contentFrame.Parent = panel

    local contentPadding = Instance.new("UIPadding", contentFrame)
    contentPadding.PaddingLeft  = UDim.new(0, 8)
    contentPadding.PaddingRight = UDim.new(0, 8)

    local contentLayout = Instance.new("UIListLayout", contentFrame)
    contentLayout.Padding = UDim.new(0, spacing)
    contentLayout.SortOrder = Enum.SortOrder.LayoutOrder
    contentLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    contentLayout.VerticalAlignment   = Enum.VerticalAlignment.Center

    local player = cloneref(Players.LocalPlayer)

    local avatarWrapper = Instance.new("Frame")
    avatarWrapper.Size = UDim2.new(0, avatarSize + 6, 0, avatarSize + 6)
    avatarWrapper.BackgroundTransparency = 1
    avatarWrapper.LayoutOrder = 1
    avatarWrapper.Parent = contentFrame

    local avatarGlow = Instance.new("Frame")
    avatarGlow.Size = UDim2.new(1, 0, 1, 0)
    avatarGlow.Position = UDim2.new(0.5, 0, 0.5, 0)
    avatarGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    avatarGlow.BackgroundColor3 = Arqel.Theme.Accent
    avatarGlow.BackgroundTransparency = 0.5
    avatarGlow.BorderSizePixel = 0
    avatarGlow.Parent = avatarWrapper
    Instance.new("UICorner", avatarGlow).CornerRadius = UDim.new(0, 4)

    local avatarGlowStroke = Instance.new("UIStroke", avatarGlow)
    avatarGlowStroke.Color = Arqel.Theme.Accent
    avatarGlowStroke.Thickness = 1.5
    avatarGlowStroke.Transparency = 0.3

    local avatarContainer = Instance.new("Frame")
    avatarContainer.Size = UDim2.new(0, avatarSize, 0, avatarSize)
    avatarContainer.Position = UDim2.new(0.5, 0, 0.5, 0)
    avatarContainer.AnchorPoint = Vector2.new(0.5, 0.5)
    avatarContainer.BackgroundColor3 = Arqel.Theme.Input
    avatarContainer.BorderSizePixel = 0
    avatarContainer.ClipsDescendants = true
    avatarContainer.Parent = avatarWrapper
    Instance.new("UICorner", avatarContainer).CornerRadius = UDim.new(0, 4)

    local avatarImage = Instance.new("ImageLabel")
    avatarImage.Size = UDim2.new(1, 0, 1, 0)
    avatarImage.Position = UDim2.new(0.5, 0, 0.5, 0)
    avatarImage.AnchorPoint = Vector2.new(0.5, 0.5)
    avatarImage.BackgroundTransparency = 1
    avatarImage.ScaleType = Enum.ScaleType.Crop
    avatarImage.Parent = avatarContainer
    pcall(function()
        local content = Players:GetUserThumbnailAsync(
            player and player.UserId or 0,
            Enum.ThumbnailType.HeadShot,
            Enum.ThumbnailSize.Size150x150
        )
        avatarImage.Image = content
    end)

    local welcomeLabel = Instance.new("TextLabel")
    welcomeLabel.Size = UDim2.new(1, 0, 0, isCompact and 14 or 18)
    welcomeLabel.BackgroundTransparency = 1
    welcomeLabel.Text = "Welcome, " .. (player and player.DisplayName or "User")
    welcomeLabel.TextColor3 = Arqel.Theme.Text
    welcomeLabel.TextSize = welcomeSize
    welcomeLabel.Font = Enum.Font.GothamBold
    welcomeLabel.TextTruncate = Enum.TextTruncate.AtEnd
    welcomeLabel.LayoutOrder = 2
    welcomeLabel.Parent = contentFrame

    local divider1 = Instance.new("Frame")
    divider1.Size = UDim2.new(1, 16, 0, 2)
    divider1.Position = UDim2.new(0.5, 0, 0, 0)
    divider1.AnchorPoint = Vector2.new(0.5, 0)
    divider1.BackgroundColor3 = Arqel.Theme.Divider
    divider1.BorderSizePixel = 0
    divider1.LayoutOrder = 3
    divider1.Parent = contentFrame

    local executorContainer = Instance.new("Frame")
    executorContainer.Size = UDim2.new(1, 0, 0, fieldHeight)
    executorContainer.BackgroundTransparency = 1
    executorContainer.LayoutOrder = 4
    executorContainer.Parent = contentFrame

    local executorTitle = Instance.new("TextLabel")
    executorTitle.Size = UDim2.new(1, 0, 0, 11)
    executorTitle.BackgroundTransparency = 1
    executorTitle.Text = "Executor"
    executorTitle.TextColor3 = Arqel.Theme.TextDim
    executorTitle.TextSize = titleSize
    executorTitle.Font = Enum.Font.GothamBold
    executorTitle.TextXAlignment = Enum.TextXAlignment.Left
    executorTitle.Parent = executorContainer

    local executorValue = Instance.new("TextLabel")
    executorValue.Size = UDim2.new(1, 0, 0, 14)
    executorValue.Position = UDim2.new(0, 0, 0, 11)
    executorValue.BackgroundTransparency = 1
    executorValue.Text = getExecutorName()
    executorValue.TextColor3 = Arqel.Theme.Accent
    executorValue.TextSize = valueSize
    executorValue.Font = Enum.Font.GothamBold
    executorValue.TextXAlignment = Enum.TextXAlignment.Left
    executorValue.TextTruncate = Enum.TextTruncate.AtEnd
    executorValue.Parent = executorContainer

    local deviceContainer = Instance.new("Frame")
    deviceContainer.Size = UDim2.new(1, 0, 0, fieldHeight)
    deviceContainer.BackgroundTransparency = 1
    deviceContainer.LayoutOrder = 5
    deviceContainer.Parent = contentFrame

    local deviceTitle = Instance.new("TextLabel")
    deviceTitle.Size = UDim2.new(1, 0, 0, 11)
    deviceTitle.BackgroundTransparency = 1
    deviceTitle.Text = "Device"
    deviceTitle.TextColor3 = Arqel.Theme.TextDim
    deviceTitle.TextSize = titleSize
    deviceTitle.Font = Enum.Font.GothamBold
    deviceTitle.TextXAlignment = Enum.TextXAlignment.Left
    deviceTitle.Parent = deviceContainer

    local deviceValue = Instance.new("TextLabel")
    deviceValue.Size = UDim2.new(1, 0, 0, 14)
    deviceValue.Position = UDim2.new(0, 0, 0, 11)
    deviceValue.BackgroundTransparency = 1
    deviceValue.Text = getDeviceType()
    deviceValue.TextColor3 = Arqel.Theme.Accent
    deviceValue.TextSize = valueSize
    deviceValue.Font = Enum.Font.GothamBold
    deviceValue.TextXAlignment = Enum.TextXAlignment.Left
    deviceValue.TextTruncate = Enum.TextTruncate.AtEnd
    deviceValue.Parent = deviceContainer

    local divider2 = Instance.new("Frame")
    divider2.Size = UDim2.new(1, 16, 0, 2)
    divider2.Position = UDim2.new(0.5, 0, 0, 0)
    divider2.AnchorPoint = Vector2.new(0.5, 0)
    divider2.BackgroundColor3 = Arqel.Theme.Divider
    divider2.BorderSizePixel = 0
    divider2.LayoutOrder = 6
    divider2.Parent = contentFrame

    local hwidContainer = Instance.new("Frame")
    hwidContainer.Size = UDim2.new(1, 0, 0, fieldHeight)
    hwidContainer.BackgroundTransparency = 1
    hwidContainer.LayoutOrder = 7
    hwidContainer.Parent = contentFrame

    local hwidTitle = Instance.new("TextLabel")
    hwidTitle.Size = UDim2.new(1, 0, 0, 11)
    hwidTitle.BackgroundTransparency = 1
    hwidTitle.Text = "HWID"
    hwidTitle.TextColor3 = Arqel.Theme.TextDim
    hwidTitle.TextSize = titleSize
    hwidTitle.Font = Enum.Font.GothamBold
    hwidTitle.TextXAlignment = Enum.TextXAlignment.Left
    hwidTitle.Parent = hwidContainer

    local fullHWID       = getHWID()
    local copyBtnSize    = 18
    local dotAreaWidth   = panelWidth - 16 - copyBtnSize - 6
    local hiddenDots     = generateHiddenDots(dotAreaWidth, 5)

    local hwidValue = Instance.new("TextLabel")
    hwidValue.Size = UDim2.new(1, -(copyBtnSize + 6), 0, 14)
    hwidValue.Position = UDim2.new(0, 0, 0, 11)
    hwidValue.BackgroundTransparency = 1
    hwidValue.Text = hiddenDots
    hwidValue.TextColor3 = Arqel.Theme.TextDim
    hwidValue.TextSize = isCompact and 9 or 10
    hwidValue.Font = Enum.Font.GothamBold
    hwidValue.TextXAlignment = Enum.TextXAlignment.Left
    hwidValue.TextTruncate = Enum.TextTruncate.AtEnd
    hwidValue.Parent = hwidContainer

    local copyBtn = Instance.new("ImageButton")
    copyBtn.Size = UDim2.new(0, copyBtnSize, 0, copyBtnSize)
    copyBtn.Position = UDim2.new(1, 0, 0.5, 1)
    copyBtn.AnchorPoint = Vector2.new(1, 0.5)
    copyBtn.BackgroundTransparency = 1
    copyBtn.Image = getIcon("copy")
    copyBtn.ImageColor3 = Arqel.Theme.TextDim
    copyBtn.ScaleType = Enum.ScaleType.Fit
    copyBtn.Parent = hwidContainer
    copyBtn.MouseEnter:Connect(function()
        TweenService:Create(copyBtn, TweenInfo.new(0.15),
            { ImageColor3 = Arqel.Theme.Accent }):Play()
    end)
    copyBtn.MouseLeave:Connect(function()
        TweenService:Create(copyBtn, TweenInfo.new(0.15),
            { ImageColor3 = Arqel.Theme.TextDim }):Play()
    end)
    copyBtn.MouseButton1Click:Connect(function()
        pcall(function() setclipboard(fullHWID) end)
        TweenService:Create(copyBtn, TweenInfo.new(0.1),
            { ImageColor3 = Arqel.Theme.Success }):Play()
        task.delay(0.3, function()
            TweenService:Create(copyBtn, TweenInfo.new(0.15),
                { ImageColor3 = Arqel.Theme.TextDim }):Play()
        end)
        Arqel:Notify("Copied", "HWID copied to clipboard", 2, "copy")
    end)

    local divider3 = Instance.new("Frame")
    divider3.Size = UDim2.new(1, 16, 0, 2)
    divider3.Position = UDim2.new(0.5, 0, 0, 0)
    divider3.AnchorPoint = Vector2.new(0.5, 0)
    divider3.BackgroundColor3 = Arqel.Theme.Divider
    divider3.BorderSizePixel = 0
    divider3.LayoutOrder = 8
    divider3.Parent = contentFrame

    local clockContainer = Instance.new("Frame")
    clockContainer.Size = UDim2.new(1, 0, 0, isCompact and 30 or 38)
    clockContainer.BackgroundTransparency = 1
    clockContainer.LayoutOrder = 9
    clockContainer.Parent = contentFrame

    local clockRow = Instance.new("Frame")
    clockRow.Size = UDim2.new(1, 0, 0, isCompact and 18 or 22)
    clockRow.Position = UDim2.new(0.5, -8, 0, 0)
    clockRow.AnchorPoint = Vector2.new(0.5, 0)
    clockRow.BackgroundTransparency = 1
    clockRow.Parent = clockContainer

    local clockRowLayout = Instance.new("UIListLayout", clockRow)
    clockRowLayout.FillDirection = Enum.FillDirection.Horizontal
    clockRowLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    clockRowLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    clockRowLayout.Padding = UDim.new(0, isCompact and 4 or 6)

    local clockIcon = Instance.new("ImageLabel")
    clockIcon.Size = UDim2.new(0, isCompact and 14 or 16, 0, isCompact and 14 or 16)
    clockIcon.BackgroundTransparency = 1
    clockIcon.Image = getIcon("clock")
    clockIcon.ImageColor3 = Arqel.Theme.Accent
    clockIcon.ScaleType = Enum.ScaleType.Fit
    clockIcon.LayoutOrder = 1
    clockIcon.Parent = clockRow

    local clockTimeLabel = Instance.new("TextLabel")
    clockTimeLabel.Size = UDim2.new(0, 0, 1, 0)
    clockTimeLabel.AutomaticSize = Enum.AutomaticSize.X
    clockTimeLabel.BackgroundTransparency = 1
    clockTimeLabel.Text = formatTime12()
    clockTimeLabel.TextColor3 = Arqel.Theme.Accent
    clockTimeLabel.TextSize = isCompact and 14 or 16
    clockTimeLabel.Font = Enum.Font.GothamBold
    clockTimeLabel.LayoutOrder = 2
    clockTimeLabel.Parent = clockRow

    local clockDateLabel = Instance.new("TextLabel")
    clockDateLabel.Size = UDim2.new(1, 0, 0, isCompact and 12 or 14)
    clockDateLabel.Position = UDim2.new(0, -8, 0, isCompact and 18 or 22)
    clockDateLabel.BackgroundTransparency = 1
    clockDateLabel.Text = formatDate()
    clockDateLabel.TextColor3 = Arqel.Theme.TextDim
    clockDateLabel.TextSize = isCompact and 9 or 11
    clockDateLabel.Font = Enum.Font.GothamBold
    clockDateLabel.TextXAlignment = Enum.TextXAlignment.Center
    clockDateLabel.Parent = clockContainer

    local clockRunning = true
    task.spawn(function()
        while clockRunning do
            if not clockTimeLabel or not clockTimeLabel.Parent then
                clockRunning = false; break
            end
            clockTimeLabel.Text = formatTime12()
            clockDateLabel.Text = formatDate()
            task.wait(1)
        end
    end)
    panel.Destroying:Connect(function() clockRunning = false end)

    local function toggle(userIcon, container, baseWidth)
        isOpen = not isOpen
        if isOpen then
            TweenService:Create(panelStroke, TweenInfo.new(0.2),
                { Transparency = 0.4 }):Play()
            TweenService:Create(panel,
                TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                { Size = UDim2.new(0, panelWidth, 0, panelHeight) }):Play()
            TweenService:Create(container,
                TweenInfo.new(0.4, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
                { Size = UDim2.new(0, baseWidth + gap + panelWidth, 0, panelHeight) }):Play()
        else
            TweenService:Create(panelStroke, TweenInfo.new(0.2),
                { Transparency = 1 }):Play()
            TweenService:Create(panel,
                TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                { Size = UDim2.new(0, 0, 0, panelHeight) }):Play()
            TweenService:Create(container,
                TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.In),
                { Size = UDim2.new(0, baseWidth, 0, panelHeight) }):Play()
        end
    end

    panelClose.MouseButton1Click:Connect(function()
        if isOpen then toggle(nil, parent, windowWidth) end
    end)

    return panel, toggle, function() return isOpen end, panelWidth
end

-- ============================================================
-- KEYLESS HANDLER
-- ============================================================
local function handleKeylessSkip()
    getgenv().SCRIPT_KEY = "KEYLESS"
    getgenv().ArqelLoaded = false
    Arqel:Notify("Access Granted", "Keyless access approved!", 3, "success")
    task.wait(0.3)
    if Arqel.Callbacks.OnSuccess then Arqel.Callbacks.OnSuccess() end
end

-- ============================================================
-- BUILD CENTERED UI
-- ============================================================
local function BuildCenteredUI(windowWidth, windowHeight, panelHeight,
                              userPanelWidth, changelogPanelWidth, gap, buildContent)
    local gui = buildContent.gui

    local container = Instance.new("Frame")
    container.Name = "Container"
    container.Size = UDim2.new(0, windowWidth, 0, panelHeight)
    container.Position = UDim2.new(0.5, 0, 1.5, 0)
    container.AnchorPoint = Vector2.new(0.5, 0.5)
    container.BackgroundTransparency = 1
    container.Parent = gui

    local mainFrame = Instance.new("Frame")
    mainFrame.Name = "MainFrame"
    mainFrame.Size = UDim2.new(0, windowWidth, 0, windowHeight)
    mainFrame.Position = UDim2.new(0.5, 0, 0, 0)
    mainFrame.AnchorPoint = Vector2.new(0.5, 0)
    mainFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = container
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 16)

    local mainGrad = Instance.new("UIGradient")
    mainGrad.Rotation = 135
    mainGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(16, 16, 16)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 6, 6)),
    })
    mainGrad.Parent = mainFrame

    local mainStroke = Instance.new("UIStroke", mainFrame)
    mainStroke.Color = Color3.fromRGB(85, 85, 85)
    mainStroke.Thickness = 1
    mainStroke.Transparency = 0.25
    mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local topGlow = Instance.new("Frame")
    topGlow.Size = UDim2.new(1, -60, 0, 2)
    topGlow.Position = UDim2.new(0, 30, 0, 1)
    topGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    topGlow.BackgroundTransparency = 0.55
    topGlow.BorderSizePixel = 0
    topGlow.ZIndex = 2
    topGlow.Parent = mainFrame
    Instance.new("UICorner", topGlow).CornerRadius = UDim.new(1, 0)
    local tgGrad = Instance.new("UIGradient", topGlow)
    tgGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.5, 0),
        NumberSequenceKeypoint.new(1, 1),
    })
    tgGrad.Parent = topGlow

    local userPanel, toggleUserPanel, isUserOpen, userPanelActualWidth =
        CreateUserInfoPanel(container, windowWidth, panelHeight, userPanelWidth,
                            mainFrame, gap, false)

    local changelogPanel, toggleChangelog, isChangelogOpen, changelogPanelActualWidth =
        CreateChangelogPanel(container, windowWidth, panelHeight, changelogPanelWidth,
                             mainFrame, gap)

    local function getContainerWidth()
        local w = windowWidth
        if isUserOpen() then w = w + gap + userPanelActualWidth end
        if isChangelogOpen() then w = w + gap + changelogPanelActualWidth end
        return w
    end

    local function toggleUser(userIcon)
        local currentW = getContainerWidth()
        if isUserOpen() then
            toggleUserPanel(userIcon, container, currentW - gap - userPanelActualWidth)
        else
            toggleUserPanel(userIcon, container, currentW)
        end
    end

    local function toggleCL(changelogIcon)
        local currentW = getContainerWidth()
        if isChangelogOpen() then
            toggleChangelog(changelogIcon, container, currentW - gap - changelogPanelActualWidth)
        else
            toggleChangelog(changelogIcon, container, currentW)
        end
    end

    local function closeAllPanels(userIcon, changelogIcon, callback)
        if isChangelogOpen() then toggleCL(changelogIcon); task.wait(0.35) end
        if isUserOpen()     then toggleUser(userIcon);      task.wait(0.35) end
        if callback then callback() end
    end

    return {
        container         = container,
        mainFrame         = mainFrame,
        mainStroke        = mainStroke,
        toggleUser        = toggleUser,
        toggleCL          = toggleCL,
        isUserOpen        = isUserOpen,
        isChangelogOpen   = isChangelogOpen,
        closeAllPanels    = closeAllPanels,
    }
end

-- ============================================================
-- KEYLESS UI
-- ============================================================
local function BuildKeylessUI()
    local oldGui = hui:FindFirstChild("ArqelKeylessSystem")
    if oldGui then oldGui:Destroy() end
    local oldGui2 = hui:FindFirstChild("ArqelKeySystem")
    if oldGui2 then oldGui2:Destroy() end
    enableBlur()

    local windowWidth  = 340
    local windowHeight = 340
    local userPanelWidth      = 165
    local changelogPanelWidth = 200
    local gap = 12
    local pad = 14

    local gui = Instance.new("ScreenGui")
    gui.Name = "ArqelKeylessSystem"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 999999
    gui.Parent = hui

    local ui = BuildCenteredUI(windowWidth, windowHeight, windowHeight,
                               userPanelWidth, changelogPanelWidth, gap, { gui = gui })
    local container  = ui.container
    local main       = ui.mainFrame
    local mainStroke = ui.mainStroke

    -- Header
    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 60)
    header.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
    header.BackgroundTransparency = 0.15
    header.BorderSizePixel = 0
    header.Active = true
    header.Parent = main
    Instance.new("UICorner", header).CornerRadius = UDim.new(0, 16)

    local headerFix = Instance.new("Frame")
    headerFix.Size = UDim2.new(1, 0, 0, 12)
    headerFix.Position = UDim2.new(0, 0, 1, -12)
    headerFix.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
    headerFix.BackgroundTransparency = 0.15
    headerFix.BorderSizePixel = 0
    headerFix.Parent = header

    local logoHolder = Instance.new("Frame")
    logoHolder.Size = UDim2.fromOffset(40, 40)
    logoHolder.Position = UDim2.new(0, 14, 0.5, -20)
    logoHolder.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    logoHolder.BorderSizePixel = 0
    logoHolder.Parent = header
    Instance.new("UICorner", logoHolder).CornerRadius = UDim.new(0, 11)
    local lStrk = Instance.new("UIStroke", logoHolder)
    lStrk.Color = Color3.fromRGB(70, 70, 70); lStrk.Thickness = 1; lStrk.Transparency = 0.15

    local logo = Instance.new("ImageLabel")
    logo.BackgroundTransparency = 1
    logo.Image = getLogoIcon()
    logo.ImageColor3 = Color3.fromRGB(255, 255, 255)
    logo.Size = UDim2.fromOffset(30, 30)
    logo.Position = UDim2.new(0.5, -15, 0.5, -15)
    logo.ScaleType = Enum.ScaleType.Fit
    logo.Parent = logoHolder

    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -90, 0, 20)
    title.Position = UDim2.new(0, 66, 0, 12)
    title.BackgroundTransparency = 1
    title.Text = Arqel.Appearance.Title
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 15
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Parent = header

    local sub = Instance.new("TextLabel")
    sub.Size = UDim2.new(1, -90, 0, 14)
    sub.Position = UDim2.new(0, 66, 0, 32)
    sub.BackgroundTransparency = 1
    sub.Text = "Keyless Access"
    sub.TextColor3 = Color3.fromRGB(145, 145, 145)
    sub.TextSize = 9
    sub.Font = Enum.Font.Gotham
    sub.TextXAlignment = Enum.TextXAlignment.Left
    sub.Parent = header

    local closeBtn = Instance.new("TextButton")
    closeBtn.Text = "×"; closeBtn.TextSize = 18
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextColor3 = Color3.fromRGB(235, 235, 235)
    closeBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    closeBtn.AutoButtonColor = false
    closeBtn.Position = UDim2.new(1, -44, 0.5, -16)
    closeBtn.Size = UDim2.fromOffset(30, 32)
    closeBtn.Parent = header
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)
    closeBtn.MouseEnter:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.15),
            { BackgroundColor3 = Color3.fromRGB(200, 55, 55) }):Play()
    end)
    closeBtn.MouseLeave:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.15),
            { BackgroundColor3 = Color3.fromRGB(28, 28, 28) }):Play()
    end)

    -- Success card
    local successCard = Instance.new("Frame")
    successCard.Size = UDim2.new(1, -pad * 2, 0, 70)
    successCard.Position = UDim2.new(0, pad, 0, 72)
    successCard.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    successCard.BorderSizePixel = 0
    successCard.Parent = main
    Instance.new("UICorner", successCard).CornerRadius = UDim.new(0, 12)

    local sGrad = Instance.new("UIGradient")
    sGrad.Color = ColorSequence.new(Color3.fromRGB(22, 22, 22), Color3.fromRGB(12, 12, 12))
    sGrad.Rotation = 135; sGrad.Parent = successCard

    local sStroke = Instance.new("UIStroke", successCard)
    sStroke.Color = Color3.fromRGB(80, 220, 120); sStroke.Thickness = 1
    sStroke.Transparency = 0.3; sStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local checkIcon = Instance.new("ImageLabel")
    checkIcon.Size = UDim2.fromOffset(28, 28)
    checkIcon.Position = UDim2.new(0, 16, 0.5, -14)
    checkIcon.BackgroundTransparency = 1
    checkIcon.Image = getIcon("check")
    checkIcon.ImageColor3 = Color3.fromRGB(80, 220, 120)
    checkIcon.ScaleType = Enum.ScaleType.Fit
    checkIcon.Parent = successCard

    local succTitle = Instance.new("TextLabel")
    succTitle.Size = UDim2.new(1, -60, 0, 20)
    succTitle.Position = UDim2.new(0, 56, 0, 14)
    succTitle.BackgroundTransparency = 1
    succTitle.Text = "Access Granted"
    succTitle.TextColor3 = Color3.fromRGB(80, 220, 120)
    succTitle.TextSize = 15
    succTitle.Font = Enum.Font.GothamBold
    succTitle.TextXAlignment = Enum.TextXAlignment.Left
    succTitle.Parent = successCard

    local succSub = Instance.new("TextLabel")
    succSub.Size = UDim2.new(1, -60, 0, 14)
    succSub.Position = UDim2.new(0, 56, 0, 36)
    succSub.BackgroundTransparency = 1
    succSub.Text = "Keyless script — no key required"
    succSub.TextColor3 = Color3.fromRGB(145, 145, 145)
    succSub.TextSize = 10
    succSub.Font = Enum.Font.Gotham
    succSub.TextXAlignment = Enum.TextXAlignment.Left
    succSub.Parent = successCard

    -- Launch button
    local launchBtn = Instance.new("TextButton")
    launchBtn.Size = UDim2.new(1, -pad * 2, 0, 44)
    launchBtn.Position = UDim2.new(0, pad, 0, 158)
    launchBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    launchBtn.Text = ""; launchBtn.AutoButtonColor = false
    launchBtn.Parent = main
    Instance.new("UICorner", launchBtn).CornerRadius = UDim.new(0, 8)
    local lGrad = Instance.new("UIGradient")
    lGrad.Color = ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(220, 220, 220))
    lGrad.Rotation = 135; lGrad.Parent = launchBtn
    local lStrk2 = Instance.new("UIStroke", launchBtn)
    lStrk2.Color = Color3.fromRGB(255, 255, 255); lStrk2.Thickness = 1.2
    lStrk2.Transparency = 0; lStrk2.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local lContent = Instance.new("Frame")
    lContent.Size = UDim2.new(1, 0, 1, 0); lContent.BackgroundTransparency = 1
    lContent.Parent = launchBtn
    local lLay = Instance.new("UIListLayout", lContent)
    lLay.FillDirection = Enum.FillDirection.Horizontal
    lLay.HorizontalAlignment = Enum.HorizontalAlignment.Center
    lLay.VerticalAlignment = Enum.VerticalAlignment.Center
    lLay.Padding = UDim.new(0, 8)

    local lIcon = Instance.new("ImageLabel")
    lIcon.Size = UDim2.fromOffset(18, 18); lIcon.BackgroundTransparency = 1
    lIcon.Image = getIcon("shield"); lIcon.ImageColor3 = Color3.fromRGB(15, 15, 15)
    lIcon.ScaleType = Enum.ScaleType.Fit; lIcon.LayoutOrder = 1; lIcon.Parent = lContent

    local lLabel = Instance.new("TextLabel")
    lLabel.Size = UDim2.new(0, 0, 0, 18); lLabel.AutomaticSize = Enum.AutomaticSize.X
    lLabel.BackgroundTransparency = 1
    lLabel.Text = "Launch Script"; lLabel.TextColor3 = Color3.fromRGB(15, 15, 15)
    lLabel.TextSize = 13; lLabel.Font = Enum.Font.GothamBold
    lLabel.LayoutOrder = 2; lLabel.Parent = lContent

    launchBtn.MouseEnter:Connect(function()
        TweenService:Create(launchBtn, TweenInfo.new(0.15),
            { BackgroundColor3 = Color3.fromRGB(230, 230, 230) }):Play()
    end)
    launchBtn.MouseLeave:Connect(function()
        TweenService:Create(launchBtn, TweenInfo.new(0.15),
            { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }):Play()
    end)

    -- Footer icons
    local footer = Instance.new("Frame")
    footer.Size = UDim2.new(1, -pad * 2, 0, 36)
    footer.Position = UDim2.new(0, pad, 0, 214)
    footer.BackgroundTransparency = 1
    footer.Parent = main
    local fLay = Instance.new("UIListLayout", footer)
    fLay.FillDirection = Enum.FillDirection.Horizontal
    fLay.HorizontalAlignment = Enum.HorizontalAlignment.Center
    fLay.VerticalAlignment = Enum.VerticalAlignment.Center
    fLay.Padding = UDim.new(0, 8)

    local function iconBtn(iconKey, color, hover)
        local b = Instance.new("TextButton")
        b.Size = UDim2.fromOffset(36, 36); b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        b.BorderSizePixel = 0; b.Text = ""; b.AutoButtonColor = false
        b.Parent = footer
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
        local st = Instance.new("UIStroke", b)
        st.Color = Color3.fromRGB(60, 60, 60); st.Thickness = 1; st.Transparency = 0.5
        local ic = Instance.new("ImageLabel")
        ic.Size = UDim2.fromOffset(16, 16); ic.Position = UDim2.new(0.5, -8, 0.5, -8)
        ic.BackgroundTransparency = 1; ic.Image = getIcon(iconKey)
        ic.ImageColor3 = color; ic.ScaleType = Enum.ScaleType.Fit; ic.Parent = b
        b.MouseEnter:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.15),
                { BackgroundColor3 = Color3.fromRGB(45, 45, 45) }):Play()
            TweenService:Create(ic, TweenInfo.new(0.15),
                { ImageColor3 = hover }):Play()
        end)
        b.MouseLeave:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.15),
                { BackgroundColor3 = Color3.fromRGB(25, 25, 25) }):Play()
            TweenService:Create(ic, TweenInfo.new(0.15),
                { ImageColor3 = color }):Play()
        end)
        return b
    end

    local userBtn      = iconBtn("user",      Color3.fromRGB(150, 150, 150), Color3.fromRGB(255, 255, 255))
    local discordBtn   = iconBtn("discord",   Arqel.Theme.Discord,           Arqel.Theme.DiscordHover)
    local changelogBtn = iconBtn("changelog", Color3.fromRGB(150, 150, 150), Color3.fromRGB(255, 255, 255))
    if #Arqel.Changelog == 0 then changelogBtn.Visible = false end

    local doors = CreateDoorOverlay(main, windowWidth, windowHeight)

    userBtn.MouseButton1Click:Connect(function() ui.toggleUser(userBtn) end)
    changelogBtn.MouseButton1Click:Connect(function() ui.toggleCL(changelogBtn) end)

    local function closeDoorsThenExit(cb)
        ui.closeAllPanels(userBtn, changelogBtn, function()
            doors.close(function()
                task.wait(0.3)
                if cb then cb() end
            end)
        end)
    end

    closeBtn.MouseButton1Click:Connect(function()
        Arqel:Notify("Goodbye", "See you next time!", 2, "close")
        closeDoorsThenExit(function()
            fullCleanup()
            TweenService:Create(container, TweenInfo.new(0.4, Enum.EasingStyle.Quart),
                { Position = UDim2.new(0.5, 0, -0.5, 0) }):Play()
            task.wait(0.4)
            gui:Destroy()
            if Arqel.Callbacks.OnClose then Arqel.Callbacks.OnClose() end
        end)
    end)

    launchBtn.MouseButton1Click:Connect(function()
        Arqel:Notify("Launching", "Script loaded successfully!", 2, "success")
        getgenv().SCRIPT_KEY = "KEYLESS"
        getgenv().ArqelLoaded = false
        closeDoorsThenExit(function()
            disableBlur()
            TweenService:Create(container, TweenInfo.new(0.4, Enum.EasingStyle.Quart),
                { Position = UDim2.new(0.5, 0, -0.5, 0) }):Play()
            task.wait(0.4)
            gui:Destroy()
            if not Internal.IsJunkieMode and Arqel.Callbacks.OnSuccess then
                Arqel.Callbacks.OnSuccess()
            end
        end)
    end)

    discordBtn.MouseButton1Click:Connect(function()
        if Arqel.Links.Discord ~= "" then
            Arqel:Notify("Discord", "Invite link copied!", 2, "discord")
            pcall(setclipboard, Arqel.Links.Discord)
        end
    end)

    setupDragging(header, container)
    TweenService:Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Quart),
        { Position = UDim2.new(0.5, 0, 0.45, 0) }):Play()
    task.wait(0.6)
    doors.open(function()
        task.wait(0.2)
        ui.toggleUser(userBtn)
        if #Arqel.Changelog > 0 then task.wait(0.3); ui.toggleCL(changelogBtn) end
    end)
end

-- ============================================================
-- KEY UI
-- ============================================================
local function BuildKeyUI()
    local oldGui = hui:FindFirstChild("ArqelKeySystem")
    if oldGui then oldGui:Destroy() end
    local oldGui2 = hui:FindFirstChild("ArqelKeylessSystem")
    if oldGui2 then oldGui2:Destroy() end
    enableBlur()

    local mobile = isMobile()
    local scale  = getScale()

    local windowWidth  = mobile and math.clamp(400 * scale, 340, 440) or 420
    local baseHeight   = mobile and math.clamp(430 * scale, 380, 480) or 450
    local showShop     = isShopEnabled()
    local shopExtra    = showShop and 64 or 0
    local windowHeight = baseHeight + shopExtra

    local userPanelWidth      = 180
    local changelogPanelWidth = 220
    local gap = 12
    local pad = 14

    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "ArqelKeySystem"
    screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    screenGui.ResetOnSpawn = false
    screenGui.IgnoreGuiInset = true
    screenGui.DisplayOrder = 999999
    screenGui.Parent = hui

    local ui = BuildCenteredUI(windowWidth, windowHeight, baseHeight,
                               userPanelWidth, changelogPanelWidth, gap, { gui = screenGui })
    local container  = ui.container
    local mainFrame  = ui.mainFrame
    local mainStroke = ui.mainStroke

    -- Header
    local header = Instance.new("Frame")
    header.Size = UDim2.new(1, 0, 0, 60)
    header.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
    header.BackgroundTransparency = 0.15
    header.BorderSizePixel = 0
    header.Active = true
    header.Parent = mainFrame
    Instance.new("UICorner", header).CornerRadius = UDim.new(0, 16)

    local headerFix = Instance.new("Frame")
    headerFix.Size = UDim2.new(1, 0, 0, 12)
    headerFix.Position = UDim2.new(0, 0, 1, -12)
    headerFix.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
    headerFix.BackgroundTransparency = 0.15
    headerFix.BorderSizePixel = 0
    headerFix.Parent = header

    local logoHolder = Instance.new("Frame")
    logoHolder.Size = UDim2.fromOffset(40, 40)
    logoHolder.Position = UDim2.new(0, 14, 0.5, -20)
    logoHolder.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    logoHolder.BorderSizePixel = 0
    logoHolder.Parent = header
    Instance.new("UICorner", logoHolder).CornerRadius = UDim.new(0, 11)
    local logoStroke = Instance.new("UIStroke", logoHolder)
    logoStroke.Color = Color3.fromRGB(70, 70, 70); logoStroke.Thickness = 1
    logoStroke.Transparency = 0.15

    local logo = Instance.new("ImageLabel")
    logo.BackgroundTransparency = 1
    logo.Image = getLogoIcon()
    logo.ImageColor3 = Color3.fromRGB(255, 255, 255)
    logo.Size = UDim2.fromOffset(30, 30)
    logo.Position = UDim2.new(0.5, -15, 0.5, -15)
    logo.ScaleType = Enum.ScaleType.Fit
    logo.Parent = logoHolder

    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, -230, 0, 20)
    titleLabel.Position = UDim2.new(0, 66, 0, 10)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = Arqel.Appearance.Title
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    titleLabel.TextSize = 15
    titleLabel.Font = Enum.Font.GothamBold
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = header

    local subLabel = Instance.new("TextLabel")
    subLabel.Size = UDim2.new(1, -230, 0, 14)
    subLabel.Position = UDim2.new(0, 66, 0, 30)
    subLabel.BackgroundTransparency = 1
    subLabel.Text = Arqel.Appearance.Subtitle or "Key System"
    subLabel.TextColor3 = Color3.fromRGB(145, 145, 145)
    subLabel.TextSize = 9
    subLabel.Font = Enum.Font.Gotham
    subLabel.TextXAlignment = Enum.TextXAlignment.Left
    subLabel.Parent = header

    -- Premium badge
    local premiumBadge = Instance.new("Frame")
    premiumBadge.AnchorPoint = Vector2.new(1, 0.5)
    premiumBadge.Position = UDim2.new(1, -88, 0.5, 0)
    premiumBadge.Size = UDim2.fromOffset(78, 22)
    premiumBadge.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    premiumBadge.BorderSizePixel = 0
    premiumBadge.ClipsDescendants = true
    premiumBadge.Parent = header
    Instance.new("UICorner", premiumBadge).CornerRadius = UDim.new(1, 0)
    local badgeStroke = Instance.new("UIStroke", premiumBadge)
    badgeStroke.Color = Color3.fromRGB(255, 255, 255); badgeStroke.Thickness = 1
    badgeStroke.Transparency = 0.3; badgeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local shimmer = Instance.new("Frame")
    shimmer.Size = UDim2.new(0, 22, 1, 0)
    shimmer.Position = UDim2.new(-0.3, 0, 0, 0)
    shimmer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    shimmer.BackgroundTransparency = 0.75
    shimmer.BorderSizePixel = 0
    shimmer.Rotation = 15
    shimmer.ZIndex = 2
    shimmer.Parent = premiumBadge

    local badgeLabel = Instance.new("TextLabel")
    badgeLabel.BackgroundTransparency = 1
    badgeLabel.Size = UDim2.fromScale(1, 1)
    badgeLabel.Text = "✦ PREMIUM"
    badgeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    badgeLabel.TextSize = 10
    badgeLabel.Font = Enum.Font.GothamBold
    badgeLabel.ZIndex = 3
    badgeLabel.Parent = premiumBadge

    task.spawn(function()
        while premiumBadge.Parent do
            shimmer.Position = UDim2.new(-0.3, 0, 0, 0)
            TweenService:Create(shimmer,
                TweenInfo.new(1.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
                { Position = UDim2.new(1.3, 0, 0, 0) }):Play()
            task.wait(3.2)
        end
    end)

    local closeBtn = Instance.new("TextButton")
    closeBtn.Text = "×"; closeBtn.TextSize = 18
    closeBtn.Font = Enum.Font.GothamBold
    closeBtn.TextColor3 = Color3.fromRGB(235, 235, 235)
    closeBtn.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    closeBtn.AutoButtonColor = false
    closeBtn.Position = UDim2.new(1, -44, 0.5, -16)
    closeBtn.Size = UDim2.fromOffset(30, 32)
    closeBtn.Parent = header
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)
    closeBtn.MouseEnter:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.15),
            { BackgroundColor3 = Color3.fromRGB(200, 55, 55) }):Play()
    end)
    closeBtn.MouseLeave:Connect(function()
        TweenService:Create(closeBtn, TweenInfo.new(0.15),
            { BackgroundColor3 = Color3.fromRGB(28, 28, 28) }):Play()
    end)

    -- Helper: build a Promers-style section card
    local function makeSectionCard(yPos, height)
        local card = Instance.new("Frame")
        card.Size = UDim2.new(1, -pad * 2, 0, height)
        card.Position = UDim2.new(0, pad, 0, yPos)
        card.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        card.BorderSizePixel = 0
        card.Parent = mainFrame
        Instance.new("UICorner", card).CornerRadius = UDim.new(0, 12)

        local grad = Instance.new("UIGradient")
        grad.Color = ColorSequence.new(Color3.fromRGB(22, 22, 22), Color3.fromRGB(12, 12, 12))
        grad.Rotation = 135
        grad.Parent = card

        local stroke = Instance.new("UIStroke", card)
        stroke.Color = Color3.fromRGB(60, 60, 60); stroke.Thickness = 1
        stroke.Transparency = 0.2; stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        return card, stroke
    end

    local function makeSectionHeader(card, title)
        local h = Instance.new("Frame")
        h.Size = UDim2.new(1, 0, 0, 28)
        h.BackgroundTransparency = 1
        h.Parent = card

        local dGlow = Instance.new("Frame")
        dGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        dGlow.BackgroundTransparency = 0.85
        dGlow.BorderSizePixel = 0
        dGlow.Size = UDim2.fromOffset(12, 12)
        dGlow.Position = UDim2.new(0, 14, 0.5, -6)
        dGlow.Parent = h
        Instance.new("UICorner", dGlow).CornerRadius = UDim.new(1, 0)

        local d = Instance.new("Frame")
        d.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        d.BorderSizePixel = 0
        d.Size = UDim2.fromOffset(6, 6)
        d.Position = UDim2.new(0, 17, 0.5, -3)
        d.Parent = h
        Instance.new("UICorner", d).CornerRadius = UDim.new(1, 0)

        task.spawn(function()
            while dGlow.Parent do
                TweenService:Create(dGlow,
                    TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    { BackgroundTransparency = 0.95, Size = UDim2.fromOffset(16, 16),
                      Position = UDim2.new(0, 12, 0.5, -8) }):Play()
                task.wait(1.2)
                if not dGlow.Parent then break end
                TweenService:Create(dGlow,
                    TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                    { BackgroundTransparency = 0.8, Size = UDim2.fromOffset(12, 12),
                      Position = UDim2.new(0, 14, 0.5, -6) }):Play()
                task.wait(1.2)
            end
        end)

        local lbl = Instance.new("TextLabel")
        lbl.Size = UDim2.new(1, -40, 1, 0)
        lbl.Position = UDim2.new(0, 36, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text = string.upper(title)
        lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
        lbl.TextSize = 10
        lbl.Font = Enum.Font.GothamBold
        lbl.TextXAlignment = Enum.TextXAlignment.Left
        lbl.Parent = h
        return h
    end

    -- Status section
    local statusY = 72
    local statusCard = makeSectionCard(statusY, 68)
    makeSectionHeader(statusCard, "Status")

    local statusRow = Instance.new("Frame")
    statusRow.Size = UDim2.new(1, -28, 0, 30)
    statusRow.Position = UDim2.new(0, 14, 0, 30)
    statusRow.BackgroundTransparency = 1
    statusRow.Parent = statusCard

    local statusIcon = Instance.new("ImageLabel")
    statusIcon.Size = UDim2.fromOffset(20, 20)
    statusIcon.Position = UDim2.new(0, 0, 0.5, -10)
    statusIcon.BackgroundTransparency = 1
    statusIcon.Image = getIcon("lock")
    statusIcon.ImageColor3 = Color3.fromRGB(180, 180, 180)
    statusIcon.ScaleType = Enum.ScaleType.Fit
    statusIcon.Parent = statusRow

    local statusLabel = Instance.new("TextLabel")
    statusLabel.Size = UDim2.new(1, -30, 1, 0)
    statusLabel.Position = UDim2.new(0, 30, 0, 0)
    statusLabel.BackgroundTransparency = 1
    statusLabel.Text = Arqel.Appearance.Subtitle or "Enter your key to continue"
    statusLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
    statusLabel.TextSize = 12
    statusLabel.Font = Enum.Font.GothamBold
    statusLabel.TextXAlignment = Enum.TextXAlignment.Left
    statusLabel.TextTruncate = Enum.TextTruncate.AtEnd
    statusLabel.Parent = statusRow

    -- Input section
    local inputY = statusY + 80
    local inputCard = makeSectionCard(inputY, 84)
    makeSectionHeader(inputCard, "Access Key")

    local wrap = Instance.new("Frame")
    wrap.Size = UDim2.new(1, -28, 0, 36)
    wrap.Position = UDim2.new(0, 14, 0, 32)
    wrap.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    wrap.BorderSizePixel = 0
    wrap.Parent = inputCard
    Instance.new("UICorner", wrap).CornerRadius = UDim.new(0, 8)

    local wrapGrad = Instance.new("UIGradient")
    wrapGrad.Color = ColorSequence.new(Color3.fromRGB(35, 35, 35), Color3.fromRGB(15, 15, 15))
    wrapGrad.Rotation = 135
    wrapGrad.Parent = wrap

    local wrapStroke = Instance.new("UIStroke", wrap)
    wrapStroke.Color = Color3.fromRGB(60, 60, 60); wrapStroke.Thickness = 1.2
    wrapStroke.Transparency = 0.3; wrapStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    local penIcon = Instance.new("TextLabel")
    penIcon.BackgroundTransparency = 1
    penIcon.Text = "✎"
    penIcon.TextColor3 = Color3.fromRGB(130, 130, 130)
    penIcon.TextSize = 14
    penIcon.Font = Enum.Font.GothamBold
    penIcon.Position = UDim2.new(0, 10, 0, 0)
    penIcon.Size = UDim2.fromOffset(20, 36)
    penIcon.Parent = wrap

    local textBox = Instance.new("TextBox")
    textBox.ClearTextOnFocus = false
    textBox.Text = ""
    textBox.PlaceholderText = "Enter your key..."
    textBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
    textBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    textBox.TextSize = 12
    textBox.Font = Enum.Font.Gotham
    textBox.TextXAlignment = Enum.TextXAlignment.Left
    textBox.BackgroundTransparency = 1
    textBox.Position = UDim2.new(0, 34, 0, 0)
    textBox.Size = UDim2.new(1, -42, 1, 0)
    textBox.Parent = wrap

    textBox.Focused:Connect(function()
        TweenService:Create(wrapStroke, TweenInfo.new(0.2),
            { Color = Color3.fromRGB(255, 255, 255), Transparency = 0 }):Play()
        TweenService:Create(wrap, TweenInfo.new(0.2),
            { BackgroundColor3 = Color3.fromRGB(40, 40, 40) }):Play()
        TweenService:Create(penIcon, TweenInfo.new(0.2),
            { TextColor3 = Color3.fromRGB(255, 255, 255) }):Play()
    end)
    textBox.FocusLost:Connect(function()
        TweenService:Create(wrapStroke, TweenInfo.new(0.2),
            { Color = Color3.fromRGB(60, 60, 60), Transparency = 0.3 }):Play()
        TweenService:Create(wrap, TweenInfo.new(0.2),
            { BackgroundColor3 = Color3.fromRGB(25, 25, 25) }):Play()
        TweenService:Create(penIcon, TweenInfo.new(0.2),
            { TextColor3 = Color3.fromRGB(130, 130, 130) }):Play()
    end)

    -- Buttons
    local btnY = inputY + 96

    local function promersButton(parent, title, iconKey, isPrimary, xPos, wPos)
        local btn = Instance.new("TextButton")
        btn.Size = wPos or UDim2.new(1, 0, 0, 40)
        btn.Position = UDim2.new(0, xPos or pad, 0, btnY)
        btn.BackgroundColor3 = isPrimary and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(35, 35, 35)
        btn.Text = ""; btn.AutoButtonColor = false; btn.ClipsDescendants = true
        btn.Parent = parent
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

        local grad = Instance.new("UIGradient")
        grad.Color = isPrimary
            and ColorSequence.new(Color3.fromRGB(255, 255, 255), Color3.fromRGB(220, 220, 220))
            or  ColorSequence.new(Color3.fromRGB(45, 45, 45), Color3.fromRGB(20, 20, 20))
        grad.Rotation = 135; grad.Parent = btn

        local st = Instance.new("UIStroke", btn)
        st.Color = isPrimary and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(70, 70, 70)
        st.Thickness = 1.2
        st.Transparency = isPrimary and 0 or 0.2
        st.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        local content = Instance.new("Frame")
        content.Size = UDim2.new(1, 0, 1, 0)
        content.BackgroundTransparency = 1
        content.Parent = btn
        local lay = Instance.new("UIListLayout", content)
        lay.FillDirection = Enum.FillDirection.Horizontal
        lay.HorizontalAlignment = Enum.HorizontalAlignment.Center
        lay.VerticalAlignment = Enum.VerticalAlignment.Center
        lay.Padding = UDim.new(0, 8)

        local ic = Instance.new("ImageLabel")
        ic.Size = UDim2.fromOffset(16, 16); ic.BackgroundTransparency = 1
        ic.Image = getIcon(iconKey)
        ic.ImageColor3 = isPrimary and Color3.fromRGB(15, 15, 15) or Color3.fromRGB(255, 255, 255)
        ic.ScaleType = Enum.ScaleType.Fit
        ic.LayoutOrder = 1; ic.Parent = content

        local lb = Instance.new("TextLabel")
        lb.Size = UDim2.new(0, 0, 0, 18); lb.AutomaticSize = Enum.AutomaticSize.X
        lb.BackgroundTransparency = 1
        lb.Text = title
        lb.TextColor3 = isPrimary and Color3.fromRGB(15, 15, 15) or Color3.fromRGB(255, 255, 255)
        lb.TextSize = 12; lb.Font = Enum.Font.GothamBold
        lb.LayoutOrder = 2; lb.Parent = content

        local orig  = btn.BackgroundColor3
        local hover = isPrimary and Color3.fromRGB(230, 230, 230) or Color3.fromRGB(55, 55, 55)
        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15),
                { BackgroundColor3 = hover }):Play()
            TweenService:Create(st, TweenInfo.new(0.15),
                { Transparency = 0 }):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.15),
                { BackgroundColor3 = orig }):Play()
            TweenService:Create(st, TweenInfo.new(0.15),
                { Transparency = isPrimary and 0 or 0.2 }):Play()
        end)

        return btn
    end

    local noKey = Arqel.Options.NoGetKey
    local acquireBtn = promersButton(mainFrame,
        noKey and "Unavailable" or "Get Key",
        noKey and "nogetkey" or "key",
        false, pad, UDim2.new(0.5, -pad - 4, 0, 40))
    if noKey then
        acquireBtn.Active = false
        acquireBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end

    local redeemBtn = promersButton(mainFrame, "Redeem Key", "shield", true,
        0, UDim2.new(0.5, 4, 0, 40))
    redeemBtn.Position = UDim2.new(0.5, 4, 0, btnY)

    -- Shop
    local shopOffset = 0
    if showShop then
        local shopY = btnY + 52
        local shop = Instance.new("Frame")
        shop.Size = UDim2.new(1, -pad * 2, 0, 52)
        shop.Position = UDim2.new(0, pad, 0, shopY)
        shop.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        shop.BorderSizePixel = 0
        shop.Parent = mainFrame
        Instance.new("UICorner", shop).CornerRadius = UDim.new(0, 10)
        local sStk = Instance.new("UIStroke", shop)
        sStk.Color = Color3.fromRGB(255, 255, 255); sStk.Thickness = 1
        sStk.Transparency = 0.6; sStk.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        local sIcon = Instance.new("ImageLabel")
        sIcon.Size = UDim2.fromOffset(24, 24)
        sIcon.Position = UDim2.new(0, 12, 0.5, -12)
        sIcon.BackgroundTransparency = 1
        sIcon.Image = getShopIcon()
        sIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)
        sIcon.ScaleType = Enum.ScaleType.Fit
        sIcon.Parent = shop

        local sTitle = Instance.new("TextLabel")
        sTitle.Size = UDim2.new(1, -140, 0, 16)
        sTitle.Position = UDim2.new(0, 46, 0, 10)
        sTitle.BackgroundTransparency = 1
        sTitle.Font = Enum.Font.GothamBold
        sTitle.Text = Arqel.Shop.Title
        sTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
        sTitle.TextSize = 12; sTitle.TextXAlignment = Enum.TextXAlignment.Left
        sTitle.TextTruncate = Enum.TextTruncate.AtEnd; sTitle.Parent = shop

        local sSub = Instance.new("TextLabel")
        sSub.Size = UDim2.new(1, -140, 0, 12)
        sSub.Position = UDim2.new(0, 46, 0, 28)
        sSub.BackgroundTransparency = 1
        sSub.Font = Enum.Font.Gotham
        sSub.Text = Arqel.Shop.Subtitle
        sSub.TextColor3 = Color3.fromRGB(145, 145, 145)
        sSub.TextSize = 9; sSub.TextXAlignment = Enum.TextXAlignment.Left
        sSub.TextTruncate = Enum.TextTruncate.AtEnd; sSub.Parent = shop

        local buyBtn = Instance.new("TextButton")
        buyBtn.Size = UDim2.fromOffset(70, 28)
        buyBtn.Position = UDim2.new(1, -12, 0.5, -14)
        buyBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        buyBtn.Text = Arqel.Shop.ButtonText
        buyBtn.TextColor3 = Color3.fromRGB(15, 15, 15)
        buyBtn.Font = Enum.Font.GothamBold; buyBtn.TextSize = 11
        buyBtn.AutoButtonColor = false; buyBtn.Parent = shop
        Instance.new("UICorner", buyBtn).CornerRadius = UDim.new(0, 6)
        buyBtn.MouseEnter:Connect(function()
            TweenService:Create(buyBtn, TweenInfo.new(0.15),
                { BackgroundColor3 = Color3.fromRGB(230, 230, 230) }):Play()
        end)
        buyBtn.MouseLeave:Connect(function()
            TweenService:Create(buyBtn, TweenInfo.new(0.15),
                { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }):Play()
        end)
        buyBtn.MouseButton1Click:Connect(function()
            if Arqel.Shop.Link ~= "" then
                pcall(setclipboard, Arqel.Shop.Link)
                Arqel:Notify("Shop", "Link copied!", 2, "copy")
            end
        end)
        shopOffset = 64
    end

    -- Footer icons
    local footerY = btnY + 52 + shopOffset
    local footer = Instance.new("Frame")
    footer.Size = UDim2.new(1, -pad * 2, 0, 36)
    footer.Position = UDim2.new(0, pad, 0, footerY)
    footer.BackgroundTransparency = 1
    footer.Parent = mainFrame

    local fLay = Instance.new("UIListLayout", footer)
    fLay.FillDirection = Enum.FillDirection.Horizontal
    fLay.HorizontalAlignment = Enum.HorizontalAlignment.Center
    fLay.VerticalAlignment = Enum.VerticalAlignment.Center
    fLay.Padding = UDim.new(0, 8)

    local function iconBtn(iconKey, color, hover)
        local b = Instance.new("TextButton")
        b.Size = UDim2.fromOffset(36, 36)
        b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        b.BorderSizePixel = 0; b.Text = ""; b.AutoButtonColor = false
        b.Parent = footer
        Instance.new("UICorner", b).CornerRadius = UDim.new(0, 8)
        local st = Instance.new("UIStroke", b)
        st.Color = Color3.fromRGB(60, 60, 60); st.Thickness = 1; st.Transparency = 0.5
        local ic = Instance.new("ImageLabel")
        ic.Size = UDim2.fromOffset(16, 16)
        ic.Position = UDim2.new(0.5, -8, 0.5, -8)
        ic.BackgroundTransparency = 1
        ic.Image = getIcon(iconKey)
        ic.ImageColor3 = color
        ic.ScaleType = Enum.ScaleType.Fit
        ic.Parent = b
        b.MouseEnter:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.15),
                { BackgroundColor3 = Color3.fromRGB(45, 45, 45) }):Play()
            TweenService:Create(ic, TweenInfo.new(0.15),
                { ImageColor3 = hover }):Play()
        end)
        b.MouseLeave:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.15),
                { BackgroundColor3 = Color3.fromRGB(25, 25, 25) }):Play()
            TweenService:Create(ic, TweenInfo.new(0.15),
                { ImageColor3 = color }):Play()
        end)
        return b
    end

    local userBtn      = iconBtn("user",      Color3.fromRGB(150, 150, 150), Color3.fromRGB(255, 255, 255))
    local discordBtn   = iconBtn("discord",   Arqel.Theme.Discord,           Arqel.Theme.DiscordHover)
    local changelogBtn = iconBtn("changelog", Color3.fromRGB(150, 150, 150), Color3.fromRGB(255, 255, 255))
    if #Arqel.Changelog == 0 then changelogBtn.Visible = false end

    -- Doors + events
    local doors = CreateDoorOverlay(mainFrame, windowWidth, windowHeight)

    userBtn.MouseButton1Click:Connect(function() ui.toggleUser(userBtn) end)
    changelogBtn.MouseButton1Click:Connect(function() ui.toggleCL(changelogBtn) end)

    local function closeDoorsThenExit(cb)
        ui.closeAllPanels(userBtn, changelogBtn, function()
            doors.close(function()
                task.wait(0.3)
                if cb then cb() end
            end)
        end)
    end

    closeBtn.MouseButton1Click:Connect(function()
        Arqel:Notify("Goodbye", "See you next time!", 2, "close")
        closeDoorsThenExit(function()
            fullCleanup()
            TweenService:Create(container, TweenInfo.new(0.4, Enum.EasingStyle.Quart),
                { Position = UDim2.new(0.5, 0, -0.5, 0) }):Play()
            TweenService:Create(mainFrame, TweenInfo.new(0.3),
                { BackgroundTransparency = 1 }):Play()
            TweenService:Create(mainStroke, TweenInfo.new(0.3),
                { Transparency = 1 }):Play()
            task.wait(0.4)
            screenGui:Destroy()
            if Arqel.Callbacks.OnClose then Arqel.Callbacks.OnClose() end
        end)
    end)

    -- Status setter
    local spinConnection, dotsThread
    local function setStatus(state, customText)
        if spinConnection then
            spinConnection:Disconnect(); spinConnection = nil
            statusIcon.Rotation = 0
        end
        if dotsThread then task.cancel(dotsThread); dotsThread = nil end

        local color, icon, text =
            Color3.fromRGB(180, 180, 180), getIcon("lock"), customText or "No key detected"

        if state == "verifying" then
            color, icon, text = Arqel.Theme.Accent, getIcon("loading"), "Verifying key"
            spinConnection = RunService.Heartbeat:Connect(function(dt)
                if statusIcon and statusIcon.Parent then
                    statusIcon.Rotation = (statusIcon.Rotation + dt * 360) % 360
                elseif spinConnection then
                    spinConnection:Disconnect()
                end
            end)
            local dots, i = {".", "..", "...", ""}, 1
            dotsThread = task.spawn(function()
                while statusLabel and statusLabel.Parent
                      and statusLabel.Text:find("Verifying", 1, true) do
                    statusLabel.Text = text .. dots[i]
                    i = (i % #dots) + 1
                    task.wait(0.4)
                end
            end)
        elseif state == "success" then
            color, icon, text = Arqel.Theme.Success, getIcon("check"),
                customText or "Access Granted"
        elseif state == "error" then
            color, icon, text = Arqel.Theme.Error, getIcon("alert"),
                customText or "Invalid Key"
        end

        TweenService:Create(statusLabel, TweenInfo.new(0.3),
            { TextColor3 = color }):Play()
        TweenService:Create(statusIcon, TweenInfo.new(0.3),
            { ImageColor3 = color }):Play()
        statusLabel.Text = text
        statusIcon.Image = icon
    end

    -- Redeem handler
    local function handleRedeem()
        local key = textBox.Text:gsub("%s+", "")
        if key == "" then
            Arqel:Notify("Error", "Please enter your key", 3, "warning")
            return
        end
        setStatus("verifying")
        redeemBtn.Active = false
        task.wait(0.3)

        local valid, errorMsg = false, "Invalid key"
        if Internal.ValidateFunction then
            local success, result, msg = pcall(Internal.ValidateFunction, key)
            if success then
                if type(result) == "table" then
                    valid = result.valid == true
                    local errMsgs = {
                        KEY_INVALID       = "Key not found in system",
                        KEY_EXPIRED       = "Key has expired",
                        HWID_BANNED       = "Hardware banned",
                        KEY_INVALIDATED   = "Key was revoked",
                        ALREADY_USED      = "One-time key already used",
                        HWID_MISMATCH     = "HWID limit reached",
                        SERVICE_NOT_FOUND = "Service not found",
                        SERVICE_MISMATCH  = "Wrong service",
                        PREMIUM_REQUIRED  = "Premium required",
                        ERROR             = "Network error",
                    }
                    local errCode = result.error or "Unknown"
                    errorMsg = errMsgs[errCode] or result.message or errCode
                    if errCode == "HWID_BANNED" then
                        task.delay(2, function()
                            cloneref(Players.LocalPlayer):Kick("Hardware banned")
                        end)
                    end
                elseif type(result) == "boolean" then
                    valid = result
                    errorMsg = msg or "Invalid key"
                end
            end
        end
        redeemBtn.Active = true

        if valid then
            saveKey(key)
            getgenv().SCRIPT_KEY = key
            getgenv().ArqelLoaded = false
            setStatus("success")
            Arqel:Notify("Success", "Key validated successfully!", 2, "success")
            task.wait(1)
            closeDoorsThenExit(function()
                disableBlur()
                TweenService:Create(container, TweenInfo.new(0.4, Enum.EasingStyle.Quart),
                    { Position = UDim2.new(0.5, 0, -0.5, 0) }):Play()
                TweenService:Create(mainFrame, TweenInfo.new(0.3),
                    { BackgroundTransparency = 1 }):Play()
                task.wait(0.4)
                screenGui:Destroy()
                if not Internal.IsJunkieMode and Arqel.Callbacks.OnSuccess then
                    Arqel.Callbacks.OnSuccess()
                end
            end)
        else
            setStatus("error", errorMsg)
            Arqel:Notify("Invalid", errorMsg, 4, "error")
            if Arqel.Callbacks.OnFail then Arqel.Callbacks.OnFail(errorMsg) end
        end
    end

    redeemBtn.MouseButton1Click:Connect(handleRedeem)

    acquireBtn.MouseButton1Click:Connect(function()
        if Arqel.Options.NoGetKey then
            Arqel:Notify("Unavailable", "Get Key is unavailable", 3, "nogetkey")
            return
        end
        if Arqel.Links.GetKey ~= "" then
            Arqel:Notify("Copied", "Key link copied!", 3, "copy")
            pcall(setclipboard, Arqel.Links.GetKey)
        else
            Arqel:Notify("Error", "No key link set", 3, "warning")
        end
    end)

    discordBtn.MouseButton1Click:Connect(function()
        if Arqel.Links.Discord ~= "" then
            Arqel:Notify("Discord", "Invite link copied!", 2, "discord")
            pcall(setclipboard, Arqel.Links.Discord)
        end
    end)

    textBox.FocusLost:Connect(function(enter) if enter then handleRedeem() end end)

    setupDragging(header, container)
    TweenService:Create(container, TweenInfo.new(0.5, Enum.EasingStyle.Quart),
        { Position = UDim2.new(0.5, 0, 0.45, 0) }):Play()
    task.wait(0.6)
    doors.open(function()
        task.wait(0.2)
        ui.toggleUser(userBtn)
        if #Arqel.Changelog > 0 then
            task.wait(0.3)
            ui.toggleCL(changelogBtn)
        end
    end)
end

-- ============================================================
-- PUBLIC LAUNCH API
-- ============================================================
function Arqel:Launch()
    Internal.IsJunkieMode     = false
    Internal.ValidateFunction = Arqel.Callbacks.OnVerify

    local existingKey = getgenv().SCRIPT_KEY
    if existingKey and existingKey ~= "" then
        if existingKey == "KEYLESS" then
            Arqel:Notify("Executed", "Script loaded successfully!", 2, "success")
            if Arqel.Callbacks.OnSuccess then Arqel.Callbacks.OnSuccess() end
            return
        elseif Internal.ValidateFunction
               and validateKey(existingKey, Internal.ValidateFunction) then
            Arqel:Notify("Executed", "Script loaded successfully!", 2, "success")
            if Arqel.Callbacks.OnSuccess then Arqel.Callbacks.OnSuccess() end
            return
        end
        getgenv().SCRIPT_KEY = nil
    end

    getgenv().ArqelClosed = false

    EnsureIconsReady(function()
        if Arqel.Options.Keyless == true then
            if Arqel.Options.KeylessUI == false then
                handleKeylessSkip()
                return
            end
            BuildKeylessUI()
            while not getgenv().SCRIPT_KEY do task.wait(0.1) end
            return
        end

        if Arqel.Storage.AutoLoad and Internal.ValidateFunction then
            local savedKey = loadKey()
            if savedKey and savedKey ~= "" then
                Arqel:Notify("Checking", "Validating saved key...", 2, "shield")
                task.wait(0.5)
                if validateKey(savedKey, Internal.ValidateFunction) then
                    getgenv().SCRIPT_KEY = savedKey
                    Arqel:Notify("Welcome Back", "Key validated!", 2, "success")
                    if Arqel.Callbacks.OnSuccess then Arqel.Callbacks.OnSuccess() end
                    return
                else
                    clearKey()
                    Arqel:Notify("Expired", "Saved key is no longer valid", 3, "warning")
                    task.wait(1)
                end
            end
        end

        BuildKeyUI()
        while not getgenv().SCRIPT_KEY do task.wait(0.1) end
    end)
end

function Arqel:LaunchJunkie(config)
    assert(config and config.Service and config.Identifier and config.Provider,
        "Config required: Service, Identifier, Provider")
    Internal.IsJunkieMode = true

    local existingKey = getgenv().SCRIPT_KEY
    if existingKey and existingKey ~= "" then
        Arqel:Notify("Executed", "Script loaded successfully!", 2, "success")
        if Arqel.Callbacks.OnSuccess then Arqel.Callbacks.OnSuccess() end
        return
    end

    getgenv().ArqelClosed = false

    EnsureIconsReady(function()
        local success, Junkie = pcall(function()
            return loadstring(game:HttpGet("https://jnkie.com/sdk/library.lua"))()
        end)
        if not success or not Junkie then
            Arqel:Notify("Error", "Failed to load Junkie SDK", 5, "error")
            return
        end

        Junkie.service    = config.Service
        Junkie.identifier = config.Identifier
        Junkie.provider   = config.Provider

        Internal.Junkie = Junkie

        if Arqel.Links.GetKey == "" then
            pcall(function() Arqel.Links.GetKey = Junkie.get_key_link() end)
        end

        Internal.ValidateFunction = function(key)
            return Junkie.check_key(key)
        end

        if Arqel.Options.Keyless == nil then
            local ks, kr = pcall(function() return Junkie.check_key("KEYLESS") end)
            if ks and kr and kr.valid then
                if Arqel.Options.KeylessUI == false then
                    handleKeylessSkip()
                    return
                end
                BuildKeylessUI()
                while not getgenv().SCRIPT_KEY do task.wait(0.1) end
                return
            end
        elseif Arqel.Options.Keyless == true then
            if Arqel.Options.KeylessUI == false then
                handleKeylessSkip()
                return
            end
            BuildKeylessUI()
            while not getgenv().SCRIPT_KEY do task.wait(0.1) end
            return
        end

        if Arqel.Storage.AutoLoad then
            local savedKey = loadKey()
            if savedKey and savedKey ~= "" then
                Arqel:Notify("Checking", "Validating saved key...", 2, "shield")
                task.wait(0.5)
                local vs, vr = pcall(function() return Junkie.check_key(savedKey) end)
                if vs and vr and vr.valid then
                    getgenv().SCRIPT_KEY = savedKey
                    Arqel:Notify("Welcome Back", "Key validated!", 2, "success")
                    if Arqel.Callbacks.OnSuccess then Arqel.Callbacks.OnSuccess() end
                    return
                else
                    clearKey()
                    Arqel:Notify("Expired", "Saved key is no longer valid", 3, "warning")
                    task.wait(1)
                end
            end
        end

        BuildKeyUI()
        while not getgenv().SCRIPT_KEY do task.wait(0.1) end
    end)
end

function Arqel:GetSavedKey() return loadKey() end
function Arqel:ClearSavedKey() return clearKey() end

getgenv().Arqel = Arqel
return Arqel
