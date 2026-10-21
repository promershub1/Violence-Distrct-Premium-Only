--========================================================--
-- ALFzxzzz HUB v0.4.5 + Killer FOV Port [UNLOCKED EDITION]
-- Theme: Monochrome (Black / 15,15,15 / White)
-- Sections: Groupbox style (header + accent dot + divider)
-- Patch: Config + Music Player + Lock Toggle (OFF-Unlocked) + Icon Tab
-- Patch v0.4.5: Killer FOV (ported from Hypnosis) — Visuals Tab
-- Patch UNLOCKED: Semua fitur locked dibuka
--========================================================--

getgenv().VD = getgenv().VD or {}
local W = getgenv()

--====================================================--
-- GLOBAL THEME (MONOCHROME)
--====================================================--
_G.GLUTO_THEME      = Color3.fromRGB(255, 255, 255)
_G.GLUTO_THEME_DIM  = Color3.fromRGB(170, 170, 170)
_G.GLUTO_ACCENT     = _G.GLUTO_THEME
_G.GLUTO_ACCENT_BG  = Color3.fromRGB(15, 15, 15)
_G.GLUTO_NEUTRAL    = Color3.fromRGB(140, 140, 140)
_G.GLUTO_STROKE_OFF = Color3.fromRGB(60, 60, 60)
_G.GLUTO_BG_OFF     = Color3.fromRGB(10, 10, 10)

--====================================================--
-- SAFE GUI PARENT
--====================================================--
local function SafeGuiParent()
    if gethui then
        local ok, hui = pcall(gethui)
        if ok and hui then return hui end
    end
    local cg = game:GetService("CoreGui")
    local ok, can = pcall(function()
        local f = Instance.new("Folder"); f.Parent = cg; f:Destroy()
    end)
    if ok and can then return cg end
    return game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
end

--====================================================--
-- VARIABLE DEFAULTS
--====================================================--
VD.AutoCrouch                = VD.AutoCrouch or false
VD.KILLER_AutoAttack         = VD.KILLER_AutoAttack or false
VD.KILLER_AutoAttackRange    = VD.KILLER_AutoAttackRange or 12
VD.KILLER_AutoAttackCooldown = VD.KILLER_AutoAttackCooldown or 0.15
VD.SURV_AutoFlee             = VD.SURV_AutoFlee or false
VD.SURV_AutoFleeDist         = VD.SURV_AutoFleeDist or 40
VD.SURV_AutoFleeCooldown     = VD.SURV_AutoFleeCooldown or 1.5

VD.VeilEnabled          = VD.VeilEnabled          or false
VD.VeilShowFOV          = VD.VeilShowFOV          ~= false
VD.VeilShowTracker      = VD.VeilShowTracker      or false
VD.VeilAutoPredict      = VD.VeilAutoPredict      ~= false
VD.VeilFOV              = VD.VeilFOV              or 150
VD.VeilMaxDist          = VD.VeilMaxDist          or 500
VD.VeilSpearSpeed       = VD.VeilSpearSpeed       or 165
VD.VeilGravity          = VD.VeilGravity          or 103
VD.VeilAuraSpearSpeed   = VD.VeilAuraSpearSpeed   or 165
VD.VeilAuraSpearGravity = VD.VeilAuraSpearGravity or 96
VD.VeilLeadMultiplier   = VD.VeilLeadMultiplier   or 1.4

VD.TOF_SilentAim    = VD.TOF_SilentAim    or false
VD.TOF_TargetMode   = VD.TOF_TargetMode   or "Killer"
VD.TOF_Key          = VD.TOF_Key          or "Q"
VD.TOF_Laser        = VD.TOF_Laser        ~= false
VD.TOF_WallCheck    = VD.TOF_WallCheck    ~= false
VD.TOF_BlockKnocked = VD.TOF_BlockKnocked ~= false
VD._TOF_Locked      = false  -- [UNLOCKED]

VD.Invis_Enabled       = VD.Invis_Enabled or false
VD.Invis_ShowFloatBtn  = VD.Invis_ShowFloatBtn or false
VD.Invis_Hotkey        = VD.Invis_Hotkey or "G"

VD.KILLER_BypassLeap     = VD.KILLER_BypassLeap or false
VD.KILLER_InfGrab        = VD.KILLER_InfGrab or false
VD.KILLER_InfLakeMist    = VD.KILLER_InfLakeMist or false
VD.KILLER_InfPursuit     = VD.KILLER_InfPursuit or false
VD.KILLER_BypassCooldown = VD.KILLER_BypassCooldown or false
VD.KILLER_InfFrenzy      = VD.KILLER_InfFrenzy or false
VD.KILLER_AntiBlind      = VD.KILLER_AntiBlind or false
VD.KILLER_DestroyPallets = VD.KILLER_DestroyPallets or false
VD.KILLER_InfLunge       = VD.KILLER_InfLunge or false
VD.KILLER_AutoHook       = VD.KILLER_AutoHook or false
VD.KILLER_CounterParry   = VD.KILLER_CounterParry or false

VD.KA_AutoStalk      = VD.KA_AutoStalk or false
VD.KA_AutoStalkRange = VD.KA_AutoStalkRange or 150
VD.KA_AutoKillAll    = VD.KA_AutoKillAll or false
VD.KA_DropAllPallet  = VD.KA_DropAllPallet or false
VD.KA_BlockAllVault  = VD.KA_BlockAllVault or false

VD.NoFallDamage     = VD.NoFallDamage or false
VD.NextMapPredict   = VD.NextMapPredict or false
VD.ManualGen        = VD.ManualGen or false
VD.AutoGen          = VD.AutoGen or false
VD.KillerEscapeDist = VD.KillerEscapeDist or 30

VD.KillerPerksDisplay = VD.KillerPerksDisplay or false
VD.SpeedBoostEnabled  = VD.SpeedBoostEnabled or false
VD.SpeedBoostValue    = VD.SpeedBoostValue or 30
VD.CursorEnabled      = VD.CursorEnabled or false

VD.KillerFOV_Enabled       = VD.KillerFOV_Enabled or false
VD.KillerFOV_ThroughWalls  = VD.KillerFOV_ThroughWalls or false
VD.KillerFOV_Style         = VD.KillerFOV_Style or "Outline Cone"
VD.KillerFOV_Range         = VD.KillerFOV_Range or 12
VD.KillerFOV_Angle         = VD.KillerFOV_Angle or 70
VD.KillerFOV_Color         = VD.KillerFOV_Color or Color3.fromRGB(255, 60, 60)
VD.KillerFOV_Transparency  = VD.KillerFOV_Transparency or 0.25
VD.KillerFOV_Width         = VD.KillerFOV_Width or 0.18

W.InstantHealSelf = W.InstantHealSelf or false
W.AutoHealAll     = W.AutoHealAll or false

--====================================================--
-- MAIN FUNCTION
--====================================================--
local function __Gluto_Init_Main__()

    local Players           = game:GetService("Players")
    local RunService        = game:GetService("RunService")
    local UserInputService  = game:GetService("UserInputService")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Workspace         = game:GetService("Workspace")
    local CoreGui           = game:GetService("CoreGui")
    local CollectionService = game:GetService("CollectionService")
    local TweenService      = game:GetService("TweenService")
    local GuiService        = game:GetService("GuiService")
    local HttpService       = game:GetService("HttpService")
    local Lighting          = game:GetService("Lighting")
    local SoundService      = game:GetService("SoundService")

    local LocalPlayer = Players.LocalPlayer
    local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled
    local VirtualInputManager = nil
    pcall(function() VirtualInputManager = game:GetService("VirtualInputManager") end)

    if type(getgenv().ConfigData) ~= "table" then getgenv().ConfigData = {} end
    if type(getgenv().Elements)   ~= "table" then getgenv().Elements   = {} end
    local ConfigData = getgenv().ConfigData
    local Elements   = getgenv().Elements

    local AutoSaveEnabled = true

    local function MakeFlag(sec, title)
        local tabName = tostring(sec and sec._tabName or "tab")
        local secName = tostring(sec and sec._sectionName or "sec")
        local t       = tostring(title or "opt")
        local function san(s)
            s = s:gsub("[^%w]", "_")
            s = s:gsub("_+", "_")
            s = s:gsub("^_", ""):gsub("_$", "")
            return s
        end
        return san(tabName) .. "_" .. san(secName) .. "_" .. san(t)
    end

    local UILib = {}
    local _window
    local function corner(o,r) local c=Instance.new("UICorner"); c.CornerRadius=UDim.new(0,r or 8); c.Parent=o end
    local function stroke(o,c,t) local s=Instance.new("UIStroke"); s.Color=c or Color3.new(1,1,1); s.Thickness=t or 1; s.Transparency=.25; s.Parent=o; return s end
    local function label(p,text,size,color,bold) local x=Instance.new("TextLabel"); x.BackgroundTransparency=1; x.Text=tostring(text or ""); x.TextColor3=color or Color3.new(1,1,1); x.TextSize=size or 11; x.Font=bold and Enum.Font.GothamBold or Enum.Font.Gotham; x.TextXAlignment=Enum.TextXAlignment.Left; x.Parent=p; return x end
    local function tw(o,props,t) pcall(function() TweenService:Create(o,TweenInfo.new(t or .15,Enum.EasingStyle.Quart,Enum.EasingDirection.Out),props):Play() end) end
    local function row(parent,h) local f=Instance.new("Frame"); f.BackgroundColor3=Color3.fromRGB(18,18,18); f.BorderSizePixel=0; f.Size=UDim2.new(1,0,0,h or 44); f.Parent=parent; corner(f,7); return f end

--====================================================--
-- COLOR PICKER (MODERN UI - BRIGHTER FIX)
--====================================================--
local ActiveColorPopups = {}

local function GetColorPickerScreenGui()
    local existing = _G.__GlutoColorPickerScreenGui
    if existing and existing.Parent then return existing end
    local parent = SafeGuiParent()
    if not parent then return nil end
    local sg = Instance.new("ScreenGui")
    sg.Name = "GlutoColorPickerLayer"
    sg.ResetOnSpawn = false
    sg.IgnoreGuiInset = true
    sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    sg.DisplayOrder = 1000001
    sg.Parent = parent
    _G.__GlutoColorPickerScreenGui = sg
    return sg
end

local function addColor(sec, o)
    local r = row(sec.Body, 45)
    
    local hoverStroke = Instance.new("UIStroke")
    hoverStroke.Color = Color3.fromRGB(255, 255, 255)
    hoverStroke.Thickness = 1
    hoverStroke.Transparency = 1
    hoverStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    hoverStroke.Parent = r
    
    r.MouseEnter:Connect(function()
        TweenService:Create(r, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(26, 26, 26) }):Play()
        TweenService:Create(hoverStroke, TweenInfo.new(0.2), { Transparency = 0.85 }):Play()
    end)
    r.MouseLeave:Connect(function()
        TweenService:Create(r, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(18, 18, 18) }):Play()
        TweenService:Create(hoverStroke, TweenInfo.new(0.2), { Transparency = 1 }):Play()
    end)

    local t = label(r, o.Title, 11, Color3.fromRGB(245, 245, 245), true)
    t.Position = UDim2.new(0, 14, 0, 0)
    t.Size = UDim2.new(1, -90, 1, 0)

    local btn = Instance.new("TextButton")
    btn.Text = ""
    btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    btn.AutoButtonColor = false
    btn.Position = UDim2.new(1, -62, .5, -12)
    btn.Size = UDim2.fromOffset(50, 24)
    btn.Parent = r
    corner(btn, 12)
    
    local btnStroke = Instance.new("UIStroke")
    btnStroke.Color = Color3.fromRGB(60, 60, 60)
    btnStroke.Thickness = 1
    btnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    btnStroke.Parent = btn
    
    local colorPreview = Instance.new("Frame")
    colorPreview.Size = UDim2.new(1, -6, 1, -6)
    colorPreview.Position = UDim2.new(0, 3, 0, 3)
    colorPreview.BackgroundColor3 = o.Default or Color3.new(1,1,1)
    colorPreview.BorderSizePixel = 0
    colorPreview.Parent = btn
    corner(colorPreview, 9)
    
    local colorPreviewStroke = Instance.new("UIStroke")
    colorPreviewStroke.Color = Color3.fromRGB(0, 0, 0)
    colorPreviewStroke.Thickness = 1
    colorPreviewStroke.Transparency = 0.5
    colorPreviewStroke.Parent = colorPreview

    local value = o.Default or Color3.new(1,1,1)
    local h, s, v = Color3.toHSV(value)
    local popup = nil
    local flag = o.Flag or MakeFlag(sec, o.Title)

    local function fireCallback()
        ConfigData[flag] = { R = value.R, G = value.G, B = value.B, _c3 = true }
        if o.Callback then pcall(o.Callback, value) end
    end

    local function closePopup()
        if popup and popup.Parent then 
            local p = popup
            popup = nil
            TweenService:Create(p, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { BackgroundTransparency = 1 }):Play()
            task.delay(0.16, function() pcall(function() p:Destroy() end) end)
        end
        ActiveColorPopups[btn] = nil
        TweenService:Create(btnStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(60, 60, 60) }):Play()
    end

    local function openPopup()
        if popup and popup.Parent then closePopup(); return end
        for _, closer in pairs(ActiveColorPopups) do pcall(closer) end
        local sg = GetColorPickerScreenGui()
        if not sg then return end

        popup = Instance.new("Frame")
        popup.Name = "GlutoColorPicker"
        popup.Size = UDim2.fromOffset(240, 320)
        -- Background Popup dicerahkan
        popup.BackgroundColor3 = Color3.fromRGB(30, 30, 30) 
        popup.BackgroundTransparency = 1
        popup.BorderSizePixel = 0
        popup.ZIndex = 10
        popup.ClipsDescendants = true
        popup.Parent = sg
        corner(popup, 12)
        
        local popupGrad = Instance.new("UIGradient")
        -- Gradient dicerahkan
        popupGrad.Color = ColorSequence.new(Color3.fromRGB(40,40,40), Color3.fromRGB(20,20,20))
        popupGrad.Rotation = 135
        popupGrad.Parent = popup

        local popupStroke = Instance.new("UIStroke")
        popupStroke.Color = Color3.fromRGB(100,100,100) -- Garis pinggir lebih terang
        popupStroke.Thickness = 1.2
        popupStroke.Transparency = 1
        popupStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        popupStroke.Parent = popup

        local vp = sg.AbsoluteSize
        if vp.X == 0 then
            local cam = workspace.CurrentCamera
            vp = cam and cam.ViewportSize or Vector2.new(1280,720)
        end
        local bPos = btn.AbsolutePosition
        local bSize = btn.AbsoluteSize
        local POP_W, POP_H = 240, 320
        local px = bPos.X + bSize.X + 8
        local py = bPos.Y
        if px + POP_W > vp.X - 8 then px = bPos.X - POP_W - 8 end
        if px < 8 then px = 8 end
        if py + POP_H > vp.Y - 8 then py = vp.Y - POP_H - 8 end
        if py < 8 then py = 8 end
        popup.Position = UDim2.fromOffset(px, py)
        
        TweenService:Create(popup, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { BackgroundTransparency = 0 }):Play()
        TweenService:Create(popupStroke, TweenInfo.new(0.2), { Transparency = 0.3 }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(255, 255, 255) }):Play()

        local hdr = label(popup, o.Title or "Color Picker", 12, Color3.new(1,1,1), true)
        hdr.Position = UDim2.new(0,16,0,12)
        hdr.Size = UDim2.new(1,-50,0,18)

        local closeBtn = Instance.new("TextButton")
        closeBtn.Text = "×"; closeBtn.Font = Enum.Font.GothamBold; closeBtn.TextSize = 16
        closeBtn.TextColor3 = Color3.fromRGB(210,210,210); closeBtn.BackgroundColor3 = Color3.fromRGB(45,45,45)
        closeBtn.AutoButtonColor = false; closeBtn.Position = UDim2.new(1,-30,0,10); closeBtn.Size = UDim2.fromOffset(22,22)
        closeBtn.Parent = popup; corner(closeBtn, 6)
        closeBtn.MouseButton1Click:Connect(closePopup)
        closeBtn.MouseEnter:Connect(function() TweenService:Create(closeBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(200, 55, 55) }):Play() end)
        closeBtn.MouseLeave:Connect(function() TweenService:Create(closeBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(45, 45, 45) }):Play() end)

        -- Kotak Preview Warna (Dicerahkan)
        local previewWrap = Instance.new("Frame")
        previewWrap.Position = UDim2.fromOffset(16, 40); previewWrap.Size = UDim2.new(1, -32, 0, 50)
        previewWrap.BackgroundColor3 = Color3.fromRGB(45, 45, 45); previewWrap.BorderSizePixel = 0
        previewWrap.Parent = popup; corner(previewWrap, 8)
        local previewWrapStroke = Instance.new("UIStroke", previewWrap)
        previewWrapStroke.Color = Color3.fromRGB(80, 80, 80); previewWrapStroke.Thickness = 1; previewWrapStroke.Transparency = 0.3

        local preview = Instance.new("Frame")
        preview.Position = UDim2.fromOffset(4, 4); preview.Size = UDim2.fromOffset(42, 42)
        preview.BackgroundColor3 = value; preview.BorderSizePixel = 0; preview.Parent = previewWrap
        corner(preview, 6); stroke(preview, Color3.fromRGB(0,0,0), 1).Transparency = 0.5

        local hexLbl = label(previewWrap, "Hex: #FFFFFF", 11, Color3.fromRGB(255,255,255), true)
        hexLbl.Position = UDim2.fromOffset(56, 10); hexLbl.Size = UDim2.new(1, -60, 0, 16)
        
        local rgbLbl = label(previewWrap, "RGB: 255, 255, 255", 9, Color3.fromRGB(180,180,180))
        rgbLbl.Position = UDim2.fromOffset(56, 26); rgbLbl.Size = UDim2.new(1, -60, 0, 16)

        -- Slider Modern (Garis lebih tebal & terang)
        local function makeModernSlider(yPos, title)
            local lbl = label(popup, title, 10, Color3.fromRGB(200,200,200), true)
            lbl.Position = UDim2.fromOffset(16, yPos); lbl.Size = UDim2.fromOffset(200, 14)
            
            local bar = Instance.new("Frame")
            bar.Position = UDim2.fromOffset(16, yPos + 18); bar.Size = UDim2.new(1, -32, 0, 8) -- Dari 6 jadi 8
            bar.BackgroundColor3 = Color3.fromRGB(60,60,60); bar.BorderSizePixel = 0; bar.Parent = popup
            corner(bar, 4)
            local barStroke = stroke(bar, Color3.fromRGB(120,120,120), 1)
            barStroke.Transparency = 0.5
            
            local grad = Instance.new("UIGradient"); grad.Parent = bar
            
            local knob = Instance.new("Frame")
            knob.Size = UDim2.fromOffset(18, 18); knob.AnchorPoint = Vector2.new(0.5, 0.5)
            knob.BackgroundColor3 = Color3.new(1,1,1); knob.BorderSizePixel = 0
            knob.Position = UDim2.new(0, 0, 0.5, 0); knob.ZIndex = 5; knob.Parent = bar
            corner(knob, 9)
            local kStroke = Instance.new("UIStroke", knob)
            kStroke.Color = Color3.new(0,0,0); kStroke.Thickness = 1.5; kStroke.Transparency = 0.2

            local hit = Instance.new("TextButton"); hit.Text = ""; hit.BackgroundTransparency = 1
            hit.Size = UDim2.new(1, 0, 1, 24); hit.Position = UDim2.new(0, 0, 0, -8); hit.Parent = bar
            
            return { Bar = bar, Knob = knob, Grad = grad, Hit = hit }
        end

        local hueSlider = makeModernSlider(105, "Hue")
        local satSlider = makeModernSlider(155, "Saturation")
        local valSlider = makeModernSlider(205, "Brightness")

        -- Input Hex (Dicerahkan)
        local hexInput = Instance.new("TextBox")
        hexInput.Position = UDim2.fromOffset(16, 250); hexInput.Size = UDim2.new(1, -32, 0, 32)
        hexInput.BackgroundColor3 = Color3.fromRGB(45, 45, 45); hexInput.BorderSizePixel = 0
        hexInput.Text = ""; hexInput.PlaceholderText = "Paste Hex (#FFFFFF)"
        hexInput.PlaceholderColor3 = Color3.fromRGB(150,150,150); hexInput.TextColor3 = Color3.fromRGB(255,255,255)
        hexInput.Font = Enum.Font.GothamBold; hexInput.TextSize = 11; hexInput.ClearTextOnFocus = false
        hexInput.Parent = popup; corner(hexInput, 8); 
        local hexStroke = stroke(hexInput, Color3.fromRGB(80,80,80), 1)
        hexStroke.Transparency = 0.3

        -- Tombol Apply
        local applyBtn = Instance.new("TextButton")
        applyBtn.Position = UDim2.fromOffset(16, 288); applyBtn.Size = UDim2.new(1, -32, 0, 24)
        applyBtn.BackgroundColor3 = Color3.fromRGB(255,255,255); applyBtn.Text = "APPLY COLOR"
        applyBtn.TextColor3 = Color3.new(0,0,0); applyBtn.Font = Enum.Font.GothamBold
        applyBtn.TextSize = 10; applyBtn.AutoButtonColor = false; applyBtn.Parent = popup
        corner(applyBtn, 6)

        local function refresh()
            local c = Color3.fromHSV(h, s, v)
            preview.BackgroundColor3 = c
            colorPreview.BackgroundColor3 = c
            local r255 = math.floor(c.R * 255 + 0.5)
            local g255 = math.floor(c.G * 255 + 0.5)
            local b255 = math.floor(c.B * 255 + 0.5)
            rgbLbl.Text = ("RGB: %d, %d, %d"):format(r255, g255, b255)
            hexLbl.Text = ("Hex: #%02X%02X%02X"):format(r255, g255, b255)
            
            hueSlider.Knob.Position = UDim2.new(h, 0, 0.5, 0)
            satSlider.Knob.Position = UDim2.new(s, 0, 0.5, 0)
            valSlider.Knob.Position = UDim2.new(v, 0, 0.5, 0)
            
            hueSlider.Grad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0/6, Color3.fromHSV(0/6,1,1)),
                ColorSequenceKeypoint.new(1/6, Color3.fromHSV(1/6,1,1)),
                ColorSequenceKeypoint.new(2/6, Color3.fromHSV(2/6,1,1)),
                ColorSequenceKeypoint.new(3/6, Color3.fromHSV(3/6,1,1)),
                ColorSequenceKeypoint.new(4/6, Color3.fromHSV(4/6,1,1)),
                ColorSequenceKeypoint.new(5/6, Color3.fromHSV(5/6,1,1)),
                ColorSequenceKeypoint.new(6/6, Color3.fromHSV(1,1,1)),
            })
            satSlider.Grad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.fromHSV(h, 0, 1)),
                ColorSequenceKeypoint.new(1, Color3.fromHSV(h, 1, 1)),
            })
            valSlider.Grad.Color = ColorSequence.new({
                ColorSequenceKeypoint.new(0, Color3.new(0,0,0)),
                ColorSequenceKeypoint.new(1, Color3.fromHSV(h, s, 1)),
            })
            value = c; fireCallback()
        end

        local function bindSlider(slider, onChange)
            local dragging2 = false
            local function apply(input)
                local absX = slider.Bar.AbsolutePosition.X
                local absW = slider.Bar.AbsoluteSize.X
                if absW <= 0 then return end
                local rel = math.clamp((input.Position.X - absX) / absW, 0, 1)
                onChange(rel); refresh()
            end
            slider.Hit.InputBegan:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1
                    or inp.UserInputType == Enum.UserInputType.Touch then
                    dragging2 = true; apply(inp)
                    TweenService:Create(slider.Knob, TweenInfo.new(0.15), { Size = UDim2.fromOffset(22, 22) }):Play()
                end
            end)
            UserInputService.InputChanged:Connect(function(inp)
                if not dragging2 then return end
                if inp.UserInputType == Enum.UserInputType.MouseMovement
                    or inp.UserInputType == Enum.UserInputType.Touch then
                    apply(inp)
                end
            end)
            UserInputService.InputEnded:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1
                    or inp.UserInputType == Enum.UserInputType.Touch then
                    dragging2 = false
                    TweenService:Create(slider.Knob, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(18, 18) }):Play()
                end
            end)
        end

        bindSlider(hueSlider, function(x) h = x end)
        bindSlider(satSlider, function(x) s = x end)
        bindSlider(valSlider, function(x) v = x end)

        hexInput.FocusLost:Connect(function()
            local txt = (hexInput.Text or ""):gsub("#", ""):gsub("%s", "")
            if #txt == 6 then
                local rr = tonumber(txt:sub(1,2), 16)
                local gg = tonumber(txt:sub(3,4), 16)
                local bb = tonumber(txt:sub(5,6), 16)
                if rr and gg and bb then
                    local c = Color3.fromRGB(rr, gg, bb)
                    h, s, v = Color3.toHSV(c); refresh()
                end
            end
            hexInput.Text = ""
        end)

        applyBtn.MouseButton1Click:Connect(function() refresh(); closePopup() end)
        applyBtn.MouseEnter:Connect(function() TweenService:Create(applyBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(220, 220, 220) }):Play() end)
        applyBtn.MouseLeave:Connect(function() TweenService:Create(applyBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }):Play() end)

        ActiveColorPopups[btn] = closePopup
        refresh()
    end

    btn.MouseButton1Click:Connect(openPopup)

    local obj = {
        Set = function(_, v2, silent)
            if type(v2) == "table" and v2._c3 then v2 = Color3.new(v2.R or 1, v2.G or 1, v2.B or 1) end
            if typeof(v2) == "Color3" then
                value = v2; h, s, v = Color3.toHSV(v2)
                colorPreview.BackgroundColor3 = v2
                ConfigData[flag] = { R = v2.R, G = v2.G, B = v2.B, _c3 = true }
                if not silent then fireCallback() end
            end
        end,
        Get = function() return value end,
        Flag = flag
    }
    Elements[flag] = obj
    return obj
end

--====================================================--
-- TOGGLE (ULTRA MODERN - FIXED)
--====================================================--
local LOCK_ICON_IMAGE = "rbxassetid://6723197051"

local function addToggle(sec, o)
    local r = row(sec.Body, o.Content and 56 or 44)
    
    -- Efek Hover di Baris
    local hoverStroke = Instance.new("UIStroke")
    hoverStroke.Color = Color3.fromRGB(255, 255, 255)
    hoverStroke.Thickness = 1
    hoverStroke.Transparency = 1
    hoverStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    hoverStroke.Parent = r
    
    r.MouseEnter:Connect(function()
        TweenService:Create(r, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(26, 26, 26) }):Play()
        TweenService:Create(hoverStroke, TweenInfo.new(0.2), { Transparency = 0.85 }):Play()
    end)
    r.MouseLeave:Connect(function()
        TweenService:Create(r, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(18, 18, 18) }):Play()
        TweenService:Create(hoverStroke, TweenInfo.new(0.2), { Transparency = 1 }):Play()
    end)

    local t = label(r, o.Title, 11, Color3.fromRGB(245, 245, 245), true)
    t.Position = UDim2.new(0, 14, 0, o.Content and 7 or 0)
    t.Size = UDim2.new(1, -110, 0, 18)
    
    if o.Content then
        local d = label(r, o.Content, 9, Color3.fromRGB(145, 145, 145))
        d.Position = UDim2.new(0, 14, 0, 26)
        d.Size = UDim2.new(1, -110, 0, 18)
        d.TextTruncate = Enum.TextTruncate.AtEnd
    end

    -- ===== TRACK (LINTASAN TOGGLE) =====
    local b = Instance.new("TextButton")
    b.Text = ""
    b.AutoButtonColor = false
    b.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    b.Size = UDim2.fromOffset(48, 26)
    b.Position = UDim2.new(1, -62, 0.5, -13)
    b.ClipsDescendants = true
    b.Parent = r
    corner(b, 13)

    local bgGrad = Instance.new("UIGradient")
    bgGrad.Color = ColorSequence.new(Color3.fromRGB(45, 45, 45), Color3.fromRGB(25, 25, 25))
    bgGrad.Rotation = 90
    bgGrad.Parent = b

    local bStroke = Instance.new("UIStroke")
    bStroke.Color = Color3.fromRGB(70, 70, 70)
    bStroke.Thickness = 1
    bStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    bStroke.Parent = b

    -- Ikon OFF (Silang)
    local crossIcon = Instance.new("TextLabel")
    crossIcon.BackgroundTransparency = 1
    crossIcon.Text = "✕"
    crossIcon.TextColor3 = Color3.fromRGB(150, 150, 150)
    crossIcon.TextSize = 10
    crossIcon.Font = Enum.Font.GothamBold
    crossIcon.Position = UDim2.new(1, -18, 0.5, -7)
    crossIcon.Size = UDim2.fromOffset(14, 14)
    crossIcon.TextTransparency = 0
    crossIcon.ZIndex = 1
    crossIcon.Parent = b

    -- KNOB (BULATAN)
    local k = Instance.new("Frame")
    k.BackgroundColor3 = Color3.fromRGB(180, 180, 180)
    k.Size = UDim2.fromOffset(20, 20)
    k.Position = UDim2.new(0, 3, 0.5, -10)
    k.ZIndex = 2
    k.Parent = b
    corner(k, 10)
    
    -- Efek Shadow di bawah Knob
    local kShadow = Instance.new("Frame")
    kShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    kShadow.BackgroundTransparency = 0.6
    kShadow.Size = UDim2.fromScale(1, 1)
    kShadow.Position = UDim2.fromOffset(0, 2)
    kShadow.ZIndex = 1
    kShadow.Parent = k
    corner(kShadow, 10)

    local kStroke = Instance.new("UIStroke")
    kStroke.Color = Color3.fromRGB(0, 0, 0)
    kStroke.Thickness = 1
    kStroke.Transparency = 0.8
    kStroke.Parent = k

    -- Ikon ON (Ceklis)
    local check = Instance.new("TextLabel")
    check.BackgroundTransparency = 1
    check.Text = "✓"
    check.TextColor3 = Color3.fromRGB(15, 15, 15)
    check.TextSize = 12
    check.Font = Enum.Font.GothamBlack
    check.Size = UDim2.fromScale(1, 1)
    check.TextTransparency = 1
    check.Rotation = -90
    check.ZIndex = 3
    check.Parent = k

    -- Wadah Ripple
    local rippleHolder = Instance.new("Frame")
    rippleHolder.Size = UDim2.fromScale(1, 1)
    rippleHolder.BackgroundTransparency = 1
    rippleHolder.ClipsDescendants = true
    rippleHolder.Parent = b
    corner(rippleHolder, 13)

    -- Indikator Lock
    local isLocked = o.Locked == true
    if isLocked then
        local lockIcon = Instance.new("ImageLabel")
        lockIcon.Name = "LockIcon"
        lockIcon.BackgroundTransparency = 1
        lockIcon.Image = LOCK_ICON_IMAGE
        lockIcon.ImageColor3 = Color3.fromRGB(255, 200, 60)
        lockIcon.AnchorPoint = Vector2.new(1, 0.5)
        lockIcon.Position = UDim2.new(1, -84, .5, 0)
        lockIcon.Size = UDim2.fromOffset(15, 15)
        lockIcon.Parent = r
    end

    local state = (o.Default == true) and true or false
    if isLocked then state = false end
    local flag = o.Flag or MakeFlag(sec, o.Title)
    local obj = {}

    -- Fungsi Animasi
    local function set(v, silent)
        state = (not not v) and true or false
        
        -- Animasi Background Tombol
        TweenService:Create(b, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {
            BackgroundColor3 = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(35, 35, 35)
        }):Play()
        
        -- FIX: UIGradient.Color GAK BISA DI-TWEEN. Jadi kita ubah langsung.
        bgGrad.Color = state and ColorSequence.new(Color3.fromRGB(255,255,255), Color3.fromRGB(220,220,220)) 
                             or ColorSequence.new(Color3.fromRGB(45,45,45), Color3.fromRGB(25,25,25))
        
        TweenService:Create(bStroke, TweenInfo.new(0.3), {
            Color = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(70, 70, 70),
            Transparency = state and 0 or 0.2
        }):Play()
        
        -- Animasi Knob (Pake Elastic biar mantul)
        TweenService:Create(k, TweenInfo.new(0.4, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {
            Position = state and UDim2.new(1, -23, 0.5, -10) or UDim2.new(0, 3, 0.5, -10),
            BackgroundColor3 = state and Color3.fromRGB(15, 15, 15) or Color3.fromRGB(180, 180, 180)
        }):Play()
        
        -- Animasi Ikon
        TweenService:Create(crossIcon, TweenInfo.new(0.2), { TextTransparency = state and 1 or 0 }):Play()
        TweenService:Create(check, TweenInfo.new(0.3, Enum.EasingStyle.Back), { 
            TextTransparency = state and 0 or 1,
            Rotation = state and 0 or -90
        }):Play()
        
        ConfigData[flag] = state
        if not silent and o.Callback then pcall(o.Callback, state) end
    end

    local shakeBusy = false
    b.MouseButton1Click:Connect(function()
        if isLocked then
            if shakeBusy then return end
            shakeBusy = true
            pcall(function()
                local baseX = -62
                local ti = TweenInfo.new(0.06, Enum.EasingStyle.Linear)
                TweenService:Create(b, ti, {Position = UDim2.new(1, baseX + 4, .5, -13)}):Play()
                task.wait(0.06)
                TweenService:Create(b, ti, {Position = UDim2.new(1, baseX - 4, .5, -13)}):Play()
                task.wait(0.06)
                TweenService:Create(b, ti, {Position = UDim2.new(1, baseX + 3, .5, -13)}):Play()
                task.wait(0.06)
                TweenService:Create(b, ti, {Position = UDim2.new(1, baseX - 3, .5, -13)}):Play()
                task.wait(0.06)
                TweenService:Create(b, ti, {Position = UDim2.new(1, baseX, .5, -13)}):Play()
            end)
            pcall(function()
                local nf = getgenv().__Gluto_VD_Notify
                if nf then nf("🔒 Locked Feature", (o.Title or "Feature") .. " tidak bisa diaktifkan", 2) end
            end)
            shakeBusy = false
            return
        end
        
        -- Efek Ripple (Gelombang)
        local rFx = Instance.new("Frame")
        rFx.BackgroundColor3 = state and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        rFx.BackgroundTransparency = 0.5
        rFx.BorderSizePixel = 0
        rFx.Size = UDim2.fromOffset(0, 0)
        rFx.Position = UDim2.fromScale(0.5, 0.5)
        rFx.AnchorPoint = Vector2.new(0.5, 0.5)
        rFx.Parent = rippleHolder
        corner(rFx, 13)
        
        TweenService:Create(rFx, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.fromOffset(60, 60),
            BackgroundTransparency = 1
        }):Play()
        task.delay(0.4, function() if rFx then rFx:Destroy() end end)

        set(not state, false)
    end)

    if isLocked then
        set(false, true)
        ConfigData[flag] = false
    else
        set(state, true)
        if state and o.Callback then
            task.defer(function() pcall(o.Callback, true) end)
        end
    end

    function obj:Set(v, silent)
        if isLocked then
            set(false, true)
            ConfigData[flag] = false
            return
        end
        set(v, silent)
    end
    function obj:Get() return state end
    obj.Flag = flag
    obj.Locked = isLocked
    Elements[flag] = obj
    return obj
end

    --====================================================--
-- BUTTON (ULTRA MODERN UI)
--====================================================--
local function addButton(sec, o)
    local hasSub = o.SubCallback ~= nil
    local r = Instance.new("Frame")
    r.BackgroundTransparency = 1
    r.Size = UDim2.new(1, 0, 0, hasSub and 92 or 46)
    r.Parent = sec.Body

    -- Fungsi pembantu buat bikin tombol modern (biar gak nulis 2x)
    local function createModernBtn(parent, title, yPos, isSub)
        local b = Instance.new("TextButton")
        b.Text = title or "Button"
        b.AutoButtonColor = false
        b.BackgroundColor3 = isSub and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(35, 35, 35)
        b.TextColor3 = Color3.fromRGB(245, 245, 245)
        b.TextSize = 11
        b.Font = Enum.Font.GothamBold
        b.Size = UDim2.new(1, 0, 0, 42)
        b.Position = UDim2.new(0, 0, 0, yPos)
        b.ClipsDescendants = true
        b.Parent = parent
        corner(b, 8)

        -- Efek Gradien (Kaca)
        local grad = Instance.new("UIGradient")
        grad.Color = isSub 
            and ColorSequence.new(Color3.fromRGB(30, 30, 30), Color3.fromRGB(12, 12, 12))
            or ColorSequence.new(Color3.fromRGB(45, 45, 45), Color3.fromRGB(20, 20, 20))
        grad.Rotation = 135
        grad.Parent = b

        local bStroke = Instance.new("UIStroke")
        bStroke.Color = isSub and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(70, 70, 70)
        bStroke.Thickness = 1.2
        bStroke.Transparency = isSub and 0.5 or 0.2
        bStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        bStroke.Parent = b

        -- Teks di dalam
        local lbl = Instance.new("TextLabel")
        lbl.BackgroundTransparency = 1
        lbl.Size = UDim2.fromScale(1, 1)
        lbl.Font = Enum.Font.GothamBold
        lbl.Text = b.Text
        lbl.TextColor3 = isSub and Color3.fromRGB(200, 200, 200) or Color3.fromRGB(255, 255, 255)
        lbl.TextSize = 11
        lbl.ZIndex = 2
        lbl.Parent = b
        b.Text = "" -- Sembunyiin teks bawaan tombol

        -- Animasi Hover
        b.MouseEnter:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.15), {
                BackgroundColor3 = isSub and Color3.fromRGB(35, 35, 35) or Color3.fromRGB(55, 55, 55)
            }):Play()
            TweenService:Create(bStroke, TweenInfo.new(0.15), {
                Color = Color3.fromRGB(255, 255, 255),
                Transparency = 0
            }):Play()
            if lbl then TweenService:Create(lbl, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(255, 255, 255) }):Play() end
        end)

        b.MouseLeave:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.15), {
                BackgroundColor3 = isSub and Color3.fromRGB(20, 20, 20) or Color3.fromRGB(35, 35, 35)
            }):Play()
            TweenService:Create(bStroke, TweenInfo.new(0.15), {
                Color = isSub and Color3.fromRGB(50, 50, 50) or Color3.fromRGB(70, 70, 70),
                Transparency = isSub and 0.5 or 0.2
            }):Play()
            if lbl then TweenService:Create(lbl, TweenInfo.new(0.15), { TextColor3 = isSub and Color3.fromRGB(200, 200, 200) or Color3.fromRGB(255, 255, 255) }):Play() end
        end)

        -- Animasi Klik (Mencet)
        b.MouseButton1Down:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.08), { Size = UDim2.new(0.96, 0, 0, 38), Position = UDim2.new(0.02, 0, 0, yPos + 2) }):Play()
        end)
        b.MouseButton1Up:Connect(function()
            TweenService:Create(b, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(1, 0, 0, 42), Position = UDim2.new(0, 0, 0, yPos) }):Play()
        end)

        return b
    end

    -- Bikin Tombol Utama
    local mainBtn = createModernBtn(r, o.Title, 0, false)
    mainBtn.MouseButton1Click:Connect(function() 
        if o.Callback then pcall(o.Callback) end 
    end)

    -- Bikin Tombol Sub (Kalau ada)
    if hasSub then
        local subBtn = createModernBtn(r, o.SubTitle or "Sub Button", 46, true)
        subBtn.MouseButton1Click:Connect(function() 
            if o.SubCallback then pcall(o.SubCallback) end 
        end)
    end
    
    return mainBtn
end
--====================================================--
-- CHECKBOX (ULTRA MODERN - KIRI)
--====================================================--
local function addCheckbox(sec, o)
    local r = row(sec.Body, o.Content and 56 or 44)
    
    -- Efek Hover di Baris
    local hoverStroke = Instance.new("UIStroke")
    hoverStroke.Color = Color3.fromRGB(255, 255, 255)
    hoverStroke.Thickness = 1
    hoverStroke.Transparency = 1
    hoverStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    hoverStroke.Parent = r
    
    r.MouseEnter:Connect(function()
        TweenService:Create(r, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(26, 26, 26) }):Play()
        TweenService:Create(hoverStroke, TweenInfo.new(0.2), { Transparency = 0.85 }):Play()
    end)
    r.MouseLeave:Connect(function()
        TweenService:Create(r, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(18, 18, 18) }):Play()
        TweenService:Create(hoverStroke, TweenInfo.new(0.2), { Transparency = 1 }):Play()
    end)

    -- ===== KOTAK CHECKBOX (KIRI) =====
    local b = Instance.new("TextButton")
    b.Text = ""
    b.AutoButtonColor = false
    b.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    b.Size = UDim2.fromOffset(22, 22)
    b.Position = UDim2.new(0, 14, 0.5, -11)
    b.Parent = r
    corner(b, 6)
    
    local bgGrad = Instance.new("UIGradient")
    bgGrad.Color = ColorSequence.new(Color3.fromRGB(40, 40, 40), Color3.fromRGB(20, 20, 20))
    bgGrad.Rotation = 135
    bgGrad.Parent = b

    local bStroke = Instance.new("UIStroke")
    bStroke.Color = Color3.fromRGB(70, 70, 70)
    bStroke.Thickness = 1.2
    bStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    bStroke.Parent = b

    -- Efek Glow di belakang kotak (Pas ON)
    local glow = Instance.new("Frame")
    glow.AnchorPoint = Vector2.new(0.5, 0.5)
    glow.Position = UDim2.new(0.5, 0, 0.5, 0)
    glow.Size = UDim2.fromOffset(28, 28)
    glow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    glow.BackgroundTransparency = 1
    glow.BorderSizePixel = 0
    glow.ZIndex = 1
    glow.Parent = b
    corner(glow, 8)

    -- Ikon Ceklis (✓)
    local check = Instance.new("TextLabel")
    check.BackgroundTransparency = 1
    check.Text = "✓"
    check.TextColor3 = Color3.fromRGB(10, 10, 10)
    check.TextSize = 16
    check.Font = Enum.Font.GothamBlack
    check.Size = UDim2.fromScale(0, 0) -- Awalnya 0 buat animasi pop
    check.Position = UDim2.fromScale(0.5, 0.5)
    check.AnchorPoint = Vector2.new(0.5, 0.5)
    check.Rotation = -90
    check.TextTransparency = 1
    check.TextScaled = true
    check.ZIndex = 3
    check.Parent = b

    -- Wadah Ripple
    local rippleHolder = Instance.new("Frame")
    rippleHolder.Size = UDim2.fromScale(1, 1)
    rippleHolder.BackgroundTransparency = 1
    rippleHolder.ClipsDescendants = true
    rippleHolder.Parent = b
    corner(rippleHolder, 6)

    -- Title
    local t = label(r, o.Title, 11, Color3.fromRGB(245, 245, 245), true)
    t.Position = UDim2.new(0, 46, 0, o.Content and 7 or 0)
    t.Size = UDim2.new(1, -60, 0, 18)
    
    -- Content / Deskripsi
    if o.Content then
        local d = label(r, o.Content, 9, Color3.fromRGB(145, 145, 145))
        d.Position = UDim2.new(0, 46, 0, 26)
        d.Size = UDim2.new(1, -60, 0, 18)
        d.TextTruncate = Enum.TextTruncate.AtEnd
    end

    -- Indikator Lock
    local isLocked = o.Locked == true
    if isLocked then
        local lockIcon = Instance.new("ImageLabel")
        lockIcon.Name = "LockIcon"
        lockIcon.BackgroundTransparency = 1
        lockIcon.Image = LOCK_ICON_IMAGE
        lockIcon.ImageColor3 = Color3.fromRGB(255, 200, 60)
        lockIcon.AnchorPoint = Vector2.new(1, 0.5)
        lockIcon.Position = UDim2.new(1, -14, .5, 0) 
        lockIcon.Size = UDim2.fromOffset(15, 15)
        lockIcon.Parent = r
    end

    local state = (o.Default == true) and true or false
    if isLocked then state = false end
    local flag = o.Flag or MakeFlag(sec, o.Title)
    local obj = {}

    -- Fungsi Animasi State
    local function set(v, silent)
        state = (not not v) and true or false
        
        -- Animasi Kotak (Background)
        TweenService:Create(b, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
            BackgroundColor3 = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(25, 25, 25)
        }):Play()
        
        -- Ganti warna gradient instan (karena gabisa di-tween)
        bgGrad.Color = state and ColorSequence.new(Color3.fromRGB(255,255,255), Color3.fromRGB(220,220,220)) 
                             or ColorSequence.new(Color3.fromRGB(40,40,40), Color3.fromRGB(20,20,20))
        
        -- Animasi Stroke
        TweenService:Create(bStroke, TweenInfo.new(0.25), {
            Color = state and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(70, 70, 70),
            Transparency = state and 0 or 0.2
        }):Play()
        
        -- Animasi Glow
        TweenService:Create(glow, TweenInfo.new(0.3), {
            BackgroundTransparency = state and 0.8 or 1,
            Size = state and UDim2.fromOffset(34, 34) or UDim2.fromOffset(28, 28)
        }):Play()

        -- Animasi Ceklis (Pop & Rotate)
        TweenService:Create(check, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            TextTransparency = state and 0 or 1,
            Size = state and UDim2.fromScale(1, 1) or UDim2.fromScale(0, 0),
            Rotation = state and 0 or -90
        }):Play()
        
        ConfigData[flag] = state
        if not silent and o.Callback then pcall(o.Callback, state) end
    end

    local shakeBusy = false
    b.MouseButton1Click:Connect(function()
        if isLocked then
            if shakeBusy then return end
            shakeBusy = true
            pcall(function()
                local baseX = 14
                local ti = TweenInfo.new(0.06, Enum.EasingStyle.Linear)
                TweenService:Create(b, ti, {Position = UDim2.new(0, baseX + 4, 0.5, -11)}):Play()
                task.wait(0.06)
                TweenService:Create(b, ti, {Position = UDim2.new(0, baseX - 4, 0.5, -11)}):Play()
                task.wait(0.06)
                TweenService:Create(b, ti, {Position = UDim2.new(0, baseX + 3, 0.5, -11)}):Play()
                task.wait(0.06)
                TweenService:Create(b, ti, {Position = UDim2.new(0, baseX - 3, 0.5, -11)}):Play()
                task.wait(0.06)
                TweenService:Create(b, ti, {Position = UDim2.new(0, baseX, 0.5, -11)}):Play()
            end)
            pcall(function()
                local nf = getgenv().__Gluto_VD_Notify
                if nf then nf("🔒 Locked Feature", (o.Title or "Feature") .. " tidak bisa diaktifkan", 2) end
            end)
            shakeBusy = false
            return
        end
        
        -- Efek Ripple
        local rFx = Instance.new("Frame")
        rFx.BackgroundColor3 = state and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        rFx.BackgroundTransparency = 0.6
        rFx.BorderSizePixel = 0
        rFx.Size = UDim2.fromOffset(0, 0)
        rFx.Position = UDim2.fromScale(0.5, 0.5)
        rFx.AnchorPoint = Vector2.new(0.5, 0.5)
        rFx.Parent = rippleHolder
        corner(rFx, 6)
        
        TweenService:Create(rFx, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.fromOffset(40, 40),
            BackgroundTransparency = 1
        }):Play()
        task.delay(0.4, function() if rFx then rFx:Destroy() end end)

        -- Animasi Klik (Mengecil lalu membesar)
        TweenService:Create(b, TweenInfo.new(0.08), { Size = UDim2.fromOffset(18, 18), Position = UDim2.new(0, 16, 0.5, -9) }):Play()
        task.delay(0.1, function()
            TweenService:Create(b, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { 
                Size = UDim2.fromOffset(22, 22), Position = UDim2.new(0, 14, 0.5, -11) 
            }):Play()
        end)
        
        set(not state, false)
    end)

    if isLocked then
        set(false, true)
        ConfigData[flag] = false
    else
        set(state, true)
        if state and o.Callback then
            task.defer(function() pcall(o.Callback, true) end)
        end
    end

    function obj:Set(v, silent)
        if isLocked then
            set(false, true)
            ConfigData[flag] = false
            return
        end
        set(v, silent)
    end
    function obj:Get() return state end
    obj.Flag = flag
    obj.Locked = isLocked
    Elements[flag] = obj
    return obj
end

    --====================================================--
-- SLIDER (ULTRA MODERN)
--====================================================--
local function addSlider(sec, o)
    local r = row(sec.Body, 68)
    
    -- Efek Hover di Baris
    local hoverStroke = Instance.new("UIStroke")
    hoverStroke.Color = Color3.fromRGB(255, 255, 255)
    hoverStroke.Thickness = 1
    hoverStroke.Transparency = 1
    hoverStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    hoverStroke.Parent = r
    
    r.MouseEnter:Connect(function()
        TweenService:Create(r, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(26, 26, 26) }):Play()
        TweenService:Create(hoverStroke, TweenInfo.new(0.2), { Transparency = 0.85 }):Play()
    end)
    r.MouseLeave:Connect(function()
        TweenService:Create(r, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(18, 18, 18) }):Play()
        TweenService:Create(hoverStroke, TweenInfo.new(0.2), { Transparency = 1 }):Play()
    end)

    -- Title
    local t = label(r, o.Title, 11, Color3.fromRGB(245, 245, 245), true)
    t.Position = UDim2.new(0, 14, 0, 8)
    t.Size = UDim2.new(1, -100, 0, 18)

    -- Value Badge (Kotak Angka Kanan Atas)
    local valBadge = Instance.new("Frame")
    valBadge.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    valBadge.Size = UDim2.fromOffset(64, 22)
    valBadge.AnchorPoint = Vector2.new(1, 0)
    valBadge.Position = UDim2.new(1, -14, 0, 7)
    valBadge.Parent = r
    corner(valBadge, 6)
    
    local valBadgeStroke = Instance.new("UIStroke")
    valBadgeStroke.Color = Color3.fromRGB(70, 70, 70)
    valBadgeStroke.Thickness = 1
    valBadgeStroke.Transparency = 0.3
    valBadgeStroke.Parent = valBadge

    local vl = label(valBadge, "", 10, Color3.fromRGB(255, 255, 255), true)
    vl.TextXAlignment = Enum.TextXAlignment.Center
    vl.Size = UDim2.fromScale(1, 1)
    vl.Position = UDim2.fromScale(0, 0)

    -- ===== TRACK (Lintasan Slider) =====
    local bar = Instance.new("Frame")
    bar.BackgroundColor3 = Color3.fromRGB(25, 25, 25) -- Warna track lebih gelap
    bar.BorderSizePixel = 0
    bar.Position = UDim2.new(0, 14, 0, 44)
    bar.Size = UDim2.new(1, -28, 0, 8) -- Ketebalan 8px
    bar.Parent = r
    corner(bar, 4)
    
    local barStroke = Instance.new("UIStroke")
    barStroke.Color = Color3.fromRGB(0, 0, 0)
    barStroke.Thickness = 1
    barStroke.Transparency = 0.5
    barStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    barStroke.Parent = bar

    -- Fill (Garis Warna yang Terisi)
    local fill = Instance.new("Frame")
    fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    fill.BorderSizePixel = 0
    fill.Size = UDim2.new(0, 0, 1, 0)
    fill.Parent = bar
    corner(fill, 4)
    
    local fillGrad = Instance.new("UIGradient")
    fillGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(180, 180, 180)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))
    })
    fillGrad.Parent = fill

    -- Glow di belakang Knob (Pas ditarik)
    local knobGlow = Instance.new("Frame")
    knobGlow.AnchorPoint = Vector2.new(0.5, 0.5)
    knobGlow.Position = UDim2.new(0, 0, 0.5, 0)
    knobGlow.Size = UDim2.fromOffset(26, 26)
    knobGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knobGlow.BackgroundTransparency = 1 -- Ilangin di awal
    knobGlow.ZIndex = 2
    knobGlow.Parent = bar
    corner(knobGlow, 13)

    -- Knob (Bulatan Penarik)
    local knob = Instance.new("Frame")
    knob.Name = "Knob"
    knob.AnchorPoint = Vector2.new(0.5, 0.5)
    knob.Position = UDim2.new(0, 0, 0.5, 0)
    knob.Size = UDim2.fromOffset(18, 18)
    knob.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    knob.BorderSizePixel = 0
    knob.ZIndex = 3
    knob.Parent = bar
    corner(knob, 9)

    -- Shadow di bawah Knob
    local knobShadow = Instance.new("Frame")
    knobShadow.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    knobShadow.BackgroundTransparency = 0.6
    knobShadow.Size = UDim2.fromScale(1, 1)
    knobShadow.Position = UDim2.fromOffset(0, 2)
    knobShadow.ZIndex = 2
    knobShadow.Parent = knob
    corner(knobShadow, 9)

    local knobStroke = Instance.new("UIStroke")
    knobStroke.Color = Color3.fromRGB(0, 0, 0)
    knobStroke.Thickness = 1.5
    knobStroke.Transparency = 0.5
    knobStroke.Parent = knob

    -- Titik kecil di tengah Knob
    local knobDot = Instance.new("Frame")
    knobDot.AnchorPoint = Vector2.new(0.5, 0.5)
    knobDot.Position = UDim2.fromScale(0.5, 0.5)
    knobDot.Size = UDim2.fromOffset(4, 4)
    knobDot.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    knobDot.BorderSizePixel = 0
    knobDot.ZIndex = 4
    knobDot.Parent = knob
    corner(knobDot, 2)

    -- Hitbox (Area buat nge-drag)
    local hit = Instance.new("TextButton")
    hit.Text = ""
    hit.BackgroundTransparency = 1
    hit.Size = UDim2.new(1, 24, 1, 40)
    hit.Position = UDim2.new(0, -12, 0, -16)
    hit.ZIndex = 5
    hit.Parent = bar

    local mn, mx = tonumber(o.Min or 0), tonumber(o.Max or 100)
    local val = tonumber(o.Default or mn) or mn
    local drag = false
    local flag = o.Flag or MakeFlag(sec, o.Title)

    -- Fungsi Update Nilai & Animasi
    local function set(v, silent)
        v = math.clamp(tonumber(v) or mn, mn, mx)
        local inc = tonumber(o.Increment)
        if inc and inc > 0 then v = math.floor((v - mn) / inc + .5) * inc + mn end
        
        local oldVal = val
        val = v
        
        local a = (mx == mn) and 0 or (v - mn) / (mx - mn)
        
        -- Animasi Posisi Fill dan Knob
        TweenService:Create(fill, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Size = UDim2.new(a, 0, 1, 0)
        }):Play()
        
        TweenService:Create(knobGlow, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(a, 0, 0.5, 0)
        }):Play()
        
        TweenService:Create(knob, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
            Position = UDim2.new(a, 0, 0.5, 0)
        }):Play()
        
        -- Efek Animasi Badge (Membesar dikit pas nilai berubah)
        if val ~= oldVal then
            TweenService:Create(valBadge, TweenInfo.new(0.1), { Size = UDim2.fromOffset(68, 24), Position = UDim2.new(1, -14, 0, 6) }):Play()
            TweenService:Create(vl, TweenInfo.new(0.1), { TextSize = 11 }):Play()
            task.delay(0.15, function()
                TweenService:Create(valBadge, TweenInfo.new(0.15), { Size = UDim2.fromOffset(64, 22), Position = UDim2.new(1, -14, 0, 7) }):Play()
                TweenService:Create(vl, TweenInfo.new(0.15), { TextSize = 10 }):Play()
            end)
        end
        
        -- Update Text
        vl.Text = tostring(math.floor(v * 100) / 100) .. tostring(o.Suffix or "")
        
        ConfigData[flag] = v
        if not silent and o.Callback then pcall(o.Callback, v) end
    end

    -- Fungsi Interaksi Drag
    local function updateFromInput(input)
        local rel = math.clamp((input.Position.X - bar.AbsolutePosition.X) / math.max(bar.AbsoluteSize.X, 1), 0, 1)
        set(mn + (mx - mn) * rel, false)
    end

    hit.MouseButton1Down:Connect(function()
        drag = true
        -- Animasi pas ditarik (Knob membesar & Glow nyala)
        TweenService:Create(knob, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(22, 22) }):Play()
        TweenService:Create(knobDot, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(0, 0, 0) }):Play()
        TweenService:Create(knobGlow, TweenInfo.new(0.2), { BackgroundTransparency = 0.6, Size = UDim2.fromOffset(32, 32) }):Play()
        TweenService:Create(barStroke, TweenInfo.new(0.2), { Color = Color3.fromRGB(255, 255, 255), Transparency = 0 }):Play()
    end)

    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            if drag then
                drag = false
                -- Animasi pas dilepas (Knob mengecil & Glow ilang)
                TweenService:Create(knob, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(18, 18) }):Play()
                TweenService:Create(knobDot, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(150, 150, 150) }):Play()
                TweenService:Create(knobGlow, TweenInfo.new(0.25), { BackgroundTransparency = 1, Size = UDim2.fromOffset(26, 26) }):Play()
                TweenService:Create(barStroke, TweenInfo.new(0.2), { Color = Color3.fromRGB(0, 0, 0), Transparency = 0.5 }):Play()
            end
        end
    end)

    UserInputService.InputChanged:Connect(function(i)
        if drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            updateFromInput(i)
        end
    end)
    
    -- Fitur klik di lintasan (bukan cuma di drag)
    hit.MouseButton1Click:Connect(function()
        if not drag then
            local mouse = UserInputService:GetMouseLocation()
            local rel = math.clamp((mouse.X - bar.AbsolutePosition.X) / math.max(bar.AbsoluteSize.X, 1), 0, 1)
            
            -- Animasi pas diklik langsung (meluncur mulus)
            local targetVal = mn + (mx - mn) * rel
            local inc = tonumber(o.Increment)
            if inc and inc > 0 then targetVal = math.floor((targetVal - mn) / inc + .5) * inc + mn end
            local a = (mx == mn) and 0 or (targetVal - mn) / (mx - mn)
            
            TweenService:Create(fill, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(a, 0, 1, 0) }):Play()
            TweenService:Create(knobGlow, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Position = UDim2.new(a, 0, 0.5, 0) }):Play()
            TweenService:Create(knob, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Position = UDim2.new(a, 0, 0.5, 0) }):Play()
            
            task.delay(0.25, function() set(targetVal, false) end)
        end
    end)

    set(val, true)
    
    local obj = {Set = function(_, v, s) set(v, s) end, Get = function() return val end, Flag = flag}
    Elements[flag] = obj
    return obj
end
--====================================================--
-- DROPDOWN (ULTRA MODERN - FIXED SHADOW)
--====================================================--
local ActiveDropdownPopups = {}

local function GetDropdownScreenGui()
    local existing = _G.__GlutoDropdownScreenGui
    if existing and existing.Parent then return existing end
    local parent = SafeGuiParent()
    if not parent then return nil end
    local sg = Instance.new("ScreenGui")
    sg.Name = "GlutoDropdownLayer"; sg.ResetOnSpawn = false
    sg.IgnoreGuiInset = true; sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    sg.DisplayOrder = 1000000; sg.Parent = parent
    _G.__GlutoDropdownScreenGui = sg
    return sg
end

local function addDropdown(sec, o)
    local r = row(sec.Body, 48)
    
    -- Efek Hover di Baris
    local hoverStroke = Instance.new("UIStroke")
    hoverStroke.Color = Color3.fromRGB(255, 255, 255)
    hoverStroke.Thickness = 1
    hoverStroke.Transparency = 1
    hoverStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    hoverStroke.Parent = r
    
    r.MouseEnter:Connect(function()
        TweenService:Create(r, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(26, 26, 26) }):Play()
        TweenService:Create(hoverStroke, TweenInfo.new(0.2), { Transparency = 0.85 }):Play()
    end)
    r.MouseLeave:Connect(function()
        TweenService:Create(r, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(18, 18, 18) }):Play()
        TweenService:Create(hoverStroke, TweenInfo.new(0.2), { Transparency = 1 }):Play()
    end)

    local t = label(r, o.Title or "Dropdown", 11, Color3.fromRGB(245,245,245), true)
    t.Position = UDim2.new(0, 14, 0, 0); t.Size = UDim2.new(1, -200, 1, 0)
    t.TextYAlignment = Enum.TextYAlignment.Center

    -- ===== TOMBOL UTAMA DROPDOWN =====
    local btn = Instance.new("TextButton")
    btn.AutoButtonColor = false; btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30); btn.Text = ""
    btn.AnchorPoint = Vector2.new(1, 0.5); btn.Position = UDim2.new(1, -14, 0.5, 0)
    btn.Size = UDim2.new(0, 170, 0, 34); btn.ClipsDescendants = true; btn.Parent = r
    corner(btn, 8)
    
    local btnGrad = Instance.new("UIGradient")
    btnGrad.Color = ColorSequence.new(Color3.fromRGB(45, 45, 45), Color3.fromRGB(22, 22, 22))
    btnGrad.Rotation = 135
    btnGrad.Parent = btn

    local btnStroke = stroke(btn, Color3.fromRGB(70,70,70), 1)
    btnStroke.Transparency = 0.2

    local valueLbl = Instance.new("TextLabel")
    valueLbl.BackgroundTransparency = 1; valueLbl.Text = "Select..."
    valueLbl.TextColor3 = Color3.fromRGB(235,235,235); valueLbl.TextSize = 11
    valueLbl.Font = Enum.Font.GothamBold; valueLbl.TextXAlignment = Enum.TextXAlignment.Left
    valueLbl.TextYAlignment = Enum.TextYAlignment.Center; valueLbl.TextTruncate = Enum.TextTruncate.AtEnd
    valueLbl.Position = UDim2.new(0, 14, 0, 0); valueLbl.Size = UDim2.new(1, -40, 1, 0)
    valueLbl.Parent = btn

    local chevron = Instance.new("TextLabel")
    chevron.BackgroundTransparency = 1; chevron.Text = "▼"
    chevron.TextColor3 = Color3.fromRGB(160,160,160); chevron.TextSize = 10
    chevron.Font = Enum.Font.GothamBold; chevron.AnchorPoint = Vector2.new(0.5, 0.5)
    chevron.Position = UDim2.new(1, -14, 0.5, 0); chevron.Size = UDim2.fromOffset(12, 12)
    chevron.Parent = btn

    -- Efek Hover Tombol
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(50,50,50) }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(150,150,150) }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(30,30,30) }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(70,70,70) }):Play()
    end)

    local val = o.Default or ((o.Options or {})[1])
    local multiValues = {}
    if o.Multi and type(val) == "table" then
        for k, v in pairs(val) do
            if type(k) == "string" then multiValues[k] = v
            elseif type(v) == "string" then multiValues[v] = true end
        end
    end

    local flag = o.Flag or MakeFlag(sec, o.Title)
    local popup = nil
    local popupShadow = nil -- TAMBAHKAN VARIABEL BUAT NYIMPEN SHADOW
    local optionMeta = {}
    local searchBoxRef = nil

    local function closePopup()
        if popup and popup.Parent then
            local p = popup; popup = nil
            local s = popupShadow; popupShadow = nil
            
            -- Animasi Tutup (Scale Down + Fade)
            TweenService:Create(p, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, p.Size.X.Offset * 0.95, 0, p.Size.Y.Offset * 0.95) 
            }):Play()
            
            -- FIX: Animasi & Hapus Shadow juga!
            if s then
                TweenService:Create(s, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { 
                    ImageTransparency = 1,
                    Size = UDim2.new(0, s.Size.X.Offset * 0.95, 0, s.Size.Y.Offset * 0.95)
                }):Play()
            end

            task.delay(0.15, function() 
                pcall(function() p:Destroy() end) 
                if s then pcall(function() s:Destroy() end) end
            end)
        end
        ActiveDropdownPopups[btn] = nil
        TweenService:Create(chevron, TweenInfo.new(0.3, Enum.EasingStyle.Back), { Rotation = 0 }):Play()
        TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(30,30,30) }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(70,70,70) }):Play()
    end

    local function getDisplayText()
        if o.Multi then
            local count, first = 0, nil
            for k, v in pairs(multiValues) do
                if v then count = count + 1; if not first then first = k end end
            end
            if count == 0 then return "None" end
            if count == 1 then return tostring(first) end
            return count .. " selected"
        end
        return tostring(val or "Select...")
    end

    local function refreshButton() valueLbl.Text = getDisplayText() end

    local function fireCallback()
        if o.Multi then
            ConfigData[flag] = multiValues
            if o.Callback then pcall(o.Callback, multiValues) end
        else
            ConfigData[flag] = val
            if o.Callback then pcall(o.Callback, val) end
        end
    end

    local function isSelected(v2)
        if o.Multi then return multiValues[v2] == true end
        return tostring(val) == tostring(v2)
    end

    local function refreshOptionStates()
        for opt, meta in pairs(optionMeta) do
            if opt.Parent then
                if isSelected(meta.Value) then
                    TweenService:Create(opt, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(45,45,45) }):Play()
                    TweenService:Create(meta.TextLbl, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(255,255,255) }):Play()
                    
                    if meta.Accent then TweenService:Create(meta.Accent, TweenInfo.new(0.15), { BackgroundTransparency = 0 }):Play() end
                    
                    if meta.Check then 
                        meta.Check.Size = UDim2.fromOffset(0, 0)
                        TweenService:Create(meta.Check, TweenInfo.new(0.3, Enum.EasingStyle.Back), { TextTransparency = 0, Size = UDim2.fromOffset(16, 16) }):Play() 
                    end
                    if meta.Dot then
                        meta.Dot.Size = UDim2.fromOffset(0, 0)
                        TweenService:Create(meta.Dot, TweenInfo.new(0.3, Enum.EasingStyle.Back), { BackgroundTransparency = 0, Size = UDim2.fromOffset(6, 6) }):Play() 
                    end
                else
                    TweenService:Create(opt, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(25,25,25) }):Play()
                    TweenService:Create(meta.TextLbl, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(180,180,180) }):Play()
                    
                    if meta.Accent then TweenService:Create(meta.Accent, TweenInfo.new(0.15), { BackgroundTransparency = 1 }):Play() end
                    
                    if meta.Check then TweenService:Create(meta.Check, TweenInfo.new(0.15), { TextTransparency = 1, Size = UDim2.fromOffset(0, 0) }):Play() end
                    if meta.Dot then TweenService:Create(meta.Dot, TweenInfo.new(0.15), { BackgroundTransparency = 1, Size = UDim2.fromOffset(0, 0) }):Play() end
                end
            end
        end
    end

    local function buildPopup()
        for _, closer in pairs(ActiveDropdownPopups) do pcall(closer) end
        -- FIX: Bersihin sisa shadow kalau ada yang nyangkut sebelum buka baru
        if popupShadow and popupShadow.Parent then pcall(function() popupShadow:Destroy() end); popupShadow = nil end

        local sg = GetDropdownScreenGui()
        if not sg then return end

        local options = o.Options or {}
        local optionCount = #options
        local useSearch = optionCount > 7
        local ITEM_H  = 32; local PAD = 8; local MAX_VIS = 7
        local visible = math.min(optionCount, MAX_VIS)
        local listH   = math.max(visible * ITEM_H + math.max(visible - 1, 0) * 2, ITEM_H)
        local searchH = useSearch and 38 or 0
        local popH    = listH + PAD * 2 + searchH
        local popW    = math.max(btn.AbsoluteSize.X, 170)

        local vp = sg.AbsoluteSize
        if vp.X == 0 then
            local cam = workspace.CurrentCamera
            vp = cam and cam.ViewportSize or Vector2.new(1280, 720)
        end
        local bPos  = btn.AbsolutePosition
        local bSize = btn.AbsoluteSize
        local px = bPos.X + bSize.X - popW
        local py = bPos.Y + bSize.Y + 6
        if px < 8 then px = 8 end
        if px + popW > vp.X - 8 then px = vp.X - popW - 8 end
        if py + popH > vp.Y - 8 then py = bPos.Y - popH - 6; if py < 8 then py = 8 end end

        -- ===== DROP SHADOW POPUP =====
        local shadow = Instance.new("ImageLabel")
        shadow.Name = "Shadow"
        shadow.BackgroundTransparency = 1
        shadow.Image = "rbxassetid://6014261993"
        shadow.ImageColor3 = Color3.new(0,0,0)
        shadow.ImageTransparency = 0.5
        shadow.ScaleType = Enum.ScaleType.Slice
        shadow.SliceCenter = Rect.new(49, 49, 450, 450)
        shadow.Size = UDim2.fromOffset(popW + 20, popH + 20)
        shadow.Position = UDim2.fromOffset(px - 10, py - 5)
        shadow.ZIndex = 9
        shadow.Parent = sg
        popupShadow = shadow -- Simpan referensi ke variabel luar

        popup = Instance.new("Frame")
        popup.Name = "GlutoDropdownPopup"
        popup.BackgroundColor3 = Color3.fromRGB(30, 30, 30) 
        popup.BackgroundTransparency = 1
        popup.BorderSizePixel = 0; popup.ZIndex = 10; popup.ClipsDescendants = true
        popup.Parent = sg; corner(popup, 10)

        local popupGrad = Instance.new("UIGradient")
        popupGrad.Color = ColorSequence.new(Color3.fromRGB(40, 40, 40), Color3.fromRGB(15, 15, 15))
        popupGrad.Rotation = 135
        popupGrad.Parent = popup

        local popupStroke = Instance.new("UIStroke")
        popupStroke.Color = Color3.fromRGB(100,100,100); popupStroke.Thickness = 1.2
        popupStroke.Transparency = 1; popupStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        popupStroke.Parent = popup

        searchBoxRef = nil
        if useSearch then
            local searchWrap = Instance.new("Frame")
            searchWrap.BackgroundColor3 = Color3.fromRGB(45, 45, 45); searchWrap.BorderSizePixel = 0
            searchWrap.Position = UDim2.fromOffset(PAD, PAD); searchWrap.Size = UDim2.new(1, -PAD * 2, 0, 28)
            searchWrap.ZIndex = 11; searchWrap.Parent = popup; corner(searchWrap, 6)
            local sStroke = Instance.new("UIStroke", searchWrap)
            sStroke.Color = Color3.fromRGB(80,80,80); sStroke.Thickness = 1; sStroke.Transparency = 0.5

            local sIcon = Instance.new("TextLabel")
            sIcon.BackgroundTransparency = 1; sIcon.Text = "🔍"
            sIcon.TextSize = 10; sIcon.Size = UDim2.fromOffset(16, 16)
            sIcon.Position = UDim2.new(0, 8, 0.5, -8); sIcon.ZIndex = 12
            sIcon.Parent = searchWrap

            local searchBox = Instance.new("TextBox")
            searchBox.BackgroundTransparency = 1; searchBox.Text = ""
            searchBox.PlaceholderText = "Search..."; searchBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
            searchBox.TextColor3 = Color3.fromRGB(255, 255, 255); searchBox.TextSize = 11
            searchBox.Font = Enum.Font.GothamBold; searchBox.TextXAlignment = Enum.TextXAlignment.Left
            searchBox.ClearTextOnFocus = false
            searchBox.Position = UDim2.new(0, 26, 0, 0); searchBox.Size = UDim2.new(1, -34, 1, 0)
            searchBox.ZIndex = 12; searchBox.Parent = searchWrap
            searchBoxRef = searchBox
        end

        local listFrame = Instance.new("ScrollingFrame")
        listFrame.BackgroundTransparency = 1; listFrame.BorderSizePixel = 0
        listFrame.Position = UDim2.fromOffset(PAD, PAD + searchH)
        listFrame.Size = UDim2.new(1, -PAD * 2, 1, -(PAD * 2) - searchH)
        listFrame.CanvasSize = UDim2.new(); listFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
        listFrame.ScrollBarThickness = 2; listFrame.ScrollBarImageColor3 = Color3.fromRGB(120, 120, 120)
        listFrame.ZIndex = 11; listFrame.Parent = popup

        local listLayout = Instance.new("UIListLayout")
        listLayout.Padding = UDim.new(0, 2); listLayout.SortOrder = Enum.SortOrder.LayoutOrder
        listLayout.Parent = listFrame

        optionMeta = {}

        for i, v in ipairs(options) do
            local opt = Instance.new("TextButton")
            opt.Name = "Opt_" .. tostring(i); opt.Text = ""
            opt.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            opt.AutoButtonColor = false; opt.Size = UDim2.new(1, 0, 0, ITEM_H)
            opt.LayoutOrder = i; opt.ZIndex = 12; opt.Parent = listFrame; corner(opt, 6)
            opt.ClipsDescendants = true

            local textLbl = Instance.new("TextLabel")
            textLbl.BackgroundTransparency = 1; textLbl.Text = tostring(v)
            textLbl.TextColor3 = Color3.fromRGB(180, 180, 180); textLbl.TextSize = 11
            textLbl.Font = Enum.Font.GothamMedium; textLbl.TextXAlignment = Enum.TextXAlignment.Left
            textLbl.TextTruncate = Enum.TextTruncate.AtEnd
            textLbl.Position = UDim2.fromOffset(16, 0); textLbl.Size = UDim2.new(1, -40, 1, 0)
            textLbl.ZIndex = 13; textLbl.Parent = opt

            local accent = Instance.new("Frame")
            accent.AnchorPoint = Vector2.new(0, 0.5); accent.Position = UDim2.new(0, 6, 0.5, 0)
            accent.Size = UDim2.fromOffset(3, 14); accent.BackgroundColor3 = Color3.fromRGB(255,255,255)
            accent.BackgroundTransparency = 1; accent.BorderSizePixel = 0; accent.ZIndex = 13
            accent.Parent = opt; corner(accent, 2)

            local check, dot = nil, nil
            if o.Multi then
                check = Instance.new("TextLabel")
                check.BackgroundTransparency = 1; check.Text = "✓"
                check.TextColor3 = Color3.fromRGB(255,255,255); check.TextSize = 14
                check.Font = Enum.Font.GothamBold; check.AnchorPoint = Vector2.new(1, 0.5)
                check.Position = UDim2.new(1, -12, 0.5, 0); check.Size = UDim2.fromOffset(0, 0) 
                check.TextTransparency = 1; check.ZIndex = 13; check.Parent = opt
            else
                dot = Instance.new("Frame")
                dot.AnchorPoint = Vector2.new(1, 0.5); dot.Position = UDim2.new(1, -14, 0.5, 0)
                dot.Size = UDim2.fromOffset(0, 0); dot.BackgroundColor3 = Color3.fromRGB(255,255,255)
                dot.BackgroundTransparency = 1; dot.BorderSizePixel = 0; dot.ZIndex = 13
                dot.Parent = opt; corner(dot, 3)
            end

            local rippleHolder = Instance.new("Frame")
            rippleHolder.Size = UDim2.fromScale(1,1); rippleHolder.BackgroundTransparency = 1
            rippleHolder.ClipsDescendants = true; rippleHolder.ZIndex = 12; rippleHolder.Parent = opt
            corner(rippleHolder, 6)

            optionMeta[opt] = { Accent = accent, Check = check, Dot = dot, Value = v, TextLbl = textLbl }

            opt.MouseEnter:Connect(function()
                if not isSelected(v) then 
                    TweenService:Create(opt, TweenInfo.new(0.12), { BackgroundColor3 = Color3.fromRGB(40,40,40) }):Play()
                    TweenService:Create(textLbl, TweenInfo.new(0.12), { TextColor3 = Color3.fromRGB(255,255,255) }):Play()
                end
            end)
            opt.MouseLeave:Connect(function()
                if not isSelected(v) then 
                    TweenService:Create(opt, TweenInfo.new(0.12), { BackgroundColor3 = Color3.fromRGB(25,25,25) }):Play()
                    TweenService:Create(textLbl, TweenInfo.new(0.12), { TextColor3 = Color3.fromRGB(180,180,180) }):Play()
                end
            end)
            
            local clicker = Instance.new("TextButton")
            clicker.BackgroundTransparency = 1; clicker.Text = ""
            clicker.Size = UDim2.fromScale(1,1); clicker.ZIndex = 14; clicker.Parent = opt
            
            clicker.MouseButton1Click:Connect(function()
                local rFx = Instance.new("Frame")
                rFx.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                rFx.BackgroundTransparency = 0.7
                rFx.BorderSizePixel = 0
                rFx.Size = UDim2.fromOffset(0, 0)
                rFx.Position = UDim2.fromScale(0.5, 0.5)
                rFx.AnchorPoint = Vector2.new(0.5, 0.5)
                rFx.Parent = rippleHolder
                corner(rFx, 6)
                TweenService:Create(rFx, TweenInfo.new(0.4, Enum.EasingStyle.Quad), { Size = UDim2.fromOffset(200, 50), BackgroundTransparency = 1 }):Play()
                task.delay(0.4, function() if rFx then rFx:Destroy() end end)

                if o.Multi then
                    if multiValues[v] then multiValues[v] = nil else multiValues[v] = true end
                    refreshButton(); refreshOptionStates(); fireCallback()
                else
                    val = v; refreshButton(); refreshOptionStates(); fireCallback()
                    task.delay(0.1, closePopup)
                end
            end)
        end

        if searchBoxRef then
            searchBoxRef:GetPropertyChangedSignal("Text"):Connect(function()
                local term = string.lower(searchBoxRef.Text or "")
                for opt, meta in pairs(optionMeta) do
                    if opt.Parent then
                        local match = term == "" or string.find(string.lower(tostring(meta.Value)), term, 1, true) ~= nil
                        opt.Visible = match
                    end
                end
            end)
        end

        refreshOptionStates()

        popup.Size = UDim2.new(0, popW * 0.9, 0, popH * 0.9)
        popup.Position = UDim2.fromOffset(px + (popW * 0.05), py + (popH * 0.05))
        
        TweenService:Create(popup, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { 
            Size = UDim2.fromOffset(popW, popH),
            Position = UDim2.fromOffset(px, py),
            BackgroundTransparency = 0
        }):Play()
        
        TweenService:Create(shadow, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { 
            Size = UDim2.fromOffset(popW + 20, popH + 20),
            Position = UDim2.fromOffset(px - 10, py - 5),
            ImageTransparency = 0.5
        }):Play()
        
        TweenService:Create(popupStroke, TweenInfo.new(0.2), { Transparency = 0.3 }):Play()
        TweenService:Create(chevron, TweenInfo.new(0.3, Enum.EasingStyle.Back), { Rotation = 180 }):Play()
        TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(50,50,50) }):Play()
        TweenService:Create(btnStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(150,150,150) }):Play()

        ActiveDropdownPopups[btn] = closePopup
    end

    btn.MouseButton1Click:Connect(function()
        if popup and popup.Parent then closePopup() else buildPopup() end
    end)

    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if not (popup and popup.Parent) then return end
        if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
        local mp = input.Position
        local bPos = btn.AbsolutePosition; local bSz = btn.AbsoluteSize
        local pPos = popup.AbsolutePosition; local pSz = popup.AbsoluteSize
        local inBtn = mp.X >= bPos.X and mp.X <= bPos.X + bSz.X and mp.Y >= bPos.Y and mp.Y <= bPos.Y + bSz.Y
        local inPop = mp.X >= pPos.X and mp.X <= pPos.X + pSz.X and mp.Y >= pPos.Y and mp.Y <= pPos.Y + pSz.Y
        if not inBtn and not inPop then closePopup() end
    end)

    refreshButton()
    ConfigData[flag] = o.Multi and multiValues or val

    local obj = {}
    function obj:Set(v, silent)
        if o.Multi then
            multiValues = {}
            if type(v) == "table" then
                for k, mv in pairs(v) do
                    if type(k) == "string" then multiValues[k] = mv
                    elseif type(mv) == "string" then multiValues[mv] = true end
                end
            end
        else val = v end
        refreshButton()
        ConfigData[flag] = o.Multi and multiValues or val
        if not silent then fireCallback() end
    end
    function obj:Get() if o.Multi then return multiValues end; return val end
    function obj:SetValues(list, selected, silent)
        o.Options = list or {}
        if selected ~= nil then
            if o.Multi then
                multiValues = {}
                if type(selected) == "table" then
                    for k, v in pairs(selected) do
                        if type(k) == "string" then multiValues[k] = v
                        elseif type(v) == "string" then multiValues[v] = true end
                    end
                end
            else val = selected end
        end
        refreshButton()
        if not silent then fireCallback() end
    end
    obj.Flag = flag
    Elements[flag] = obj
    return obj
end

    --====================================================--
-- INPUT (ULTRA MODERN)
--====================================================--
local function addInput(sec, o)
    local r = row(sec.Body, 68)
    
    -- Efek Hover di Baris
    local hoverStroke = Instance.new("UIStroke")
    hoverStroke.Color = Color3.fromRGB(255, 255, 255)
    hoverStroke.Thickness = 1
    hoverStroke.Transparency = 1
    hoverStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    hoverStroke.Parent = r
    
    r.MouseEnter:Connect(function()
        TweenService:Create(r, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(26, 26, 26) }):Play()
        TweenService:Create(hoverStroke, TweenInfo.new(0.2), { Transparency = 0.85 }):Play()
    end)
    r.MouseLeave:Connect(function()
        TweenService:Create(r, TweenInfo.new(0.2), { BackgroundColor3 = Color3.fromRGB(18, 18, 18) }):Play()
        TweenService:Create(hoverStroke, TweenInfo.new(0.2), { Transparency = 1 }):Play()
    end)

    -- Title
    local t = label(r, o.Title, 10, Color3.fromRGB(235,235,235), true)
    t.Position = UDim2.new(0, 14, 0, 8)
    t.Size = UDim2.new(1, -28, 0, 16)

    -- ===== KOTAK INPUT UTAMA =====
    local wrap = Instance.new("Frame")
    wrap.Position = UDim2.new(0, 14, 0, 28)
    wrap.Size = UDim2.new(1, -28, 0, 30)
    wrap.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    wrap.BorderSizePixel = 0
    wrap.Parent = r
    corner(wrap, 8)

    local wrapGrad = Instance.new("UIGradient")
    wrapGrad.Color = ColorSequence.new(Color3.fromRGB(35, 35, 35), Color3.fromRGB(15, 15, 15))
    wrapGrad.Rotation = 135
    wrapGrad.Parent = wrap

    local wrapStroke = Instance.new("UIStroke")
    wrapStroke.Color = Color3.fromRGB(60, 60, 60)
    wrapStroke.Thickness = 1.2
    wrapStroke.Transparency = 0.3
    wrapStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    wrapStroke.Parent = wrap

    -- Ikon Pena di Kiri
    local icon = Instance.new("TextLabel")
    icon.BackgroundTransparency = 1
    icon.Text = "✎"
    icon.TextColor3 = Color3.fromRGB(130, 130, 130)
    icon.TextSize = 14
    icon.Font = Enum.Font.GothamBold
    icon.Position = UDim2.new(0, 8, 0, 0)
    icon.Size = UDim2.fromOffset(20, 30)
    icon.ZIndex = 2
    icon.Parent = wrap

    -- TextBox
    local b = Instance.new("TextBox")
    b.ClearTextOnFocus = false
    b.Text = tostring(o.Default or "")
    b.PlaceholderText = o.Placeholder or "Type here..."
    b.PlaceholderColor3 = Color3.fromRGB(100, 100, 100)
    b.TextColor3 = Color3.fromRGB(255, 255, 255)
    b.TextSize = 11
    b.Font = Enum.Font.GothamMedium
    b.TextXAlignment = Enum.TextXAlignment.Left
    b.BackgroundTransparency = 1
    b.Position = UDim2.new(0, 30, 0, 0)
    b.Size = UDim2.new(1, -38, 1, 0)
    b.ZIndex = 2
    b.Parent = wrap

    -- ===== EFEK FOKUS (Pas Lagi Ngetik) =====
    b.Focused:Connect(function()
        TweenService:Create(wrapStroke, TweenInfo.new(0.2), { 
            Color = Color3.fromRGB(255, 255, 255), 
            Transparency = 0 
        }):Play()
        TweenService:Create(wrap, TweenInfo.new(0.2), { 
            BackgroundColor3 = Color3.fromRGB(40, 40, 40) 
        }):Play()
        TweenService:Create(icon, TweenInfo.new(0.2), { 
            TextColor3 = Color3.fromRGB(255, 255, 255) 
        }):Play()
    end)

    b.FocusLost:Connect(function()
        TweenService:Create(wrapStroke, TweenInfo.new(0.2), { 
            Color = Color3.fromRGB(60, 60, 60), 
            Transparency = 0.3 
        }):Play()
        TweenService:Create(wrap, TweenInfo.new(0.2), { 
            BackgroundColor3 = Color3.fromRGB(25, 25, 25) 
        }):Play()
        TweenService:Create(icon, TweenInfo.new(0.2), { 
            TextColor3 = Color3.fromRGB(130, 130, 130) 
        }):Play()

        local flag = o.Flag or MakeFlag(sec, o.Title)
        ConfigData[flag] = b.Text
        if o.Callback then pcall(o.Callback, b.Text) end
    end)

    -- Logika Simpan & Load Config
    local flag = o.Flag or MakeFlag(sec, o.Title)
    local obj = {
        Set = function(_, v, s)
            b.Text = tostring(v or "")
            ConfigData[flag] = b.Text
            if not s and o.Callback then pcall(o.Callback, b.Text) end
        end,
        Get = function() return b.Text end,
        Flag = flag
    }
    Elements[flag] = obj
    return obj
end

    local function addKeybind(sec,o)
        local r=row(sec.Body,45)
        local t=label(r,o.Title,11,Color3.fromRGB(245,245,245),true)
        t.Position=UDim2.new(0,11,0,0); t.Size=UDim2.new(1,-105,1,0)
        local b=Instance.new("TextButton")
        b.Text=o.Default and o.Default.Name or "None"; b.AutoButtonColor=false
        b.BackgroundColor3=Color3.fromRGB(30,30,30); b.TextColor3=Color3.fromRGB(225,225,225)
        b.TextSize=10; b.Font=Enum.Font.GothamMedium
        b.Position=UDim2.new(1,-94,0,6); b.Size=UDim2.fromOffset(84,33)
        b.Parent=r; corner(b,7); stroke(b,Color3.fromRGB(55,55,55))
        local key=o.Default
        local flag = o.Flag or MakeFlag(sec, o.Title)
        b.MouseButton1Click:Connect(function()
            b.Text="Press key..."
            local c
            c=UserInputService.InputBegan:Connect(function(i,gp)
                if gp then return end
                if i.UserInputType==Enum.UserInputType.Keyboard then
                    key=i.KeyCode; b.Text=key.Name
                    ConfigData[flag] = key.Name; c:Disconnect()
                    if o.Callback then pcall(o.Callback,key) end
                end
            end)
        end)
        local obj = {
            Set = function(_,v,s)
                if type(v) == "string" then
                    if v == "None" or v == "" then key = nil
                    else key = Enum.KeyCode[v] end
                else key = v end
                b.Text = key and key.Name or "None"
                ConfigData[flag] = key and key.Name or "None"
                if not s and o.Callback then pcall(o.Callback, key) end
            end,
            Get = function() return key end,
            Flag = flag
        }
        Elements[flag] = obj
        return obj
    end

local function addDivider(sec, o)
    local r = Instance.new("Frame")
    r.BackgroundTransparency = 1
    r.Size = UDim2.new(1, 0, 0, 24)
    r.Parent = sec.Body

    local line = Instance.new("Frame")
    line.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    line.BorderSizePixel = 0
    line.Size = UDim2.new(1, 0, 0, 1)
    line.Position = UDim2.new(0, 0, 0.5, -0.5)
    line.Parent = r

    if o and o.Title then
        local text = label(r, string.upper(o.Title), 9, Color3.fromRGB(150, 150, 150), true)
        text.Size = UDim2.new(1, 0, 0, 16)
        text.Position = UDim2.new(0, 0, 0.5, -8)
        text.TextXAlignment = Enum.TextXAlignment.Center
        text.ZIndex = 2
        
        local bg = Instance.new("Frame")
        bg.Size = UDim2.fromOffset(100, 16)
        bg.Position = UDim2.new(0.5, 0, 0.5, -8)
        bg.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
        bg.BorderSizePixel = 0
        bg.Parent = r
        corner(bg, 4)
        
        text.Parent = bg
    end
end

    local function addParagraph(sec,o)
        local r=row(sec.Body,62)
        local t=label(r,o.Title or "Info",11,Color3.fromRGB(245,245,245),true)
        t.Position=UDim2.new(0,11,0,7); t.Size=UDim2.new(1,-22,0,18)
        local c=label(r,o.Content or "",9,Color3.fromRGB(150,150,150))
        c.Position=UDim2.new(0,11,0,28); c.Size=UDim2.new(1,-22,0,28); c.TextWrapped=true
        return r
    end

    local function section(tab, name)
    local card = Instance.new("Frame")
    card.Name = "Section_" .. tostring(name)
    card.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    card.BorderSizePixel = 0
    card.Size = UDim2.new(1, -2, 0, 0)
    card.AutomaticSize = Enum.AutomaticSize.Y
    card.ClipsDescendants = false
    card.Parent = tab.Page
    corner(card, 12)

    local cardGrad = Instance.new("UIGradient")
    cardGrad.Color = ColorSequence.new(Color3.fromRGB(22, 22, 22), Color3.fromRGB(12, 12, 12))
    cardGrad.Rotation = 135
    cardGrad.Parent = card

    local cardStroke = Instance.new("UIStroke")
    cardStroke.Name = "SectionStroke"
    cardStroke.Color = Color3.fromRGB(60, 60, 60)
    cardStroke.Thickness = 1
    cardStroke.Transparency = 0.2
    cardStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    cardStroke.Parent = card

    -- ===== HEADER =====
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.BackgroundTransparency = 1
    header.Position = UDim2.new(0, 0, 0, 0)
    header.Size = UDim2.new(1, 0, 0, 42)
    header.Parent = card

    -- Area Klik (Biar bisa buka-tutup dari header)
    local headerBtn = Instance.new("TextButton")
    headerBtn.Text = ""
    headerBtn.BackgroundTransparency = 1
    headerBtn.Size = UDim2.fromScale(1, 1)
    headerBtn.Parent = header

    -- Efek Hover Header
    headerBtn.MouseEnter:Connect(function()
        TweenService:Create(cardStroke, TweenInfo.new(0.2), { Color = Color3.fromRGB(100, 100, 100) }):Play()
    end)
    headerBtn.MouseLeave:Connect(function()
        TweenService:Create(cardStroke, TweenInfo.new(0.2), { Color = Color3.fromRGB(60, 60, 60) }):Play()
    end)

    local dotGlow = Instance.new("Frame")
    dotGlow.Name = "AccentDotGlow"
    dotGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    dotGlow.BackgroundTransparency = 0.85
    dotGlow.BorderSizePixel = 0
    dotGlow.Size = UDim2.fromOffset(12, 12)
    dotGlow.Position = UDim2.new(0, 16, 0.5, -6)
    dotGlow.Parent = header
    corner(dotGlow, 6)

    local dot = Instance.new("Frame")
    dot.Name = "AccentDot"
    dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    dot.BorderSizePixel = 0
    dot.Size = UDim2.fromOffset(6, 6)
    dot.Position = UDim2.new(0, 19, 0.5, -3)
    dot.Parent = header
    corner(dot, 3)

    -- Animasi Glow Dot
    task.spawn(function()
        while dotGlow.Parent do
            TweenService:Create(dotGlow, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { BackgroundTransparency = 0.95, Size = UDim2.fromOffset(16, 16), Position = UDim2.new(0, 14, 0.5, -8) }):Play()
            task.wait(1.2)
            if not dotGlow.Parent then break end
            TweenService:Create(dotGlow, TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { BackgroundTransparency = 0.8, Size = UDim2.fromOffset(12, 12), Position = UDim2.new(0, 16, 0.5, -6) }):Play()
            task.wait(1.2)
        end
    end)

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.BackgroundTransparency = 1
    title.Text = string.upper(tostring(name or "Section"))
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 12
    title.Font = Enum.Font.GothamBold
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.Position = UDim2.new(0, 36, 0, 0)
    title.Size = UDim2.new(1, -70, 1, 0)
    title.Parent = header

    -- Ikon Panah (Chevron)
    local chevron = Instance.new("TextLabel")
    chevron.Name = "Chevron"
    chevron.BackgroundTransparency = 1
    chevron.Text = "▼"
    chevron.TextColor3 = Color3.fromRGB(150, 150, 150)
    chevron.TextSize = 12
    chevron.Font = Enum.Font.GothamBold
    chevron.AnchorPoint = Vector2.new(1, 0.5)
    chevron.Position = UDim2.new(1, -16, 0.5, 0)
    chevron.Size = UDim2.fromOffset(20, 20)
    chevron.Rotation = -90 -- Mulai dari posisi nutup
    chevron.Parent = header

    -- Garis Pemisah Pudar (Gradient)
    local divider = Instance.new("Frame")
    divider.Name = "Divider"
    divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    divider.BorderSizePixel = 0
    divider.Position = UDim2.new(0, 16, 0, 42)
    divider.Size = UDim2.new(1, -32, 0, 1)
    divider.Parent = card
    
    local divGrad = Instance.new("UIGradient")
    divGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.5, 0.7),
        NumberSequenceKeypoint.new(1, 1)
    })
    divGrad.Parent = divider

    -- ===== BODY =====
    local bodyWrap = Instance.new("Frame")
    bodyWrap.Name = "BodyWrap"
    bodyWrap.BackgroundTransparency = 1
    bodyWrap.Position = UDim2.new(0, 0, 0, 42)
    bodyWrap.Size = UDim2.new(1, 0, 0, 0)
    bodyWrap.AutomaticSize = Enum.AutomaticSize.Y
    bodyWrap.ClipsDescendants = true
    bodyWrap.Parent = card

    local body = Instance.new("Frame")
    body.Name = "Body"
    body.BackgroundTransparency = 1
    body.Position = UDim2.new(0, 10, 0, 6)
    body.Size = UDim2.new(1, -20, 0, 0)
    body.AutomaticSize = Enum.AutomaticSize.Y
    body.Parent = bodyWrap

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 6)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = body

    local pad = Instance.new("UIPadding")
    pad.PaddingBottom = UDim.new(0, 12)
    pad.Parent = body

    -- ===== LOGIKA BUKA TUTUP =====
    local collapsed = true
    local isAnimating = false

    local function toggleCollapse()
        if isAnimating then return end
        isAnimating = true
        collapsed = not collapsed
        
        if not collapsed then
            -- Animasi Buka
            bodyWrap.Visible = true
            divider.Visible = true
            bodyWrap.Size = UDim2.new(1, 0, 0, 0)
            bodyWrap.Position = UDim2.new(0, 0, 0, 42)
            
            TweenService:Create(chevron, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Rotation = 0 }):Play()
            TweenService:Create(divider, TweenInfo.new(0.2), { BackgroundTransparency = 0 }):Play()
            
            -- Animasi Slide (Geser Turun)
            bodyWrap.Position = UDim2.new(0, 0, 0, 38)
            TweenService:Create(bodyWrap, TweenInfo.new(0.25, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                Position = UDim2.new(0, 0, 0, 42)
            }):Play()
        else
            -- Animasi Tutup
            TweenService:Create(chevron, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Rotation = -90 }):Play()
            TweenService:Create(divider, TweenInfo.new(0.2), { BackgroundTransparency = 1 }):Play()
            
            -- Animasi Slide (Geser Naik)
            TweenService:Create(bodyWrap, TweenInfo.new(0.2, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                Position = UDim2.new(0, 0, 0, 38)
            }):Play()
            
            task.delay(0.2, function()
                bodyWrap.Visible = false
                divider.Visible = false
                isAnimating = false
            end)
            return
        end
        task.delay(0.3, function() isAnimating = false end)
    end

    headerBtn.MouseButton1Click:Connect(toggleCollapse)

    -- Set awal (Tutup)
    bodyWrap.Visible = false
    divider.Visible = false
    chevron.Rotation = -90

    local s = { Body = body, Root = card, Header = header, Collapsed = collapsed }
s.AddToggle = addToggle
s.AddCheckbox = addCheckbox
s.AddButton = addButton
s.AddSlider = addSlider
s.AddDropdown = addDropdown
s.AddInput = addInput
s.AddKeybind = addKeybind
s.AddColorPicker = addColor
s.AddParagraph = addParagraph
s.AddDivider = addDivider
    
    s._tabName = tab and tab._name
    s._tabPage = tab and tab.Page
    s._sectionName = name
    s._expand = function() if collapsed then toggleCollapse() end end
    return s
end

    function UILib:Window(cfg)
    local safeParent = SafeGuiParent()
    local gui = Instance.new("ScreenGui")
    gui.Name = "PromersCustomUI"
    gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true
    gui.DisplayOrder = 999999
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = safeParent

    local shadow = Instance.new("ImageLabel")
    shadow.Name = "WindowShadow"
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.Position = UDim2.fromScale(0.5, 0.5)
    shadow.Size = UDim2.fromOffset(700, 520)
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://6014261993"
    shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    shadow.ImageTransparency = 0.35
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    shadow.Parent = gui

    local main = Instance.new("Frame")
    main.Name = "Main"
    main.AnchorPoint = Vector2.new(0.5, 0.5)
    main.Position = UDim2.fromScale(0.5, 0.5)
    main.Size = UDim2.fromOffset(620, 440)
    main.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    main.BorderSizePixel = 0
    main.Active = true
    main.Parent = gui
    corner(main, 16)

    local mainGrad = Instance.new("UIGradient")
    mainGrad.Rotation = 135
    mainGrad.Color = ColorSequence.new({
        ColorSequenceKeypoint.new(0, Color3.fromRGB(16, 16, 16)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(6, 6, 6)),
    })
    mainGrad.Parent = main

    local strokeOuter = Instance.new("UIStroke")
    strokeOuter.Color = Color3.fromRGB(85, 85, 85)
    strokeOuter.Thickness = 1
    strokeOuter.Transparency = 0.25
    strokeOuter.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    strokeOuter.Parent = main

    local topGlow = Instance.new("Frame")
    topGlow.Size = UDim2.new(1, -60, 0, 2)
    topGlow.Position = UDim2.new(0, 30, 0, 1)
    topGlow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    topGlow.BackgroundTransparency = 0.55
    topGlow.BorderSizePixel = 0
    topGlow.ZIndex = 2
    topGlow.Parent = main
    corner(topGlow, 8)
    local tgGrad = Instance.new("UIGradient")
    tgGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1),
        NumberSequenceKeypoint.new(0.5, 0),
        NumberSequenceKeypoint.new(1, 1),
    })
    tgGrad.Parent = topGlow

    local top = Instance.new("Frame")
    top.Name = "TopBar"
    top.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
    top.BackgroundTransparency = 0.15
    top.BorderSizePixel = 0
    top.Size = UDim2.new(1, 0, 0, 60)
    top.Parent = main
    corner(top, 16)

    local topBottomCover = Instance.new("Frame")
    topBottomCover.BackgroundColor3 = Color3.fromRGB(13, 13, 13)
    topBottomCover.BackgroundTransparency = 0.15
    topBottomCover.BorderSizePixel = 0
    topBottomCover.Position = UDim2.new(0, 0, 1, -10)
    topBottomCover.Size = UDim2.new(1, 0, 0, 10)
    topBottomCover.Parent = top

    local logoHolder = Instance.new("Frame")
    logoHolder.Size = UDim2.fromOffset(40, 40)
    logoHolder.Position = UDim2.new(0, 14, 0.5, -20)
    logoHolder.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
    logoHolder.BorderSizePixel = 0
    logoHolder.Parent = top
    corner(logoHolder, 11)

    local logoStroke = Instance.new("UIStroke")
    logoStroke.Color = Color3.fromRGB(70, 70, 70)
    logoStroke.Thickness = 1
    logoStroke.Transparency = 0.15
    logoStroke.Parent = logoHolder

    local logo = Instance.new("ImageLabel")
    logo.BackgroundTransparency = 1
    logo.Image = "rbxassetid://118748055443363"
    logo.Size = UDim2.fromOffset(30, 30)
    logo.Position = UDim2.new(0.5, -15, 0.5, -15)
    logo.Parent = logoHolder

    local title = label(top, cfg.Title or "Promers Hub", 15, Color3.fromRGB(255, 255, 255), true)
    title.Position = UDim2.new(0, 66, 0, 10)
    title.Size = UDim2.new(1, -230, 0, 20)

    local sub = label(top, cfg.Footer or "Violence District", 9, Color3.fromRGB(145, 145, 145))
    sub.Position = UDim2.new(0, 66, 0, 30)
    sub.Size = UDim2.new(1, -230, 0, 16)

    local premiumBadge = Instance.new("Frame")
    premiumBadge.AnchorPoint = Vector2.new(1, 0.5)
    premiumBadge.Position = UDim2.new(1, -88, 0.5, 0)
    premiumBadge.Size = UDim2.fromOffset(78, 22)
    premiumBadge.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
    premiumBadge.BorderSizePixel = 0
    premiumBadge.ClipsDescendants = true
    premiumBadge.Parent = top
    corner(premiumBadge, 11)

    local badgeStroke = Instance.new("UIStroke")
    badgeStroke.Color = Color3.fromRGB(255, 255, 255)
    badgeStroke.Thickness = 1
    badgeStroke.Transparency = 0.3
    badgeStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    badgeStroke.Parent = premiumBadge

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
    badgeLabel.TextXAlignment = Enum.TextXAlignment.Center
    badgeLabel.ZIndex = 3
    badgeLabel.Parent = premiumBadge

    task.spawn(function()
        while premiumBadge.Parent do
            shimmer.Position = UDim2.new(-0.3, 0, 0, 0)
            TweenService:Create(shimmer, TweenInfo.new(1.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
                Position = UDim2.new(1.3, 0, 0, 0),
            }):Play()
            task.wait(3.2)
        end
    end)

    local close = Instance.new("TextButton")
    close.Text = "×"
    close.TextSize = 18
    close.Font = Enum.Font.GothamBold
    close.TextColor3 = Color3.fromRGB(235, 235, 235)
    close.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    close.AutoButtonColor = false
    close.Position = UDim2.new(1, -44, 0.5, -16)
    close.Size = UDim2.fromOffset(30, 32)
    close.Parent = top
    corner(close, 8)
    close.MouseEnter:Connect(function()
        TweenService:Create(close, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(200, 55, 55) }):Play()
    end)
    close.MouseLeave:Connect(function()
        TweenService:Create(close, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(28, 28, 28) }):Play()
    end)

    local mini = Instance.new("TextButton")
    mini.Text = "—"
    mini.TextSize = 16
    mini.Font = Enum.Font.GothamBold
    mini.TextColor3 = Color3.fromRGB(235, 235, 235)
    mini.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
    mini.AutoButtonColor = false
    mini.Position = UDim2.new(1, -80, 0.5, -16)
    mini.Size = UDim2.fromOffset(30, 32)
    mini.Parent = top
    corner(mini, 8)
    mini.MouseEnter:Connect(function()
        TweenService:Create(mini, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(55, 55, 55) }):Play()
    end)
    mini.MouseLeave:Connect(function()
        TweenService:Create(mini, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(28, 28, 28) }):Play()
    end)

local side = Instance.new("ScrollingFrame")
side.Name = "Sidebar"
side.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
side.BackgroundTransparency = 0.15
side.BorderSizePixel = 0
side.Position = UDim2.new(0, 0, 0, 60)
side.Size = UDim2.new(0, 138, 1, -115)
side.ScrollBarThickness = 2
side.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
side.ClipsDescendants = true
side.CanvasSize = UDim2.new(0, 0, 0, 0)
side.AutomaticCanvasSize = Enum.AutomaticSize.Y
side.Parent = main
corner(side, 14)

local tl = Instance.new("UIListLayout")
tl.Padding = UDim.new(0, 4)
tl.Parent = side

local pad = Instance.new("UIPadding")
pad.PaddingTop = UDim.new(0, 12)
pad.PaddingLeft = UDim.new(0, 8)
pad.PaddingRight = UDim.new(0, 8)
pad.PaddingBottom = UDim.new(0, 8)
pad.Parent = side

local sideDivider = Instance.new("Frame")
sideDivider.Size = UDim2.new(0, 1, 1, -115 - 20)
sideDivider.Position = UDim2.new(0, 138, 0, 60)
sideDivider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
sideDivider.BackgroundTransparency = 0.9
sideDivider.BorderSizePixel = 0
sideDivider.ZIndex = 3
sideDivider.Parent = main

local profileFrame = Instance.new("Frame")
profileFrame.Name = "ProfileSection"
profileFrame.AnchorPoint = Vector2.new(0, 1)
profileFrame.Position = UDim2.new(0, 8, 1, -10)
profileFrame.Size = UDim2.new(0, 122, 0, 38)
profileFrame.BackgroundColor3 = Color3.fromRGB(18, 18, 18)
profileFrame.BackgroundTransparency = 0.05
profileFrame.BorderSizePixel = 0
profileFrame.Parent = main
corner(profileFrame, 10)

local profileStroke = Instance.new("UIStroke")
profileStroke.Color = Color3.fromRGB(65, 65, 65)
profileStroke.Thickness = 1
profileStroke.Transparency = 0.25
profileStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
profileStroke.Parent = profileFrame

local avatarHolder = Instance.new("ImageLabel")
avatarHolder.Size = UDim2.fromOffset(26, 26)
avatarHolder.Position = UDim2.new(0, 6, 0.5, -13)
avatarHolder.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
avatarHolder.Image = "rbxthumb://type=AvatarHeadShot&id=" .. LocalPlayer.UserId .. "&w=150&h=150"
avatarHolder.Parent = profileFrame
corner(avatarHolder, 13)

local avatarStroke = Instance.new("UIStroke")
avatarStroke.Color = Color3.fromRGB(85, 85, 85)
avatarStroke.Thickness = 1
avatarStroke.Parent = avatarHolder

local nameLbl = Instance.new("TextLabel")
nameLbl.BackgroundTransparency = 1
nameLbl.Size = UDim2.new(1, -38, 0, 12)
nameLbl.Position = UDim2.new(0, 36, 0, 7)
nameLbl.Font = Enum.Font.GothamBold
nameLbl.Text = LocalPlayer.DisplayName or LocalPlayer.Name
nameLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
nameLbl.TextSize = 10
nameLbl.TextXAlignment = Enum.TextXAlignment.Left
nameLbl.TextTruncate = Enum.TextTruncate.AtEnd
nameLbl.Parent = profileFrame

local rolePill = Instance.new("Frame")
rolePill.Size = UDim2.fromOffset(50, 13)
rolePill.Position = UDim2.new(0, 36, 0, 20)
rolePill.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
rolePill.BorderSizePixel = 0
rolePill.Parent = profileFrame
corner(rolePill, 7)

local roleDot = Instance.new("Frame")
roleDot.Size = UDim2.fromOffset(4, 4)
roleDot.Position = UDim2.new(0, 5, 0.5, -2)
roleDot.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
roleDot.BorderSizePixel = 0
roleDot.Parent = rolePill
corner(roleDot, 2)

local roleLbl = Instance.new("TextLabel")
roleLbl.Size = UDim2.new(1, -12, 1, 0)
roleLbl.Position = UDim2.new(0, 12, 0, 0)
roleLbl.BackgroundTransparency = 1
roleLbl.Font = Enum.Font.GothamBold
roleLbl.Text = "LOBBY"
roleLbl.TextColor3 = Color3.fromRGB(150, 150, 150)
roleLbl.TextSize = 7
roleLbl.TextXAlignment = Enum.TextXAlignment.Left
roleLbl.Parent = rolePill

task.spawn(function()
    while profileFrame.Parent do
        local role = W.GetRole and W.GetRole() or nil
        if role == "Killer" then
            roleLbl.Text = "KILLER"
            roleLbl.TextColor3 = Color3.fromRGB(255, 100, 100)
            roleDot.BackgroundColor3 = Color3.fromRGB(255, 100, 100)
            rolePill.BackgroundColor3 = Color3.fromRGB(45, 20, 20)
        elseif role == "Survivor" then
            roleLbl.Text = "SURVIVOR"
            roleLbl.TextColor3 = Color3.fromRGB(100, 200, 255)
            roleDot.BackgroundColor3 = Color3.fromRGB(100, 200, 255)
            rolePill.BackgroundColor3 = Color3.fromRGB(20, 35, 45)
        else
            roleLbl.Text = "LOBBY"
            roleLbl.TextColor3 = Color3.fromRGB(150, 150, 150)
            roleDot.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
            rolePill.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        end
        task.wait(1.5)
    end
end)

    local content = Instance.new("Frame")
    content.BackgroundTransparency = 1
    content.Position = UDim2.new(0, 138, 0, 60)
    content.Size = UDim2.new(1, -138, 1, -60)
    content.ClipsDescendants = true
    content.Parent = main

    local float = Instance.new("ImageButton")
    float.Name = "FloatingOpenButton"
    float.Image = "rbxassetid://118748055443363"
    float.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
    float.Size = UDim2.fromOffset(52, 52)
    float.Position = UDim2.new(1, -78, 0, 105)
    float.AutoButtonColor = false
    float.Visible = false
    float.Parent = gui
    corner(float, 14)
    stroke(float, Color3.fromRGB(45, 45, 45), 1.3)

    local drag, ds, dp = false, nil, nil
    top.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            drag = true; ds = i.Position; dp = main.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if drag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local d = i.Position - ds
            main.Position = UDim2.new(dp.X.Scale, dp.X.Offset + d.X, dp.Y.Scale, dp.Y.Offset + d.Y)
            shadow.Position = main.Position
        end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            drag = false
        end
    end)

    local fdrag, fds, fdp = false, nil, nil
    float.InputBegan:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            fdrag = true; fds = i.Position; fdp = float.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(i)
        if fdrag and (i.UserInputType == Enum.UserInputType.MouseMovement or i.UserInputType == Enum.UserInputType.Touch) then
            local d = i.Position - fds
            float.Position = UDim2.new(fdp.X.Scale, fdp.X.Offset + d.X, fdp.Y.Scale, fdp.Y.Offset + d.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(i)
        if i.UserInputType == Enum.UserInputType.MouseButton1 or i.UserInputType == Enum.UserInputType.Touch then
            fdrag = false
        end
    end)

    local function hide()
        TweenService:Create(main, TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
            Size = UDim2.fromOffset(560, 400), BackgroundTransparency = 1,
        }):Play()
        TweenService:Create(shadow, TweenInfo.new(0.22), { ImageTransparency = 1 }):Play()
        task.delay(0.22, function()
            main.Visible = false
            float.Visible = true
            float.Size = UDim2.fromOffset(0, 0)
            TweenService:Create(float, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.fromOffset(52, 52),
            }):Play()
        end)
    end
    local function show()
        main.Visible = true
        main.Size = UDim2.fromOffset(560, 400)
        main.BackgroundTransparency = 1
        shadow.ImageTransparency = 1
        float.Visible = false
        TweenService:Create(main, TweenInfo.new(0.32, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Size = UDim2.fromOffset(620, 440), BackgroundTransparency = 0,
        }):Play()
        TweenService:Create(shadow, TweenInfo.new(0.32), { ImageTransparency = 0.35 }):Play()
    end

    mini.MouseButton1Click:Connect(hide)
    close.MouseButton1Click:Connect(hide)
    float.MouseButton1Click:Connect(show)

    task.spawn(function()
        local cam = Workspace.CurrentCamera
        local function adapt()
            if not cam then return end
            local vp = cam.ViewportSize
            if vp.X < 720 then
                local w = math.clamp(vp.X - 40, 400, 620)
                local h = math.clamp(vp.Y - 80, 320, 440)
                main.Size = UDim2.fromOffset(w, h)
                shadow.Size = UDim2.fromOffset(w + 60, h + 60)
            else
                main.Size = UDim2.fromOffset(620, 440)
                shadow.Size = UDim2.fromOffset(700, 520)
            end
        end
        adapt()
        if cam then cam:GetPropertyChangedSignal("ViewportSize"):Connect(adapt) end
    end)

    local tabs = {}
    local win = { Gui = gui, Main = main }
    local current
local tabActiveBars = {}

local function select(n)
    current = n
    for k, v in pairs(tabs) do
        local isActive = (k == n)
        
        -- Background Tombol
        TweenService:Create(v.Button, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
            BackgroundColor3 = isActive and Color3.fromRGB(45, 45, 45) or Color3.fromRGB(16, 16, 16),
        }):Play()
        
        -- FIX ERROR: UIGradient.Transparency TIDAK BISA di-tween.
        -- Jadi kita set langsung secara instan.
        if v.Grad then
            v.Grad.Transparency = isActive and NumberSequence.new(0.1) or NumberSequence.new(1)
        end

        -- Garis Pinggir (Stroke)
        if v.Stroke then
            TweenService:Create(v.Stroke, TweenInfo.new(0.25), {
                Color = isActive and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(50, 50, 50),
                Transparency = isActive and 0 or 0.5
            }):Play()
        end
        
        -- Visibilitas Halaman
        v.Page.Visible = isActive
        
        -- Ikon (Membesar & Menyala)
        if v.Icon then
            TweenService:Create(v.Icon, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                ImageColor3 = isActive and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(120, 120, 120),
                Size = isActive and UDim2.fromOffset(20, 20) or UDim2.fromOffset(18, 18),
                Position = isActive and UDim2.new(0, 12, 0.5, -10) or UDim2.new(0, 12, 0.5, -9)
            }):Play()
        end
        
        -- Teks (Membesar & Menyala)
        if v.Label then
            TweenService:Create(v.Label, TweenInfo.new(0.25, Enum.EasingStyle.Quart), {
                TextColor3 = isActive and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(120, 120, 120),
                TextSize = isActive and 12 or 11
            }):Play()
        end
        
        -- Garis Aksen Kiri (Active Bar)
        if tabActiveBars[k] then
            TweenService:Create(tabActiveBars[k], TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = isActive and UDim2.new(0, 4, 0, 24) or UDim2.new(0, 4, 0, 0),
                BackgroundTransparency = isActive and 0 or 1,
            }):Play()
        end
    end
end

    function win:AddTab(o)
    local name = o.Name
    local icon = o.Icon
    
    local b = Instance.new("TextButton")
    b.Text = ""
    b.BackgroundColor3 = Color3.fromRGB(16, 16, 16) -- Warna dasar lebih soft
    b.AutoButtonColor = false
    b.Size = UDim2.new(1, 0, 0, 38) -- Sedikit lebih tinggi biar lega
    b.ClipsDescendants = false
    b.Parent = side
    corner(b, 10)

    -- Efek Kaca (Gradient) pas aktif
    local bGrad = Instance.new("UIGradient")
    bGrad.Color = ColorSequence.new(Color3.fromRGB(70, 70, 70), Color3.fromRGB(30, 30, 30))
    bGrad.Rotation = 135
    bGrad.Transparency = NumberSequence.new(1) -- Awalnya transparan (OFF)
    bGrad.Parent = b

    local bStroke = Instance.new("UIStroke")
    bStroke.Color = Color3.fromRGB(50, 50, 50)
    bStroke.Thickness = 1
    bStroke.Transparency = 0.5
    bStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    bStroke.Parent = b

    -- Garis Aksen Kiri (Active Indicator)
    local activeBar = Instance.new("Frame")
    activeBar.Size = UDim2.new(0, 4, 0, 0)
    activeBar.Position = UDim2.new(0, 0, 0.5, 0)
    activeBar.AnchorPoint = Vector2.new(0, 0.5)
    activeBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    activeBar.BackgroundTransparency = 1
    activeBar.BorderSizePixel = 0
    activeBar.Parent = b
    corner(activeBar, 2)
    tabActiveBars[name] = activeBar

    local tabIcon = nil
    if icon then
        tabIcon = Instance.new("ImageLabel")
        tabIcon.BackgroundTransparency = 1
        tabIcon.Image = "rbxassetid://" .. tostring(icon)
        tabIcon.ImageColor3 = Color3.fromRGB(120, 120, 120)
        tabIcon.Size = UDim2.fromOffset(18, 18)
        tabIcon.Position = UDim2.new(0, 12, 0.5, -9)
        tabIcon.Parent = b
    end

    local lbl = Instance.new("TextLabel")
    lbl.BackgroundTransparency = 1
    lbl.Text = name
    lbl.TextColor3 = Color3.fromRGB(120, 120, 120)
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamBold -- Dibikin Bold biar lebih tegas
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextYAlignment = Enum.TextYAlignment.Center
    lbl.Position = icon and UDim2.new(0, 40, 0, 0) or UDim2.new(0, 16, 0, 0)
    lbl.Size = UDim2.new(1, -48, 1, 0)
    lbl.Parent = b

    -- Animasi Hover (Menyala tipis)
    b.MouseEnter:Connect(function()
        if current ~= name then
            TweenService:Create(b, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(30, 30, 30) }):Play()
            TweenService:Create(bStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(100, 100, 100), Transparency = 0.3 }):Play()
            if tabIcon then TweenService:Create(tabIcon, TweenInfo.new(0.15), { ImageColor3 = Color3.fromRGB(200, 200, 200) }):Play() end
            TweenService:Create(lbl, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(200, 200, 200) }):Play()
        end
    end)

    b.MouseLeave:Connect(function()
        if current ~= name then
            TweenService:Create(b, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(16, 16, 16) }):Play()
            TweenService:Create(bStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(50, 50, 50), Transparency = 0.5 }):Play()
            if tabIcon then TweenService:Create(tabIcon, TweenInfo.new(0.15), { ImageColor3 = Color3.fromRGB(120, 120, 120) }):Play() end
            TweenService:Create(lbl, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(120, 120, 120) }):Play()
        end
    end)

    local p = Instance.new("ScrollingFrame")
    p.BackgroundTransparency = 1
    p.BorderSizePixel = 0
    p.Position = UDim2.new(0, 14, 0, 14)
    p.Size = UDim2.new(1, -28, 1, -28)
    p.ScrollBarThickness = 3
    p.ScrollBarImageColor3 = Color3.fromRGB(90, 90, 90)
    p.CanvasSize = UDim2.new()
    p.AutomaticCanvasSize = Enum.AutomaticSize.Y
    p.Visible = false
    p.Parent = content
    local l = Instance.new("UIListLayout")
    l.Padding = UDim.new(0, 10)
    l.Parent = p

    local page = { Page = p, _name = name }
    function page:AddSection(n) return section(page, n) end

    tabs[name] = { Button = b, Page = p, Icon = tabIcon, Label = lbl, Grad = bGrad, Stroke = bStroke }
    b.MouseButton1Click:Connect(function() select(name) end)
    
    -- Auto-select tab pertama pas dimuat
    if not current then
        select(name)
    end
    
    return page
end

    function win:InfoTab(o)
        local p = self:AddTab({ Name = o.Name or "Information", Icon = o.Icon })
        local ban = Instance.new("ImageLabel")
        ban.Image = o.Banner or "rbxassetid://124361049319609"
        ban.ScaleType = Enum.ScaleType.Crop
        ban.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
        ban.Size = UDim2.new(1, 0, 0, 140)
        ban.Parent = p.Page
        corner(ban, 10)
        stroke(ban, Color3.fromRGB(55, 55, 55))

        local ov = Instance.new("Frame")
        ov.BackgroundColor3 = Color3.new(0, 0, 0)
        ov.BackgroundTransparency = 0.38
        ov.Size = UDim2.fromScale(1, 1)
        ov.Parent = ban
        corner(ov, 10)

        local a = label(ov, o.SectionTitle or "Information", 18, Color3.new(1, 1, 1), true)
        a.Position = UDim2.new(0, 15, 0, 52)
        a.Size = UDim2.new(1, -30, 0, 28)

        local v = label(ov, o.Version or "", 10, Color3.fromRGB(205, 205, 205))
        v.Position = UDim2.new(0, 15, 0, 82)
        v.Size = UDim2.new(1, -30, 0, 18)

        for _, c in ipairs(o.Cards or {}) do
            local s = section(p, c.Title or "Info")
            addParagraph(s, { Title = c.Title, Content = c.Description })
        end
        return p
    end

    function win:Notify(o)
        local h = gui:FindFirstChild("Notifications") or Instance.new("Frame")
        h.Name = "Notifications"
        h.BackgroundTransparency = 1
        h.AnchorPoint = Vector2.new(1, 1)
        h.Position = UDim2.new(1, -15, 1, -15)
        h.Size = UDim2.fromOffset(310, 360)
        h.Parent = gui
        if not h:FindFirstChildOfClass("UIListLayout") then
            local l = Instance.new("UIListLayout")
            l.VerticalAlignment = Enum.VerticalAlignment.Bottom
            l.HorizontalAlignment = Enum.HorizontalAlignment.Right
            l.Padding = UDim.new(0, 6)
            l.Parent = h
        end

        local r = row(h, 62)
        local rStroke = Instance.new("UIStroke")
        rStroke.Color = Color3.fromRGB(255, 255, 255)
        rStroke.Thickness = 1
        rStroke.Transparency = 0.85
        rStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        rStroke.Parent = r

        local accentBar = Instance.new("Frame")
        accentBar.Size = UDim2.new(0, 3, 1, -12)
        accentBar.Position = UDim2.new(0, 0, 0, 6)
        accentBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        accentBar.BorderSizePixel = 0
        accentBar.Parent = r
        corner(accentBar, 2)

        local a = label(r, o.Title or "Promers", 12, Color3.new(1, 1, 1), true)
        a.Position = UDim2.new(0, 12, 0, 8)
        a.Size = UDim2.new(1, -22, 0, 18)

        local b = label(r, o.Content or "", 10, Color3.fromRGB(170, 170, 170))
        b.Position = UDim2.new(0, 12, 0, 28)
        b.Size = UDim2.new(1, -22, 0, 25)
        b.TextWrapped = true

        r.BackgroundTransparency = 1
        r.Position = UDim2.new(1, 20, 0, 0)
        TweenService:Create(r, TweenInfo.new(0.28, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 0,
        }):Play()

        task.delay(o.Delay or o.Time or 2, function()
            if r.Parent then
                TweenService:Create(r, TweenInfo.new(0.22, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                    Position = UDim2.new(1, 20, 0, 0), BackgroundTransparency = 1,
                }):Play()
                task.delay(0.25, function() if r.Parent then r:Destroy() end end)
            end
        end)
    end

    do
        local searchBox = Instance.new("Frame")
        searchBox.Name = "SearchBox"
        searchBox.AnchorPoint = Vector2.new(1, 0.5)
        searchBox.Position = UDim2.new(1, -174, 0.5, 0)
        searchBox.Size = UDim2.fromOffset(130, 28)
        searchBox.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
        searchBox.BorderSizePixel = 0
        searchBox.Parent = top
        corner(searchBox, 6)

        local searchStroke = Instance.new("UIStroke")
        searchStroke.Color = Color3.fromRGB(50, 50, 50)
        searchStroke.Thickness = 1
        searchStroke.Transparency = 0.3
        searchStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        searchStroke.Parent = searchBox

        local searchIcon = Instance.new("TextLabel")
        searchIcon.BackgroundTransparency = 1
        searchIcon.Text = "•"
        searchIcon.TextColor3 = Color3.fromRGB(140, 140, 140)
        searchIcon.TextSize = 16
        searchIcon.Font = Enum.Font.GothamBold
        searchIcon.Position = UDim2.new(0, 5, 0, 0)
        searchIcon.Size = UDim2.fromOffset(16, 28)
        searchIcon.Parent = searchBox

        local searchInput = Instance.new("TextBox")
        searchInput.BackgroundTransparency = 1
        searchInput.Text = ""
        searchInput.PlaceholderText = "Search..."
        searchInput.PlaceholderColor3 = Color3.fromRGB(110, 110, 110)
        searchInput.TextColor3 = Color3.fromRGB(235, 235, 235)
        searchInput.TextSize = 10
        searchInput.Font = Enum.Font.Gotham
        searchInput.TextXAlignment = Enum.TextXAlignment.Left
        searchInput.ClearTextOnFocus = false
        searchInput.Position = UDim2.new(0, 22, 0, 0)
        searchInput.Size = UDim2.new(1, -28, 1, 0)
        searchInput.Parent = searchBox

            local resultGui = nil
            local ActiveCloser = nil

            local function closeResult()
                if resultGui and resultGui.Parent then
                    local g = resultGui; resultGui = nil
                    pcall(function() g:Destroy() end)
                end
                ActiveCloser = nil
            end

            local function scanAllItems()
                local items = {}
                for tabName, tabData in pairs(tabs) do
                    local page = tabData.Page
                    if page then
                        for _, sectionFrame in ipairs(page:GetChildren()) do
                            if sectionFrame:IsA("Frame") and sectionFrame.Name:sub(1, 8) == "Section_" then
                                local header = sectionFrame:FindFirstChild("Header")
                                local secTitleLbl = header and header:FindFirstChild("Title")
                                local sectionName = secTitleLbl and secTitleLbl.Text or "Section"
                                local body = sectionFrame:FindFirstChild("Body")
                                if body then
                                    for _, itemFrame in ipairs(body:GetChildren()) do
                                        if itemFrame:IsA("Frame") then
                                            local titleLbl = nil
                                            for _, c in ipairs(itemFrame:GetChildren()) do
                                                if c:IsA("TextLabel")
                                                   and c.Font == Enum.Font.GothamBold
                                                   and (c.TextSize == 10 or c.TextSize == 11)
                                                   and c.Text ~= "" then
                                                    titleLbl = c; break
                                                end
                                            end
                                            if titleLbl then
                                                table.insert(items, {
                                                    Name = titleLbl.Text, Frame = itemFrame,
                                                    SectionFrame = sectionFrame, SectionName = sectionName, TabName = tabName,
                                                })
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                return items
            end

            local function navigateTo(entry)
                closeResult()
                searchInput.Text = ""
                if entry.TabName and tabs[entry.TabName] and select then pcall(select, entry.TabName) end
                task.defer(function()
                    local header = entry.SectionFrame:FindFirstChild("Header")
                    local body = entry.SectionFrame:FindFirstChild("Body")
                    if body and not body.Visible and header then
                        local collapseBtn = header:FindFirstChild("CollapseBtn")
                        if collapseBtn and firesignal then pcall(firesignal, collapseBtn.MouseButton1Click) end
                    end
                    task.wait(0.08)
                    local page = tabs[entry.TabName] and tabs[entry.TabName].Page
                    if page and entry.Frame then
                        local frameY = entry.Frame.AbsolutePosition.Y - page.AbsolutePosition.Y + page.CanvasPosition.Y
                        local target = math.max(0, frameY - 60)
                        TweenService:Create(page, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                            CanvasPosition = Vector2.new(page.CanvasPosition.X, target)
                        }):Play()
                    end
                    if entry.Frame then
                        local origColor = entry.Frame.BackgroundColor3
                        entry.Frame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
                        TweenService:Create(entry.Frame, TweenInfo.new(0.9, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                            BackgroundColor3 = origColor,
                        }):Play()
                    end
                end)
            end

            local function buildResult(results)
                closeResult()
                if #results == 0 then return end
                local parent = SafeGuiParent()
                if not parent then return end
                local sg = Instance.new("ScreenGui")
                sg.Name = "GlutoSearchPopup"; sg.ResetOnSpawn = false
                sg.IgnoreGuiInset = true; sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
                sg.DisplayOrder = 1000002; sg.Parent = parent
                resultGui = sg

                local frame = Instance.new("Frame")
                frame.Name = "Panel"; frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                frame.BackgroundTransparency = 1; frame.BorderSizePixel = 0
                frame.Parent = sg; corner(frame, 8)

                local fStroke = Instance.new("UIStroke")
                fStroke.Color = Color3.fromRGB(55, 55, 55); fStroke.Thickness = 1
                fStroke.Transparency = 0.3; fStroke.Parent = frame

                local ITEM_H = 40; local MAX_SHOW = 8
                local showCount = math.min(#results, MAX_SHOW)
                local popH = showCount * ITEM_H + 12; local popW = 300

                local absPos = searchBox.AbsolutePosition
                local absSize = searchBox.AbsoluteSize
                local vp = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1280, 720)
                local px = absPos.X + absSize.X - popW
                local py = absPos.Y + absSize.Y + 6
                if px < 8 then px = 8 end
                if px + popW > vp.X - 8 then px = vp.X - popW - 8 end
                if py + popH > vp.Y - 8 then py = absPos.Y - popH - 6 end
                frame.Position = UDim2.fromOffset(px, py)
                frame.Size = UDim2.fromOffset(popW, popH)

                local listFrame = Instance.new("ScrollingFrame")
                listFrame.BackgroundTransparency = 1; listFrame.BorderSizePixel = 0
                listFrame.Position = UDim2.fromOffset(6, 6); listFrame.Size = UDim2.new(1, -12, 1, -12)
                listFrame.CanvasSize = UDim2.new(); listFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
                listFrame.ScrollBarThickness = 2; listFrame.ScrollBarImageColor3 = Color3.fromRGB(100, 100, 100)
                listFrame.Parent = frame

                local listLayout = Instance.new("UIListLayout")
                listLayout.Padding = UDim.new(0, 2); listLayout.SortOrder = Enum.SortOrder.LayoutOrder
                listLayout.Parent = listFrame

                for i, entry in ipairs(results) do
                    local opt = Instance.new("TextButton")
                    opt.BackgroundColor3 = Color3.fromRGB(20, 20, 20); opt.Text = ""
                    opt.AutoButtonColor = false; opt.Size = UDim2.new(1, 0, 0, ITEM_H - 2)
                    opt.LayoutOrder = i; opt.Parent = listFrame; corner(opt, 5)

                    local nameLbl = Instance.new("TextLabel")
                    nameLbl.BackgroundTransparency = 1; nameLbl.Text = entry.Name
                    nameLbl.TextColor3 = Color3.fromRGB(235, 235, 235); nameLbl.TextSize = 11
                    nameLbl.Font = Enum.Font.GothamBold; nameLbl.TextXAlignment = Enum.TextXAlignment.Left
                    nameLbl.TextTruncate = Enum.TextTruncate.AtEnd
                    nameLbl.Position = UDim2.new(0, 12, 0, 5); nameLbl.Size = UDim2.new(1, -24, 0, 14)
                    nameLbl.Parent = opt

                    local pathLbl = Instance.new("TextLabel")
                    pathLbl.BackgroundTransparency = 1; pathLbl.Text = entry.TabName .. " › " .. tostring(entry.SectionName)
                    pathLbl.TextColor3 = Color3.fromRGB(140, 140, 140); pathLbl.TextSize = 9
                    pathLbl.Font = Enum.Font.Gotham; pathLbl.TextXAlignment = Enum.TextXAlignment.Left
                    pathLbl.TextTruncate = Enum.TextTruncate.AtEnd
                    pathLbl.Position = UDim2.new(0, 12, 0, 21); pathLbl.Size = UDim2.new(1, -24, 0, 12)
                    pathLbl.Parent = opt

                    opt.MouseEnter:Connect(function() TweenService:Create(opt, TweenInfo.new(0.12), { BackgroundColor3 = Color3.fromRGB(32, 32, 32) }):Play() end)
                    opt.MouseLeave:Connect(function() TweenService:Create(opt, TweenInfo.new(0.12), { BackgroundColor3 = Color3.fromRGB(20, 20, 20) }):Play() end)
                    opt.MouseButton1Click:Connect(function() navigateTo(entry) end)
                end

                TweenService:Create(frame, TweenInfo.new(0.18), { BackgroundTransparency = 0 }):Play()
                ActiveCloser = closeResult
            end

            local function doSearch()
                local q = string.lower(searchInput.Text or "")
                if q == "" then closeResult(); return end
                local items = scanAllItems()
                local results = {}
                for _, it in ipairs(items) do
                    if string.find(string.lower(it.Name), q, 1, true) then table.insert(results, it) end
                end
                if #results > 0 then buildResult(results) else closeResult() end
            end

            searchInput:GetPropertyChangedSignal("Text"):Connect(doSearch)

            searchInput.Focused:Connect(function()
                TweenService:Create(searchStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(180, 180, 180), Transparency = 0 }):Play()
            end)
            searchInput.FocusLost:Connect(function()
                TweenService:Create(searchStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(50, 50, 50), Transparency = 0.3 }):Play()
            end)

            UserInputService.InputBegan:Connect(function(input, gp)
                if gp then return end
                if not ActiveCloser then return end
                if input.UserInputType ~= Enum.UserInputType.MouseButton1 and input.UserInputType ~= Enum.UserInputType.Touch then return end
                local mp = input.Position
                local boxPos = searchBox.AbsolutePosition; local boxSz = searchBox.AbsoluteSize
                local inBox = mp.X >= boxPos.X and mp.X <= boxPos.X + boxSz.X and mp.Y >= boxPos.Y and mp.Y <= boxPos.Y + boxSz.Y
                if not inBox then
                    if resultGui then
                        local panel = resultGui:FindFirstChild("Panel")
                        if panel then
                            local pPos = panel.AbsolutePosition; local pSz = panel.AbsoluteSize
                            local inPanel = mp.X >= pPos.X and mp.X <= pPos.X + pSz.X and mp.Y >= pPos.Y and mp.Y <= pPos.Y + pSz.Y
                            if inPanel then return end
                        end
                    end
                    closeResult()
                end
            end)
        end

        _window=win
        return win
    end
    function UILib:MakeNotify(o) if _window then _window:Notify(o) end end

    do
        local function FixText(inst)
            if not inst then return end
            if inst:IsA("TextLabel") or inst:IsA("TextButton") or inst:IsA("TextBox") then
                local txt = inst.Text
                if txt and (string.find(txt, "Gluto Windows", 1, true) or string.find(txt, "Gluto Window", 1, true)) then
                    pcall(function()
                        inst.Text = txt:gsub("Gluto Windows", "Close Windows"):gsub("Gluto Window", "Close Windows")
                    end)
                end
            end
        end
        local function ScanAndHook(container)
            if not container then return end
            for _, d in ipairs(container:GetDescendants()) do FixText(d) end
            container.DescendantAdded:Connect(FixText)
        end
        ScanAndHook(CoreGui)
        if gethui then
            local hok, hui = pcall(gethui)
            if hok and hui then ScanAndHook(hui) end
        end
        ScanAndHook(LocalPlayer:FindFirstChild("PlayerGui"))
    end

    local NotifyColor = _G.GLUTO_THEME
    W.NotifyEnabled = W.NotifyEnabled ~= false

    local function ShowNotify(title, message, duration)
        if not W.NotifyEnabled then return end
        if not UILib or not UILib.MakeNotify then return end
        pcall(function()
            UILib:MakeNotify({
                Title = title or "Promers", Description = "Info",
                Content = message or "", Color = NotifyColor,
                Time = 0.4, Delay = duration or 2, Icon = "92106934813318"
            })
        end)
    end
    local function VD_Notify(title, content, duration) ShowNotify(title, content, duration) end
    getgenv().__Gluto_VD_Notify = VD_Notify
    local function ForceNotify(title, message, duration)
        if not UILib or not UILib.MakeNotify then return end
        pcall(function()
            UILib:MakeNotify({
                Title = title or "Promers", Description = "Info",
                Content = message or "", Color = NotifyColor,
                Time = 0.4, Delay = duration or 2, Icon = "92106934813318"
            })
        end)
    end

    local function TeamIs(plr, role)
        if not plr or not plr.Team or not plr.Team.Name then return false end
        local tn = string.lower(plr.Team.Name)
        if role == "Killer" then return string.find(tn, "killer", 1, true) ~= nil end
        if role == "Survivor" then return string.find(tn, "survivor", 1, true) ~= nil end
        return false
    end
    W.TeamIs = TeamIs

    local function GetRole()
        if TeamIs(LocalPlayer, "Killer") then return "Killer" end
        if TeamIs(LocalPlayer, "Survivor") then return "Survivor" end
        return nil
    end
    W.GetRole = GetRole

    W.GB_GetAllGenerators = function()
        local gens = {}
        local mf = Workspace:FindFirstChild("Map")
        if mf then
            for _, obj in ipairs(mf:GetDescendants()) do
                if obj:IsA("Model") and obj.Name == "Generator" then
                    local real = obj:GetAttribute("RepairProgress") ~= nil
                              or obj:GetAttribute("kickcount") ~= nil
                              or obj:GetAttribute("ProgressRepair") ~= nil
                    if real then table.insert(gens, obj) end
                end
            end
        end
        return gens
    end
    W.GB_GetPoints = function(m)
        local pts = {}
        if m then
            for _, o in ipairs(m:GetChildren()) do
                if o:IsA("BasePart") and string.find(o.Name, "GeneratorPoint") then
                    table.insert(pts, o)
                end
            end
        end
        return pts
    end

    function IsDowned(char)
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        if not hrp then return true end
        local state = char:GetAttribute("State")
        return state == "Downed" or state == "Dead"
    end

    function TriggerCrouch()
        local startT = tick()
        task.spawn(function()
            local char = LocalPlayer.Character
            if not char then return end
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            pcall(function() char:SetAttribute("Crouching", true) end)
            pcall(function() ReplicatedStorage.Remotes.Mechanics.ChangeAttribute:FireServer("Crouchingserver", true) end)
            pcall(function() ReplicatedStorage.Remotes.Chase.Runevent:FireServer(char, false) end)
            if humanoid then pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Landed) end) end
            pcall(function()
                local survMob = LocalPlayer:FindFirstChildOfClass("PlayerGui"):FindFirstChild("Survivor-mob")
                if survMob then
                    local controls = survMob:FindFirstChild("Controls")
                    if controls then
                        local crouchBtn = controls:FindFirstChild("crouch")
                        if crouchBtn then firesignal(crouchBtn.MouseButton1Click) end
                    end
                end
            end)
            while tick() - startT < 1.2 do
                pcall(function() ReplicatedStorage.Remotes.Mechanics.ChangeAttribute:FireServer("Crouchingserver", true) end)
                task.wait(0.1)
            end
            pcall(function() char:SetAttribute("Crouching", false) end)
            pcall(function() ReplicatedStorage.Remotes.Mechanics.ChangeAttribute:FireServer("Crouchingserver", false) end)
            if humanoid then pcall(function() humanoid:ChangeState(Enum.HumanoidStateType.Landed) end) end
            pcall(function()
                local survMob = LocalPlayer:FindFirstChildOfClass("PlayerGui"):FindFirstChild("Survivor-mob")
                if survMob then
                    local controls = survMob:FindFirstChild("Controls")
                    if controls then
                        local crouchBtn = controls:FindFirstChild("crouch")
                        if crouchBtn then firesignal(crouchBtn.MouseButton1Click) end
                    end
                end
            end)
        end)
    end

    local CrouchAttached = {}
    function IsKiller(p) return p.Team and p.Team.Name == "Killer" end

    function AttachCrouchSensor(kChar)
        if not kChar or CrouchAttached[kChar] then return end
        CrouchAttached[kChar] = true
        local humanoid = kChar:FindFirstChild("Humanoid")
        if not humanoid then humanoid = kChar:WaitForChild("Humanoid", 5); if not humanoid then return end end
        local animator = humanoid:FindFirstChildOfClass("Animator")
        if not animator then animator = humanoid:WaitForChild("Animator", 5); if not animator then return end end
        humanoid.ChildAdded:Connect(function(child)
            if child:IsA("Animator") then CrouchAttached[kChar] = nil; AttachCrouchSensor(kChar) end
        end)
        kChar.AncestryChanged:Connect(function(_, parent)
            if not parent then CrouchAttached[kChar] = nil end
        end)
        animator.AnimationPlayed:Connect(function(track)
            local animId = track.Animation and track.Animation.AnimationId or ""
            local id = animId:match("%d+")
            if id == "80411309607666" and VD.AutoCrouch then
                local myChar = LocalPlayer.Character
                if IsDowned(myChar) then return end
                local myHRP = myChar and myChar:FindFirstChild("HumanoidRootPart")
                local kHRP = kChar:FindFirstChild("HumanoidRootPart")
                if myHRP and kHRP then
                    local dist = (myHRP.Position - kHRP.Position).Magnitude
                    if dist <= 40 then TriggerCrouch() end
                end
            end
        end)
    end

    function TryAttachCrouch(p)
        if p ~= LocalPlayer and IsKiller(p) and p.Character then AttachCrouchSensor(p.Character) end
    end
    function SetupCrouchPlayer(p)
        if p == LocalPlayer then return end
        p.CharacterAdded:Connect(function() TryAttachCrouch(p) end)
        p:GetPropertyChangedSignal("Team"):Connect(function() TryAttachCrouch(p) end)
        if p.Character then TryAttachCrouch(p) end
    end
    for _, p in pairs(Players:GetPlayers()) do SetupCrouchPlayer(p) end
    Players.PlayerAdded:Connect(SetupCrouchPlayer)
    task.spawn(function()
        while true do
            task.wait(5)
            for _, p in pairs(Players:GetPlayers()) do TryAttachCrouch(p) end
        end
    end)

do
    local VALID_PARRY_IDS = {
        ["122812055447896"] = "Veil lunge", ["133963973694098"] = "Mayers Basic",
        ["117042998468241"] = "Mayers lunge", ["135002183282873"] = "cure lunge",
        ["121216847022485"] = "cure Basic", ["132817836308238"] = "Jeff Basic",
        ["129784271201071"] = "Jeff lunge", ["82666958311998"] = "Jeff Frenzy",
        ["78432063483146"] = "Abyssal Basic", ["118907603246885"] = "Abyssal lunge",
        ["139369275981139"] = "Jason Basic", ["110355011987939"] = "Jason lunge",
        ["111920872708571"] = "Masked Basic", ["105374834496520"] = "Masked lunge",
        ["138720291317243"] = "Masked Tony", ["106871536134254"] = "Masked Alex",
        ["130593238885843"] = "Masked Cobra", ["115244153053858"] = "Masked Cobra lunge",
        ["74968262036854"] = "Hidden Basic", ["113255068724446"] = "Hidden lunge",
        ["98163597193511"] = "Hidden S1", ["80411309607666"] = "Abyssal S1"
    }

    local ParryState = { Cooldown = false, CooldownThread = nil, RadiusAdornment = nil }
    local ParryAttached = {}

    VD.Surv_AutoParry         = VD.Surv_AutoParry or false
    VD.Surv_ParrySafety       = VD.Surv_ParrySafety ~= false
    VD.Surv_ParryAggressive   = VD.Surv_ParryAggressive or false
    VD.Surv_ParryCircle       = VD.Surv_ParryCircle ~= false
    VD.Surv_ParryRadius       = VD.Surv_ParryRadius or 15
    VD.Surv_ParryFace         = VD.Surv_ParryFace or 0.7
    VD.Surv_ParryAntiFake     = VD.Surv_ParryAntiFake ~= false
    VD.Surv_ParryFacingAngle  = VD.Surv_ParryFacingAngle or 60
    VD.Ignored_Skills_List    = VD.Ignored_Skills_List or {}

    local function IsDownedFull(char)
        if not char then return true end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return true end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.Health <= 0 then return true end
        local st = char:GetAttribute("State")
        if st == "Downed" or st == "Dead" then return true end
        if char:GetAttribute("Knocked") == true then return true end
        if char:GetAttribute("IsHooked") == true then return true end
        return false
    end

    local function IsSafeToParry(char)
        if not VD.Surv_ParrySafety then return true end
        if not char then return false end
        local i = char:FindFirstChild("CheckInterractable")
        if i then
            if i:GetAttribute("isVaulting") or i:GetAttribute("isRepairing")
            or i:GetAttribute("isUnhooking") or i:GetAttribute("isHealing")
            or i:GetAttribute("isSliding") then return false end
        end
        return true
    end

    local function IsKillerFacingMe(kChar, myPos, angleDeg)
        local kRoot = kChar and kChar:FindFirstChild("HumanoidRootPart")
        if not kRoot or not myPos then return false end
        local angle = math.rad(tonumber(angleDeg) or 60)
        local toMe = myPos - kRoot.Position
        if toMe.Magnitude < 0.05 then return true end
        toMe = Vector3.new(toMe.X, 0, toMe.Z)
        if toMe.Magnitude < 0.05 then return true end
        toMe = toMe.Unit
        local look = kRoot.CFrame.LookVector
        look = Vector3.new(look.X, 0, look.Z)
        if look.Magnitude <= 0.05 then return false end
        look = look.Unit
        local bodyDot = look:Dot(toMe)
        local head = kChar:FindFirstChild("Head")
        local headDot = bodyDot
        if head then
            local hLook = head.CFrame.LookVector
            hLook = Vector3.new(hLook.X, 0, hLook.Z)
            if hLook.Magnitude > 0.05 then headDot = hLook.Unit:Dot(toMe) end
        end
        return (bodyDot >= math.cos(angle)) or (headDot >= math.cos(angle))
    end

    local function TapMobileParryButton()
        local pg = LocalPlayer:FindFirstChild("PlayerGui")
        if not pg then return end
        local sm = pg:FindFirstChild("Survivor-mob")
        local pb = sm and sm:FindFirstChild("Controls") and sm.Controls:FindFirstChild("Gui-mob")
        if pb and pb.Visible and firesignal then
            pcall(function()
                firesignal(pb.MouseButton1Down)
                task.wait(0.01)
                firesignal(pb.MouseButton1Up)
            end)
        elseif VirtualInputManager then
            pcall(function()
                VirtualInputManager:SendMouseButtonEvent(0, 0, 1, true, game, 0)
                task.wait(0.01)
                VirtualInputManager:SendMouseButtonEvent(0, 0, 1, false, game, 0)
            end)
        end
    end

    local function ExecuteParry()
        if ParryState.Cooldown then return end
        pcall(function()
            local pr = ReplicatedStorage:FindFirstChild("Remotes")
                and ReplicatedStorage.Remotes:FindFirstChild("Items")
                and ReplicatedStorage.Remotes.Items:FindFirstChild("Parrying Dagger")
                and ReplicatedStorage.Remotes.Items["Parrying Dagger"]:FindFirstChild("parry")
            if pr then
                for _ = 1, 10 do pr:FireServer() end
            end
            task.spawn(TapMobileParryButton)
        end)
    end

    task.spawn(function()
        local r = ReplicatedStorage:WaitForChild("Remotes", 5)
        local it = r and r:WaitForChild("Items", 5)
        local dagger = it and it:WaitForChild("Parrying Dagger", 5)
        local prr = dagger and dagger:WaitForChild("parryResult", 5)
        if prr then
            prr.OnClientEvent:Connect(function(a1, a2)
                local cd = tonumber(a2) or ((a1 == true) and 90 or 60)
                ParryState.Cooldown = true
                if ParryState.CooldownThread then task.cancel(ParryState.CooldownThread) end
                ParryState.CooldownThread = task.delay(cd, function()
                    ParryState.Cooldown = false
                end)
            end)
        end
    end)

    local function AttachParrySensor(kChar)
        if not kChar or ParryAttached[kChar] then return end
        ParryAttached[kChar] = true
        local h = kChar:FindFirstChild("Humanoid")
        if not h then h = kChar:WaitForChild("Humanoid", 5); if not h then return end end
        local an = h:FindFirstChildOfClass("Animator")
        if not an then an = kChar:WaitForChild("Animator", 5); if not an then return end end
        h.ChildAdded:Connect(function(c)
            if c:IsA("Animator") then ParryAttached[kChar] = nil; AttachParrySensor(kChar) end
        end)
        kChar.AncestryChanged:Connect(function(_, p)
            if not p then ParryAttached[kChar] = nil end
        end)
        an.AnimationPlayed:Connect(function(track)
            local aid = track.Animation and track.Animation.AnimationId or ""
            local id = aid:match("%d+")
            local aName = VALID_PARRY_IDS[id]
            if not aName then return end

            if not VD.Surv_AutoParry then return end
            if ParryState.Cooldown then return end
            if VD.Ignored_Skills_List and VD.Ignored_Skills_List[aName] then return end

            local myC = LocalPlayer.Character
            if IsDownedFull(myC) or not IsSafeToParry(myC) then return end

            local myH = myC and myC:FindFirstChild("HumanoidRootPart")
            local kH = kChar:FindFirstChild("HumanoidRootPart")
            if not myH or not kH then return end

            local sd = (myH.Position - kH.Position).Magnitude

            if VD.Surv_ParryAntiFake then
                if not IsKillerFacingMe(kChar, myH.Position, VD.Surv_ParryFacingAngle or 60) then return end
            end

            if VD.Surv_ParryAggressive then
                local ar = 12
                local dr = (VD.Surv_ParryRadius or 15) + 5
                if sd > dr then return end
                if sd <= ar then ExecuteParry()
                else
                    local tracker
                    local st = os.clock()
                    tracker = RunService.Heartbeat:Connect(function()
                        if os.clock() - st >= 1.5 or ParryState.Cooldown or not myH or not kH or IsDownedFull(myC) then
                            if tracker then tracker:Disconnect() end
                            return
                        end
                        if (myH.Position - kH.Position).Magnitude <= ar then
                            ExecuteParry()
                            if tracker then tracker:Disconnect() end
                        end
                    end)
                end
            else
                if sd > (VD.Surv_ParryRadius or 15) then return end
                local mpf = Vector3.new(myH.Position.X, 0, myH.Position.Z)
                local kpf = Vector3.new(kH.Position.X, 0, kH.Position.Z)
                local fd = mpf - kpf
                if fd.Magnitude > 0 then
                    local fdir = fd.Unit
                    local klf = Vector3.new(kH.CFrame.LookVector.X, 0, kH.CFrame.LookVector.Z)
                    if klf.Magnitude > 0.001 then
                        klf = klf.Unit
                        if klf:Dot(fdir) < (VD.Surv_ParryFace or 0.7) then return end
                    end
                end
                ExecuteParry()
            end
        end)
    end

    local function TryAttachParry(p)
        if p ~= LocalPlayer and IsKiller(p) and p.Character then
            AttachParrySensor(p.Character)
        end
    end

    local function SetupParryPlayer(p)
        if p == LocalPlayer then return end
        p.CharacterAdded:Connect(function() TryAttachParry(p) end)
        p:GetPropertyChangedSignal("Team"):Connect(function() TryAttachParry(p) end)
        if p.Character then TryAttachParry(p) end
    end

    for _, p in pairs(Players:GetPlayers()) do SetupParryPlayer(p) end
    Players.PlayerAdded:Connect(SetupParryPlayer)

    task.spawn(function()
        while true do
            task.wait(10)
            for _, p in pairs(Players:GetPlayers()) do TryAttachParry(p) end
        end
    end)

    task.spawn(function()
        while true do
            task.wait(0.2)
            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if VD.Surv_ParryCircle and VD.Surv_AutoParry and hrp then
                if not ParryState.RadiusAdornment or ParryState.RadiusAdornment.Parent ~= hrp then
                    if ParryState.RadiusAdornment then pcall(function() ParryState.RadiusAdornment:Destroy() end) end
                    ParryState.RadiusAdornment = Instance.new("CylinderHandleAdornment")
                    ParryState.RadiusAdornment.Name = "AutoParryCircleESP"
                    ParryState.RadiusAdornment.Height = 0.05
                    ParryState.RadiusAdornment.Transparency = 0.3
                    ParryState.RadiusAdornment.Adornee = hrp
                    ParryState.RadiusAdornment.Parent = hrp
                    ParryState.RadiusAdornment.ZIndex = 0
                    ParryState.RadiusAdornment.AlwaysOnTop = false
                end
                local cR = VD.Surv_ParryRadius or 15
                ParryState.RadiusAdornment.Radius = cR
                ParryState.RadiusAdornment.InnerRadius = math.max(0.1, cR - 0.15)
                ParryState.RadiusAdornment.CFrame = CFrame.new(0, -3, 0) * CFrame.Angles(math.rad(90), 0, 0)
                if ParryState.Cooldown then
                    ParryState.RadiusAdornment.Color3 = Color3.fromRGB(128, 128, 128)
                elseif VD.Surv_ParryAggressive then
                    ParryState.RadiusAdornment.Color3 = Color3.fromRGB(255, 255, 255)
                else
                    ParryState.RadiusAdornment.Color3 = Color3.fromRGB(25, 25, 25)
                end
            elseif ParryState.RadiusAdornment then
                pcall(function() ParryState.RadiusAdornment:Destroy() end)
                ParryState.RadiusAdornment = nil
            end
        end
    end)
end

--====================================================--
-- 100% MENTAH VDT: AUTO PARRY (V1, V2, Aggressive, ESP)
--====================================================--
do
    local tbl = {
        Players = Players, UserInputService = UserInputService, RunService = RunService,
        ReplicatedStorage = ReplicatedStorage, VirtualInputManager = VirtualInputManager,
        LocalPlayer = LocalPlayer, Workspace = workspace,
    }
    
    local parry
    local tbl3 = {
        Surv_Parry = false, Surv_ParryV2 = false, Surv_ParryCircle = true,
        Surv_ParryAggressive = false, Surv_ParrySafety = false, Surv_ParryRadius = 15,
        Surv_ParryFace = 0.7, Ignored_Skills_List = {},
    }
    local tbl6 = {
        ParryCooldown = false, ParryCooldownTime = 50, Pv2Con = nil, TrackV2 = {}, autoParry = nil,
    }
    local tbl5 = {
        ["122812055447896"] = "Veil lunge", ["133963973694098"] = "Mayers Basic", ["117042998468241"] = "Mayers lunge",
        ["135002183282873"] = "cure lunge", ["121216847022485"] = "cure Basic", ["132817836308238"] = "Jeff Basic",
        ["129784271201071"] = "Jeff lunge", ["82666958311998"] = "Jeff Frenzy", ["78432063483146"] = "Abyssal Basic",
        ["118907603246885"] = "Abyssal lunge", ["139369275981139"] = "Jason Basic", ["110355011987939"] = "Jason lunge",
        ["111920872708571"] = "Masked Basic", ["105374834496520"] = "Masked lunge", ["138720291317243"] = "Masked Tony",
        ["106871536134254"] = "Masked Alex", ["130593238885843"] = "Masked Cobra", ["115244153053858"] = "Masked Cobra lunge",
        ["74968262036854"] = "Hidden Basic", ["113255068724446"] = "Hidden lunge", ["98163597193511"] = "Hidden S1",
        ["80411309607666"] = "Abyssal S1",
    }

    local function fn6(arg) return arg and arg.Team and arg.Team.Name == "Killer" end
    local function fn11(arg)
        if not arg then return false end
        return arg:GetAttribute("Knocked") == true or arg:GetAttribute("IsHooked") == true
    end
    local function fn13(arg)
        if not tbl3.Surv_ParrySafety then return true end
        if not arg then return false end
        local checkInterractable = arg:FindFirstChild("CheckInterractable")
        if checkInterractable then
            if checkInterractable:GetAttribute("isVaulting") == true then return false end
            if checkInterractable:GetAttribute("isRepairing") == true then return false end
            if checkInterractable:GetAttribute("isUnhooking") == true then return false end
            if checkInterractable:GetAttribute("isHealing") == true then return false end
            if checkInterractable:GetAttribute("isSliding") == true then return false end
        end
        return true
    end

    parry = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Items") and ReplicatedStorage.Remotes.Items:FindFirstChild("Parrying Dagger") and ReplicatedStorage.Remotes.Items["Parrying Dagger"]:FindFirstChild("parry")

    local function fn52()
        pcall(function()
            local playerGui = LocalPlayer:FindFirstChild("PlayerGui")
            if not playerGui then return end
            local guiMob = playerGui:FindFirstChild("Survivor-mob") and playerGui["Survivor-mob"]:FindFirstChild("Controls") and playerGui["Survivor-mob"].Controls:FindFirstChild("Gui-mob")
            if guiMob and guiMob:IsA("GuiObject") and guiMob.Visible then
                if type(firesignal) == "function" then
                    pcall(function()
                        firesignal(guiMob.MouseButton1Down)
                        task.wait(0.01)
                        firesignal(guiMob.MouseButton1Up)
                    end)
                end
            else
                pcall(function()
                    if VirtualInputManager then
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 1, true, game, 0)
                        task.wait(0.01)
                        VirtualInputManager:SendMouseButtonEvent(0, 0, 1, false, game, 0)
                    end
                end)
            end
        end)
    end

    local function fn53()
        if tbl6.ParryCooldown then return end
        pcall(function()
            if parry then parry:FireServer() end
            task.spawn(fn52)
        end)
    end

    -- V1 (Anim Tracker)
    local tbl18 = {}
    local function fn71(arg)
        if not arg or tbl18[arg] then return end
        tbl18[arg] = true
        local humanoid2 = arg:WaitForChild("Humanoid", 5)
        if not humanoid2 then return end
        local animator = humanoid2:FindFirstChildOfClass("Animator") or humanoid2:WaitForChild("Animator", 5)
        if not animator then return end
        local connection4 = nil
        connection4 = humanoid2.ChildAdded:Connect(function(child)
            if child:IsA("Animator") then
                tbl18[arg] = nil; if connection4 then connection4:Disconnect() end; fn71(arg)
            end
        end)
        arg.AncestryChanged:Connect(function(child, parent)
            if not parent then tbl18[arg] = nil; if connection4 then connection4:Disconnect() end end
        end)
        
        animator.AnimationPlayed:Connect(function(arg2)
            local match = (arg2.Animation and arg2.Animation.AnimationId or ""):match("%d+")
            local v4 = tbl5[match]
            if not v4 or not tbl3.Surv_Parry then return end
            if tbl3.Ignored_Skills_List and tbl3.Ignored_Skills_List[v4] then return end

            local character = LocalPlayer.Character
            local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
            local humanoidRootPart3 = arg:FindFirstChild("HumanoidRootPart")
            if not humanoidRootPart2 or not humanoidRootPart3 then return end

            local magnitude = (humanoidRootPart2.Position - humanoidRootPart3.Position).Magnitude
            if tbl6.ParryCooldown or fn11(character) or not fn13(character) then return end

            if tbl3.Surv_ParryAggressive then
                local n4 = 10
                if tbl3.Surv_ParryRadius + 5 < magnitude then return end
                local connection5 = nil; local now = os.clock()
                connection5 = RunService.Heartbeat:Connect(function()
                    if os.clock() - now >= 1.5 or not humanoidRootPart2 or not humanoidRootPart2.Parent or not humanoidRootPart3 or not humanoidRootPart3.Parent then
                        connection5:Disconnect() return
                    end
                    if fn11(character) then connection5:Disconnect() return end
                    if (humanoidRootPart2.Position - humanoidRootPart3.Position).Magnitude <= n4 then
                        if not tbl6.ParryCooldown and fn13(character) then
                            local n5 = Vector3.new(humanoidRootPart2.Position.X, 0, humanoidRootPart2.Position.Z) - Vector3.new(humanoidRootPart3.Position.X, 0, humanoidRootPart3.Position.Z)
                            if n5.Magnitude > 0 then
                                if (tbl3.Surv_ParryFace or 0.7) <= Vector3.new(humanoidRootPart3.CFrame.LookVector.X, 0, humanoidRootPart3.CFrame.LookVector.Z).Unit:Dot(n5.Unit) then
                                    fn53() connection5:Disconnect()
                                end
                            else
                                fn53() connection5:Disconnect()
                            end
                        end
                    end
                end)
            else
                if magnitude > tbl3.Surv_ParryRadius then return end
                if humanoidRootPart2.Parent and humanoidRootPart3.Parent then
                    local n4 = Vector3.new(humanoidRootPart2.Position.X, 0, humanoidRootPart2.Position.Z) - Vector3.new(humanoidRootPart3.Position.X, 0, humanoidRootPart3.Position.Z)
                    if not (n4.Magnitude > 0) then return end
                    local vector = Vector3.new(humanoidRootPart3.CFrame.LookVector.X, 0, humanoidRootPart3.CFrame.LookVector.Z)
                    if vector.Magnitude > 0.001 then
                        if vector.Unit:Dot(n4.Unit) < (tbl3.Surv_ParryFace or 0.7) then return end
                    end
                    fn53()
                end
            end
        end)
    end

    local function fn73(arg)
        if arg == LocalPlayer then return end
        arg.CharacterAdded:Connect(function() if arg ~= LocalPlayer and fn6(arg) and arg.Character then fn71(arg.Character) end end)
        arg:GetPropertyChangedSignal("Team"):Connect(function() if arg ~= LocalPlayer and fn6(arg) and arg.Character then fn71(arg.Character) end end)
        if arg.Character and fn6(arg) then fn71(arg.Character) end
    end
    for _, player in ipairs(Players:GetPlayers()) do fn73(player) end
    Players.PlayerAdded:Connect(fn73)

    -- V2 (Heartbeat Tracker)
    local tbl15 = {}
    local function fn54()
        table.clear(tbl15)
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and fn6(player) and player.Character then table.insert(tbl15, player) end
        end
    end
    Players.PlayerAdded:Connect(fn54)
    Players.PlayerRemoving:Connect(fn54)
    for _, player in ipairs(Players:GetPlayers()) do player:GetPropertyChangedSignal("Team"):Connect(fn54) end
    fn54()

    local function fn55(arg)
        if arg then
            if tbl6.Pv2Con then return end
            tbl6.Pv2Con = RunService.Heartbeat:Connect(function()
                if tbl6.ParryCooldown then return end
                local character = LocalPlayer.Character
                if not character or fn11(character) or not fn13(character) then return end
                local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")
                if not humanoidRootPart2 then return end
                local n2 = (tbl3.Surv_ParryRadius or 15) + 5
                for _, v3 in ipairs(tbl15) do
                    local character2 = v3.Character
                    if character2 then
                        local humanoidRootPart3 = character2:FindFirstChild("HumanoidRootPart")
                        if humanoidRootPart3 then
                            local magnitude = (humanoidRootPart2.Position - humanoidRootPart3.Position).Magnitude
                            if not (n2 < magnitude) then
                                local animator = character2:FindFirstChildOfClass("Humanoid") and character2.Humanoid:FindFirstChildOfClass("Animator")
                                if animator then
                                    local n3 = Vector3.new(humanoidRootPart2.Position.X, 0, humanoidRootPart2.Position.Z) - Vector3.new(humanoidRootPart3.Position.X, 0, humanoidRootPart3.Position.Z)
                                    local flag3 = false
                                    if n3.Magnitude > 0 then flag3 = Vector3.new(humanoidRootPart3.CFrame.LookVector.X, 0, humanoidRootPart3.CFrame.LookVector.Z).Unit:Dot(n3.Unit) >= (tbl3.Surv_ParryFace or 0.85) end
                                    if flag3 then
                                        for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                                            if not tbl6.TrackV2[track] then
                                                tbl6.TrackV2[track] = true
                                                local v4 = tbl5[(track.Animation and track.Animation.AnimationId or ""):match("%d+")]
                                                if v4 and not (tbl3.Ignored_Skills_List and tbl3.Ignored_Skills_List[v4]) then
                                                    if magnitude <= tbl3.Surv_ParryRadius then fn53() end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
                for k in pairs(tbl6.TrackV2) do if not k.IsPlaying then tbl6.TrackV2[k] = nil end end
            end)
        else
            if tbl6.Pv2Con then tbl6.Pv2Con:Disconnect(); tbl6.Pv2Con = nil end
            table.clear(tbl6.TrackV2)
        end
    end

    -- Parry Circle Visual (VDT Render)
    RunService.RenderStepped:Connect(function()
        local humanoidRootPart2 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        local survParry = tbl3.Surv_ParryCircle and (tbl3.Surv_Parry or tbl3.Surv_ParryV2)

        if survParry and humanoidRootPart2 then
            if not tbl6.autoParry or tbl6.autoParry.Parent ~= humanoidRootPart2 then
                if tbl6.autoParry then tbl6.autoParry:Destroy() end
                tbl6.autoParry = Instance.new("CylinderHandleAdornment")
                tbl6.autoParry.Name = "AutoParryCircleESP"
                tbl6.autoParry.Height = 0.05
                tbl6.autoParry.Transparency = 0.3
                tbl6.autoParry.Adornee = humanoidRootPart2
                tbl6.autoParry.Parent = humanoidRootPart2
                tbl6.autoParry.ZIndex = 0
                tbl6.autoParry.AlwaysOnTop = false
            end
            local survParryRadius = tbl3.Surv_ParryRadius
            if tbl3.Surv_ParryAggressive then survParryRadius += 5 end
            tbl6.autoParry.Radius = survParryRadius
            tbl6.autoParry.InnerRadius = math.max(0.1, survParryRadius - 0.15)
            tbl6.autoParry.CFrame = CFrame.new(0, -3, 0) * CFrame.Angles(1.5707963267948966, 0, 0)
            if tbl6.ParryCooldown then tbl6.autoParry.Color3 = Color3.fromRGB(255, 128, 0)
            elseif tbl3.Surv_ParryAggressive then tbl6.autoParry.Color3 = Color3.fromRGB(255, 0, 0)
            else tbl6.autoParry.Color3 = Color3.fromRGB(0, 255, 255) end
        elseif tbl6.autoParry then
            tbl6.autoParry:Destroy(); tbl6.autoParry = nil
        end
    end)

    -- Cooldown Listener
    task.spawn(function()
        local remotes2 = ReplicatedStorage:WaitForChild("Remotes", 5)
        remotes2 = remotes2 and remotes2:WaitForChild("Items", 5):WaitForChild("Parrying Dagger", 5)
        remotes2 = remotes2 and remotes2:WaitForChild("parryResult", 5)
        if remotes2 then
            remotes2.OnClientEvent:Connect(function(arg, arg2)
                local n4 = tonumber(arg2) or arg == true and 90 or 60
                tbl6.ParryCooldown = true
                if tbl6.ParryCooldownThread then task.cancel(tbl6.ParryCooldownThread) end
                tbl6.ParryCooldownThread = task.delay(n4, function() tbl6.ParryCooldown = false end)
            end)
        end
    end)

    _G.VDT_Parry = { tbl3 = tbl3, fn55 = fn55 }
end
--====================================================--
-- AUTO PARRY V3.1 (BolongHub + FIXES)
-- Fixed: tracking, fallback press, force trigger, debug
--====================================================--
do
    VD.AP3_Enabled     = VD.AP3_Enabled     or false
    VD.AP3_RadiusESP   = VD.AP3_RadiusESP   or false
    VD.AP3_Radius      = VD.AP3_Radius      or 11
    VD.AP3_Strictness  = VD.AP3_Strictness  or 0.1
    VD.AP3_Debug       = VD.AP3_Debug       or false
    VD.AP3_ForceClose  = VD.AP3_ForceClose  ~= false -- force trigger kalau super dekat

    local AP3 = {
        Enabled = false,
        TrackedActions   = {},
        KillerCharacters = {},
        RadarParts       = {},
        RadarConn        = nil,
        Cooldown         = 0,   -- anti double-fire
        LastParryCount   = 0,
        RefreshTimer     = 0,
    }

    local HIDDEN_S1_FULL = "rbxassetid://98163597193511"
    local CLOSE_DIST = 30
    local NEAR_DIST  = 4.5
    local MED_DIST   = 2.75
    local FORCE_DIST = 3.5
    local APPROACH_DOT = 2.0
    local PREDICT_TIME = 0.18
    local NEAR_PLUS = 2.25
    local PARRY_COOLDOWN = 0.15

    local SKILL_DB_NUM = {
        [113255068724446]={type="lungehold",length=1.00,triggerProgress=0.018,triggerTime=0.018},
        [74968262036854]={type="attack",length=1.70,triggerProgress=0.018,triggerTime=0.030},
        [135002183282873]={type="lungehold",length=1.50,triggerProgress=0.015,triggerTime=0.022},
        [121216847022485]={type="attack",length=1.75,triggerProgress=0.015,triggerTime=0.025},
        [117042998468241]={type="lungehold",length=1.00,triggerProgress=0.018,triggerTime=0.018},
        [133963973694098]={type="attack",length=1.72,triggerProgress=0.016,triggerTime=0.025},
        [110355011987939]={type="lungehold",length=1.00,triggerProgress=0.012,triggerTime=0.012},
        [139369275981139]={type="attack",length=1.72,triggerProgress=0.014,triggerTime=0.022},
        [118907603246885]={type="lungehold",length=0.83,triggerProgress=0.010,triggerTime=0.010},
        [78432063483146]={type="attack",length=1.72,triggerProgress=0.018,triggerTime=0.025},
        [122812055447896]={type="lungehold",length=0.75,triggerProgress=0.010,triggerTime=0.008},
        [78935059863801]={type="attack",length=1.63,triggerProgress=0.016,triggerTime=0.022},
        [129784271201071]={type="lungehold",length=1.00,triggerProgress=0.015,triggerTime=0.015},
        [132817836308238]={type="attack",length=1.72,triggerProgress=0.017,triggerTime=0.025},
        [105374834496520]={type="lungehold",length=1.00,triggerProgress=0.010,triggerTime=0.010},
        [111920872708571]={type="attack",length=1.72,triggerProgress=0.014,triggerTime=0.022},
    }
    local SKILL_DB = {}
    for id, prof in pairs(SKILL_DB_NUM) do
        SKILL_DB["rbxassetid://"..id] = prof
    end

    local MASKED_FAST = {
        ["rbxassetid://117070354890871"]={type="lungehold",length=2.00},
        ["rbxassetid://106871536134254"]={type="attack",length=3.00},
        ["rbxassetid://109402730355822"]={type="attack",length=2.95},
    }

    -- ==== PARRY ACTION (robust multi-method) ====
    local function AP3_PressParry()
        local char = LocalPlayer.Character
        if not char then return false end
        local now = tick()
        if now - AP3.Cooldown < PARRY_COOLDOWN then return false end
        AP3.Cooldown = now
        AP3.LastParryCount = AP3.LastParryCount + 1

        local fired = false

        -- Method 1: Remote Parrying Dagger (fastest)
        pcall(function()
            local pr = ReplicatedStorage:FindFirstChild("Remotes")
                and ReplicatedStorage.Remotes:FindFirstChild("Items")
                and ReplicatedStorage.Remotes.Items:FindFirstChild("Parrying Dagger")
                and ReplicatedStorage.Remotes.Items["Parrying Dagger"]:FindFirstChild("parry")
            if pr then
                for _ = 1, 3 do pr:FireServer() end
                fired = true
            end
        end)

        -- Method 2: Gui-mob tap (client-side trigger, ALWAYS valid)
        pcall(function()
            local pg = LocalPlayer:FindFirstChild("PlayerGui")
            local mob = pg and pg:FindFirstChild("Survivor-mob")
            local controls = mob and mob:FindFirstChild("Controls")
            local btn = controls and controls:FindFirstChild("Gui-mob")
            if btn and btn:IsA("ImageButton") and type(firesignal) == "function" then
                firesignal(btn.MouseButton1Down)
                task.delay(0.02, function()
                    if btn and btn.Parent then
                        pcall(firesignal, btn.MouseButton1Up)
                        pcall(firesignal, btn.MouseButton1Click)
                    end
                end)
                fired = true
            end
        end)

        -- Method 3: VirtualInputManager tap (mobile fallback)
        if not fired and VirtualInputManager then
            pcall(function()
                VirtualInputManager:SendMouseButtonEvent(0, 0, 1, true, game, 0)
                task.wait(0.02)
                VirtualInputManager:SendMouseButtonEvent(0, 0, 1, false, game, 0)
                fired = true
            end)
        end

        -- Method 4: keyboard space fallback
        if not fired and VirtualInputManager then
            pcall(function()
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
                task.wait(0.02)
                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
            end)
        end

        -- Cleanup "doing action" tag
        local root = char:FindFirstChild("HumanoidRootPart")
        if root then
            pcall(function()
                if CollectionService:HasTag(root, "doing action") then
                    CollectionService:RemoveTag(root, "doing action")
                end
            end)
        end

        if VD.AP3_Debug then
            VD_Notify("AP3 Parry", "Fired #" .. AP3.LastParryCount, 1)
        end
        return fired
    end

    -- ==== LOS CHECK ====
    local function AP3_HasLineOfSight(killerChar, dist, isLunge)
        local myC = LocalPlayer.Character
        local myRoot = myC and myC:FindFirstChild("HumanoidRootPart")
        local kRoot = killerChar and killerChar:FindFirstChild("HumanoidRootPart")
        if not myRoot or not kRoot then return false end
        local rp = RaycastParams.new()
        rp.FilterType = Enum.RaycastFilterType.Exclude
        rp.FilterDescendantsInstances = {myC, killerChar}
        rp.IgnoreWater = true
        local offsets = { Vector3.new(0,0,0), Vector3.new(0,1.1,0), Vector3.new(0,-0.75,0) }
        local dir = kRoot.Position - myRoot.Position
        if dir.Magnitude <= 0.05 then return true end
        local vaultInWay = false
        for _, off in ipairs(offsets) do
            local hit = Workspace:Raycast(myRoot.Position + off, dir, rp)
            if not hit then return true end
            local n = hit.Instance and string.lower(hit.Instance.Name) or ""
            if n:find("vault") or n:find("window") or n:find("ledge") then
                vaultInWay = true
            end
        end
        if isLunge and vaultInWay and dist <= VD.AP3_Radius + NEAR_PLUS then
            return true
        end
        return false
    end

    local function AP3_TryParry(killerChar, dist, isLunge, force)
        if not VD.AP3_Enabled then return false end
        if dist > VD.AP3_Radius then return false end
        if not force and not AP3_HasLineOfSight(killerChar, dist, isLunge) then
            if VD.AP3_Debug then
                VD_Notify("AP3", "LOS blocked @ " .. string.format("%.1f", dist), 1)
            end
            return false
        end
        return AP3_PressParry()
    end

    -- ==== TRACK KILLER (no TeamIs gate, robust re-hook) ====
    local function AP3_TrackKiller(player, char)
        if player == LocalPlayer then return end
        if not char or not char.Parent then return end
        if AP3.KillerCharacters[char] then return end

        AP3.KillerCharacters[char] = { player = player, animator = nil, conn = nil }

        local function reconnectAnimator()
            local rec = AP3.KillerCharacters[char]
            if not rec then return end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not hum then return end
            local animator = hum:FindFirstChildOfClass("Animator")
            if not animator then return end
            if rec.animator == animator and rec.conn then return end
            if rec.conn then pcall(function() rec.conn:Disconnect() end) end
            rec.animator = animator

            rec.conn = animator.AnimationPlayed:Connect(function(track)
                if not VD.AP3_Enabled then return end
                if not track or not track.Animation then return end
                local aid = track.Animation.AnimationId

                if VD.AP3_Debug then
                    VD_Notify("AP3 Anim", tostring(aid):match("%d+") or "?", 1)
                end

                -- Hidden S1: close-distance auto parry
                if aid == HIDDEN_S1_FULL then
                    local myC = LocalPlayer.Character
                    local myRoot = myC and myC:FindFirstChild("HumanoidRootPart")
                    local kRoot = char:FindFirstChild("HumanoidRootPart")
                    if myRoot and kRoot then
                        local d = (Vector3.new(myRoot.Position.X,0,myRoot.Position.Z) - Vector3.new(kRoot.Position.X,0,kRoot.Position.Z)).Magnitude
                        if d <= CLOSE_DIST then
                            AP3_TryParry(char, d, false, true)
                        end
                    end
                    return
                end

                -- Masked fast
                if MASKED_FAST[aid] then
                    local myC = LocalPlayer.Character
                    local myRoot = myC and myC:FindFirstChild("HumanoidRootPart")
                    local kRoot = char:FindFirstChild("HumanoidRootPart")
                    if myRoot and kRoot then
                        local d = (Vector3.new(myRoot.Position.X,0,myRoot.Position.Z) - Vector3.new(kRoot.Position.X,0,kRoot.Position.Z)).Magnitude
                        if d <= VD.AP3_Radius then
                            AP3_TryParry(char, d, true)
                        end
                    end
                    return
                end

                -- Standard
                local prof = SKILL_DB[aid]
                if not prof then return end

                local action = { track = track, profile = prof, fired = false }
                AP3.TrackedActions[char] = action
                local stopConn
                stopConn = track.Stopped:Connect(function()
                    if stopConn then stopConn:Disconnect() end
                    task.delay(0.2, function()
                        if AP3.TrackedActions[char] and AP3.TrackedActions[char].track == track then
                            AP3.TrackedActions[char] = nil
                        end
                    end)
                end)
            end)

            hum.ChildAdded:Connect(function(c)
                if c:IsA("Animator") then
                    task.wait(0.1)
                    reconnectAnimator()
                end
            end)
        end

        reconnectAnimator()

        char.AncestryChanged:Connect(function(_, parent)
            if not parent then
                local rec = AP3.KillerCharacters[char]
                if rec and rec.conn then pcall(function() rec.conn:Disconnect() end) end
                AP3.KillerCharacters[char] = nil
                AP3.TrackedActions[char] = nil
            end
        end)

        local hum = char:WaitForChild("Humanoid", 5)
        if hum then
            hum.ChildAdded:Connect(function(c)
                if c:IsA("Animator") then
                    task.wait(0.1)
                    reconnectAnimator()
                end
            end)
        end
    end

    local function AP3_SetupPlayer(player)
        if player == LocalPlayer then return end
        if player.Character then
            task.spawn(AP3_TrackKiller, player, player.Character)
        end
        player.CharacterAdded:Connect(function(char)
            task.spawn(AP3_TrackKiller, player, char)
        end)
        player:GetPropertyChangedSignal("Team"):Connect(function()
            if player.Character then
                task.spawn(AP3_TrackKiller, player, player.Character)
            end
        end)
    end
    for _, p in ipairs(Players:GetPlayers()) do AP3_SetupPlayer(p) end
    Players.PlayerAdded:Connect(AP3_SetupPlayer)

    -- Periodic re-scan (5s) to re-hook missed killers
    task.spawn(function()
        while true do
            task.wait(5)
            if not VD.AP3_Enabled then continue end
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    if not AP3.KillerCharacters[p.Character] then
                        task.spawn(AP3_TrackKiller, p, p.Character)
                    end
                end
            end
        end
    end)

    -- ==== MONITOR LOOP (50Hz) ====
    task.spawn(function()
        while true do
            task.wait(0.02)
            if not VD.AP3_Enabled then continue end
            pcall(function()
                local myC = LocalPlayer.Character
                local myRoot = myC and myC:FindFirstChild("HumanoidRootPart")
                if not myRoot then return end
                if AP3_TryParry == nil then return end

                local ping = 0
                pcall(function() ping = math.clamp(LocalPlayer:GetNetworkPing(), 0, 0.3) end)

                -- 1) CLOSE-RANGE MONITOR
                for kChar in pairs(AP3.KillerCharacters) do
                    if not kChar or not kChar.Parent then
                        AP3.KillerCharacters[kChar] = nil
                    else
                        local kRoot = kChar:FindFirstChild("HumanoidRootPart")
                        if kRoot then
                            local diff = myRoot.Position - kRoot.Position
                            local horiz = Vector3.new(diff.X, 0, diff.Z)
                            local dist = horiz.Magnitude
                            local kVel = kRoot.AssemblyLinearVelocity
                            local mVel = myRoot.AssemblyLinearVelocity
                            local relVel = Vector3.new(kVel.X - mVel.X, 0, kVel.Z - mVel.Z)
                            local approach = dist > 0 and relVel:Dot(horiz.Unit) or 0
                            local predK = kRoot.Position + Vector3.new(kVel.X, 0, kVel.Z) * ping
                            local predM = myRoot.Position + Vector3.new(mVel.X, 0, mVel.Z) * ping
                            local predDist = (Vector3.new(predM.X,0,predM.Z) - Vector3.new(predK.X,0,predK.Z)).Magnitude

                            local near = false
                            local forceNear = false
                            if dist <= MED_DIST then near = true; forceNear = true
                            elseif dist <= FORCE_DIST and VD.AP3_ForceClose then near = true; forceNear = true
                            elseif dist <= NEAR_DIST and approach >= APPROACH_DOT then
                                local t = dist / approach
                                if t <= PREDICT_TIME or predDist <= 3.75 then near = true end
                            end

                            if near then
                                local action = AP3.TrackedActions[kChar]
                                if action and not action.fired then
                                    if AP3_TryParry(kChar, dist, action.profile.type == "lungehold", forceNear) then
                                        action.fired = true
                                    end
                                elseif not action and forceNear then
                                    -- No active action but super close → force parry
                                    AP3_TryParry(kChar, dist, false, true)
                                end
                            end
                        end
                    end
                end

                -- 2) ATTACKERS MONITOR (progress based)
                for kChar, action in pairs(AP3.TrackedActions) do
                    if not kChar or not kChar.Parent or not action.track or not action.track.IsPlaying then
                        AP3.TrackedActions[kChar] = nil
                    elseif not action.fired then
                        local prof = action.profile
                        local kRoot = kChar:FindFirstChild("HumanoidRootPart")
                        if kRoot then
                            local diff = myRoot.Position - kRoot.Position
                            local horiz = Vector3.new(diff.X, 0, diff.Z)
                            local dist = diff.Magnitude
                            local kVel = kRoot.AssemblyLinearVelocity
                            local mVel = myRoot.AssemblyLinearVelocity
                            local flatK = Vector3.new(kVel.X, 0, kVel.Z)
                            local flatM = Vector3.new(mVel.X, 0, mVel.Z)
                            local approach = horiz.Magnitude > 0 and (flatK - flatM):Dot(horiz.Unit) or 0

                            local near = false
                            if dist <= MED_DIST then near = true
                            elseif dist <= NEAR_DIST and approach >= APPROACH_DOT then
                                local t = dist / approach
                                if t <= PREDICT_TIME then near = true end
                            end

                            local shouldFire = false
                            if near then
                                shouldFire = true
                            else
                                local timePos = action.track.TimePosition or 0
                                local length = action.track.Length or prof.length
                                local progress = length > 0 and (timePos / length) or 0
                                if timePos >= prof.triggerTime or progress >= prof.triggerProgress then
                                    if prof.type == "lungehold" then
                                        local gap = math.max(dist - 3.5, 0)
                                        local t2 = approach > 0 and gap / approach or math.huge
                                        if approach >= 6 and t2 <= 0.32 then shouldFire = true end
                                    else
                                        shouldFire = true
                                    end
                                end
                            end

                            if shouldFire then
                                local forceNear = dist <= FORCE_DIST and VD.AP3_ForceClose
                                if AP3_TryParry(kChar, dist, prof.type == "lungehold", forceNear) then
                                    action.fired = true
                                end
                            end
                        end
                    end
                end
            end)
        end
    end)

    -- ==== RADIUS ESP ====
    local function AP3_StartRadar()
        if AP3.RadarConn then return end
        AP3.RadarParts = {}
        local segs = 32
        local segArc = (2 * math.pi) / segs
        for i = 1, segs do
            local p = Instance.new("Part")
            p.Shape = Enum.PartType.Block
            p.Anchored = true; p.CanCollide = false
            p.CanQuery = false; p.CastShadow = false
            p.Material = Enum.Material.Neon
            p.Color = Color3.fromRGB(255, 255, 255)
            p.Transparency = 1
            p.Size = Vector3.new(0.08, 0.08, 0.1)
            p.Name = "AP3_RadarSeg"
            p.Parent = Workspace
            AP3.RadarParts[i] = p
        end
        AP3.RadarConn = RunService.RenderStepped:Connect(function()
            local show = VD.AP3_Enabled and VD.AP3_RadiusESP
            local char = LocalPlayer.Character
            local root = char and char:FindFirstChild("HumanoidRootPart")
            if not show or not root then
                for _, p in ipairs(AP3.RadarParts) do
                    if p and p.Parent then p.Transparency = 1 end
                end
                return
            end
            local radius = VD.AP3_Radius
            local arc = (2 * math.pi * radius) / segs
            local center = root.Position - Vector3.new(0, root.Size.Y/2 + 1.5, 0)
            for i, p in ipairs(AP3.RadarParts) do
                if p and p.Parent then
                    local a1 = segArc * (i - 1)
                    local a2 = segArc * i
                    local pos1 = center + Vector3.new(math.cos(a1)*radius, 0, math.sin(a1)*radius)
                    local pos2 = center + Vector3.new(math.cos(a2)*radius, 0, math.sin(a2)*radius)
                    p.Size = Vector3.new(0.08, 0.08, arc + 0.02)
                    p.CFrame = CFrame.lookAt(pos1, pos2) * CFrame.new(0, 0, -arc/2)
                    p.Transparency = 0.15
                end
            end
        end)
    end

    local function AP3_StopRadar()
        if AP3.RadarConn then AP3.RadarConn:Disconnect(); AP3.RadarConn = nil end
        for _, p in ipairs(AP3.RadarParts) do
            if p and p.Parent then p:Destroy() end
        end
        AP3.RadarParts = {}
    end

    -- ==== PUBLIC API ====
W.AP3_SetEnabled = function(v)
    VD.AP3_Enabled = v and true or false
    AP3.Enabled = VD.AP3_Enabled
    if not v then
        AP3.TrackedActions = {}
    else
        -- Force re-scan semua killer saat baru enable
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and p.Character then
                task.spawn(AP3_TrackKiller, p, p.Character)
            end
        end
    end
    -- Sync floating button visual
    if getgenv().Gluto_AutoParryV3Btn_UpdateVisual then
        pcall(getgenv().Gluto_AutoParryV3Btn_UpdateVisual)
    end
end
    W.AP3_SetRadiusESP = function(v)
        VD.AP3_RadiusESP = v and true or false
        if v then AP3_StartRadar() else AP3_StopRadar() end
    end
    W.AP3_SetRadius    = function(v) VD.AP3_Radius = tonumber(v) or 11 end
    W.AP3_SetStrictness = function(v) VD.AP3_Strictness = tonumber(v) or 0.1 end
    W.AP3_SetDebug     = function(v) VD.AP3_Debug = v and true or false end
    W.AP3_SetForceClose = function(v) VD.AP3_ForceClose = v and true or false end
    W.AP3_GetStatus    = function()
        local count = 0
        for _ in pairs(AP3.KillerCharacters) do count = count + 1 end
        return { tracked = count, parries = AP3.LastParryCount, cooldown = PARRY_COOLDOWN }
    end

    if VD.AP3_Enabled then task.defer(function() W.AP3_SetEnabled(true) end) end
    if VD.AP3_RadiusESP then task.defer(AP3_StartRadar) end
end

    local lastAutoAttack = 0
    function W.KA_AutoAttack()
        if not VD.KILLER_AutoAttack then return end
        if GetRole() ~= "Killer" then return end
        local now = tick()
        if now - lastAutoAttack < (VD.KILLER_AutoAttackCooldown or 0.15) then return end
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local closest, shortest = nil, VD.KILLER_AutoAttackRange or 12
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and TeamIs(plr, "Survivor") and plr.Character then
                local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                if hum and hrp and hum.Health > 35 then
                    local d = (hrp.Position - root.Position).Magnitude
                    if d <= shortest then shortest = d; closest = plr end
                end
            end
        end
        if closest then
            lastAutoAttack = now
            pcall(function()
                local attacks = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Attacks")
                local basic = attacks and attacks:FindFirstChild("BasicAttack")
                if basic then basic:FireServer(false) end
            end)
        end
    end

    local lastAutoFlee = 0
    function W.SURV_AutoFlee()
        if not VD.SURV_AutoFlee then return end
        if GetRole() ~= "Survivor" then return end
        local now = tick()
        if now - lastAutoFlee < (VD.SURV_AutoFleeCooldown or 1.5) then return end
        local myChar = LocalPlayer.Character
        local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
        local hum = myChar and myChar:FindFirstChildOfClass("Humanoid")
        if not myRoot or not hum or hum.Health <= 0 then return end
        local killerRoot = nil; local nearest = math.huge
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and TeamIs(plr, "Killer") and plr.Character then
                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local d = (hrp.Position - myRoot.Position).Magnitude
                    if d < nearest then nearest = d; killerRoot = hrp end
                end
            end
        end
        if not killerRoot then return end
        if nearest > (VD.SURV_AutoFleeDist or 40) then return end
        lastAutoFlee = now
        local bestPt, bestDist = nil, 0
        local mf = Workspace:FindFirstChild("Map")
        if mf then
            for _, obj in ipairs(mf:GetDescendants()) do
                if obj:IsA("BasePart") and string.find(obj.Name, "^GeneratorPoint%d+$") then
                    local d = (obj.Position - killerRoot.Position).Magnitude
                    if d > bestDist then bestDist = d; bestPt = obj end
                end
            end
        end
        if bestPt then
            pcall(function() myRoot.CFrame = bestPt.CFrame + Vector3.new(0, 5, 0) end)
            VD_Notify("Auto Flee", "Teleported away from killer!", 2)
        end
    end

    task.spawn(function()
        while true do
            task.wait(0.1)
            pcall(W.KA_AutoAttack)
            pcall(W.SURV_AutoFlee)
        end
    end)

    local KillerAttackAnims = {
        ["78432063483146"]="attack",["121216847022485"]="attack",["74968262036854"]="attack",
        ["132817836308238"]="attack",["82666958311998"]="attack",["111920872708571"]="attack",
        ["106871536134254"]="attack",["109402730355822"]="attack",["130593238885843"]="attack",
        ["138720291317243"]="attack",["139369275981139"]="attack",["133963973694098"]="attack",
        ["78935059863801"]="attack",
        ["118907603246885"]="lungehold",["135002183282873"]="lungehold",["113255068724446"]="lungehold",
        ["129784271201071"]="lungehold",["105374834496520"]="lungehold",["117070354890871"]="lungehold",
        ["115244153053858"]="lungehold",["110355011987939"]="lungehold",["117042998468241"]="lungehold",
        ["122812055447896"]="lungehold"
    }

    do
        local VeilState = { target = nil, lookVector = nil, velHistory = {} }
        local VeilVisuals = {}
        pcall(function()
            if typeof(Drawing) ~= "table" or not Drawing.new then return end
            VeilVisuals.FOVCircleOutline = Drawing.new("Circle")
            VeilVisuals.FOVCircleOutline.Color = Color3.fromRGB(0, 0, 0)
            VeilVisuals.FOVCircleOutline.Thickness = 3
            VeilVisuals.FOVCircleOutline.Filled = false
            VeilVisuals.FOVCircleOutline.Transparency = 0.4
            VeilVisuals.FOVCircleOutline.Visible = false
            VeilVisuals.FOVCircleFill = Drawing.new("Circle")
            VeilVisuals.FOVCircleFill.Color = _G.GLUTO_THEME
            VeilVisuals.FOVCircleFill.Thickness = 1
            VeilVisuals.FOVCircleFill.Filled = false
            VeilVisuals.FOVCircleFill.Transparency = 0.5
            VeilVisuals.FOVCircleFill.Visible = false
            VeilVisuals.TrackerCircleOutline = Drawing.new("Circle")
            VeilVisuals.TrackerCircleOutline.Color = Color3.fromRGB(0, 0, 0)
            VeilVisuals.TrackerCircleOutline.Thickness = 3
            VeilVisuals.TrackerCircleOutline.Filled = false
            VeilVisuals.TrackerCircleOutline.Transparency = 0.4
            VeilVisuals.TrackerCircleOutline.Visible = false
            VeilVisuals.TrackerCircleFill = Drawing.new("Circle")
            VeilVisuals.TrackerCircleFill.Color = _G.GLUTO_THEME
            VeilVisuals.TrackerCircleFill.Thickness = 1
            VeilVisuals.TrackerCircleFill.Filled = false
            VeilVisuals.TrackerCircleFill.Transparency = 0.5
            VeilVisuals.TrackerCircleFill.Visible = false
            VeilVisuals.TrackerLine = Drawing.new("Line")
            VeilVisuals.TrackerLine.Color = _G.GLUTO_THEME
            VeilVisuals.TrackerLine.Thickness = 2
            VeilVisuals.TrackerLine.Transparency = 0.5
            VeilVisuals.TrackerLine.Visible = false
        end)

        local function Veil_IsSurvivorVeil(p)
            if not p or not p.Team or not p.Team.Name then return false end
            return string.find(string.lower(p.Team.Name), "survivor", 1, true) ~= nil
        end

        local function Veil_solvePitch(p, d, dy)
            d = math.max(d, 0.1)
            local s2 = p.v0 * p.v0
            local root = s2 * s2 - p.g * (p.g * d * d + 2 * dy * s2)
            if root < 0 then root = 0 end
            local tanTheta = (s2 - math.sqrt(root)) / (p.g * d)
            local theta = math.atan(tanTheta)
            local t = d / (p.v0 * math.cos(theta))
            return theta, t
        end

        local function Veil_getCharacterVelocity(char)
            local root = char and (char:FindFirstChild("HumanoidRootPart") or char:FindFirstChild("Torso"))
            if not root or not root:IsA("BasePart") then return Vector3.zero end
            local now = os.clock()
            local last = VeilState.velHistory[char]
            local measured = Vector3.zero
            if last and now - last.t > 0.02 then
                measured = (root.Position - last.pos) / (now - last.t)
                if measured.Magnitude > 150 then measured = last.smooth or Vector3.zero end
            end
            local smooth = last and last.smooth or measured
            smooth = smooth:Lerp(measured, 0.65)
            VeilState.velHistory[char] = { pos = root.Position, t = now, smooth = smooth }
            if smooth.Magnitude < 1 then return Vector3.zero end
            return Vector3.new(smooth.X, 0, smooth.Z)
        end

        Players.PlayerRemoving:Connect(function(p)
            if p.Character then VeilState.velHistory[p.Character] = nil end
        end)

        local function Veil_HideTracker()
            if VeilVisuals.TrackerLine then VeilVisuals.TrackerLine.Visible = false end
            if VeilVisuals.TrackerCircleOutline then VeilVisuals.TrackerCircleOutline.Visible = false end
            if VeilVisuals.TrackerCircleFill then VeilVisuals.TrackerCircleFill.Visible = false end
        end

        local function Veil_HideAllVisuals()
            if VeilVisuals.FOVCircleFill then VeilVisuals.FOVCircleFill.Visible = false end
            if VeilVisuals.FOVCircleOutline then VeilVisuals.FOVCircleOutline.Visible = false end
            Veil_HideTracker()
        end

        local function Veil_UpdateAimbot()
            if GetRole() ~= "Killer" then
                VeilState.target = nil; VeilState.lookVector = nil
                Veil_HideAllVisuals(); return
            end
            local cam = Workspace.CurrentCamera
            if not cam then return end
            local center = Vector2.new(cam.ViewportSize.X / 2, cam.ViewportSize.Y / 2)

            if VD.VeilShowFOV and VD.VeilEnabled then
                if VeilVisuals.FOVCircleOutline then
                    VeilVisuals.FOVCircleOutline.Position = center
                    VeilVisuals.FOVCircleOutline.Radius = VD.VeilFOV or 150
                    VeilVisuals.FOVCircleOutline.Visible = true
                end
                if VeilVisuals.FOVCircleFill then
                    VeilVisuals.FOVCircleFill.Position = center
                    VeilVisuals.FOVCircleFill.Radius = VD.VeilFOV or 150
                    VeilVisuals.FOVCircleFill.Visible = true
                end
            else
                if VeilVisuals.FOVCircleOutline then VeilVisuals.FOVCircleOutline.Visible = false end
                if VeilVisuals.FOVCircleFill then VeilVisuals.FOVCircleFill.Visible = false end
            end

            if not VD.VeilEnabled then
                VeilState.target = nil; VeilState.lookVector = nil
                Veil_HideAllVisuals(); return
            end

            local char = LocalPlayer.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            if not hrp then
                VeilState.target = nil; VeilState.lookVector = nil
                Veil_HideTracker(); return
            end

            local nearest, nearestPart = nil, nil
            local bestDist = VD.VeilFOV or 150
            local bestStudDist = VD.VeilMaxDist or 500

            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and Veil_IsSurvivorVeil(p) and p.Character then
                    local pc = p.Character
                    local isDown = pc:GetAttribute("Knocked") == true or pc:GetAttribute("HookProgressDepleting") == true
                    if not isDown then
                        local hum = pc:FindFirstChildOfClass("Humanoid")
                        local targetPart = pc:FindFirstChild("UpperTorso") or pc:FindFirstChild("Torso") or pc:FindFirstChild("HumanoidRootPart")
                        if hum and hum.Health > 0 and targetPart then
                            local sp, on = cam:WorldToViewportPoint(targetPart.Position)
                            if on and sp.Z > 0 then
                                local sd = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                                if sd < bestDist then
                                    local studDist = (targetPart.Position - hrp.Position).Magnitude
                                    if studDist <= bestStudDist then
                                        bestDist = sd; nearest = p; nearestPart = targetPart
                                    end
                                end
                            end
                        end
                    end
                end
            end

            if not nearest or not nearestPart then
                VeilState.target = nil; VeilState.lookVector = nil
                Veil_HideTracker(); return
            end

            local tp = nearestPart.Position
            local hand = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
            local origin = (hand and hand:IsA("BasePart")) and hand.Position or hrp.Position
            local dir = tp - origin
            local dist = dir.Magnitude

            if dist <= 0.1 or dist > (VD.VeilMaxDist or 500) then
                VeilState.target = nil; VeilState.lookVector = nil
                Veil_HideTracker(); return
            end

            local isAuraActive = char:GetAttribute("special") == true
            local prof
            if isAuraActive then
                prof = { v0 = VD.VeilAuraSpearSpeed or 165, g = VD.VeilAuraSpearGravity or 96.5,
                    windup = 0.10, latency = 0.04, maxlead = 25, scale = VD.VeilLeadMultiplier or 1.4 }
            else
                prof = { v0 = VD.VeilSpearSpeed or 165, g = VD.VeilGravity or 103,
                    windup = 0.10, latency = 0.04, maxlead = 45, scale = VD.VeilLeadMultiplier or 1.4 }
            end

            local aimPoint = tp
            if VD.VeilAutoPredict then
                local vel = Veil_getCharacterVelocity(nearest.Character)
                if vel.Magnitude > 0.5 then
                    local h0 = Vector3.new(dir.X, 0, dir.Z)
                    local _, tFlight = Veil_solvePitch(prof, h0.Magnitude, dir.Y)
                    local ping = 0.08
                    pcall(function() ping = math.clamp(LocalPlayer:GetNetworkPing(), 0, 0.35) end)
                    local delay = tFlight + prof.windup + ping + prof.latency
                    for _ = 1, 2 do
                        local lead = vel * delay * prof.scale
                        local maxLead = math.clamp(dist * 0.6, 3, prof.maxlead)
                        if lead.Magnitude > maxLead then lead = lead.Unit * maxLead end
                        aimPoint = tp + lead
                        local ad = aimPoint - origin
                        local ah = Vector3.new(ad.X, 0, ad.Z)
                        local _, t2 = Veil_solvePitch(prof, math.max(ah.Magnitude, 0.1), ad.Y)
                        delay = t2 + prof.windup + ping + prof.latency
                    end
                end
            end

            local adir = aimPoint - origin
            local ah = Vector3.new(adir.X, 0, adir.Z)
            local ahDist = ah.Magnitude
            local pitch = Veil_solvePitch(prof, ahDist, adir.Y)
            if ahDist > 0.001 then
                VeilState.lookVector = ah.Unit * math.cos(pitch) + Vector3.new(0, math.sin(pitch), 0)
            else
                VeilState.lookVector = adir.Unit
            end
            VeilState.target = nearest

            if VD.VeilShowTracker then
                local sp, vis = cam:WorldToViewportPoint(tp)
                local showTracker = false
                if vis and sp.Z > 0 then
                    local screenDist = (Vector2.new(sp.X, sp.Y) - center).Magnitude
                    if screenDist <= (VD.VeilFOV or 150) then
                        showTracker = true
                        local bottomCenter = Vector2.new(center.X, cam.ViewportSize.Y)
                        if VeilVisuals.TrackerLine then
                            VeilVisuals.TrackerLine.From = bottomCenter
                            VeilVisuals.TrackerLine.To = Vector2.new(sp.X, sp.Y)
                            VeilVisuals.TrackerLine.Visible = true
                        end
                        local radius = math.clamp(1000 / dist, 10, 40)
                        if VeilVisuals.TrackerCircleOutline then
                            VeilVisuals.TrackerCircleOutline.Position = Vector2.new(sp.X, sp.Y)
                            VeilVisuals.TrackerCircleOutline.Radius = radius
                            VeilVisuals.TrackerCircleOutline.Visible = true
                        end
                        if VeilVisuals.TrackerCircleFill then
                            VeilVisuals.TrackerCircleFill.Position = Vector2.new(sp.X, sp.Y)
                            VeilVisuals.TrackerCircleFill.Radius = radius
                            VeilVisuals.TrackerCircleFill.Visible = true
                        end
                    end
                end
                if not showTracker then Veil_HideTracker() end
            else
                Veil_HideTracker()
            end
        end

        local VeilHookState = { remoteHooked = false }
        local function Veil_setupInterceptor()
            if VeilHookState.remoteHooked then return end
            if typeof(hookmetamethod) ~= "function" then return end
            task.spawn(function()
                pcall(function()
                    local oldNamecall
                    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                        local method = getnamecallmethod()
                        if not checkcaller() and method == "FireServer" then
                            if self.Name == "Spearthrow" and VD.VeilEnabled
                                and typeof(VeilState.lookVector) == "Vector3"
                                and GetRole() == "Killer" then
                                local args = {...}
                                if typeof(args[1]) == "Vector3" then args[1] = VeilState.lookVector end
                                return oldNamecall(self, unpack(args))
                            end
                        end
                        return oldNamecall(self, ...)
                    end)
                    VeilHookState.remoteHooked = true
                end)
            end)
        end
        Veil_setupInterceptor()

        RunService.RenderStepped:Connect(function() pcall(Veil_UpdateAimbot) end)
        W.Veil_HideAllVisuals = Veil_HideAllVisuals
    end
--====================================================--
-- 100% MENTAH VDT: SILENT VEIL (TRAJECTORY & PREDICTION)
--====================================================--
do
    local tbl = {
        Players = Players,
        UserInputService = UserInputService,
        Lighting = Lighting,
        RunService = RunService,
        CoreGui = CoreGui,
        ReplicatedStorage = ReplicatedStorage,
        VirtualInputManager = VirtualInputManager,
        Workspace = Workspace,
        Camera = workspace.CurrentCamera,
        LocalPlayer = LocalPlayer,
        Terrain = workspace.Terrain,
    }
    
    local tbl3 = {
        Aim_SilentVeil = false,
        SmartPredict = false,
        Veil_ShowFOV = true,
        Veil_ShowLaser = true,
        Veil_FOV = 150,
        Veil_LeadMultiplier = 1.7,
        SPEAR_Speed = 165,
        SPEAR_Gravity = workspace.Gravity * 0.5,
        SPEAR_MaxDist = 500,
    }
    
    local tbl6 = { spearSwitchCooldown = false, isAttackCd = false }
    local tbl8 = { isChargingSpear = false, currentTouchInput = nil, spearAimStartTime = 0 }
    local tbl11 = {}
    
    local function fn6(arg) return arg and arg.Team and arg.Team.Name == "Killer" end
    local function fn11(arg)
        if not arg then return false end
        return arg:GetAttribute("Knocked") == true or arg:GetAttribute("IsHooked") == true
    end

    local function fn51(arg)
        local vector2 = Vector2.new(tbl.Camera.ViewportSize.X / 2, tbl.Camera.ViewportSize.Y / 2)
        local character = tbl.LocalPlayer.Character
        local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart2 then return nil end
        
        local huge = math.huge
        local v3 = nil

        for _, v4 in ipairs(tbl.Players:GetPlayers()) do
            if v4.Character and v4 ~= tbl.LocalPlayer then
                local v5 = fn6(v4)
                if arg == "Survivor" and not v5 then
                    local character2 = v4.Character
                    local humanoid2 = character2:FindFirstChildOfClass("Humanoid")
                    if humanoid2 and humanoid2.Health > 0 and not fn11(character2) then
                        local torso = character2:FindFirstChild("Torso") or character2:FindFirstChild("HumanoidRootPart")
                        if torso then
                            local magnitude = (torso.Position - humanoidRootPart2.Position).Magnitude
                            local spearMaxDist = tbl3.SPEAR_MaxDist
                            if magnitude <= spearMaxDist then
                                if tbl3.Veil_ShowFOV then
                                    local veilFov = tbl3.Veil_FOV
                                    local v7, v8 = tbl.Camera:WorldToViewportPoint(torso.Position)
                                    if v8 then
                                        local magnitude2 = (Vector2.new(v7.X, v7.Y) - vector2).Magnitude
                                        if magnitude2 < huge and magnitude2 <= veilFov then
                                            huge = magnitude2
                                            v3 = torso
                                        end
                                    end
                                elseif magnitude < huge then
                                    huge = magnitude
                                    v3 = torso
                                end
                            end
                        end
                    end
                end
            end
        end
        return v3
    end

    -- Trajectory Visuals
    local part = Instance.new("Part")
    part.Name = "PLaser"
    part.Material = Enum.Material.Neon
    part.Color = Color3.fromRGB(57, 255, 20)
    part.CanCollide = false
    part.Anchored = true
    part.CastShadow = false
    part.Size = Vector3.new(0.05, 0.05, 1.5)

    local highlight = Instance.new("Highlight")
    highlight.Name = "VTarget"
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.OutlineTransparency = 0

    local circle = Drawing.new("Circle")
    circle.Filled = true
    circle.Radius = 6
    circle.Color = Color3.fromRGB(0, 220, 255)
    circle.Transparency = 0.9
    circle.Visible = false
    local n = 15
    local folder = Instance.new("Folder")
    folder.Name = "Trajectory"
    folder.Parent = tbl.Workspace.Terrain
    local tbl12 = {}
    local tbl13 = {}

    for i = 1, n + 1 do
        local attachment = Instance.new("Attachment")
        attachment.Name = "Att_" .. i
        attachment.Parent = folder
        table.insert(tbl12, attachment)
    end

    for i = 1, 15 do
        local beam = Instance.new("Beam")
        beam.Attachment0 = tbl12[i]
        beam.Attachment1 = tbl12[i + 1]
        beam.Width0 = 0.12
        beam.Width1 = 0.12
        beam.FaceCamera = true
        beam.Color = ColorSequence.new(Color3.fromRGB(0, 220, 255))
        beam.LightEmission = 1
        beam.LightInfluence = 0
        beam.Texture = "rbxassetid://4740112440"
        beam.TextureSpeed = 2
        beam.Enabled = false
        beam.Parent = folder
        table.insert(tbl13, beam)
    end

    local function fn46()
        for _, v3 in ipairs(tbl13) do v3.Enabled = false end
        circle.Visible = false
    end

    local function fn47(arg, arg2, arg3, arg4, arg5, arg6, arg7)
        local n2 = arg2 * arg3
        local n3 = math.max(tbl3.SPEAR_MaxDist or 500, 500)
        local position3 = arg6 and arg6.Position
        local magnitude = position3 and (position3 - arg).Magnitude or 100
        local n4 = magnitude / arg3 / n
        local vector = Vector3.new(0, -arg4, 0)
        local tbl14 = { arg }
        arg7 = arg7 or position3
        local huge = math.huge

        for i = 1, 15 do
            arg = arg + n2 * n4 + 0.5 * vector * n4 ^ 2
            table.insert(tbl14, arg)
            if arg7 then
                local magnitude2 = (arg - arg7).Magnitude
                if magnitude2 < huge then huge = magnitude2 end
            end
            n2 += vector * n4
        end

        local flag3 = arg6 ~= nil and magnitude <= n3 and huge <= 6
        local colorSequence = ColorSequence.new(flag3 and Color3.fromRGB(0, 255, 120) or Color3.fromRGB(255, 60, 60))

        for i = 1, #tbl14 do
            if tbl12[i] then tbl12[i].WorldPosition = tbl14[i] end
        end

        for i = 1, 15 do
            if i < #tbl14 and tbl3.Veil_ShowLaser then
                tbl13[i].Color = colorSequence
                tbl13[i].Enabled = true
            else
                tbl13[i].Enabled = false
            end
        end

        if arg6 then
            local v3, v4 = tbl.Camera:WorldToViewportPoint(arg6.Position)
            if v4 and v3.Z > 0 then
                circle.Position = Vector2.new(v3.X, v3.Y)
                circle.Visible = true
                if flag3 then circle.Color = Color3.fromRGB(0, 255, 120) else circle.Color = Color3.fromRGB(255, 60, 60) end
            else
                circle.Visible = false
            end
        else
            circle.Visible = false
        end
    end

    -- FOV Frame (Bawaan VDT pake Drawing, tapi kita siapin fallback)
    local frame3 = Instance.new("Frame")
    frame3.BackgroundTransparency = 1
    frame3.AnchorPoint = Vector2.new(0.5, 0.5)
    frame3.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame3.Visible = false
    frame3.Parent = SafeGuiParent()
    Instance.new("UICorner", frame3).CornerRadius = UDim.new(1, 0)
    local uiStroke = Instance.new("UIStroke", frame3)
    uiStroke.Color = Color3.fromRGB(0, 255, 100)
    uiStroke.Thickness = 0.4

    -- Render Loop (VDT)
    tbl.RunService.RenderStepped:Connect(function()
        local character = tbl.LocalPlayer.Character
        local flag5 = character and character:GetAttribute("spearmode") == true
        local flag6 = character and character:GetAttribute("special") == true
        local flag7 = character and character:GetAttribute("IsStunned") == true

        local vector2 = Vector2.new(tbl.Camera.ViewportSize.X / 2, tbl.Camera.ViewportSize.Y / 2)
        local color = Color3.fromRGB(255, 255, 255)
        local visible = false
        local aimbotRadius = 0

        if tbl3.Aim_SilentVeil and tbl3.Veil_ShowFOV and flag5 then
            aimbotRadius = tbl3.Veil_FOV
            if flag6 then color = Color3.fromRGB(0, 255, 100) else color = Color3.fromRGB(150, 150, 150) end
            visible = true
        end

        frame3.Visible = visible
        if visible then
            frame3.Size = UDim2.new(0, aimbotRadius * 2, 0, aimbotRadius * 2)
            frame3.Position = UDim2.new(0, vector2.X, 0, vector2.Y)
            uiStroke.Color = color
        end

        if tbl8.isChargingSpear and tbl3.Aim_SilentVeil and flag5 and not tbl6.spearSwitchCooldown and not flag7 then
            local character2 = tbl.LocalPlayer.Character
            local rightArm = character2 and (character2:FindFirstChild("Right Arm") or character2:FindFirstChild("RightHand"))
            local humanoidRootPart3 = character2 and character2:FindFirstChild("HumanoidRootPart")
            rightArm = rightArm and rightArm.Position or humanoidRootPart3 and humanoidRootPart3.Position + Vector3.new(1.5, 0.5, 0)

            if rightArm and character2 then
                local flag8 = character2:GetAttribute("special") == true
                local smartPredict = tbl3.SmartPredict
                local n4 = smartPredict and (flag8 and 165 or 142.5) or tbl3.SPEAR_Speed
                local spearGravity = tbl3.SmartPredict and tbl.Workspace.Gravity * 0.5 or tbl3.SPEAR_Gravity
                local Survivor = fn51("Survivor")
                local n5, unit

                if Survivor then
                    highlight.Parent = Survivor.Parent
                    local humanoidRootPart4 = Survivor:IsA("Model") and Survivor:FindFirstChild("HumanoidRootPart") or Survivor
                    local position5 = humanoidRootPart4.Position
                    local humanoid2 = Survivor.Parent and Survivor.Parent:FindFirstChildOfClass("Humanoid")
                    local n6 = (humanoid2 and humanoid2.MoveDirection.Magnitude > 0) and (humanoid2.MoveDirection * humanoid2.WalkSpeed) or (humanoidRootPart4:IsA("BasePart") and humanoidRootPart4.AssemblyLinearVelocity or Vector3.zero)
                    
                    local vector = Vector3.new(n6.X, 0, n6.Z)
                    local magnitude = (position5 - rightArm).Magnitude
                    local n7 = magnitude / n4
                    if tbl3.SmartPredict then
                        n5 = position5 + vector * n7 * tbl3.Veil_LeadMultiplier
                        unit = (n5 + Vector3.new(0, 0.5 * spearGravity * n7 ^ 2 - 1.5, 0) - rightArm).Unit
                    else
                        n5 = position5 + vector * n7 * math.clamp(magnitude / 50, 0.1, 4)
                        unit = (n5 + Vector3.new(0, 0.5 * spearGravity * n7 ^ 2 * math.clamp(magnitude / 100, 1, 2.5), 0) - rightArm).Unit
                    end
                else
                    highlight.Parent = nil
                    unit = tbl.Camera.CFrame.LookVector
                    n5 = nil
                end
                fn47(rightArm, unit, n4, spearGravity, character2, Survivor, n5)
            else
                fn46()
                highlight.Parent = nil
            end
        else
            fn46()
            highlight.Parent = nil
        end
    end)

    -- Inputs
    tbl.UserInputService.InputBegan:Connect(function(input, gameProcessed)
        local flag4 = input.UserInputType == Enum.UserInputType.Touch
        if gameProcessed and not flag4 then return end
        local character = tbl.LocalPlayer.Character
        local flag5 = character and character:GetAttribute("spearmode") == true

        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if tbl3.Aim_SilentVeil and flag5 then
                tbl8.isChargingSpear = true
                tbl8.spearAimStartTime = tick()
                task.delay(7, function()
                    if tbl8.isChargingSpear and tick() - tbl8.spearAimStartTime >= 6.9 then
                        tbl8.isChargingSpear = false
                        tbl8.currentTouchInput = nil
                    end
                end)
            end
        elseif flag4 then
            if tbl3.Aim_SilentVeil and flag5 and not tbl6.spearSwitchCooldown then
                local playerGui = tbl.LocalPlayer:FindFirstChild("PlayerGui")
                local attack = playerGui and playerGui:FindFirstChild("Slasher-mob") and playerGui["Slasher-mob"]:FindFirstChild("Controls") and playerGui["Slasher-mob"].Controls:FindFirstChild("attack")
                if attack and attack.Visible then
                    local position3 = input.Position
                    local absolutePosition = attack.AbsolutePosition
                    local absoluteSize = attack.AbsoluteSize
                    if position3.X >= absolutePosition.X and position3.X <= absolutePosition.X + absoluteSize.X and position3.Y >= absolutePosition.Y and position3.Y <= absolutePosition.Y + absoluteSize.Y then
                        tbl8.isChargingSpear = true
                        tbl8.currentTouchInput = input
                        tbl8.spearAimStartTime = tick()
                        task.delay(7, function()
                            if tbl8.isChargingSpear and tick() - tbl8.spearAimStartTime >= 6.9 then
                                tbl8.isChargingSpear = false
                                tbl8.currentTouchInput = nil
                            end
                        end)
                    end
                end
            end
        end
    end)

    tbl.UserInputService.InputEnded:Connect(function(input)
        local flag4 = input.UserInputType == Enum.UserInputType.Touch
        if tbl8.isChargingSpear and (input == tbl8.currentTouchInput or input.UserInputType == Enum.UserInputType.MouseButton1) then
            tbl8.isChargingSpear = false
            if tbl8.currentTouchInput == input then tbl8.currentTouchInput = nil end
            if tbl6.spearSwitchCooldown then return end
            if tick() - (tbl8.spearAimStartTime or tick()) >= 7 then return end
            if tbl6.isAttackCd then return end
            tbl6.isAttackCd = true
            task.delay(3, function() tbl6.isAttackCd = false end)

            local character = tbl.LocalPlayer.Character
            local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
            if character and (character:FindFirstChild("Head") or humanoidRootPart2) and humanoidRootPart2 then
                local flag5 = character:GetAttribute("special") == true
                local position3 = humanoidRootPart2.Position
                local spearSpeed = tbl3.SmartPredict and (flag5 and 165 or 142.5) or tbl3.SPEAR_Speed
                local Survivor = fn51("Survivor")
                local unit

                if Survivor then
                    local humanoidRootPart3 = Survivor:IsA("Model") and Survivor:FindFirstChild("HumanoidRootPart") or Survivor
                    local position4 = humanoidRootPart3.Position
                    local humanoid2 = Survivor.Parent and Survivor.Parent:FindFirstChildOfClass("Humanoid")
                    local n4 = (humanoid2 and humanoid2.MoveDirection.Magnitude > 0) and (humanoid2.MoveDirection * humanoid2.WalkSpeed) or (humanoidRootPart3:IsA("BasePart") and humanoidRootPart3.AssemblyLinearVelocity or Vector3.zero)
                    
                    local vector = Vector3.new(n4.X, 0, n4.Z)
                    local magnitude = (position4 - position3).Magnitude
                    local n5 = magnitude / spearSpeed
                    if tbl3.SmartPredict then
                        unit = (position4 + vector * n5 * tbl3.Veil_LeadMultiplier + Vector3.new(0, 0.5 * tbl.Workspace.Gravity * 0.5 * n5 ^ 2 - 1.5, 0) - position3).Unit
                    else
                        unit = (position4 + vector * n5 * math.clamp(magnitude / 50, 0.1, 4) + Vector3.new(0, 0.5 * tbl3.SPEAR_Gravity * n5 ^ 2 * math.clamp(magnitude / 100, 1, 2.5), 0) - position3).Unit
                    end
                else
                    unit = tbl.Camera.CFrame.LookVector
                end

                pcall(function()
                    local veilRemote = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Killers") and ReplicatedStorage.Remotes.Killers:FindFirstChild("Veil") and ReplicatedStorage.Remotes.Killers.Veil:FindFirstChild("Spearthrow")
                    if veilRemote then veilRemote:FireServer(unit, spearSpeed, position3) end
                end)
            end
        end
    end)

    -- Ngecek kalau Spear Mode aktif (VDT asli pake attribute)
    tbl.LocalPlayer.CharacterAdded:Connect(function(c)
        c:GetAttributeChangedSignal("spearmode"):Connect(function()
            if not c:GetAttribute("spearmode") then
                tbl8.isChargingSpear = false
                tbl8.currentTouchInput = nil
            end
        end)
    end)

    -- Expose ke UI
    _G.VDT_VeilLogic = tbl3
end

    function W.doSelfHealTrue()
        local c = LocalPlayer.Character; if not c then return end
        local hr = ReplicatedStorage.Remotes.Healing.HealEvent
        local hp = c:FindFirstChild("HumanoidRootPart"); if not hp then return end
        pcall(function() hr:FireServer(hp, true) end)
    end
    function W.doSelfHealFalse()
        local c = LocalPlayer.Character; if not c then return end
        local hr = ReplicatedStorage.Remotes.Healing.HealEvent
        local hp = c:FindFirstChild("HumanoidRootPart"); if not hp then return end
        pcall(function() hr:FireServer(hp, false) end)
    end
    function W.doOthersHealTrue(tp)
        if not tp or not tp.Character then return end
        local hrp = tp.Character:FindFirstChild("HumanoidRootPart"); if not hrp then return end
        local hr = ReplicatedStorage.Remotes.Healing.HealEvent
        pcall(function() hr:FireServer(hrp, true) end)
    end
    function W.doOthersHealFalse(tp)
        if not tp or not tp.Character then return end
        local hrp = tp.Character:FindFirstChild("HumanoidRootPart"); if not hrp then return end
        local hr = ReplicatedStorage.Remotes.Healing.HealEvent
        pcall(function() hr:FireServer(hrp, false) end)
    end

    W.SelfHeal_BlockedAnimId = "95836365038528"
    W.SelfHeal_AnimMonitor = W.SelfHeal_AnimMonitor or { Conn = nil, CharHook = nil }
    function W.SelfHeal_StartAnimBlock()
        if W.SelfHeal_AnimMonitor.Conn then return end
        W.SelfHeal_AnimMonitor.Conn = RunService.Heartbeat:Connect(function()
            if not W.InstantHealSelf then return end
            local char = LocalPlayer.Character; if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
            local anim = hum:FindFirstChildOfClass("Animator"); if not anim then return end
            local ok2, tracks = pcall(function() return anim:GetPlayingAnimationTracks() end)
            if not ok2 then return end
            for _, track in ipairs(tracks) do
                local aid = track.Animation and track.Animation.AnimationId or ""
                local numId = aid:match("%d+")
                if numId == W.SelfHeal_BlockedAnimId then pcall(function() track:Stop(0) end) end
            end
        end)
        local function hookChar(char)
            if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
            local anim = hum:FindFirstChildOfClass("Animator") or hum:WaitForChild("Animator", 3); if not anim then return end
            anim.AnimationPlayed:Connect(function(track)
                if not W.InstantHealSelf then return end
                local aid = track.Animation and track.Animation.AnimationId or ""
                local numId = aid:match("%d+")
                if numId == W.SelfHeal_BlockedAnimId then pcall(function() track:Stop(0) end) end
            end)
        end
        hookChar(LocalPlayer.Character)
        W.SelfHeal_AnimMonitor.CharHook = LocalPlayer.CharacterAdded:Connect(function(c)
            task.wait(0.3); hookChar(c)
        end)
    end
    function W.SelfHeal_StopAnimBlock()
        if W.SelfHeal_AnimMonitor.Conn then pcall(function() W.SelfHeal_AnimMonitor.Conn:Disconnect() end); W.SelfHeal_AnimMonitor.Conn = nil end
        if W.SelfHeal_AnimMonitor.CharHook then pcall(function() W.SelfHeal_AnimMonitor.CharHook:Disconnect() end); W.SelfHeal_AnimMonitor.CharHook = nil end
    end
    function W.setInstantHealSelf(v)
        W.InstantHealSelf = v
        if v then
            if W.SelfHeal_StartAnimBlock then W.SelfHeal_StartAnimBlock() end
        else
            if W.SelfHeal_StopAnimBlock then W.SelfHeal_StopAnimBlock() end
        end
        if v then
            local ha = false
            if W.InstantHealConnection then W.InstantHealConnection:Disconnect() end
            W.InstantHealConnection = RunService.Heartbeat:Connect(function()
                if not W.InstantHealSelf then return end
                local c = LocalPlayer.Character
                local h = c and c:FindFirstChildOfClass("Humanoid")
                if not h then return end
                if h.Health >= h.MaxHealth * 0.9 then
                    if ha then ha = false; W.doSelfHealFalse() end
                    return
                end
                if ha then
                    local ci = c:FindFirstChild("CheckInterractable")
                    if ci and not ci:GetAttribute("isHealing") then ha = false end
                end
                if not ha then ha = true; W.doSelfHealTrue() end
            end)
        else
            if W.InstantHealConnection then W.InstantHealConnection:Disconnect(); W.InstantHealConnection = nil end
            pcall(W.doSelfHealFalse)
        end
    end
    function W.setAutoHealAll(v)
        W.AutoHealAll = v
        if v then
            local ah = {}
            if W.AutoHealAllConnection then W.AutoHealAllConnection:Disconnect() end
            W.AutoHealAllConnection = RunService.Heartbeat:Connect(function()
                if not W.AutoHealAll then return end
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and p.Character then
                        local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                        local hu = p.Character:FindFirstChildOfClass("Humanoid")
                        if hu and hu.Health > 0 and hu.Health < hu.MaxHealth * 0.9 and hrp then
                            if ah[p] then
                                local c = LocalPlayer.Character
                                local ci = c and c:FindFirstChild("CheckInterractable")
                                if ci and not ci:GetAttribute("isHealing") then ah[p] = nil end
                            end
                            if not ah[p] then ah[p] = true; W.doOthersHealTrue(p) end
                        else
                            if ah[p] then ah[p] = nil; W.doOthersHealFalse(p) end
                        end
                    else
                        if ah[p] then ah[p] = nil; pcall(function() W.doOthersHealFalse(p) end) end
                    end
                end
            end)
        else
            if W.AutoHealAllConnection then W.AutoHealAllConnection:Disconnect(); W.AutoHealAllConnection = nil end
        end
    end
    LocalPlayer.CharacterAdded:Connect(function()
        task.wait(0.5)
        if W.InstantHealSelf then W.setInstantHealSelf(true) end
        if W.AutoHealAll then W.setAutoHealAll(true) end
    end)

    W.FP = W.FP or {
        ActiveBuffs = {}, Conns = {}, LastBuffEnd = 0, CooldownTime = 5, HB = nil,
        FlowstateOn = false, QuickRecOn = false, PerfLandOn = false, AdrenalineOn = false,
    }
    local FP = W.FP
    local function FP_Char() return LocalPlayer.Character end
    local function FP_Hum() local c = FP_Char(); return c and c:FindFirstChildOfClass("Humanoid") end
    local function FP_GetTotal()
        local t = 0
        for _,b in pairs(FP.ActiveBuffs) do if tick() < b.endTime then t = t + b.amt end end
        return t
    end
    local function FP_Apply()
        local c = FP_Char(); local tb = FP_GetTotal(); local h = FP_Hum()
        if c then if tb > 0 then c:SetAttribute("speedboost", 1+(tb/14)) else c:SetAttribute("speedboost", 1) end end
        if h and tb > 0 then h.WalkSpeed = 16 + tb end
    end
    local PerkGUI = {
        Gui = nil, Container = nil, Layout = nil, Cards = {},
        PerkInfo = {
            Flowstate = { Icon = "✦", Label = "FLOWSTATE" },
            QuickRecovery = { Icon = "✚", Label = "QUICK RECOV" },
            PerfectLanding = { Icon = "▼", Label = "PERFECT LAND" },
            AdrenalineRush = { Icon = "♥", Label = "ADRENALINE" },
        }
    }
    local function PerkGUI_Create()
        if PerkGUI.Gui then return end
        local parent = SafeGuiParent(); if not parent then return end
        local gui = Instance.new("ScreenGui")
        gui.Name = "GlutoPerkGUI"; gui.ResetOnSpawn = false; gui.IgnoreGuiInset = true
        gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling; gui.DisplayOrder = 50; gui.Parent = parent
        PerkGUI.Gui = gui
        local container = Instance.new("Frame")
        container.Name = "Container"; container.AnchorPoint = Vector2.new(1, 0)
        container.Position = UDim2.new(1, -12, 0, 100); container.Size = UDim2.new(0, 180, 0, 0)
        container.AutomaticSize = Enum.AutomaticSize.Y; container.BackgroundTransparency = 1
        container.Parent = gui
        PerkGUI.Container = container
        local layout = Instance.new("UIListLayout")
        layout.FillDirection = Enum.FillDirection.Vertical; layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Padding = UDim.new(0, 6); layout.HorizontalAlignment = Enum.HorizontalAlignment.Right
        layout.Parent = container
        PerkGUI.Layout = layout
    end
    local function PerkGUI_AddCard(name)
        if PerkGUI.Cards[name] then return end
        if not PerkGUI.Gui then PerkGUI_Create() end
        if not PerkGUI.Gui then return end
        local info = PerkGUI.PerkInfo[name] or { Icon = "★", Label = string.upper(name) }
        local card = Instance.new("Frame")
        card.Name = "Card_" .. name; card.Size = UDim2.new(0, 180, 0, 38)
        card.BackgroundColor3 = Color3.fromRGB(15, 15, 15); card.BackgroundTransparency = 1
        card.BorderSizePixel = 0; card.ZIndex = 1
        card.LayoutOrder = #PerkGUI.Cards + 1; card.Parent = PerkGUI.Container
        Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)
        local grad = Instance.new("UIGradient")
        grad.Rotation = 135
        grad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(20, 20, 20)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 10)),
        })
        grad.Parent = card
        local stroke = Instance.new("UIStroke", card)
        stroke.Name = "Stroke"; stroke.Color = _G.GLUTO_THEME; stroke.Thickness = 1.2
        stroke.Transparency = 0.2; stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        local iconHolder = Instance.new("Frame")
        iconHolder.Name = "IconHolder"; iconHolder.Size = UDim2.fromOffset(26, 26)
        iconHolder.Position = UDim2.new(0, 6, 0.5, -13); iconHolder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        iconHolder.BorderSizePixel = 0; iconHolder.ZIndex = 3; iconHolder.Parent = card
        Instance.new("UICorner", iconHolder).CornerRadius = UDim.new(1, 0)
        local iconGrad = Instance.new("UIGradient", iconHolder)
        iconGrad.Rotation = 135
        iconGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 45)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25)),
        })
        local iconStroke = Instance.new("UIStroke", iconHolder)
        iconStroke.Color = _G.GLUTO_THEME; iconStroke.Thickness = 1; iconStroke.Transparency = 0.25
        local iconTxt = Instance.new("TextLabel")
        iconTxt.Name = "Icon"; iconTxt.Size = UDim2.fromScale(1, 1); iconTxt.BackgroundTransparency = 1
        iconTxt.Font = Enum.Font.GothamBlack; iconTxt.Text = info.Icon
        iconTxt.TextColor3 = _G.GLUTO_THEME; iconTxt.TextScaled = true; iconTxt.ZIndex = 4
        iconTxt.Parent = iconHolder
        local nameLbl = Instance.new("TextLabel")
        nameLbl.Name = "Name"; nameLbl.Size = UDim2.new(1, -46, 0, 12)
        nameLbl.Position = UDim2.new(0, 38, 0, 5); nameLbl.BackgroundTransparency = 1
        nameLbl.Font = Enum.Font.GothamBold; nameLbl.Text = info.Label
        nameLbl.TextColor3 = _G.GLUTO_THEME; nameLbl.TextSize = 10
        nameLbl.TextXAlignment = Enum.TextXAlignment.Left
        nameLbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0); nameLbl.TextStrokeTransparency = 0.5
        nameLbl.ZIndex = 3; nameLbl.Parent = card
        local timeLbl = Instance.new("TextLabel")
        timeLbl.Name = "Time"; timeLbl.AnchorPoint = Vector2.new(1, 0); timeLbl.Size = UDim2.fromOffset(34, 12)
        timeLbl.Position = UDim2.new(1, -6, 0, 5); timeLbl.BackgroundTransparency = 1
        timeLbl.Font = Enum.Font.GothamBold; timeLbl.Text = "3.0s"
        timeLbl.TextColor3 = Color3.fromRGB(170, 170, 170); timeLbl.TextSize = 9
        timeLbl.TextXAlignment = Enum.TextXAlignment.Right; timeLbl.ZIndex = 3; timeLbl.Parent = card
        local barBg = Instance.new("Frame")
        barBg.Name = "BarBg"; barBg.AnchorPoint = Vector2.new(0.5, 1)
        barBg.Size = UDim2.new(1, -12, 0, 3); barBg.Position = UDim2.new(0.5, 0, 1, -5)
        barBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40); barBg.BorderSizePixel = 0
        barBg.ZIndex = 4; barBg.Parent = card
        Instance.new("UICorner", barBg).CornerRadius = UDim.new(1, 0)
        local barFill = Instance.new("Frame")
        barFill.Name = "BarFill"; barFill.Size = UDim2.new(1, 0, 1, 0)
        barFill.BackgroundColor3 = _G.GLUTO_THEME; barFill.BorderSizePixel = 0
        barFill.ZIndex = 5; barFill.Parent = barBg
        Instance.new("UICorner", barFill).CornerRadius = UDim.new(1, 0)
        PerkGUI.Cards[name] = { Card = card, BarFill = barFill, Stroke = stroke, TimeLbl = timeLbl, IconTxt = iconTxt }
        card.Position = UDim2.new(0.4, 0, 0, 0)
        TweenService:Create(card, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
            Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 0.05,
        }):Play()
    end
    local function PerkGUI_RemoveCard(name)
        local data = PerkGUI.Cards[name]; if not data then return end
        PerkGUI.Cards[name] = nil
        local card = data.Card; if not card or not card.Parent then return end
        TweenService:Create(card, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
            Position = UDim2.new(0.4, 0, 0, 0), BackgroundTransparency = 1,
        }):Play()
        task.delay(0.28, function() if card and card.Parent then card:Destroy() end end)
    end
    task.spawn(function()
        while true do
            task.wait(0.05)
            for name in pairs(FP.ActiveBuffs) do
                if not PerkGUI.Cards[name] then PerkGUI_AddCard(name) end
            end
            for name, data in pairs(PerkGUI.Cards) do
                if not FP.ActiveBuffs[name] then
                    PerkGUI_RemoveCard(name)
                else
                    local b = FP.ActiveBuffs[name]
                    if b and data.BarFill then
                        local remain = math.max(0, b.endTime - tick())
                        local dur = b.duration or 3
                        local ratio = math.clamp(remain / dur, 0, 1)
                        data.BarFill.Size = UDim2.new(ratio, 0, 1, 0)
                        data.BarFill.BackgroundColor3 = _G.GLUTO_THEME_DIM:Lerp(_G.GLUTO_THEME, ratio)
                        if data.TimeLbl then data.TimeLbl.Text = string.format("%.1fs", remain) end
                    end
                end
            end
        end
    end)
    local function FP_EnsureHB()
        if FP.HB then return end
        FP.HB = RunService.Heartbeat:Connect(function()
            local exp = {}
            for n,b in pairs(FP.ActiveBuffs) do if tick() >= b.endTime then table.insert(exp,n) end end
            for _,n in ipairs(exp) do FP.ActiveBuffs[n]=nil end
            if #exp > 0 and FP_GetTotal()<=0 then FP.LastBuffEnd = tick() end
            FP_Apply()
            if FP_GetTotal()<=0 and next(FP.ActiveBuffs)==nil then
                if FP.HB then FP.HB:Disconnect(); FP.HB=nil end
                local c = FP_Char(); if c then c:SetAttribute("speedboost",1) end
            end
        end)
    end
    local function FP_TryBuff(name, amt, dur)
        if FP.ActiveBuffs[name] then return end
        if tick()-FP.LastBuffEnd < FP.CooldownTime and next(FP.ActiveBuffs)==nil then return end
        FP.ActiveBuffs[name] = {amt=amt, endTime=tick()+dur, duration=dur, startTime=tick()}
        FP_Apply(); FP_EnsureHB()
        VD_Notify("Fake Perks", "["..name.."] Aktif! +"..amt.." Speed ("..dur.."s)", 3)
    end
    local function FP_Clean(name)
        if FP.Conns[name] then for _,c in ipairs(FP.Conns[name]) do pcall(function() c:Disconnect() end) end FP.Conns[name] = nil end
    end
    local function FP_Reg(name, conn) if not FP.Conns[name] then FP.Conns[name] = {} end table.insert(FP.Conns[name], conn) end
    function W.FP_SetupFlowstate(val)
        FP.FlowstateOn = val
        local c = FP_Char(); if c then c:SetAttribute("Flowstate", val) end
        if val then
            local r = ReplicatedStorage:FindFirstChild("Remotes")
            local w = r and r:FindFirstChild("Window")
            local p = r and r:FindFirstChild("Pallet")
            local function onV() if not FP.FlowstateOn then return end task.delay(0.5, function() if FP.FlowstateOn then FP_TryBuff("Flowstate",5,3) end end) end
            if w then local vb = w:FindFirstChild("Vaultbindable"); if vb and vb:IsA("BindableEvent") then FP_Reg("Flowstate", vb.Event:Connect(onV)) end end
            if p then local sb = p:FindFirstChild("Slidebindable"); if sb and sb:IsA("BindableEvent") then FP_Reg("Flowstate", sb.Event:Connect(onV)) end end
            local function hookChar(cc)
                if not cc then return end
                local cn = cc:GetAttributeChangedSignal("__VaultFireCount"):Connect(function() if FP.FlowstateOn then onV() end end)
                FP_Reg("Flowstate", cn)
            end
            hookChar(LocalPlayer.Character)
            FP_Reg("Flowstate", LocalPlayer.CharacterAdded:Connect(function(cc) if FP.FlowstateOn then cc:SetAttribute("Flowstate",true); hookChar(cc) end end))
        else
            FP_Clean("Flowstate"); FP.ActiveBuffs["Flowstate"] = nil
            local c2 = FP_Char(); if c2 then c2:SetAttribute("Flowstate", false) end
        end
    end
    function W.FP_SetupQuickRecovery(val)
        FP.QuickRecOn = val
        if val then
            local function onH() if not FP.QuickRecOn then return end FP_TryBuff("QuickRecovery", 6, 3) end
            local r = ReplicatedStorage:FindFirstChild("Remotes")
            local hf = r and r:FindFirstChild("Healing")
            if hf then local hd = hf:FindFirstChild("Healdone"); if hd and hd:IsA("BindableEvent") then FP_Reg("QuickRecovery", hd.Event:Connect(onH)) end end
            local function hookH(cc)
                if not cc then return end
                local h = cc:FindFirstChildOfClass("Humanoid")
                if h then
                    local lh = h.Health
                    local cn = h.HealthChanged:Connect(function(nh)
                        if not FP.QuickRecOn then return end
                        if nh > lh and (nh>=h.MaxHealth or (nh-lh)>=15) then onH() end
                        lh = nh
                    end)
                    FP_Reg("QuickRecovery", cn)
                end
            end
            hookH(LocalPlayer.Character)
            FP_Reg("QuickRecovery", LocalPlayer.CharacterAdded:Connect(hookH))
        else
            FP_Clean("QuickRecovery"); FP.ActiveBuffs["QuickRecovery"] = nil
        end
    end
    function W.FP_SetupPerfectLanding(val)
        FP.PerfLandOn = val
        if val then
            local function hookF(cc)
                if not cc then return end
                local h = cc:FindFirstChildOfClass("Humanoid"); if not h then return end
                local wf, fs = false, 0
                local cn = h.StateChanged:Connect(function(_,n)
                    if not FP.PerfLandOn then return end
                    if n == Enum.HumanoidStateType.Freefall then wf=true; fs=tick() end
                    if wf and (n == Enum.HumanoidStateType.Landed or n == Enum.HumanoidStateType.Running) then
                        local ft = tick() - fs; wf = false
                        if ft >= 0.25 then FP_TryBuff("PerfectLanding", 8, 3) end
                    end
                end)
                FP_Reg("PerfectLanding", cn)
            end
            hookF(LocalPlayer.Character)
            FP_Reg("PerfectLanding", LocalPlayer.CharacterAdded:Connect(hookF))
        else
            FP_Clean("PerfectLanding"); FP.ActiveBuffs["PerfectLanding"] = nil
        end
    end
    function W.FP_SetupAdrenalineRush(val)
        FP.AdrenalineOn = val
        if val then
            local function hookD(cc)
                if not cc then return end
                local h = cc:FindFirstChildOfClass("Humanoid"); if not h then return end
                local lh = h.Health
                local cn = h.HealthChanged:Connect(function(nh)
                    if not FP.AdrenalineOn then return end
                    if nh < lh and nh <= 50 and nh > 0 then FP_TryBuff("AdrenalineRush", 4, 5) end
                    lh = nh
                end)
                FP_Reg("AdrenalineRush", cn)
            end
            hookD(LocalPlayer.Character)
            FP_Reg("AdrenalineRush", LocalPlayer.CharacterAdded:Connect(hookD))
        else
            FP_Clean("AdrenalineRush"); FP.ActiveBuffs["AdrenalineRush"] = nil
        end
    end

    W.StunSounds = W.StunSounds or {
        ["Default"]="18843924331",["Clash Royale"]="114072050006157",["Blash"]="89068385567682",
        ["Coin"]="75510526696824",["Kururin Kuru"]="119896940405402",["Spongebob"]="6835794541",
        ["Fahhhh"]="123562480982353",["Cave"]="3173566193",["Aughhh"]="9095205664",
        ["Samsung"]="6879335951",["iPhone"]="4203251375",["Siren"]="130677853589923",
    }
    W.StunIndicator = W.StunIndicator or {
        Enabled = false, Cache = {}, HeartbeatConn = nil, Range = 500,
        Icon = "rbxassetid://81633822407558",
        SoundEnabled = true, SoundId = "18843924331",
        SoundVolume = 1.5, SoundRange = 500, SelectedSound = "Default",
    }
    local SInd = W.StunIndicator
    SInd.SelectedSound = SInd.SelectedSound or "Default"
    local function SInd_GetActiveSoundId()
        local id = W.StunSounds[SInd.SelectedSound]
        if id then return id end
        return SInd.SoundId
    end
    local function SInd_IsStunned(char)
        if not char then return false end
        if char:GetAttribute("IsStunned") == true then return true end
        if char:GetAttribute("isStunned") == true then return true end
        if char:GetAttribute("Stunned") == true then return true end
        if char:GetAttribute("stunned") == true then return true end
        if char:GetAttribute("IsStun") == true then return true end
        if char:GetAttribute("Stun") == true then return true end
        local ci = char:FindFirstChild("CheckInterractable")
        if ci then
            if ci:GetAttribute("isStunned") == true then return true end
            if ci:GetAttribute("Stunned") == true then return true end
        end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then
            local sv = hum:FindFirstChild("StunValue")
            if sv and sv.Value > 0 then return true end
        end
        return false
    end
    local function SInd_Remove(char)
        local data = SInd.Cache[char]
        if data then
            pcall(function()
                if data.StopAnim then data.StopAnim() end
                if data.Gui then data.Gui:Destroy() end
            end)
            SInd.Cache[char] = nil
        end
    end
    local function SInd_PlaySound(char)
        if not SInd.SoundEnabled then return end
        pcall(function()
            local head = char and char:FindFirstChild("Head")
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local attachTo = head or hrp; if not attachTo then return end
            local snd = Instance.new("Sound")
            snd.Name = "GlutoStunSound"; snd.SoundId = "rbxassetid://" .. tostring(SInd_GetActiveSoundId())
            snd.Volume = SInd.SoundVolume or 1.5; snd.PlaybackSpeed = 1
            snd.RollOffMaxDistance = SInd.SoundRange or 500; snd.RollOffMinDistance = 10
            snd.RollOffMode = Enum.RollOffMode.InverseTapered; snd.Parent = attachTo
            snd:Play()
            snd.Ended:Connect(function() pcall(function() snd:Destroy() end) end)
            task.delay(5, function() pcall(function() if snd and snd.Parent then snd:Destroy() end end) end)
        end)
    end
    local function SInd_Create(char)
        if SInd.Cache[char] then return SInd.Cache[char] end
        local head = char:FindFirstChild("Head"); if not head then return nil end
        local bbg = Instance.new("BillboardGui")
        bbg.Name = "GlutoStunIndicator"; bbg.Size = UDim2.fromOffset(140, 42)
        bbg.StudsOffset = Vector3.new(0, 3.0, 0); bbg.AlwaysOnTop = true
        bbg.LightInfluence = 0; bbg.MaxDistance = 500; bbg.Adornee = head; bbg.Parent = char
        local pulse1 = Instance.new("Frame")
        pulse1.Name = "Pulse1"; pulse1.AnchorPoint = Vector2.new(0.5, 0.5)
        pulse1.Position = UDim2.new(0.5, 0, 0.5, 0); pulse1.Size = UDim2.fromOffset(34, 34)
        pulse1.BackgroundTransparency = 1; pulse1.BorderSizePixel = 0; pulse1.ZIndex = 0
        pulse1.Parent = bbg
        Instance.new("UICorner", pulse1).CornerRadius = UDim.new(1, 0)
        local p1s = Instance.new("UIStroke", pulse1)
        p1s.Color = _G.GLUTO_THEME; p1s.Thickness = 1.8; p1s.Transparency = 0.3
        p1s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        local pulse2 = Instance.new("Frame")
        pulse2.Name = "Pulse2"; pulse2.AnchorPoint = Vector2.new(0.5, 0.5)
        pulse2.Position = UDim2.new(0.5, 0, 0.5, 0); pulse2.Size = UDim2.fromOffset(34, 34)
        pulse2.BackgroundTransparency = 1; pulse2.BorderSizePixel = 0; pulse2.ZIndex = 0
        pulse2.Parent = bbg
        Instance.new("UICorner", pulse2).CornerRadius = UDim.new(1, 0)
        local p2s = Instance.new("UIStroke", pulse2)
        p2s.Color = _G.GLUTO_THEME; p2s.Thickness = 1.8; p2s.Transparency = 0.4
        p2s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        local main = Instance.new("Frame")
        main.Name = "Main"; main.Size = UDim2.new(0, 140, 0, 34); main.Position = UDim2.new(0, 0, 0, 4)
        main.BackgroundColor3 = Color3.fromRGB(15, 15, 15); main.BackgroundTransparency = 0.05
        main.BorderSizePixel = 0; main.ZIndex = 1; main.Parent = bbg
        Instance.new("UICorner", main).CornerRadius = UDim.new(0, 9)
        local bodyGrad = Instance.new("UIGradient")
        bodyGrad.Rotation = 135
        bodyGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 25)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 10)),
        })
        bodyGrad.Parent = main
        local mainStroke = Instance.new("UIStroke", main)
        mainStroke.Name = "MainStroke"; mainStroke.Color = _G.GLUTO_THEME
        mainStroke.Thickness = 1.3; mainStroke.Transparency = 0.15
        mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        local iconHolder = Instance.new("Frame")
        iconHolder.Name = "IconHolder"; iconHolder.Size = UDim2.fromOffset(24, 24)
        iconHolder.Position = UDim2.new(0, 5, 0.5, -12); iconHolder.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
        iconHolder.BorderSizePixel = 0; iconHolder.ZIndex = 3; iconHolder.Parent = main
        Instance.new("UICorner", iconHolder).CornerRadius = UDim.new(1, 0)
        local iconGrad = Instance.new("UIGradient", iconHolder)
        iconGrad.Rotation = 135
        iconGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 45)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25)),
        })
        local iconStroke = Instance.new("UIStroke", iconHolder)
        iconStroke.Color = _G.GLUTO_THEME; iconStroke.Thickness = 1; iconStroke.Transparency = 0.25
        local starIcon = Instance.new("TextLabel")
        starIcon.Name = "StarIcon"; starIcon.Size = UDim2.fromScale(1, 1)
        starIcon.BackgroundTransparency = 1; starIcon.Font = Enum.Font.GothamBlack
        starIcon.Text = "★"; starIcon.TextColor3 = _G.GLUTO_THEME; starIcon.TextScaled = true
        starIcon.TextStrokeColor3 = Color3.fromRGB(0, 0, 0); starIcon.TextStrokeTransparency = 0.5
        starIcon.ZIndex = 4; starIcon.Parent = iconHolder
        local title = Instance.new("TextLabel")
        title.Name = "Title"; title.Size = UDim2.new(1, -42, 0, 12)
        title.Position = UDim2.new(0, 34, 0, 4); title.BackgroundTransparency = 1
        title.Font = Enum.Font.GothamBlack; title.Text = "STUNNED"
        title.TextColor3 = _G.GLUTO_THEME; title.TextSize = 11
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.TextStrokeColor3 = Color3.fromRGB(0, 0, 0); title.TextStrokeTransparency = 0.5
        title.ZIndex = 3; title.Parent = main
        local sub = Instance.new("TextLabel")
        sub.Name = "Sub"; sub.Size = UDim2.new(1, -42, 0, 8)
        sub.Position = UDim2.new(0, 34, 0, 18); sub.BackgroundTransparency = 1
        sub.Font = Enum.Font.GothamBold; sub.Text = "SILENT"
        sub.TextColor3 = Color3.fromRGB(170, 170, 170); sub.TextSize = 7
        sub.TextXAlignment = Enum.TextXAlignment.Left
        sub.TextStrokeColor3 = Color3.fromRGB(0, 0, 0); sub.TextStrokeTransparency = 0.6
        sub.ZIndex = 3; sub.Parent = main
        local accent = Instance.new("Frame")
        accent.Name = "Accent"; accent.AnchorPoint = Vector2.new(1, 0.5)
        accent.Size = UDim2.fromOffset(2.5, 14); accent.Position = UDim2.new(1, -5, 0.5, 0)
        accent.BackgroundColor3 = _G.GLUTO_THEME; accent.BorderSizePixel = 0
        accent.ZIndex = 3; accent.Parent = main
        Instance.new("UICorner", accent).CornerRadius = UDim.new(1, 0)
        main.Size = UDim2.new(0, 0, 0, 0); main.BackgroundTransparency = 1
        task.spawn(function()
            task.wait(0.02)
            TweenService:Create(main, TweenInfo.new(0.4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 140, 0, 34), BackgroundTransparency = 0.05,
            }):Play()
        end)
        local animActive = true
        local function StopAnim() animActive = false end
        task.spawn(function()
            local t = 0
            while animActive and bbg.Parent and main.Parent do
                t = t + 0.05
                local pulse = (math.sin(t * 3) + 1) * 0.5
                mainStroke.Transparency = 0.35 - pulse * 0.2
                mainStroke.Thickness = 1.2 + pulse * 0.3
                starIcon.Rotation = math.sin(t * 2) * 10
                local p1 = (t * 0.55) % 1
                pulse1.Size = UDim2.fromOffset(34 + p1 * 40, 34 + p1 * 40)
                p1s.Transparency = 0.15 + p1 * 0.75
                local p2 = ((t * 0.55) + 0.5) % 1
                pulse2.Size = UDim2.fromOffset(34 + p2 * 40, 34 + p2 * 40)
                p2s.Transparency = 0.15 + p2 * 0.75
                task.wait(0.03)
            end
        end)
        local function ExitAndDestroy()
            animActive = false
            TweenService:Create(main, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1,
            }):Play()
            task.delay(0.28, function() pcall(function() bbg:Destroy() end) end)
        end
        SInd.Cache[char] = { Gui = bbg, Main = main, StopAnim = StopAnim, Exit = ExitAndDestroy }
        return SInd.Cache[char]
    end
    function W.SInd_SetEnabled(v)
        SInd.Enabled = v and true or false
        if SInd.Enabled then
            if SInd.HeartbeatConn then return end
            SInd.HeartbeatConn = RunService.Heartbeat:Connect(function()
                if not SInd.Enabled then return end
                local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not myRoot then return end
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= LocalPlayer and TeamIs(p, "Killer") and p.Character then
                        local char = p.Character
                        local hrp = char:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local dist = (hrp.Position - myRoot.Position).Magnitude
                            local stunned = SInd_IsStunned(char)
                            local data = SInd.Cache[char]
                            local wasStunned = data ~= nil
                            if stunned and dist <= SInd.Range then
                                if not wasStunned then SInd_PlaySound(char); SInd_Create(char) end
                            else
                                if wasStunned then
                                    if data.Exit then data.Exit() else SInd_Remove(char) end
                                    SInd.Cache[char] = nil
                                end
                            end
                        end
                    end
                end
            end)
        else
            if SInd.HeartbeatConn then SInd.HeartbeatConn:Disconnect(); SInd.HeartbeatConn = nil end
            for _, data in pairs(SInd.Cache) do
                pcall(function()
                    if data.StopAnim then data.StopAnim() end
                    if data.Gui then data.Gui:Destroy() end
                end)
            end
            SInd.Cache = {}
        end
    end

    W.TrollTeleport = W.TrollTeleport or {
        Enabled = false, IsProcessing = false, TriggerCount = 0,
        AnimatorHook = nil, CharHook = nil,
        BlockedAnimList = { ["123812278891591"] = 1, ["74099023522626"] = 2 },
    }
    local TT = W.TrollTeleport
    local function TT_HookCharacter(char)
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
        local anim = hum:FindFirstChildOfClass("Animator") or hum:WaitForChild("Animator", 3); if not anim then return end
        local root = char:FindFirstChild("HumanoidRootPart"); if not root then return end
        anim.AnimationPlayed:Connect(function(track)
            if not TT.Enabled then return end
            if TT.IsProcessing then return end
            local aid = track.Animation and track.Animation.AnimationId or ""
            local numId = aid:match("%d+")
            local delay = numId and TT.BlockedAnimList[numId]
            if not delay then return end
            TT.IsProcessing = true; TT.TriggerCount = TT.TriggerCount + 1
            local startCF = root.CFrame
            VD_Notify("Troll Teleport", "Trigger #" .. TT.TriggerCount .. " | Delay " .. delay .. "s", 2)
            task.spawn(function()
                if track.IsPlaying then pcall(function() track.Stopped:Wait() end) end
                task.wait(delay)
                local c = LocalPlayer.Character
                local rp = c and c:FindFirstChild("HumanoidRootPart")
                if rp and rp.Parent then pcall(function() rp.CFrame = startCF end) end
                TT.IsProcessing = false
            end)
        end)
    end
    function W.TrollTeleport_Start()
        if TT.AnimatorHook then return end
        TT.IsProcessing = false
        TT_HookCharacter(LocalPlayer.Character)
        TT.CharHook = LocalPlayer.CharacterAdded:Connect(function(c) task.wait(0.4); TT_HookCharacter(c) end)
    end
    function W.TrollTeleport_Stop()
        if TT.CharHook then pcall(function() TT.CharHook:Disconnect() end); TT.CharHook = nil end
        TT.AnimatorHook = nil; TT.IsProcessing = false
    end
    function W.TrollTeleport_SetEnabled(v)
        TT.Enabled = v and true or false
        if TT.Enabled then W.TrollTeleport_Start() else W.TrollTeleport_Stop() end
    end

    W.Escape = W.Escape or { Enabled = false, FinishLineName = "fininshline", TeleportCount = 0 }
    local Esc = W.Escape
    function W.Escape_Teleport()
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not root then ForceNotify("Escape", "Character not found", 2); return false end
        local found = nil
        for _, obj in ipairs(Workspace:GetDescendants()) do
            if string.lower(obj.Name) == string.lower(Esc.FinishLineName) and obj:IsA("BasePart") then found = obj; break end
        end
        if not found then ForceNotify("Escape", "Finish line not found", 2); return false end
        pcall(function() root.CFrame = found.CFrame + Vector3.new(0, 5, 0) end)
        Esc.TeleportCount = Esc.TeleportCount + 1
        VD_Notify("Instant Escape", "Teleported! (#" .. Esc.TeleportCount .. ")", 2)
        return true
    end

    W.Masked = W.Masked or { CurrentPower = "Cobra", Powers = {"Cobra", "Richter", "Brandon", "Rabbit", "Alex", "Tony"} }
    local Masked = W.Masked
    function W.Masked_Activate()
        local ev = ReplicatedStorage:FindFirstChild("Remotes", true)
            and ReplicatedStorage.Remotes:FindFirstChild("Killers", true)
            and ReplicatedStorage.Remotes.Killers:FindFirstChild("Masked", true)
            and ReplicatedStorage.Remotes.Killers.Masked:FindFirstChild("Activatepower")
        if ev then
            pcall(function() ev:FireServer(Masked.CurrentPower) end)
            VD_Notify("Select Masked", "Activated: " .. Masked.CurrentPower, 2)
        else ForceNotify("Select Masked", "Activatepower remote not found", 2) end
    end
    function W.Masked_Deactivate()
        local ev = ReplicatedStorage:FindFirstChild("Remotes", true)
            and ReplicatedStorage.Remotes:FindFirstChild("Killers", true)
            and ReplicatedStorage.Remotes.Killers:FindFirstChild("Masked", true)
            and ReplicatedStorage.Remotes.Killers.Masked:FindFirstChild("Deactivatepower")
        if ev then
            pcall(function() ev:FireServer() end)
            VD_Notify("Select Masked", "Deactivated", 2)
        else ForceNotify("Select Masked", "Deactivatepower remote not found", 2) end
    end

    W.FullESP = W.FullESP or { Survivor = false, Killer = false, Generator = false, Pallet = false, Window = false, SCP = false, Distance = 500 }
    W.FullESPStatus = W.FullESPStatus or { Enabled = false, ShowName = true, ShowDistance = true, ShowHealth = false, ShowAvatar = true, ShowAction = true, Radius = 500 }
    W.FullESPColors = W.FullESPColors or {
        Survivor = Color3.fromRGB(0, 190, 255), Killer = Color3.fromRGB(255, 0, 0),
        Generator = Color3.fromRGB(180, 180, 180), Window = _G.GLUTO_THEME,
        Pallet = Color3.fromRGB(255, 165, 0), SCP = Color3.fromRGB(0, 255, 0),
    }
    local FESP = W.FullESP
    local FESPS = W.FullESPStatus
    local FESPC = W.FullESPColors

    do
        local ESPObjects = {}
        local StatusESP  = {}
        local CachedSCP = {}; local CachedGen = {}; local CachedPallet = {}; local CachedWindow = {}
        local WindowObjects = {}

        local function CacheObject(obj)
            if not obj then return end
            local ln = string.lower(obj.Name)
            if string.find(ln, "scp", 1, true) then CachedSCP[obj] = true end
            if obj.Name == "Generator" then CachedGen[obj] = true
            elseif obj.Name == "Pallet" or obj.Name == "Palletwrong" then CachedPallet[obj] = true end
        end

        for _, obj in ipairs(Workspace:GetDescendants()) do CacheObject(obj) end
        Workspace.DescendantAdded:Connect(CacheObject)
        Workspace.DescendantRemoving:Connect(function(obj)
            CachedSCP[obj] = nil; CachedGen[obj] = nil; CachedPallet[obj] = nil; CachedWindow[obj] = nil
            if ESPObjects[obj] then pcall(function() ESPObjects[obj]:Destroy() end); ESPObjects[obj] = nil end
            if StatusESP[obj] then pcall(function() StatusESP[obj]:Destroy() end); StatusESP[obj] = nil end
        end)

        local function RemoveESP(obj)
            if not obj then return end
            if ESPObjects[obj] then pcall(function() ESPObjects[obj]:Destroy() end); ESPObjects[obj] = nil end
        end

        local function CreateESP(obj, color)
            if not obj or not obj.Parent then return end
            if ESPObjects[obj] then
                ESPObjects[obj].FillColor = color; ESPObjects[obj].OutlineColor = color
                return
            end
            local h = Instance.new("Highlight")
            h.FillColor = color; h.OutlineColor = color; h.FillTransparency = 0.9
            h.OutlineTransparency = 0.3; h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            h.Parent = obj
            ESPObjects[obj] = h
            obj.AncestryChanged:Connect(function(_, parent) if not parent then RemoveESP(obj) end end)
        end

        local function RemoveStatusESP(char)
            if StatusESP[char] then pcall(function() StatusESP[char]:Destroy() end); StatusESP[char] = nil end
        end

        local function StatusESP_GetAction(char, hum)
            if not char or not hum then return "IDLE", Color3.fromRGB(140, 140, 140) end
            if hum.Health <= 0 then return "DEAD", Color3.fromRGB(200, 60, 60) end
            if char:GetAttribute("IsHooked") or char:GetAttribute("isHooked") or char:GetAttribute("Hooked") then
                return "HOOKED", Color3.fromRGB(255, 60, 60) end
            if char:GetAttribute("IsCarried") or char:GetAttribute("isCarried") or char:GetAttribute("Carried") then
                return "CARRIED", Color3.fromRGB(255, 100, 100) end
            local state = char:GetAttribute("State")
            if state == "Downed" or char:GetAttribute("Knocked") == true
               or char:GetAttribute("IsDown") == true or char:GetAttribute("Downed") == true then
                return "DOWNED", Color3.fromRGB(255, 130, 60) end
            local ci = char:FindFirstChild("CheckInterractable")
            if ci then
                if ci:GetAttribute("isRepairing") then return "REPAIR", Color3.fromRGB(255, 220, 60) end
                if ci:GetAttribute("isHealing") then return "HEAL", Color3.fromRGB(80, 220, 120) end
                if ci:GetAttribute("isVaulting") then return "VAULT", Color3.fromRGB(120, 200, 255) end
                if ci:GetAttribute("isSliding") then return "SLIDE", Color3.fromRGB(150, 180, 255) end
                if ci:GetAttribute("isDroppingPallet") then return "PALLET", Color3.fromRGB(255, 165, 60) end
                if ci:GetAttribute("isUnhooking") then return "UNHOOK", Color3.fromRGB(180, 120, 255) end
                if ci:GetAttribute("isExiting") then return "EXIT", Color3.fromRGB(80, 255, 180) end
            end
            local root = char:FindFirstChild("HumanoidRootPart")
            if root then
                local vel = root.AssemblyLinearVelocity
                local speed = Vector3.new(vel.X, 0, vel.Z).Magnitude
                if speed > 20 then return "SPRINT", Color3.fromRGB(120, 255, 200) end
                if speed > 2 then return "MOVE", Color3.fromRGB(180, 180, 180) end
            end
            return "IDLE", Color3.fromRGB(140, 140, 140)
        end

        local function CreateStatusESP(plr, char, root)
            if not FESPS.Enabled then RemoveStatusESP(char); return end
            if not root then return end
            local head = char:FindFirstChild("Head")
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not head or not hum then return end

            local isDown = hum.Health <= 0 or hum.Health < 2
                or char:GetAttribute("Downed") == true or char:GetAttribute("IsDown") == true
                or char:GetAttribute("Knocked") == true

            local dist = (head.Position - root.Position).Magnitude
            if dist > FESPS.Radius then RemoveStatusESP(char); return end

            local accentColor = _G.GLUTO_THEME
            if TeamIs(plr, "Killer") then accentColor = FESPC.Killer
            elseif TeamIs(plr, "Survivor") then accentColor = FESPC.Survivor end
            if isDown then accentColor = Color3.fromRGB(255, 60, 60) end

            local hpPct = math.clamp(hum.Health / math.max(hum.MaxHealth, 1), 0, 1)
            local hpColor
            if hpPct > 0.6 then hpColor = Color3.fromRGB(80, 220, 120)
            elseif hpPct > 0.3 then hpColor = Color3.fromRGB(255, 200, 60)
            else hpColor = Color3.fromRGB(255, 80, 80) end

            local actionText, actionColor = StatusESP_GetAction(char, hum)

            local bb = StatusESP[char]
            if not bb or not bb.Parent then
                bb = Instance.new("BillboardGui")
                bb.Name = "GlutoStatusESP"; bb.AlwaysOnTop = true; bb.LightInfluence = 0
                bb.Adornee = head; bb.StudsOffset = Vector3.new(0, 3.0, 0)
                bb.Size = UDim2.fromOffset(280, 60); bb.Parent = char

                local scaleObj = Instance.new("UIScale"); scaleObj.Name = "DistScale"
                scaleObj.Scale = 1; scaleObj.Parent = bb

                local card = Instance.new("Frame")
                card.Name = "Card"; card.Size = UDim2.fromOffset(260, 52)
                card.Position = UDim2.new(0.5, 0, 0, 0); card.AnchorPoint = Vector2.new(0.5, 0)
                card.BackgroundColor3 = Color3.fromRGB(12, 12, 12); card.BackgroundTransparency = 0.15
                card.BorderSizePixel = 0; card.Parent = bb
                Instance.new("UICorner", card).CornerRadius = UDim.new(0, 10)

                local cardStroke = Instance.new("UIStroke", card)
                cardStroke.Name = "CardStroke"; cardStroke.Color = accentColor
                cardStroke.Thickness = 1; cardStroke.Transparency = 0.4
                cardStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

                local accent = Instance.new("Frame")
                accent.Name = "Accent"; accent.AnchorPoint = Vector2.new(0, 0.5)
                accent.Size = UDim2.new(0, 3, 0, 34); accent.Position = UDim2.new(0, 0, 0.5, 0)
                accent.BackgroundColor3 = accentColor; accent.BorderSizePixel = 0
                accent.Parent = card
                Instance.new("UICorner", accent).CornerRadius = UDim.new(1, 0)

                local avatarHolder = Instance.new("Frame")
                avatarHolder.Name = "AvatarHolder"; avatarHolder.Size = UDim2.fromOffset(34, 34)
                avatarHolder.Position = UDim2.new(0, 11, 0.5, -17)
                avatarHolder.BackgroundColor3 = Color3.fromRGB(30, 30, 30); avatarHolder.BorderSizePixel = 0
                avatarHolder.ClipsDescendants = true; avatarHolder.Parent = card
                Instance.new("UICorner", avatarHolder).CornerRadius = UDim.new(1, 0)

                local avatarStroke = Instance.new("UIStroke", avatarHolder)
                avatarStroke.Name = "AvatarStroke"; avatarStroke.Color = accentColor
                avatarStroke.Thickness = 1.5; avatarStroke.Transparency = 0.2
                avatarStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

                local avatarImg = Instance.new("ImageLabel")
                avatarImg.Name = "AvatarImg"; avatarImg.Size = UDim2.fromScale(1, 1)
                avatarImg.BackgroundTransparency = 1
                avatarImg.Image = "rbxthumb://type=AvatarHeadShot&id=" .. plr.UserId .. "&w=150&h=150"
                avatarImg.Parent = avatarHolder

                local nameLbl = Instance.new("TextLabel")
                nameLbl.Name = "NameLbl"; nameLbl.BackgroundTransparency = 1
                nameLbl.Size = UDim2.new(1, -120, 0, 16); nameLbl.Position = UDim2.new(0, 54, 0, 7)
                nameLbl.Font = Enum.Font.GothamBold; nameLbl.TextSize = 12
                nameLbl.TextColor3 = _G.GLUTO_THEME; nameLbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                nameLbl.TextStrokeTransparency = 0.6; nameLbl.TextXAlignment = Enum.TextXAlignment.Left
                nameLbl.TextYAlignment = Enum.TextYAlignment.Center
                nameLbl.TextTruncate = Enum.TextTruncate.AtEnd
                nameLbl.Text = plr.Name; nameLbl.Parent = card

                local actionPill = Instance.new("Frame")
                actionPill.Name = "ActionPill"; actionPill.Size = UDim2.fromOffset(60, 16)
                actionPill.Position = UDim2.new(0, 54, 0, 27)
                actionPill.BackgroundColor3 = Color3.fromRGB(28, 28, 28)
                actionPill.BackgroundTransparency = 0.1; actionPill.BorderSizePixel = 0
                actionPill.Parent = card
                Instance.new("UICorner", actionPill).CornerRadius = UDim.new(1, 0)

                local actionStroke = Instance.new("UIStroke", actionPill)
                actionStroke.Name = "ActionStroke"; actionStroke.Color = actionColor
                actionStroke.Thickness = 1; actionStroke.Transparency = 0.5
                actionStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

                local actionDot = Instance.new("Frame")
                actionDot.Name = "ActionDot"; actionDot.Size = UDim2.fromOffset(5, 5)
                actionDot.Position = UDim2.new(0, 7, 0.5, -2.5)
                actionDot.BackgroundColor3 = actionColor; actionDot.BorderSizePixel = 0
                actionDot.Parent = actionPill
                Instance.new("UICorner", actionDot).CornerRadius = UDim.new(1, 0)

                local actionLbl = Instance.new("TextLabel")
                actionLbl.Name = "ActionLbl"; actionLbl.BackgroundTransparency = 1
                actionLbl.Size = UDim2.new(1, -18, 1, 0); actionLbl.Position = UDim2.new(0, 16, 0, 0)
                actionLbl.Font = Enum.Font.GothamBold; actionLbl.TextSize = 9
                actionLbl.TextColor3 = actionColor; actionLbl.Text = "IDLE"
                actionLbl.TextXAlignment = Enum.TextXAlignment.Left
                actionLbl.TextYAlignment = Enum.TextYAlignment.Center
                actionLbl.Parent = actionPill

                local distLbl = Instance.new("TextLabel")
                distLbl.Name = "DistLbl"; distLbl.BackgroundTransparency = 1
                distLbl.AnchorPoint = Vector2.new(1, 0); distLbl.Size = UDim2.fromOffset(60, 14)
                distLbl.Position = UDim2.new(1, -12, 0, 7)
                distLbl.Font = Enum.Font.GothamBold; distLbl.TextSize = 11
                distLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
                distLbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
                distLbl.TextStrokeTransparency = 0.5
                distLbl.TextXAlignment = Enum.TextXAlignment.Right
                distLbl.TextYAlignment = Enum.TextYAlignment.Center
                distLbl.Text = "0m"; distLbl.Parent = card

                local downBadge = Instance.new("Frame")
                downBadge.Name = "DownBadge"; downBadge.AnchorPoint = Vector2.new(1, 0)
                downBadge.Size = UDim2.fromOffset(42, 15); downBadge.Position = UDim2.new(1, -12, 0, 25)
                downBadge.BackgroundColor3 = Color3.fromRGB(255, 60, 60)
                downBadge.BackgroundTransparency = 0.05; downBadge.BorderSizePixel = 0
                downBadge.Visible = false; downBadge.Parent = card
                Instance.new("UICorner", downBadge).CornerRadius = UDim.new(1, 0)

                local downLbl = Instance.new("TextLabel")
                downLbl.Name = "DownLbl"; downLbl.Size = UDim2.fromScale(1, 1)
                downLbl.BackgroundTransparency = 1; downLbl.Font = Enum.Font.GothamBold
                downLbl.TextSize = 9; downLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
                downLbl.Text = "DOWN"; downLbl.Parent = downBadge

                local hpBg = Instance.new("Frame")
                hpBg.Name = "HPBarBg"; hpBg.AnchorPoint = Vector2.new(0.5, 1)
                hpBg.Size = UDim2.new(1, -20, 0, 3); hpBg.Position = UDim2.new(0.5, 0, 1, -5)
                hpBg.BackgroundColor3 = Color3.fromRGB(40, 40, 40); hpBg.BorderSizePixel = 0
                hpBg.Parent = card
                Instance.new("UICorner", hpBg).CornerRadius = UDim.new(1, 0)

                local hpFill = Instance.new("Frame")
                hpFill.Name = "HPFill"; hpFill.Size = UDim2.new(1, 0, 1, 0)
                hpFill.BackgroundColor3 = hpColor; hpFill.BorderSizePixel = 0
                hpFill.Parent = hpBg
                Instance.new("UICorner", hpFill).CornerRadius = UDim.new(1, 0)

                StatusESP[char] = bb
            end

            local card = bb:FindFirstChild("Card"); if not card then return end
            local cardStroke = card:FindFirstChild("CardStroke")
            local accent = card:FindFirstChild("Accent")
            local avatarHolder = card:FindFirstChild("AvatarHolder")
            local avatarStroke = avatarHolder and avatarHolder:FindFirstChild("AvatarStroke")
            local avatarImg = avatarHolder and avatarHolder:FindFirstChild("AvatarImg")
            local nameLbl = card:FindFirstChild("NameLbl")
            local actionPill = card:FindFirstChild("ActionPill")
            local actionStroke = actionPill and actionPill:FindFirstChild("ActionStroke")
            local actionDot = actionPill and actionPill:FindFirstChild("ActionDot")
            local actionLbl = actionPill and actionPill:FindFirstChild("ActionLbl")
            local distLbl = card:FindFirstChild("DistLbl")
            local downBadge = card:FindFirstChild("DownBadge")
            local hpBg = card:FindFirstChild("HPBarBg")
            local hpFill = hpBg and hpBg:FindFirstChild("HPFill")
            local distScale = bb:FindFirstChild("DistScale")

            if accent then accent.BackgroundColor3 = accentColor end
            if cardStroke then cardStroke.Color = accentColor; cardStroke.Transparency = isDown and 0.1 or 0.5 end
            if avatarStroke then avatarStroke.Color = accentColor; avatarStroke.Transparency = isDown and 0.1 or 0.3 end
            if avatarHolder then avatarHolder.Visible = FESPS.ShowAvatar == true end
            if avatarImg and avatarImg.Image == "" then
                avatarImg.Image = "rbxthumb://type=AvatarHeadShot&id=" .. plr.UserId .. "&w=150&h=150"
            end
            if nameLbl then
                nameLbl.Text = plr.Name; nameLbl.Visible = FESPS.ShowName
                nameLbl.TextColor3 = isDown and Color3.fromRGB(255, 130, 130) or _G.GLUTO_THEME
            end
            if actionPill then
                actionPill.Visible = FESPS.ShowAction == true
                actionPill.Size = UDim2.fromOffset(math.max(50, #actionText * 6 + 24), 16)
            end
            if actionStroke then actionStroke.Color = actionColor end
            if actionDot then actionDot.BackgroundColor3 = actionColor end
            if actionLbl then actionLbl.Text = actionText; actionLbl.TextColor3 = actionColor end
            if distLbl then distLbl.Text = string.format("%.0fm", dist); distLbl.Visible = FESPS.ShowDistance end
            if downBadge then downBadge.Visible = isDown end
            if hpBg and hpFill then
                hpFill.Size = UDim2.new(hpPct, 0, 1, 0)
                hpFill.BackgroundColor3 = hpColor
                hpBg.Visible = FESPS.ShowHealth
            end
            if distScale then
                local minScale = 0.40; local maxScale = 0.55
                local nearDist = 20; local farDist  = 180
                local t = math.clamp((dist - nearDist) / math.max(farDist - nearDist, 1), 0, 1)
                local eased = 1 - (1 - t) * (1 - t)
                local targetScale = maxScale - (maxScale - minScale) * eased
                local currentScale = distScale.Scale
                distScale.Scale = currentScale + (targetScale - currentScale) * 0.25
            end
            if nameLbl then nameLbl.TextTransparency = math.clamp((dist - 250) / 500, 0, 0.25) end
        end

        local function GetGameValue(obj, name)
            if not obj then return nil end
            local attr = obj:GetAttribute(name); if attr ~= nil then return attr end
            local child = obj:FindFirstChild(name)
            if child then local ok, v = pcall(function() return child.Value end); if ok then return v end end
            return nil
        end

        local function UpdateGenerator(gen)
            if not gen or not gen.Parent then return end
            if not FESP.Generator then
                local o = gen:FindFirstChild("GenESP"); if o then o:Destroy() end
                local h = gen:FindFirstChild("GenHighlight"); if h then h:Destroy() end
                return
            end
            local percent = GetGameValue(gen, "RepairProgress") or GetGameValue(gen, "Progress")
                or GetGameValue(gen, "ProgressRepair") or 0
            local bb = gen:FindFirstChild("GenESP")
            local isDone = percent >= 100
            local statusText = isDone and "DONE" or string.format("%.0f%%", percent)
            local currentColor = isDone and Color3.fromRGB(0, 200, 100) or FESPC.Generator

            if not bb then
                bb = Instance.new("BillboardGui")
                bb.Name = "GenESP"; bb.Size = UDim2.fromOffset(80, 20)
                bb.AlwaysOnTop = true; bb.StudsOffset = Vector3.new(0, 2.5, 0)
                local scaleObj = Instance.new("UIScale"); scaleObj.Name = "DistScale"
                scaleObj.Scale = 1; scaleObj.Parent = bb
                local container = Instance.new("Frame")
                container.Name = "Container"; container.Size = UDim2.fromOffset(80, 20)
                container.Position = UDim2.new(0.5, 0, 0.5, 0); container.AnchorPoint = Vector2.new(0.5, 0.5)
                container.BackgroundColor3 = Color3.fromRGB(15, 15, 15); container.BackgroundTransparency = 0.05
                container.BorderSizePixel = 0; container.Parent = bb
                Instance.new("UICorner", container).CornerRadius = UDim.new(0, 4)
                local stroke = Instance.new("UIStroke", container)
                stroke.Color = Color3.fromRGB(60, 60, 60); stroke.Thickness = 1; stroke.Transparency = 0
                local lblGEN = Instance.new("TextLabel")
                lblGEN.Name = "LabelGEN"; lblGEN.Size = UDim2.new(0.45, 0, 1, 0)
                lblGEN.BackgroundTransparency = 1; lblGEN.Text = "GEN"
                lblGEN.TextColor3 = Color3.fromRGB(255, 255, 255); lblGEN.Font = Enum.Font.GothamBold
                lblGEN.TextSize = 11; lblGEN.TextXAlignment = Enum.TextXAlignment.Right
                lblGEN.Parent = container
                local lblPCT = Instance.new("TextLabel")
                lblPCT.Name = "LabelPCT"; lblPCT.Size = UDim2.new(0.55, 0, 1, 0)
                lblPCT.Position = UDim2.new(0.45, 0, 0, 0); lblPCT.BackgroundTransparency = 1
                lblPCT.Text = statusText; lblPCT.TextColor3 = currentColor
                lblPCT.Font = Enum.Font.GothamBold; lblPCT.TextSize = 11
                lblPCT.TextXAlignment = Enum.TextXAlignment.Left; lblPCT.Parent = container
                bb.Adornee = gen; bb.Parent = gen
            else
                local container = bb:FindFirstChild("Container")
                if container then
                    local lblPCT = container:FindFirstChild("LabelPCT")
                    if lblPCT then lblPCT.Text = statusText; lblPCT.TextColor3 = currentColor end
                end
            end
            local scaleObj = bb:FindFirstChild("DistScale")
            if scaleObj then
                local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if myRoot then
                    local genPos
                    pcall(function() genPos = gen:GetPivot().Position end)
                    if genPos then
                        local dist = (genPos - myRoot.Position).Magnitude
                        scaleObj.Scale = math.clamp(80 / math.max(dist, 1), 0.4, 1.0)
                    end
                end
            end
            local h = gen:FindFirstChild("GenHighlight") or Instance.new("Highlight")
            h.Name = "GenHighlight"; h.Adornee = gen
            h.FillColor = currentColor; h.OutlineColor = currentColor
            h.FillTransparency = 1; h.OutlineTransparency = 0
            h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop; h.Parent = gen
        end

        local function UpdateMapESP(obj, root)
            if not obj or not root or not obj.Parent then return end
            local pos
            if obj:IsA("Model") then
                if obj.PrimaryPart then pos = obj.PrimaryPart.Position
                else
                    local ok, pivot = pcall(function() return obj:GetPivot().Position end)
                    pos = ok and pivot or nil
                    if not pos then local bp = obj:FindFirstChildWhichIsA("BasePart", true); if bp then pos = bp.Position end end
                end
            elseif obj:IsA("BasePart") then pos = obj.Position end
            if not pos then return end
            local dist = (pos - root.Position).Magnitude
            if obj.Name == "Pallet" or obj.Name == "Palletwrong" then
                if FESP.Pallet and dist <= FESP.Distance then CreateESP(obj, FESPC.Pallet)
                else RemoveESP(obj) end
            end
        end

        local function UpdateSCPEsp(root)
            if not FESP.SCP then for obj in pairs(CachedSCP) do RemoveESP(obj) end; return end
            for obj in pairs(CachedSCP) do
                if obj and obj.Parent then
                    local pos
                    if obj:IsA("Model") then
                        local ok, pivot = pcall(function() return obj:GetPivot().Position end)
                        pos = ok and pivot or nil
                    elseif obj:IsA("BasePart") then pos = obj.Position end
                    if pos then
                        local dist = (pos - root.Position).Magnitude
                        if dist <= FESP.Distance then CreateESP(obj, FESPC.SCP)
                        else RemoveESP(obj) end
                    end
                end
            end
        end

        local function RemoveWindowESP(model)
            if not model then return end
            local wData = WindowObjects[model]
            if wData then
                if wData.highlight then pcall(function() wData.highlight:Destroy() end) end
                if wData.box then pcall(function() wData.box:Destroy() end) end
                if wData.bottomPart and wData.bottomPart.Parent then
                    pcall(function()
                        local orig = wData.bottomPart:GetAttribute("ESP_OrigTrans")
                        if orig ~= nil then
                            wData.bottomPart.Transparency = orig
                            wData.bottomPart:SetAttribute("ESP_OrigTrans", nil)
                        end
                    end)
                end
                WindowObjects[model] = nil
            end
            if CachedWindow[model] then CachedWindow[model] = nil end
        end

        local function HandleWindowObject(child)
            if not FESP.Window then return end
            if not child or child.Name ~= "VaultTrigger" then return end
            local winModel = child.Parent
            if not winModel or not winModel:IsA("Model") then return end
            if WindowObjects[winModel] then return end
            local bottomPart = winModel:FindFirstChild("Bottom")
            if not bottomPart or not bottomPart:IsA("BasePart") then
                local bestSize = 0
                for _, p in ipairs(winModel:GetChildren()) do
                    if p:IsA("BasePart") and p.Name ~= "VaultTrigger" and p.Name ~= "inviswall" and p.Size.Magnitude > bestSize then
                        bestSize = p.Size.Magnitude; bottomPart = p
                    end
                end
            end
            if not bottomPart then return end
            if bottomPart:GetAttribute("ESP_OrigTrans") == nil then
                bottomPart:SetAttribute("ESP_OrigTrans", bottomPart.Transparency)
            end
            if bottomPart.Transparency > 0.5 then bottomPart.Transparency = 0.5 end
            local box = Instance.new("BoxHandleAdornment")
            box.Name = "GlutoWindowBox"; box.Adornee = bottomPart; box.Size = bottomPart.Size
            box.Color3 = FESPC.Window; box.Transparency = 0.3; box.AlwaysOnTop = true
            box.ZIndex = 5; box.Parent = bottomPart
            local hl = Instance.new("Highlight")
            hl.Name = "GlutoWindowHighlight"; hl.Adornee = winModel
            hl.FillColor = FESPC.Window; hl.FillTransparency = 0.9
            hl.OutlineColor = FESPC.Window; hl.OutlineTransparency = 0.1
            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop; hl.Parent = winModel
            WindowObjects[winModel] = { highlight = hl, box = box, bottomPart = bottomPart }
        end

        local function ScanAllWindows()
            if not FESP.Window then return end
            local map = Workspace:FindFirstChild("Map"); if not map then return end
            for _, obj in ipairs(map:GetDescendants()) do
                if obj.Name == "VaultTrigger" then HandleWindowObject(obj) end
            end
        end

        Workspace.DescendantAdded:Connect(function(obj)
            if obj.Name == "VaultTrigger" and FESP.Window then
                task.defer(function() HandleWindowObject(obj) end)
            end
        end)

        local espLastUpdate = 0
        RunService.RenderStepped:Connect(function()
            local now = tick()
            if now - espLastUpdate < 0.05 then return end
            espLastUpdate = now
            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not root then return end
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    local char = p.Character
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum and hum.Health > 0 then
                        local hrp = char:FindFirstChild("HumanoidRootPart")
                        if hrp then
                            local dist = (hrp.Position - root.Position).Magnitude
                            if dist <= FESP.Distance then
                                if FESP.Survivor and TeamIs(p, "Survivor") then CreateESP(char, FESPC.Survivor)
                                elseif FESP.Killer and TeamIs(p, "Killer") then CreateESP(char, FESPC.Killer)
                                else RemoveESP(char) end
                            else RemoveESP(char) end
                        end
                        CreateStatusESP(p, char, root)
                    else
                        RemoveESP(char); RemoveStatusESP(char)
                    end
                end
            end
            if FESP.Generator then for gen in pairs(CachedGen) do UpdateGenerator(gen) end end
            for obj in pairs(CachedPallet) do UpdateMapESP(obj, root) end
            UpdateSCPEsp(root)
            if FESP.Window then
                if not _G.GlutoWindowScanned then
                    _G.GlutoWindowScanned = true
                    pcall(ScanAllWindows)
                end
            else
                _G.GlutoWindowScanned = false
                for model in pairs(WindowObjects) do RemoveWindowESP(model) end
            end
        end)
    end

    do
        _G.GLUTO_KillerFovFolder = nil
        _G.GLUTO_KillerFovVisuals = {}

        local _FovGroundRayParams = RaycastParams.new()
        _FovGroundRayParams.FilterType = Enum.RaycastFilterType.Exclude
        _FovGroundRayParams.IgnoreWater = true

        local function CleanupKFOV()
            if _G.GLUTO_KillerFovFolder then
                pcall(function() _G.GLUTO_KillerFovFolder:Destroy() end)
                _G.GLUTO_KillerFovFolder = nil
            end
            _G.GLUTO_KillerFovVisuals = {}
        end

        local function KFOV_RaycastGround(originXZ, dirVec, floorY, filterList, throughWalls)
            _FovGroundRayParams.FilterDescendantsInstances = filterList or {}
            local origin3 = Vector3.new(originXZ.X, floorY + 0.5, originXZ.Z)
            local endpoint
            if throughWalls then
                endpoint = origin3 + dirVec
            else
                local hit = Workspace:Raycast(origin3, dirVec, _FovGroundRayParams)
                endpoint = hit and hit.Position or (origin3 + dirVec)
            end
            local dropHit = Workspace:Raycast(
                Vector3.new(endpoint.X, floorY + 3, endpoint.Z),
                Vector3.new(0, -10, 0),
                _FovGroundRayParams
            )
            if dropHit then
                return Vector3.new(endpoint.X, dropHit.Position.Y + 0.08, endpoint.Z)
            end
            return Vector3.new(endpoint.X, floorY + 0.08, endpoint.Z)
        end

        local function KFOV_CreateBeam(parent, color, width, transparency)
            local p0 = Instance.new("Part")
            p0.Size = Vector3.new(0.1, 0.1, 0.1); p0.Transparency = 1
            p0.Anchored = true; p0.CanCollide = false
            p0.CanQuery = false; p0.CanTouch = false; p0.Parent = parent

            local p1 = Instance.new("Part")
            p1.Size = Vector3.new(0.1, 0.1, 0.1); p1.Transparency = 1
            p1.Anchored = true; p1.CanCollide = false
            p1.CanQuery = false; p1.CanTouch = false; p1.Parent = parent

            local a0 = Instance.new("Attachment", p0)
            local a1 = Instance.new("Attachment", p1)

            local beam = Instance.new("Beam")
            beam.Attachment0 = a0
            beam.Attachment1 = a1
            beam.Width0 = width or 0.18
            beam.Width1 = width or 0.18
            beam.FaceCamera = true
            beam.Color = ColorSequence.new(color or Color3.fromRGB(255, 60, 60))
            beam.Transparency = NumberSequence.new(transparency or 0.25)
            beam.Segments = 1
            beam.Parent = p0

            return {
                p0 = p0, p1 = p1, beam = beam,
                Update = function(self, posA, posB, col, w, trans)
                    p0.Position = posA
                    p1.Position = posB
                    if col then beam.Color = ColorSequence.new(col) end
                    if w then beam.Width0 = w; beam.Width1 = w end
                    if trans then beam.Transparency = NumberSequence.new(trans) end
                end,
                Destroy = function(self)
                    pcall(function() p0:Destroy() end)
                    pcall(function() p1:Destroy() end)
                end,
            }
        end

        local function KFOV_GetKillerChars()
            local list = {}
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and TeamIs(plr, "Killer") and plr.Character then
                    local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                    local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and hum.Health > 0 then
                        table.insert(list, plr.Character)
                    end
                end
            end
            return list
        end

        local function KFOV_RenderChar(char)
            if not char or not char.Parent then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end

            local range        = VD.KillerFOV_Range or 12
            local angleDeg     = VD.KillerFOV_Angle or 70
            local halfAngle    = math.rad(angleDeg / 2)
            local color        = VD.KillerFOV_Color or Color3.fromRGB(255, 60, 60)
            local style        = VD.KillerFOV_Style or "Outline Cone"
            local trans        = VD.KillerFOV_Transparency or 0.25
            local width        = VD.KillerFOV_Width or 0.18
            local throughWall  = VD.KillerFOV_ThroughWalls == true

            local vis = _G.GLUTO_KillerFovVisuals[char]
            if not vis or not vis.beams then
                vis = { beams = {} }
                _G.GLUTO_KillerFovVisuals[char] = vis
            end

            local lookVec = hrp.CFrame.LookVector
            local flatLook = Vector3.new(lookVec.X, 0, lookVec.Z)
            if flatLook.Magnitude < 0.001 then
                flatLook = Vector3.new(0, 0, -1)
            else
                flatLook = flatLook.Unit
            end
            local baseAng = math.atan2(flatLook.Z, flatLook.X)

            local filterList = { char }
            if LocalPlayer.Character then table.insert(filterList, LocalPlayer.Character) end

            local probeParams = RaycastParams.new()
            probeParams.FilterType = Enum.RaycastFilterType.Exclude
            probeParams.FilterDescendantsInstances = filterList
            probeParams.IgnoreWater = true
            local floorHit = Workspace:Raycast(hrp.Position, Vector3.new(0, -15, 0), probeParams)
            local floorY = floorHit and floorHit.Position.Y or (hrp.Position.Y - 2.8)

            local origin = Vector3.new(hrp.Position.X, floorY + 0.08, hrp.Position.Z)

            local SEG_COUNT = 14
            local arcPts = {}
            for i = 0, SEG_COUNT do
                local t = i / SEG_COUNT
                local ang = (baseAng - halfAngle) + (t * halfAngle * 2)
                local dir = Vector3.new(math.cos(ang), 0, math.sin(ang)) * range
                local pt = KFOV_RaycastGround(origin, dir, floorY, filterList, throughWall)
                table.insert(arcPts, pt)
            end

            local lines = {}
            if style == "Dotted Arc" then
                local function addDotted(fromP, toP, count)
                    count = count or 8
                    for i = 0, count - 1 do
                        if i % 2 == 0 then
                            local a = fromP:Lerp(toP, i / count)
                            local b = fromP:Lerp(toP, (i + 1) / count)
                            table.insert(lines, {a, b})
                        end
                    end
                end
                addDotted(origin, arcPts[1], 8)
                addDotted(origin, arcPts[#arcPts], 8)
                for i = 1, #arcPts - 1 do
                    if i % 2 == 1 then
                        table.insert(lines, {arcPts[i], arcPts[i + 1]})
                    end
                end
            else
                table.insert(lines, {origin, arcPts[1]})
                table.insert(lines, {origin, arcPts[#arcPts]})
                for i = 1, #arcPts - 1 do
                    table.insert(lines, {arcPts[i], arcPts[i + 1]})
                end
            end

            local folder = _G.GLUTO_KillerFovFolder
            if not folder or not folder.Parent then
                folder = Instance.new("Folder")
                folder.Name = "Gluto_KillerFOV"
                folder.Parent = Workspace
                _G.GLUTO_KillerFovFolder = folder
            end

            for i, line in ipairs(lines) do
                local beam = vis.beams[i]
                if not beam then
                    beam = KFOV_CreateBeam(folder, color, width, trans)
                    vis.beams[i] = beam
                end
                beam:Update(line[1], line[2], color, width, trans)
            end
            while #vis.beams > #lines do
                local b = table.remove(vis.beams)
                b:Destroy()
            end
        end

        _G.GLUTO_KillerFOV_Conn = nil
        _G.GLUTO_KillerFOV_SetEnabled = function(v)
            v = v and true or false
            if v then
                if _G.GLUTO_KillerFOV_Conn then return end
                _G.GLUTO_KillerFOV_Conn = RunService.RenderStepped:Connect(function()
                    if not VD.KillerFOV_Enabled then return end
                    local chars = KFOV_GetKillerChars()
                    local present = {}
                    for _, c in ipairs(chars) do
                        present[c] = true
                        pcall(KFOV_RenderChar, c)
                    end
                    for c, vis in pairs(_G.GLUTO_KillerFovVisuals) do
                        if not present[c] then
                            if vis.beams then
                                for _, b in ipairs(vis.beams) do pcall(function() b:Destroy() end) end
                            end
                            _G.GLUTO_KillerFovVisuals[c] = nil
                        end
                    end
                end)
            else
                if _G.GLUTO_KillerFOV_Conn then
                    pcall(function() _G.GLUTO_KillerFOV_Conn:Disconnect() end)
                    _G.GLUTO_KillerFOV_Conn = nil
                end
                CleanupKFOV()
            end
        end

        if VD.KillerFOV_Enabled then
            task.defer(function() _G.GLUTO_KillerFOV_SetEnabled(true) end)
        end
    end

    --====================================================--
-- VDT INVISIBLE FE (100% LOCAL BYPASS)
--====================================================--
local VDT_Invis = { Enabled = false, HookSetup = false, Sound = nil, UI = nil }

local function ToggleVDTInvis(state)
    if VDT_Invis.Enabled == state then return end
    VDT_Invis.Enabled = state
    local char = LocalPlayer.Character
    if not char then return end

    if not VDT_Invis.Sound then
        VDT_Invis.Sound = Instance.new("Sound")
        VDT_Invis.Sound.Name = "InvisActivateSound"
        VDT_Invis.Sound.SoundId = "rbxassetid://120228379729797"
        VDT_Invis.Sound.Volume = 1
        VDT_Invis.Sound.Parent = SoundService
    end

    if not VDT_Invis.HookSetup then
        VDT_Invis.HookSetup = true
        task.spawn(function()
            pcall(function()
                if type(hookmetamethod) == "function" and type(getnamecallmethod) == "function" and type(checkcaller) == "function" then
                    local oldNamecall
                    oldNamecall = hookmetamethod(game, "__namecall", function(self, ...)
                        local method = getnamecallmethod()
                        local args = {...}
                        if not checkcaller() and method == "FireServer" and typeof(self) == "Instance" then
                            local selfName = string.lower(self.Name)
                            if VDT_Invis.Enabled and selfName == "updatecharacterlook" then
                                local newArgs = {}
                                for i, v in ipairs(args) do
                                    if typeof(v) == "CFrame" then
                                        newArgs[i] = v * CFrame.new(0, 5000, 0)
                                    else
                                        newArgs[i] = v
                                    end
                                end
                                return oldNamecall(self, unpack(newArgs))
                            end
                        end
                        return oldNamecall(self, ...)
                    end)
                end
            end)
        end)
    end

    if state then
        if VDT_Invis.Sound then VDT_Invis.Sound:Play() end
        local highlight = char:FindFirstChild("InvisibilityFX")
        if not highlight then
            highlight = Instance.new("Highlight")
            highlight.Name = "InvisibilityFX"
            highlight.Adornee = char
            highlight.FillColor = Color3.fromRGB(15, 15, 15)
            highlight.OutlineColor = Color3.fromRGB(55, 55, 55)
            highlight.FillTransparency = 1 
            highlight.OutlineTransparency = 1
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Parent = char
        end
        
        local head = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
        local invisUI = char:FindFirstChild("InvisStatusGUI")
        
        if not invisUI and head then
            invisUI = Instance.new("BillboardGui")
            invisUI.Name = "InvisStatusGUI"
            invisUI.Adornee = head
            invisUI.Size = UDim2.new(0, 100, 0, 50)
            invisUI.StudsOffset = Vector3.new(0, 1.6, 0)
            invisUI.AlwaysOnTop = true
            invisUI.Parent = char

            local container = Instance.new("Frame")
            container.Name = "Container"
            container.Size = UDim2.new(1, 0, 1, 0)
            container.BackgroundTransparency = 1
            container.Parent = invisUI

            local box = Instance.new("Frame")
            box.Name = "Box"
            box.Size = UDim2.new(0, 18, 0, 18)
            box.Position = UDim2.new(0.5, 14, 0.5, -9)
            box.AnchorPoint = Vector2.new(0, 0.5)
            box.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            box.BackgroundTransparency = 0.2 
            box.BorderSizePixel = 0
            box.ZIndex = 2
            box.Parent = container
            Instance.new("UICorner", box).CornerRadius = UDim.new(0, 4)
            
            local icon = Instance.new("ImageLabel")
            icon.Name = "Icon"
            icon.Size = UDim2.new(1, 0, 1, 0)
            icon.BackgroundTransparency = 1
            icon.Image = "rbxassetid://118748055443363"
            icon.ImageTransparency = 1
            icon.ZIndex = 3
            icon.Parent = box

            local line = Instance.new("Frame")
            line.Name = "Line"
            line.Size = UDim2.new(0, 2, 0, 16) 
            line.Position = UDim2.new(0.5, 6, 0.5, 0) 
            line.AnchorPoint = Vector2.new(0.5, 0.5) 
            line.Rotation = 45 
            line.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
            line.BorderSizePixel = 0
            line.ZIndex = 1
            line.Parent = container

            local lineGradient = Instance.new("UIGradient")
            lineGradient.Rotation = 90
            lineGradient.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0, 0),
                NumberSequenceKeypoint.new(1, 1) 
            })
            lineGradient.Parent = line
        end
        
        TweenService:Create(highlight, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {FillTransparency = 0.7, OutlineTransparency = 0.5}):Play()
        local iconImg = invisUI and invisUI:FindFirstChild("Icon", true)
        if iconImg then TweenService:Create(iconImg, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {ImageTransparency = 0}):Play() end
    else
        local highlight = char:FindFirstChild("InvisibilityFX")
        local invisUI = char:FindFirstChild("InvisStatusGUI")
        local iconImg = invisUI and invisUI:FindFirstChild("Icon", true)
        
        if highlight then TweenService:Create(highlight, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {FillTransparency = 1, OutlineTransparency = 1}):Play() end
        if iconImg then TweenService:Create(iconImg, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {ImageTransparency = 1}):Play() end
        
        task.spawn(function()
            task.wait(0.4)
            if not VDT_Invis.Enabled then
                if highlight then highlight:Destroy() end
                if invisUI then invisUI:Destroy() end
            end
        end)
    end
end

-- Auto-Apply pas respawn
LocalPlayer.CharacterAdded:Connect(function(c)
    task.wait(1)
    if VDT_Invis.Enabled then
        local tempState = VDT_Invis.Enabled
        VDT_Invis.Enabled = false 
        ToggleVDTInvis(tempState)
    end
end)

    getgenv().Bypass_HiddenLeapBypassThread = nil
    function W.BYPASS_StartHiddenCooldownBypass()
        if getgenv().Bypass_HiddenLeapBypassThread then return end
        getgenv().Bypass_HiddenLeapBypassThread = task.spawn(function()
            local leapFunction, m2Function
            local function scanGC()
                pcall(function()
                    for _, v in pairs(getgc(true)) do
                        if type(v) == "function" and islclosure(v) then
                            local info
                            pcall(function() info = debug.getinfo(v) end)
                            if info then
                                if info.name == "tryActivate" then leapFunction = v
                                elseif info.name == "playM2Animation" then m2Function = v end
                            end
                        end
                        if leapFunction and m2Function then break end
                    end
                end)
            end
            scanGC()
            local lastScan = os.clock()
            while task.wait(0.1) do
                if not VD.KILLER_BypassLeap then break end
                if not (leapFunction and m2Function) then
                    if os.clock() - lastScan >= 2 then lastScan = os.clock(); scanGC() end
                end
                if leapFunction then
                    pcall(function()
                        for i, val in pairs(debug.getupvalues(leapFunction)) do
                            if type(val) == "boolean" and val == true then debug.setupvalue(leapFunction, i, false) end
                        end
                    end)
                end
                if m2Function then
                    pcall(function()
                        for i, val in pairs(debug.getupvalues(m2Function)) do
                            if type(val) == "boolean" and val == true then debug.setupvalue(m2Function, i, false) end
                        end
                    end)
                end
            end
            getgenv().Bypass_HiddenLeapBypassThread = nil
        end)
    end
    function W.BYPASS_StopHiddenCooldownBypass() end
    function W.BYPASS_SetHiddenLeap(v)
        VD.KILLER_BypassLeap = v and true or false
        if VD.KILLER_BypassLeap then W.BYPASS_StartHiddenCooldownBypass()
        else W.BYPASS_StopHiddenCooldownBypass() end
    end

    W.MyersGrabData = W.MyersGrabData or { Enabled = false, HotkeyCode = Enum.KeyCode.H }
    local MyersGrabData = W.MyersGrabData
    function W.getMyersTarget()
        local char = LocalPlayer.Character; if not char then return nil end
        local myHRP = char:FindFirstChild("HumanoidRootPart"); if not myHRP then return nil end
        local candidates = {}
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= LocalPlayer and player.Character then
                local hrp = player.Character:FindFirstChild("HumanoidRootPart")
                local hum = player.Character:FindFirstChildOfClass("Humanoid")
                if hrp and hum and hum.Health > 0 then
                    table.insert(candidates, { player = player, dist = (hrp.Position - myHRP.Position).Magnitude, health = hum.Health })
                end
            end
        end
        table.sort(candidates, function(a, b) return a.dist < b.dist end)
        for _, c in ipairs(candidates) do return c.player end
        return nil
    end
    function W.doMyersGrab()
        if not MyersGrabData.Enabled then return end
        local target = W.getMyersTarget()
        if not target or not target.Character then return end
        pcall(function() ReplicatedStorage.Remotes.Killers.Stalker.grab:FireServer(target.Character) end)
    end
    function W.setMyersGrab(v)
        MyersGrabData.Enabled = v and true or false
        VD.KILLER_InfGrab = MyersGrabData.Enabled
        if getgenv().Gluto_MGrabBtn_UpdateVisual then pcall(getgenv().Gluto_MGrabBtn_UpdateVisual) end
    end
    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == MyersGrabData.HotkeyCode and MyersGrabData.Enabled then
            W.doMyersGrab()
        end
    end)

    getgenv().MAWWW_SlasherCooldownBypassThread = nil
    function W.MAWWW_StartSlasherCooldownBypass()
        if getgenv().MAWWW_SlasherCooldownBypassThread then return end
        pcall(function()
            local b = true
            local mt = debug.getmetatable(b)
            if not mt then mt = {}; debug.setmetatable(b, mt) end
            if setreadonly then setreadonly(mt, false) end
            mt.__div = function() return 0 end
            mt.__mul = function() return 0 end
            mt.__add = function() return 0 end
            mt.__sub = function() return 0 end
            if setreadonly then setreadonly(mt, true) end
        end)
        getgenv().MAWWW_SlasherCooldownBypassThread = task.spawn(function()
            local toggleFunc = nil; local pursuitHandler = nil
            local function scanGCForSlasher()
                pcall(function()
                    for _, v in pairs(getgc(true)) do
                        if type(v) == "function" and islclosure(v) then
                            local consts = debug.getconstants(v)
                            local hasOffset, hasLinear, hasAction, hasTweenInfo = false, false, false, false
                            local hasPursuit, hasWalkSpeed = false, false
                            for _, c in pairs(consts) do
                                if c == "Offset" then hasOffset = true end
                                if c == "Linear" then hasLinear = true end
                                if c == "action" then hasAction = true end
                                if c == "TweenInfo" then hasTweenInfo = true end
                                if c == "Pursuit" then hasPursuit = true end
                                if c == "WalkSpeed" then hasWalkSpeed = true end
                            end
                            if hasOffset and hasLinear and hasAction and hasTweenInfo and not hasPursuit then toggleFunc = v end
                            if hasPursuit and hasTweenInfo and hasAction and hasWalkSpeed then pursuitHandler = v end
                        end
                        if toggleFunc and pursuitHandler then break end
                    end
                end)
            end
            scanGCForSlasher()
            local lastScan = os.clock()
            while task.wait(0.1) do
                if not VD.KILLER_InfLakeMist and not VD.KILLER_InfPursuit then break end
                if not (toggleFunc and pursuitHandler) then
                    if os.clock() - lastScan >= 2 then scanGCForSlasher(); lastScan = os.clock() end
                end
                if toggleFunc and VD.KILLER_InfLakeMist then
                    pcall(function()
                        debug.setupvalue(toggleFunc, 6, false); debug.setupvalue(toggleFunc, 10, false)
                    end)
                end
                if pursuitHandler and VD.KILLER_InfPursuit then
                    pcall(function()
                        debug.setupvalue(pursuitHandler, 5, false); debug.setupvalue(pursuitHandler, 6, false)
                    end)
                end
            end
            getgenv().MAWWW_SlasherCooldownBypassThread = nil
        end)
    end
    function W.MAWWW_StopSlasherCooldownBypass()
        pcall(function()
            local jason = ReplicatedStorage:FindFirstChild("Remotes")
                and ReplicatedStorage.Remotes:FindFirstChild("Killers")
                and ReplicatedStorage.Remotes.Killers:FindFirstChild("Jason")
            if jason then
                if not VD.KILLER_InfLakeMist then
                    local lm = jason:FindFirstChild("LakeMist"); if lm then lm:FireServer(false) end
                end
                if not VD.KILLER_InfPursuit then
                    local ps = jason:FindFirstChild("Pursuit"); if ps then ps:FireServer(false) end
                end
            end
        end)
    end
    function W.MAWWW_SetLakeMist(v)
        VD.KILLER_InfLakeMist = v and true or false
        if VD.KILLER_InfLakeMist or VD.KILLER_InfPursuit then W.MAWWW_StartSlasherCooldownBypass()
        else W.MAWWW_StopSlasherCooldownBypass() end
    end
    function W.MAWWW_SetPursuit(v)
        VD.KILLER_InfPursuit = v and true or false
        if VD.KILLER_InfLakeMist or VD.KILLER_InfPursuit then W.MAWWW_StartSlasherCooldownBypass()
        else W.MAWWW_StopSlasherCooldownBypass() end
    end

    getgenv().MAWWW_AbyssCooldownBypassConnection = nil
    getgenv().MAWWW_CorruptHandlerFunc = nil
    function W.MAWWW_StartAbyssCooldownBypass()
        if not getgenv().MAWWW_CorruptHandlerFunc then
            pcall(function()
                for _, v in pairs(getgc(true)) do
                    if type(v) == "function" and islclosure(v) then
                        local constants = debug.getconstants(v)
                        if table.find(constants, "corrupt") and table.find(constants, "Immobile") then
                            getgenv().MAWWW_CorruptHandlerFunc = v; break
                        end
                    end
                end
            end)
        end
        if not getgenv().MAWWW_CorruptHandlerFunc then return end
        if getgenv().MAWWW_AbyssCooldownBypassConnection then
            getgenv().MAWWW_AbyssCooldownBypassConnection:Disconnect()
        end
        getgenv().MAWWW_AbyssCooldownBypassConnection = RunService.Heartbeat:Connect(function()
            if not VD.KILLER_BypassCooldown then return end
            if getgenv().MAWWW_CorruptHandlerFunc then
                local upvalues = debug.getupvalues(getgenv().MAWWW_CorruptHandlerFunc)
                for idx, val in pairs(upvalues) do
                    if type(val) == "boolean" and val == false then
                        debug.setupvalue(getgenv().MAWWW_CorruptHandlerFunc, idx, true)
                    end
                end
            end
        end)
    end
    function W.MAWWW_StopAbyssCooldownBypass()
        if getgenv().MAWWW_AbyssCooldownBypassConnection then
            getgenv().MAWWW_AbyssCooldownBypassConnection:Disconnect()
            getgenv().MAWWW_AbyssCooldownBypassConnection = nil
        end
    end
    function W.MAWWW_SetAbyssBypass(v)
        VD.KILLER_BypassCooldown = v and true or false
        if VD.KILLER_BypassCooldown then W.MAWWW_StartAbyssCooldownBypass()
        else W.MAWWW_StopAbyssCooldownBypass() end
    end

    getgenv().MAWWW_JeffCooldownBypassThread = nil
    function W.MAWWW_StartJeffCooldownBypass()
        if getgenv().MAWWW_JeffCooldownBypassThread then return end
        getgenv().MAWWW_JeffCooldownBypassThread = task.spawn(function()
            while task.wait() do
                if not VD.KILLER_InfFrenzy then break end
                pcall(function()
                    local char = LocalPlayer.Character
                    if char and char:GetAttribute("Frenzy") ~= true then char:SetAttribute("Frenzy", true) end
                end)
            end
            getgenv().MAWWW_JeffCooldownBypassThread = nil
        end)
    end
    function W.MAWWW_StopJeffCooldownBypass()
        pcall(function()
            local char = LocalPlayer.Character
            if char and char:GetAttribute("Frenzy") == true then
                char:SetAttribute("Frenzy", false)
                local killer = ReplicatedStorage:FindFirstChild("Remotes")
                    and ReplicatedStorage.Remotes:FindFirstChild("Killers")
                    and ReplicatedStorage.Remotes.Killers:FindFirstChild("Killer")
                if killer then
                    local deact = killer:FindFirstChild("Deactivatefromclient")
                    if deact then deact:FireServer() end
                end
            end
        end)
    end
    function W.MAWWW_SetJeffFrenzy(v)
        VD.KILLER_InfFrenzy = v and true or false
        if VD.KILLER_InfFrenzy then W.MAWWW_StartJeffCooldownBypass()
        else W.MAWWW_StopJeffCooldownBypass() end
    end

    function W.SetupAntiBlind()
        pcall(function()
            local r  = ReplicatedStorage:FindFirstChild("Remotes")
            local i  = r and r:FindFirstChild("Items")
            local fl = i and i:FindFirstChild("Flashlight")
            local gb = fl and fl:FindFirstChild("GotBlinded")
            if not (gb and gb:IsA("RemoteEvent")) then return end
            local ok, mt = pcall(function() return getrawmetatable(game) end)
            if ok and mt and setreadonly then
                pcall(function()
                    setreadonly(mt, false)
                    local old = mt.__namecall
                    mt.__namecall = newcclosure(function(self, ...)
                        if not checkcaller() and getgenv().VD and getgenv().VD.KILLER_AntiBlind and self == gb then
                            local method = getnamecallmethod()
                            if method == "FireServer" and W.GetRole() == "Killer" then return nil end
                        end
                        return old(self, ...)
                    end)
                    setreadonly(mt, true)
                end)
            end
        end)
    end
    pcall(W.SetupAntiBlind)

    getgenv().MAWWW_IsBreakingPallet = false
    function W.MAWWW_DestroyAllPallets()
        if not VD.KILLER_DestroyPallets then return end
        if W.GetRole() ~= "Killer" then return end
        if getgenv().MAWWW_IsBreakingPallet then return end
        local char = LocalPlayer.Character
        local root = char and char:FindFirstChild("HumanoidRootPart")
        if not char or not root then return end
        local stunned = char:GetAttribute("IsStunned") or char:GetAttribute("isStunned")
        local immobile = char:GetAttribute("Immobile") or char:GetAttribute("immobile")
        local carrying = char:GetAttribute("IsCarrying") or char:GetAttribute("isCarrying")
        local ci = char:FindFirstChild("CheckInterractable")
        local action = ci and (ci:GetAttribute("action") or ci:GetAttribute("Action"))
        if stunned or immobile or carrying or action then return end
        local pts = CollectionService:GetTagged("PalletPointSlide")
        local nearest, minDist = nil, 6
        for _, p in ipairs(pts) do
            if p:IsA("BasePart") and not CollectionService:HasTag(p, "doing action") then
                local d = (p.Position - root.Position).Magnitude
                if d < minDist then minDist = d; nearest = p end
            end
        end
        if not nearest then return end
        getgenv().MAWWW_IsBreakingPallet = true
        task.spawn(function()
            pcall(function()
                local r = ReplicatedStorage:FindFirstChild("Remotes")
                local pFold = r and r:FindFirstChild("Pallet")
                local j = pFold and pFold:FindFirstChild("Jason")
                if j then
                    local dg = j:FindFirstChild("Destroy-Global")
                    local commit = j:FindFirstChild("PalletBreakCommit")
                    if dg and dg:IsA("RemoteEvent") then dg:FireServer(nearest) end
                    if commit and commit:IsA("RemoteEvent") then commit:FireServer(nearest) end
                end
            end)
            task.wait(0.2)
            local start = os.clock()
            while char and char.Parent and (char:GetAttribute("Immobile") or char:GetAttribute("immobile")) do
                if os.clock() - start > 3 then break end
                task.wait(0.1)
            end
            getgenv().MAWWW_IsBreakingPallet = false
        end)
    end

    local VD_OriginalLungeBoost = nil
    function VD_UpdateInfiniteLunge()
        local char = LocalPlayer.Character; if not char then return end
        if VD.KILLER_InfLunge then
            if char:GetAttribute("lungeboost") ~= 999999 then
                VD_OriginalLungeBoost = char:GetAttribute("lungeboost") or 1
                char:SetAttribute("lungeboost", 999999)
            end
        else
            if VD_OriginalLungeBoost then
                char:SetAttribute("lungeboost", VD_OriginalLungeBoost)
                VD_OriginalLungeBoost = nil
            end
        end
    end
    W.VD_UpdateInfiniteLunge = VD_UpdateInfiniteLunge
    LocalPlayer.CharacterRemoving:Connect(function() VD_OriginalLungeBoost = nil end)

    do
        local AttackAim = {
            Enabled = false, Holding = false, Strength = 1,
            Predict = true, PredictStrength = 0.12, FOV = 250,
            VisibilityCheck = true, AimPart = "HumanoidRootPart",
        }
        local AttackAimConnection = nil
        local CurrentAttackButton = nil
        local AttackPaths = { "Slasher-mob.Controls.attack", "Masked-mob.Controls.attack", "Killer-mob.Controls.attack" }
        local RayParams = RaycastParams.new()
        RayParams.FilterType = Enum.RaycastFilterType.Exclude

        local function AL_IsVisible(part)
            local cam = Workspace.CurrentCamera; if not cam then return true end
            RayParams.FilterDescendantsInstances = { LocalPlayer.Character }
            local origin = cam.CFrame.Position
            local dir = part.Position - origin
            local result = Workspace:Raycast(origin, dir, RayParams)
            if not result then return true end
            return result.Instance:IsDescendantOf(part.Parent)
        end

        local function AL_GetAttackButton()
            for _, path in ipairs(AttackPaths) do
                local current = LocalPlayer:FindFirstChild("PlayerGui")
                for seg in string.gmatch(path, "[^%.]+") do current = current and current:FindFirstChild(seg) end
                if current and current:IsA("GuiObject") then return current end
            end
            return nil
        end

        local function AL_GetClosestAttackTarget()
            local cam = Workspace.CurrentCamera; if not cam then return nil end
            local center = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
            local closest, shortest = nil, AttackAim.FOV
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Team and string.find(string.lower(p.Team.Name), "survivor", 1, true) and p.Character then
                    local hrp = p.Character:FindFirstChild(AttackAim.AimPart)
                    local hum = p.Character:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and hum.Health > 0 then
                        local pos, visible = cam:WorldToViewportPoint(hrp.Position)
                        if visible then
                            local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                            if dist < shortest then
                                if AttackAim.VisibilityCheck then
                                    if not AL_IsVisible(hrp) then continue end
                                end
                                shortest = dist; closest = hrp
                            end
                        end
                    end
                end
            end
            return closest
        end

        local function AL_StartAttackAim()
            if AttackAimConnection then return end
            AttackAimConnection = RunService.RenderStepped:Connect(function()
                if not AttackAim.Enabled then return end
                if not AttackAim.Holding then return end
                local target = AL_GetClosestAttackTarget(); if not target then return end
                local cam = Workspace.CurrentCamera
                local pos = target.Position
                if AttackAim.Predict then pos = pos + (target.AssemblyLinearVelocity * AttackAim.PredictStrength) end
                cam.CFrame = CFrame.new(cam.CFrame.Position, pos)
            end)
        end

        UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if input.UserInputType == Enum.UserInputType.MouseButton2 and AttackAim.Enabled then
                AttackAim.Holding = true
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton2 then
                AttackAim.Holding = false
            end
        end)

        task.spawn(function()
            while true do
                task.wait(1)
                local btn = AL_GetAttackButton()
                if btn and btn ~= CurrentAttackButton then
                    CurrentAttackButton = btn
                    btn.InputBegan:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Touch and AttackAim.Enabled then
                            AttackAim.Holding = true
                        end
                    end)
                    btn.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Touch then
                            AttackAim.Holding = false
                        end
                    end)
                end
            end
        end)

        W.AttackAim_Start = AL_StartAttackAim
        W.AttackAim_Cfg = AttackAim
    end

    do
        local GunAim = {
            Enabled = false, Holding = false, TargetMode = "Killer",
            Strength = 1, Predict = true, PredictStrength = 0.12,
            FOV = 250, VisibilityCheck = true, AimPart = "HumanoidRootPart", Target = nil,
        }
        local GunAimConnection = nil
        local CurrentGunButton = nil

        local function GA_IsVisible(part)
            local cam = Workspace.CurrentCamera; if not cam then return true end
            local rp = RaycastParams.new()
            rp.FilterType = Enum.RaycastFilterType.Exclude
            rp.FilterDescendantsInstances = { LocalPlayer.Character }
            local origin = cam.CFrame.Position
            local dir = part.Position - origin
            local result = Workspace:Raycast(origin, dir, rp)
            if not result then return true end
            return result.Instance:IsDescendantOf(part.Parent)
        end

        local function GA_GetButton()
            local current = LocalPlayer:FindFirstChild("PlayerGui")
            for seg in string.gmatch("Survivor-mob.Controls.Gui-mob", "[^%.]+") do
                current = current and current:FindFirstChild(seg)
            end
            return current
        end

        local function GA_GetClosestTarget()
            local cam = Workspace.CurrentCamera; if not cam then return nil end
            local center = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
            local closest, shortest = nil, GunAim.FOV
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and p.Team then
                    local valid = false
                    if GunAim.TargetMode == "Killer" and string.find(string.lower(p.Team.Name), "killer", 1, true) then valid = true
                    elseif GunAim.TargetMode == "Survivor" and string.find(string.lower(p.Team.Name), "survivor", 1, true) then valid = true end
                    if valid then
                        local hrp = p.Character:FindFirstChild(GunAim.AimPart)
                        local hum = p.Character:FindFirstChildOfClass("Humanoid")
                        if hrp and hum and hum.Health > 0 then
                            local pos, visible = cam:WorldToViewportPoint(hrp.Position)
                            if visible then
                                local dist = (Vector2.new(pos.X, pos.Y) - center).Magnitude
                                if dist < shortest then
                                    if GunAim.VisibilityCheck and not GA_IsVisible(hrp) then continue end
                                    shortest = dist; closest = hrp
                                end
                            end
                        end
                    end
                end
            end
            return closest
        end

        local function GA_Start()
            if GunAimConnection then return end
            GunAimConnection = RunService.RenderStepped:Connect(function()
                if not GunAim.Enabled or not GunAim.Holding then GunAim.Target = nil; return end
                local target = GA_GetClosestTarget(); if not target then return end
                GunAim.Target = target
                local pos = target.Position
                if GunAim.Predict then pos = pos + (target.AssemblyLinearVelocity * GunAim.PredictStrength) end
                local cam = Workspace.CurrentCamera
                cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position, pos), GunAim.Strength)
            end)
        end

        UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if input.UserInputType == Enum.UserInputType.MouseButton2 and GunAim.Enabled then
                GunAim.Holding = true
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton2 then GunAim.Holding = false end
        end)

        task.spawn(function()
            while true do
                task.wait(1)
                local btn = GA_GetButton()
                if btn and btn ~= CurrentGunButton then
                    CurrentGunButton = btn
                    btn.InputBegan:Connect(function(input)
                        if (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton2) and GunAim.Enabled then
                            GunAim.Holding = true
                        end
                    end)
                    btn.InputEnded:Connect(function(input)
                        if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton2 then
                            GunAim.Holding = false
                        end
                    end)
                end
            end
        end)

        W.GunAim_Start = GA_Start
        W.GunAim_Cfg = GunAim
    end

    W.KillerAbilities = W.KillerAbilities or {
        AutoStalk = VD.KA_AutoStalk, AutoStalkRange = VD.KA_AutoStalkRange,
        AutoKillAll = VD.KA_AutoKillAll, DropAllPallet = VD.KA_DropAllPallet,
        BlockAllVault = VD.KA_BlockAllVault,
    }
    local KA = W.KillerAbilities
    function W.KA_GetClosestSurvivor(range, minHealth)
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not root then return nil end
        local closest, shortest = nil, (range or math.huge)
        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= LocalPlayer and plr.Character and TeamIs(plr, "Survivor") then
                local hum = plr.Character:FindFirstChildOfClass("Humanoid")
                local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                if hum and hrp and hum.Health > (minHealth or 30) then
                    local d = (hrp.Position - root.Position).Magnitude
                    if d <= shortest then shortest = d; closest = plr end
                end
            end
        end
        return closest
    end
    local AutoStalkConnection = nil
    function W.KA_StartAutoStalk()
        if AutoStalkConnection then return end
        AutoStalkConnection = RunService.Heartbeat:Connect(function()
            if not KA.AutoStalk then return end
            if GetRole() ~= "Killer" then return end
            local target = W.KA_GetClosestSurvivor(KA.AutoStalkRange, 30)
            if not target or not target.Character then return end
            local stalkEvent = ReplicatedStorage:FindFirstChild("Remotes", true)
                and ReplicatedStorage.Remotes:FindFirstChild("Killers", true)
                and ReplicatedStorage.Remotes.Killers:FindFirstChild("Stalker", true)
                and ReplicatedStorage.Remotes.Killers.Stalker:FindFirstChild("StartStalking")
            if stalkEvent then pcall(function() stalkEvent:FireServer(target) end) end
        end)
    end
    function W.KA_StopAutoStalk()
        if AutoStalkConnection then pcall(function() AutoStalkConnection:Disconnect() end); AutoStalkConnection = nil end
    end
    function W.KA_SetAutoStalk(v)
        KA.AutoStalk = v and true or false
        VD.KA_AutoStalk = KA.AutoStalk
        if KA.AutoStalk then W.KA_StartAutoStalk() else W.KA_StopAutoStalk() end
    end
    local KillAllTarget = nil
    function W.KA_UpdateKillAll()
        if not KA.AutoKillAll then KillAllTarget = nil; return end
        if GetRole() ~= "Killer" then KillAllTarget = nil; return end
        local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local tChar = KillAllTarget and KillAllTarget.Character
        if not KillAllTarget or not tChar or not tChar.Parent
            or not tChar:FindFirstChild("Humanoid") or tChar.Humanoid.Health <= 35 then
            KillAllTarget = W.KA_GetClosestSurvivor(math.huge, 30)
            tChar = KillAllTarget and KillAllTarget.Character
        end
        if KillAllTarget and tChar then
            local targetHRP = tChar:FindFirstChild("HumanoidRootPart")
            if targetHRP then
                local velocity  = targetHRP.AssemblyLinearVelocity
                local predict   = velocity * 0.15
                local targetPos = targetHRP.Position + predict
                local behind    = targetHRP.CFrame.LookVector * -3
                root.CFrame = CFrame.new(targetPos + behind, targetPos)
            end
            pcall(function()
                local attacks = ReplicatedStorage:FindFirstChild("Remotes") and ReplicatedStorage.Remotes:FindFirstChild("Attacks")
                local basic = attacks and attacks:FindFirstChild("BasicAttack")
                if basic then basic:FireServer(false) end
            end)
        end
    end
    function W.KA_SetAutoKillAll(v)
        KA.AutoKillAll = v and true or false
        VD.KA_AutoKillAll = KA.AutoKillAll
        if not KA.AutoKillAll then KillAllTarget = nil end
    end
    local lastDropAllPallet = 0
    function W.KA_DropAllPallets()
        if not KA.DropAllPallet then return end
        if GetRole() ~= "Killer" then return end
        local now = tick()
        if now - lastDropAllPallet < 2 then return end
        lastDropAllPallet = now
        pcall(function()
            local remotes = ReplicatedStorage:FindFirstChild("Remotes")
            local palletFold = remotes and remotes:FindFirstChild("Pallet")
            local dropEvent = palletFold and palletFold:FindFirstChild("PalletDropEvent")
            if not dropEvent then return end
            local map = workspace:FindFirstChild("Map"); if not map then return end
            for _, obj in ipairs(map:GetDescendants()) do
                if obj.Name == "Palletwrong" and (obj:IsA("Model") or obj:IsA("Folder")) then
                    local target = obj:FindFirstChild("PalletPointSlide") or obj:FindFirstChild("PalletPoint")
                    if target then pcall(function() dropEvent:FireServer(target) end) end
                end
            end
        end)
    end
    function W.KA_SetDropAllPallet(v)
        KA.DropAllPallet = v and true or false
        VD.KA_DropAllPallet = KA.DropAllPallet
    end
    local lastBlockVault = 0
    function W.KA_BlockAllVaults()
        if not KA.BlockAllVault then return end
        local VaultEvent = ReplicatedStorage:FindFirstChild("Remotes")
            and ReplicatedStorage.Remotes:FindFirstChild("Window")
            and ReplicatedStorage.Remotes.Window:FindFirstChild("VaultEvent")
        if not VaultEvent then return end
        local map = workspace:FindFirstChild("Map"); if not map then return end
        for _, trigger in ipairs(map:GetDescendants()) do
            if trigger.Name == "VaultTrigger" then pcall(function() VaultEvent:FireServer(trigger, true) end) end
        end
    end
    function W.KA_SetBlockAllVault(v)
        KA.BlockAllVault = v and true or false
        VD.KA_BlockAllVault = KA.BlockAllVault
    end
    task.spawn(function()
        while true do
            task.wait(0.12)
            if KA.AutoKillAll then pcall(W.KA_UpdateKillAll) end
            if KA.DropAllPallet then pcall(W.KA_DropAllPallets) end
            if KA.BlockAllVault then pcall(W.KA_BlockAllVaults) end
            if VD.KILLER_DestroyPallets then pcall(W.MAWWW_DestroyAllPallets) end
            pcall(VD_UpdateInfiniteLunge)
        end
    end)
    LocalPlayer.CharacterAdded:Connect(function()
        task.wait(1)
        if KA.AutoStalk then pcall(W.KA_StartAutoStalk) end
    end)

    do
        local CounterParryAnimList = {
            "122812055447896","133963973694098","117042998468241","135002183282873",
            "121216847022485","132817836308238","129784271201071","82666958311998",
            "78432063483146","118907603246885","139369275981139","110355011987939",
            "111920872708571","105374834496520","138720291317243","106871536134254",
            "130593238885843","115244153053858","74968262036854","113255068724446",
            "98163597193511","80411309607666",
        }
        W.CounterParry = W.CounterParry or { Running = false, Conn = nil }
        local CP = W.CounterParry

        function W.CounterParry_Start()
            if CP.Running then return end
            CP.Running = true
            CP.Conn = task.spawn(function()
                while task.wait(0.5) do
                    if not VD.KILLER_CounterParry then break end
                    if GetRole() ~= "Killer" then continue end
                    local char = LocalPlayer.Character; if not char then continue end
                    local myRoot = char:FindFirstChild("HumanoidRootPart"); if not myRoot then continue end
                    local near = false
                    for _, p in pairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer and TeamIs(p, "Survivor") and p.Character then
                            local r = p.Character:FindFirstChild("HumanoidRootPart")
                            if r and (myRoot.Position - r.Position).Magnitude <= 15 then near = true; break end
                        end
                    end
                    if near then
                        local randomId = CounterParryAnimList[math.random(1, #CounterParryAnimList)]
                        local anim = Instance.new("Animation")
                        anim.AnimationId = "rbxassetid://" .. randomId
                        local hum = char:FindFirstChildOfClass("Humanoid")
                        local animator = hum and hum:FindFirstChildOfClass("Animator")
                        if animator then
                            local ok, track = pcall(function() return animator:LoadAnimation(anim) end)
                            if ok and track then
                                pcall(function()
                                    track:Play(); track:AdjustWeight(0); task.wait(0.05); track:Stop()
                                end)
                            end
                        end
                        anim:Destroy()
                    end
                end
                CP.Running = false
            end)
        end

        function W.CounterParry_Stop()
            CP.Running = false
            if CP.Conn then pcall(function() task.cancel(CP.Conn) end); CP.Conn = nil end
        end

        function W.CounterParry_SetEnabled(v)
            VD.KILLER_CounterParry = v and true or false
            if v then W.CounterParry_Start() else W.CounterParry_Stop() end
        end
    end

    do
        local IsAutoHooking = false
        local function GetMapCacheHooks()
            local hooks = {}
            local map = Workspace:FindFirstChild("Map"); if not map then return hooks end
            for _, obj in ipairs(map:GetDescendants()) do
                if obj:IsA("Model") and obj.Name == "Hook" then
                    local hp = obj:FindFirstChild("HookPoint") or obj:FindFirstChild("HookHitbox")
                        or obj:FindFirstChildWhichIsA("BasePart", true)
                    if hp then table.insert(hooks, { model = obj, part = hp }) end
                end
            end
            return hooks
        end
        local function IsPlayerOnHook(character, hooks)
            local tr = character:FindFirstChild("HumanoidRootPart"); if not tr then return false end
            for _, h in ipairs(hooks) do
                if (h.part.Position - tr.Position).Magnitude < 6 then return true end
            end
            return false
        end
        local function IsPlayerCarried(character)
            return character:GetAttribute("IsCarried") == true
        end
        local function FindDownedSurvivor(hooks)
            local myRoot = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not myRoot then return nil, nil end
            local closest, closestDist, closestChar = nil, math.huge, nil
            for _, pl in ipairs(Players:GetPlayers()) do
                if pl == LocalPlayer or not pl.Character then continue end
                if not TeamIs(pl, "Survivor") then continue end
                local tr = pl.Character:FindFirstChild("HumanoidRootPart")
                local h = pl.Character:FindFirstChildOfClass("Humanoid")
                if not tr or not h then continue end
                local pct = h.MaxHealth > 0 and (h.Health / h.MaxHealth) or 0
                if pct > 0.25 or pct <= 0 then continue end
                if IsPlayerOnHook(pl.Character, hooks) then continue end
                if IsPlayerCarried(pl.Character) then continue end
                local d = (tr.Position - myRoot.Position).Magnitude
                if d < closestDist then closestDist = d; closest = tr; closestChar = pl.Character end
            end
            return closest, closestChar
        end
        local function FindNearestHook(targetPos, hooks)
            local closest, closestDist = nil, math.huge
            for _, h in ipairs(hooks) do
                local d = (h.part.Position - targetPos).Magnitude
                if d < closestDist then closestDist = d; closest = h end
            end
            return closest
        end
        local function DoAutoHook()
            if not VD.KILLER_AutoHook then return end
            if IsAutoHooking then return end
            if GetRole() ~= "Killer" then return end
            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not root then return end
            local hooks = GetMapCacheHooks(); if #hooks == 0 then return end
            local targetRoot, targetChar = FindDownedSurvivor(hooks); if not targetRoot then return end
            local nearestHook = FindNearestHook(targetRoot.Position, hooks); if not nearestHook then return end
            IsAutoHooking = true
            task.spawn(function()
                local CarryEvent, HookEvent, HookCommit
                pcall(function()
                    local carryFolder = ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("Carry")
                    CarryEvent = carryFolder:FindFirstChild("CarrySurvivorEvent")
                    HookEvent  = carryFolder:FindFirstChild("HookEvent")
                    HookCommit = carryFolder:FindFirstChild("HookCommit")
                end)
                pcall(function() root.CFrame = CFrame.new(targetRoot.Position + Vector3.new(0, 3, 0), targetRoot.Position) end)
                task.wait(0.2)
                pcall(function() if CarryEvent then CarryEvent:FireServer(targetChar) end end)
                task.wait(0.5)
                local r2 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if not r2 then IsAutoHooking = false; return end
                pcall(function() r2.CFrame = CFrame.new(nearestHook.part.Position + Vector3.new(0, 3, 0)) end)
                task.wait(0.3)
                pcall(function()
                    local hookPoint = nearestHook.model:FindFirstChild("HookPoint") or nearestHook.model:FindFirstChild("HookHitbox") or nearestHook.part
                    if HookEvent then HookEvent:FireServer(hookPoint) end
                    if HookCommit then HookCommit:FireServer(hookPoint) end
                end)
                task.wait(1)
                IsAutoHooking = false
            end)
        end
        function W.KA_StartAutoHook()
            if W._AutoHookThread then return end
            W._AutoHookThread = task.spawn(function()
                while VD.KILLER_AutoHook do
                    if GetRole() == "Killer" then pcall(DoAutoHook) end
                    task.wait(1)
                end
                W._AutoHookThread = nil
            end)
        end
        function W.KA_StopAutoHook()
            if W._AutoHookThread then pcall(function() task.cancel(W._AutoHookThread) end); W._AutoHookThread = nil end
        end
        function W.KA_SetAutoHook(v)
            VD.KILLER_AutoHook = v and true or false
            if VD.KILLER_AutoHook then W.KA_StartAutoHook() else W.KA_StopAutoHook() end
        end
    end

    do
    local PerkDisplayState = { Gui = nil, Thread = nil, Enabled = false, Minimized = false }
    
    local function GetKillerPlayer()
        for _, p in ipairs(Players:GetPlayers()) do
            if TeamIs(p, "Killer") then return p end
        end
        return nil
    end
    
    local function FormatPerkName(name)
        name = tostring(name or "")
        local clean = name:gsub("_", " "):gsub("-", " ")
        clean = clean:gsub("(%l)(%u)", "%1 %2"):gsub("(%a)(%d)", "%1 %2"):gsub("(%d)(%a)", "%1 %2")
        clean = clean:gsub("%s+", " "):gsub("^%s+", ""):gsub("%s+$", "")
        return clean ~= "" and clean or "Unknown Perk"
    end
    
    local function ParsePerkName(name)
        name = tostring(name or "")
        local perkName, level = name:match("^(.+)%s+(%d+)$")
        if not perkName then return nil end
        perkName = perkName:gsub("^%s+", ""):gsub("%s+$", "")
        if perkName == "" then return nil end
        local lower = perkName:lower()
        local excluded = {
            head=true,torso=true,humanoid=true,
            ["left arm"]=true,["right arm"]=true,["left leg"]=true,["right leg"]=true,["humanoidrootpart"]=true,
        }
        if excluded[lower] then return nil end
        return perkName, level
    end
    
    local function ReadPerksFromChar(char)
        if not char then return {} end
        local result, seen = {}, {}
        local function addPerk(rawName, displayName, level)
            if not rawName then return end
            rawName = tostring(rawName)
            if rawName == "" or rawName == "nil" then return end
            if rawName:lower():find("template") then return end
            if seen[rawName] then return end
            seen[rawName] = true
            table.insert(result, {
                Raw = rawName,
                Name = displayName and tostring(displayName) or FormatPerkName(rawName),
                Level = level and tostring(level) or nil,
            })
        end
        local function scanAttrs(inst)
            if not inst.GetAttributes then return end
            local attrs = inst:GetAttributes()
            for k, v in pairs(attrs) do
                local lk = tostring(k):lower()
                if lk:find("perk") then
                    if type(v) == "string" then addPerk(v)
                    elseif v == true then addPerk(k)
                    elseif type(v) == "number" and lk:find("level") then
                        local bn = tostring(k):gsub("[Ll]evel",""):gsub("[Pp]erk","")
                        if bn ~= "" then addPerk(bn, nil, v) end
                    end
                end
            end
        end
        scanAttrs(char)
        for _, child in ipairs(char:GetChildren()) do
            local pn, lv = ParsePerkName(child.Name)
            if pn then addPerk(child.Name, pn, lv) end
        end
        for _, inst in ipairs(char:GetDescendants()) do
            scanAttrs(inst)
            local lower = inst.Name:lower()
            if lower == "perks" or lower == "killerperks" or lower:find("perkfolder") or lower:find("perklist") then
                for _, child in ipairs(inst:GetChildren()) do
                    if child:IsA("StringValue") then addPerk(child.Value)
                    elseif child:IsA("IntValue") or child:IsA("NumberValue") then addPerk(child.Name, nil, child.Value)
                    elseif child:IsA("BoolValue") and child.Value then addPerk(child.Name) end
                end
            elseif lower:find("perk") then
                if inst:IsA("StringValue") then addPerk(inst.Value)
                elseif inst:IsA("BoolValue") and inst.Value then addPerk(inst.Name) end
            end
        end
        table.sort(result, function(a, b) return tostring(a.Name) < tostring(b.Name) end)
        return result
    end

    local function BuildGui()
        if PerkDisplayState.Gui then pcall(function() PerkDisplayState.Gui:Destroy() end) end
        local pg = SafeGuiParent(); if not pg then return end
        
        local gui = Instance.new("ScreenGui")
        gui.Name = "GlutoKillerPerksDisplay"
        gui.ResetOnSpawn = false
        gui.IgnoreGuiInset = true
        gui.DisplayOrder = 60
        gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        gui.Parent = pg

        -- Frame Utama
        local frame = Instance.new("Frame")
        frame.Name = "MainFrame"
        frame.Size = UDim2.new(0, 210, 0, 30)
        frame.Position = UDim2.new(0.02, 0, 0.42, 0)
        frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        frame.BorderSizePixel = 0
        frame.Active = true
        frame.ClipsDescendants = true
        frame.Parent = gui
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
        
        local bgGrad = Instance.new("UIGradient", frame)
        bgGrad.Color = ColorSequence.new(Color3.fromRGB(28, 28, 28), Color3.fromRGB(10, 10, 10))
        bgGrad.Rotation = 135
        
        local stroke = Instance.new("UIStroke", frame)
        stroke.Color = Color3.fromRGB(80, 80, 80)
        stroke.Thickness = 1.2
        stroke.Transparency = 0.2
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

        -- Garis Aksen Atas
        local topBar = Instance.new("Frame", frame)
        topBar.Name = "TopBar"
        topBar.Size = UDim2.new(1, -24, 0, 2)
        topBar.Position = UDim2.new(0, 12, 0, 0)
        topBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        topBar.BorderSizePixel = 0
        Instance.new("UICorner", topBar).CornerRadius = UDim.new(1, 0)
        local topGlow = Instance.new("UIGradient", topBar)
        topGlow.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1)
        })

        -- Header
        local header = Instance.new("Frame", frame)
        header.Name = "Header"
        header.Size = UDim2.new(1, 0, 0, 26)
        header.Position = UDim2.new(0, 0, 0, 2)
        header.BackgroundTransparency = 1
        header.Active = true

        local title = Instance.new("TextLabel", header)
        title.Name = "Title"
        title.Size = UDim2.new(0, 80, 1, 0)
        title.Position = UDim2.new(0, 12, 0, 0)
        title.BackgroundTransparency = 1
        title.Font = Enum.Font.GothamBold
        title.Text = "PERKS"
        title.TextColor3 = Color3.fromRGB(255, 255, 255)
        title.TextSize = 11
        title.TextXAlignment = Enum.TextXAlignment.Left

        local killerName = Instance.new("TextLabel", header)
        killerName.Name = "KillerName"
        killerName.Size = UDim2.new(0, 80, 0, 16)
        killerName.Position = UDim2.new(1, -55, 0.5, -8)
        killerName.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        killerName.BackgroundTransparency = 0.5
        killerName.Font = Enum.Font.GothamBold
        killerName.Text = "???"
        killerName.TextColor3 = Color3.fromRGB(200, 200, 200)
        killerName.TextSize = 9
        killerName.TextTruncate = Enum.TextTruncate.AtEnd
        killerName.Parent = header
        Instance.new("UICorner", killerName).CornerRadius = UDim.new(0, 4)

        local minBtn = Instance.new("TextButton", header)
        minBtn.Name = "MinBtn"
        minBtn.Size = UDim2.new(0, 20, 0, 20)
        minBtn.Position = UDim2.new(1, -24, 0.5, -10)
        minBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
        minBtn.Text = "−"
        minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        minBtn.Font = Enum.Font.GothamBold
        minBtn.TextSize = 14
        minBtn.AutoButtonColor = false
        Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)
        
        minBtn.MouseEnter:Connect(function() TweenService:Create(minBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(60,60,60) }):Play() end)
        minBtn.MouseLeave:Connect(function() TweenService:Create(minBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(30,30,30) }):Play() end)

        -- Divider
        local divider = Instance.new("Frame", frame)
        divider.Name = "Divider"
        divider.Size = UDim2.new(1, -24, 0, 1)
        divider.Position = UDim2.new(0, 12, 0, 28)
        divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        divider.BackgroundTransparency = 0.85
        divider.BorderSizePixel = 0

        -- Body
        local body = Instance.new("Frame", frame)
        body.Name = "Body"
        body.Size = UDim2.new(1, -24, 0, 0)
        body.Position = UDim2.new(0, 12, 0, 34)
        body.AutomaticSize = Enum.AutomaticSize.Y
        body.BackgroundTransparency = 1
        body.ClipsDescendants = true
        
        local layout = Instance.new("UIListLayout", body)
        layout.FillDirection = Enum.FillDirection.Vertical
        layout.SortOrder = Enum.SortOrder.LayoutOrder
        layout.Padding = UDim.new(0, 4)

        local function setMinimized(state)
            PerkDisplayState.Minimized = state
            if state then
                TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 210, 0, 30) }):Play()
                divider.Visible = false; body.Visible = false; minBtn.Text = "+"
            else
                TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 210, 0, 30 + body.AbsoluteSize.Y + 10) }):Play()
                divider.Visible = true; body.Visible = true; minBtn.Text = "−"
            end
        end
        
        minBtn.MouseButton1Click:Connect(function() setMinimized(not PerkDisplayState.Minimized) end)

        -- Drag Logic
        local dragging, dragStart, startPos = false, nil, nil
        header.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true; dragStart = input.Position; startPos = frame.Position
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if not dragging then return end
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                local d = input.Position - dragStart
                frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)

        -- Set default state (expanded)
        setMinimized(false)
        PerkDisplayState.Gui = gui
    end

    local function UpdateDisplay()
    local gui = PerkDisplayState.Gui; if not gui then return end
    local frame = gui:FindFirstChild("MainFrame"); if not frame then return end
    local header = frame:FindFirstChild("Header")
    local body = frame:FindFirstChild("Body")
    if not header or not body then return end
    
    local killer = GetKillerPlayer()
    local killerName = killer and (killer.DisplayName or killer.Name) or "???"
    local hName = header:FindFirstChild("KillerName")
    if hName then hName.Text = killerName end
    
    -- ===== FIX BUG: Hapus semua GUI lama (Frame & TextLabel) =====
    for _, child in ipairs(body:GetChildren()) do
        if child:IsA("Frame") or child:IsA("TextLabel") then
            child:Destroy()
        end
    end
    
    local perks = {}
    if killer and killer.Character then perks = ReadPerksFromChar(killer.Character) end
    local count = math.min(#perks, 6)
    
    if count == 0 then
        local emptyLbl = Instance.new("TextLabel")
        emptyLbl.Size = UDim2.new(1, 0, 0, 20)
        emptyLbl.BackgroundTransparency = 1
        emptyLbl.Font = Enum.Font.GothamMedium
        emptyLbl.Text = "No perks detected..."
        emptyLbl.TextColor3 = Color3.fromRGB(150, 150, 150)
        emptyLbl.TextSize = 10
        emptyLbl.TextXAlignment = Enum.TextXAlignment.Center
        emptyLbl.Parent = body
    else
        for i = 1, count do
            local p = perks[i]
            local pFrame = Instance.new("Frame")
            pFrame.Size = UDim2.new(1, 0, 0, 22)
            pFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            pFrame.BackgroundTransparency = 0.5
            pFrame.BorderSizePixel = 0
            pFrame.Parent = body
            Instance.new("UICorner", pFrame).CornerRadius = UDim.new(0, 6)
            
            local dot = Instance.new("Frame", pFrame)
            dot.Size = UDim2.new(0, 4, 0, 4)
            dot.Position = UDim2.new(0, 8, 0.5, -2)
            dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            dot.BorderSizePixel = 0
            Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)
            
            local lbl = Instance.new("TextLabel", pFrame)
            lbl.Size = UDim2.new(1, -20, 1, 0)
            lbl.Position = UDim2.new(0, 18, 0, 0)
            lbl.BackgroundTransparency = 1
            lbl.Font = Enum.Font.GothamMedium
            local lvlText = p.Level and (" (Lv " .. tostring(p.Level) .. ")") or ""
            lbl.Text = p.Name .. lvlText
            lbl.TextColor3 = Color3.fromRGB(240, 240, 240)
            lbl.TextSize = 10
            lbl.TextXAlignment = Enum.TextXAlignment.Left
            lbl.TextTruncate = Enum.TextTruncate.AtEnd
        end
    end
    
    -- Auto Resize Height
    if not PerkDisplayState.Minimized then
        TweenService:Create(frame, TweenInfo.new(0.2), { Size = UDim2.new(0, 210, 0, 30 + body.AbsoluteSize.Y + 10) }):Play()
    end
end

    local function Stop()
        PerkDisplayState.Enabled = false
        if PerkDisplayState.Thread then pcall(function() task.cancel(PerkDisplayState.Thread) end); PerkDisplayState.Thread = nil end
        if PerkDisplayState.Gui then pcall(function() PerkDisplayState.Gui:Destroy() end); PerkDisplayState.Gui = nil end
    end
    
    local function Start()
        if PerkDisplayState.Enabled then return end
        PerkDisplayState.Enabled = true
        BuildGui()
        task.spawn(function() task.wait(0.05); UpdateDisplay() end)
        PerkDisplayState.Thread = task.spawn(function()
            while PerkDisplayState.Enabled do pcall(UpdateDisplay); task.wait(1) end
        end)
    end
    
    W.KillerPerksDisplay_Start = Start
    W.KillerPerksDisplay_Stop = Stop
    W.KillerPerksDisplay_SetEnabled = function(v)
        VD.KillerPerksDisplay = v and true or false
        if VD.KillerPerksDisplay then Start() else Stop() end
    end
end

    do
        local SpeedBoostConnection = nil
        local function ShouldDisableSpeedBoost()
            local char = LocalPlayer.Character; if not char then return true end
            local hum = char:FindFirstChildOfClass("Humanoid")
            if hum then
                local animator = hum:FindFirstChildOfClass("Animator")
                if animator then
                    for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
                        local anim = track.Animation
                        if anim and anim.AnimationId then
                            if anim.AnimationId == "rbxassetid://127096285501517" then return true end
                            if anim.AnimationId == "rbxassetid://112166042383605" then return true end
                            if anim.AnimationId == "http://www.roblox.com/asset/?id=126965695851149" then return true end
                            if anim.AnimationId == "http://www.roblox.com/asset/?id=135084204086504" then return true end
                            if anim.AnimationId == "rbxassetid://123047897844134" then return true end
                            local id = anim.AnimationId:match("%d+")
                            if id and KillerAttackAnims["rbxassetid://" .. id] then return true end
                        end
                    end
                end
                if hum.Health <= 0 or hum.Health < 2
                    or char:GetAttribute("Downed") == true or char:GetAttribute("IsDown") == true
                    or char:GetAttribute("Knocked") == true then
                    return true
                end
            end
            return false
        end
        function W.SpeedBoost_SetEnabled(v)
            VD.SpeedBoostEnabled = v and true or false
            if SpeedBoostConnection then SpeedBoostConnection:Disconnect(); SpeedBoostConnection = nil end
            if not VD.SpeedBoostEnabled then
                local char = LocalPlayer.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if hum then pcall(function() hum.WalkSpeed = 16 end) end
                return
            end
            SpeedBoostConnection = RunService.Heartbeat:Connect(function()
                if not VD.SpeedBoostEnabled then return end
                if ShouldDisableSpeedBoost() then return end
                local char = LocalPlayer.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if hum and hum.WalkSpeed ~= VD.SpeedBoostValue then
                    pcall(function() hum.WalkSpeed = VD.SpeedBoostValue end)
                end
            end)
        end
        W.SpeedBoost_SetValue = function(v) VD.SpeedBoostValue = tonumber(v) or 30 end
        LocalPlayer.CharacterAdded:Connect(function()
            task.wait(0.8)
            if VD.SpeedBoostEnabled then W.SpeedBoost_SetEnabled(true) end
        end)
    end

    do
        local CursorThread = nil
        local savedOriginal = { MouseIconEnabled = nil, MouseBehavior = nil, AutoRotate = nil }
        function W.Cursor_SetEnabled(v)
            VD.CursorEnabled = v and true or false
            if v then
                savedOriginal.MouseIconEnabled = UserInputService.MouseIconEnabled
                savedOriginal.MouseBehavior = UserInputService.MouseBehavior
                local char = LocalPlayer.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                savedOriginal.AutoRotate = hum and hum.AutoRotate or true
                pcall(function()
                    UserInputService.MouseIconEnabled = true
                    UserInputService.MouseBehavior = Enum.MouseBehavior.Default
                end)
                if hum then pcall(function() hum.AutoRotate = false end) end
                if CursorThread then pcall(function() task.cancel(CursorThread) end) end
                CursorThread = task.spawn(function()
                    while VD.CursorEnabled do
                        pcall(function()
                            UserInputService.MouseIconEnabled = true
                            UserInputService.MouseBehavior = Enum.MouseBehavior.Default
                        end)
                        local c = LocalPlayer.Character
                        local h = c and c:FindFirstChildOfClass("Humanoid")
                        if h and h.AutoRotate then h.AutoRotate = false end
                        task.wait(0.1)
                    end
                end)
            else
                VD.CursorEnabled = false
                if CursorThread then pcall(function() task.cancel(CursorThread) end); CursorThread = nil end
                pcall(function()
                    UserInputService.MouseIconEnabled = savedOriginal.MouseIconEnabled or false
                    UserInputService.MouseBehavior = savedOriginal.MouseBehavior or Enum.MouseBehavior.LockCenter
                end)
                local c = LocalPlayer.Character
                local h = c and c:FindFirstChildOfClass("Humanoid")
                if h then pcall(function() h.AutoRotate = savedOriginal.AutoRotate or true end) end
            end
        end
        UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if input.KeyCode == Enum.KeyCode.LeftAlt or input.KeyCode == Enum.KeyCode.RightAlt then
                W.Cursor_SetEnabled(not VD.CursorEnabled)
            end
        end)
        LocalPlayer.CharacterAdded:Connect(function()
            task.wait(1)
            if VD.CursorEnabled then W.Cursor_SetEnabled(true) end
        end)
    end

    do
        VD.FLASK_SilentAim    = VD.FLASK_SilentAim    or false
        VD.FLASK_ShowBeam     = VD.FLASK_ShowBeam     ~= false
        VD.FLASK_ShowLanding  = VD.FLASK_ShowLanding  ~= false
        VD.FLASK_Predict      = VD.FLASK_Predict      ~= false
        VD.FLASK_Speed        = VD.FLASK_Speed        or 90
        VD.FLASK_Gravity      = VD.FLASK_Gravity      or 196
        VD.FLASK_LeadMult     = VD.FLASK_LeadMult     or 1.0
        VD.FLASK_Range        = VD.FLASK_Range        or 200
        VD.FLASK_BeamColor    = VD.FLASK_BeamColor    or _G.GLUTO_THEME
        VD.FLASK_AccentColor  = VD.FLASK_AccentColor  or Color3.fromRGB(60, 60, 60)
        local FlaskState = { Target = nil, PredictedPos = nil, BeamPart = nil, AccentPart = nil, LandingRing = nil }
        local function Flask_GetTarget()
            local myChar = LocalPlayer.Character
            local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if not myRoot then return nil end
            local maxR = tonumber(VD.FLASK_Range) or 200
            local best, bd = nil, math.huge
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and TeamIs(p, "Survivor") and p.Character then
                    local hum = p.Character:FindFirstChildOfClass("Humanoid")
                    local root = p.Character:FindFirstChild("HumanoidRootPart")
                    if hum and hum.Health > 0 and root then
                        local d = (root.Position - myRoot.Position).Magnitude
                        if d <= maxR and d < bd then bd = d; best = { Player = p, Root = root, Char = p.Character } end
                    end
                end
            end
            return best
        end
        local function Flask_GetHandOrigin()
            local c = LocalPlayer.Character; if not c then return nil end
            return c:FindFirstChild("LeftHand") or c:FindFirstChild("Left Arm")
                or c:FindFirstChild("RightHand") or c:FindFirstChild("Right Arm")
                or c:FindFirstChild("HumanoidRootPart")
        end
        local function Flask_PredictLanding(origin, targetRoot)
            local targetPos = targetRoot.Position
            local speed   = tonumber(VD.FLASK_Speed)   or 90
            local gravity = tonumber(VD.FLASK_Gravity) or 196
            local lead    = tonumber(VD.FLASK_LeadMult) or 1.0
            if not VD.FLASK_Predict then return targetPos end
            local tv = targetRoot.AssemblyLinearVelocity or Vector3.zero
            local horizVel = Vector3.new(tv.X, 0, tv.Z)
            local dist = (targetPos - origin).Magnitude
            local time = dist / speed
            local predicted = targetPos
            for _ = 1, 3 do
                predicted = targetPos + horizVel * time * lead
                local nd = (predicted - origin).Magnitude
                time = nd / speed
            end
            local drop = 0.5 * gravity * (time * time)
            return predicted + Vector3.new(0, drop, 0)
        end
        local function Flask_ClearVisuals()
            if FlaskState.BeamPart then pcall(function() FlaskState.BeamPart:Destroy() end); FlaskState.BeamPart = nil end
            if FlaskState.AccentPart then pcall(function() FlaskState.AccentPart:Destroy() end); FlaskState.AccentPart = nil end
            if FlaskState.LandingRing then pcall(function() FlaskState.LandingRing:Destroy() end); FlaskState.LandingRing = nil end
        end
        local function Flask_HideVisuals()
            if FlaskState.BeamPart then FlaskState.BeamPart.Transparency = 1 end
            if FlaskState.AccentPart then FlaskState.AccentPart.Transparency = 1 end
            if FlaskState.LandingRing then FlaskState.LandingRing.Transparency = 1 end
        end
        local function Flask_EnsureBeamParts()
            if not FlaskState.BeamPart or not FlaskState.BeamPart.Parent then
                local beam = Instance.new("Part")
                beam.Name = "GlutoFlaskBeam"; beam.Anchored = true
                beam.CanCollide = false; beam.CanTouch = false; beam.CanQuery = false; beam.CastShadow = false
                beam.Material = Enum.Material.Neon
                beam.Color = VD.FLASK_BeamColor or _G.GLUTO_THEME
                beam.Transparency = 0.2; beam.Parent = Workspace
                FlaskState.BeamPart = beam
            end
            if not FlaskState.AccentPart or not FlaskState.AccentPart.Parent then
                local accent = Instance.new("Part")
                accent.Name = "GlutoFlaskBeamAccent"; accent.Anchored = true
                accent.CanCollide = false; accent.CanTouch = false; accent.CanQuery = false; accent.CastShadow = false
                accent.Material = Enum.Material.SmoothPlastic
                accent.Color = VD.FLASK_AccentColor or Color3.fromRGB(60, 60, 60)
                accent.Transparency = 0.35; accent.Parent = Workspace
                FlaskState.AccentPart = accent
            end
            if FlaskState.BeamPart then FlaskState.BeamPart.Color = VD.FLASK_BeamColor or _G.GLUTO_THEME end
            if FlaskState.AccentPart then FlaskState.AccentPart.Color = VD.FLASK_AccentColor or Color3.fromRGB(60, 60, 60) end
        end
        local function Flask_UpdateBeam(origin, landing)
            Flask_EnsureBeamParts()
            local dir = landing - origin; local dist = dir.Magnitude
            if dist < 0.1 then return end
            local mid = (origin + landing) / 2
            local cf = CFrame.lookAt(mid, landing)
            FlaskState.BeamPart.Size = Vector3.new(0.12, 0.12, dist)
            FlaskState.BeamPart.CFrame = cf; FlaskState.BeamPart.Transparency = 0.2
            FlaskState.AccentPart.Size = Vector3.new(0.22, 0.22, dist)
            FlaskState.AccentPart.CFrame = cf; FlaskState.AccentPart.Transparency = 0.35
        end
        local function Flask_UpdateLanding(pos)
            if not VD.FLASK_ShowLanding then
                if FlaskState.LandingRing then FlaskState.LandingRing.Transparency = 1 end
                return
            end
            if not FlaskState.LandingRing or not FlaskState.LandingRing.Parent then
                local ring = Instance.new("Part")
                ring.Name = "GlutoFlaskLanding"; ring.Shape = Enum.PartType.Cylinder
                ring.Anchored = true; ring.CanCollide = false; ring.CanTouch = false
                ring.CanQuery = false; ring.CastShadow = false
                ring.Material = Enum.Material.Neon
                ring.Color = VD.FLASK_BeamColor or _G.GLUTO_THEME
                ring.Size = Vector3.new(0.2, 5, 5); ring.Parent = Workspace
                FlaskState.LandingRing = ring
            end
            FlaskState.LandingRing.Color = VD.FLASK_BeamColor or _G.GLUTO_THEME
            FlaskState.LandingRing.CFrame = CFrame.new(pos) * CFrame.Angles(0, 0, math.rad(90))
            FlaskState.LandingRing.Transparency = 0.35
        end
        RunService.RenderStepped:Connect(function()
            if not VD.FLASK_SilentAim then
                Flask_HideVisuals(); FlaskState.Target = nil; FlaskState.PredictedPos = nil; return
            end
            if GetRole() ~= "Killer" then Flask_HideVisuals(); return end
            local target = Flask_GetTarget()
            if not target or not target.Root then
                Flask_HideVisuals(); FlaskState.Target = nil; FlaskState.PredictedPos = nil; return
            end
            local hand = Flask_GetHandOrigin(); if not hand then return end
            local landing = Flask_PredictLanding(hand.Position, target.Root)
            FlaskState.Target = target; FlaskState.PredictedPos = landing
            if VD.FLASK_ShowBeam then pcall(Flask_UpdateBeam, hand.Position, landing)
            else
                if FlaskState.BeamPart then FlaskState.BeamPart.Transparency = 1 end
                if FlaskState.AccentPart then FlaskState.AccentPart.Transparency = 1 end
            end
            pcall(Flask_UpdateLanding, landing)
        end)
        task.spawn(function()
            pcall(function()
                local oldNC
                oldNC = hookmetamethod(game, "__namecall", function(self, ...)
                    if getnamecallmethod() == "FireServer" and self.Name == "ThrowFlask"
                       and VD.FLASK_SilentAim and GetRole() == "Killer" and FlaskState.PredictedPos then
                        local args = {...}
                        if typeof(args[2]) == "Vector3" then
                            local origin = args[2]
                            local aimDir = (FlaskState.PredictedPos - origin)
                            if aimDir.Magnitude > 0.1 then
                                args[1] = aimDir.Unit
                                return oldNC(self, unpack(args))
                            end
                        elseif typeof(args[1]) == "Vector3" then
                            local hand = Flask_GetHandOrigin()
                            if hand then
                                local aimDir = (FlaskState.PredictedPos - hand.Position)
                                if aimDir.Magnitude > 0.1 then
                                    args[1] = aimDir.Unit
                                    return oldNC(self, unpack(args))
                                end
                            end
                        end
                    end
                    return oldNC(self, ...)
                end)
            end)
        end)
        W.Flask_SetEnabled = function(v) VD.FLASK_SilentAim = v and true or false; if not v then Flask_ClearVisuals() end end
        W.Flask_SetBeamColor   = function(c) VD.FLASK_BeamColor = c end
        W.Flask_SetAccentColor = function(c) VD.FLASK_AccentColor = c end
        W.Flask_SetSpeed       = function(v) VD.FLASK_Speed = tonumber(v) or 90 end
        W.Flask_SetGravity     = function(v) VD.FLASK_Gravity = tonumber(v) or 196 end
        W.Flask_SetLead        = function(v) VD.FLASK_LeadMult = tonumber(v) or 1.0 end
        W.Flask_SetRange       = function(v) VD.FLASK_Range = tonumber(v) or 200 end
    end

    do
        VD.SPEAR_Aimbot = VD.SPEAR_Aimbot or false
        VD.SPEAR_Gravity = VD.SPEAR_Gravity or 50
        VD.SPEAR_Speed = VD.SPEAR_Speed or 100
        local SpearBtnData = {
            UI = nil, Button = nil, Active = true, DragLocked = false,
            Dragging = false, DragStart = nil, DragStartPos = nil,
            ManualTarget = nil, TargetIndex = 0,
            TargetLabel = nil, LeftArrow = nil, RightArrow = nil,
        }
        local function SpearAimbotCalc(targetPos)
            if not VD.SPEAR_Aimbot or GetRole() ~= "Killer" then return nil end
            local char = LocalPlayer.Character; if not char then return nil end
            local root = char:FindFirstChild("HumanoidRootPart"); if not root then return nil end
            local startPos = root.Position + Vector3.new(0, 2, 0)
            local distance = (targetPos - startPos).Magnitude
            local gravity  = VD.SPEAR_Gravity or 50
            local speed    = VD.SPEAR_Speed or 100
            local time     = distance / speed
            local drop     = 0.5 * gravity * time * time
            return targetPos + Vector3.new(0, drop, 0)
        end
        local function Spear_GetTargetList()
            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            local list = {}
            if not root then return list end
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and TeamIs(player, "Survivor") and player.Character then
                    local tr = player.Character:FindFirstChild("HumanoidRootPart")
                    local th = player.Character:FindFirstChildOfClass("Humanoid")
                    if tr and th and th.MaxHealth > 0 and (th.Health / th.MaxHealth) > 0.25 then
                        local dist = (tr.Position - root.Position).Magnitude
                        table.insert(list, { Player = player, Dist = dist })
                    end
                end
            end
            table.sort(list, function(a, b) return a.Dist < b.Dist end)
            local players = {}
            for _, v in ipairs(list) do table.insert(players, v.Player) end
            return players
        end
        local function Spear_UpdateTargetLabel()
            if not (SpearBtnData and SpearBtnData.TargetLabel) then return end
            if SpearBtnData.ManualTarget and SpearBtnData.ManualTarget.Parent then
                SpearBtnData.TargetLabel.Text = SpearBtnData.ManualTarget.Name
            else
                SpearBtnData.TargetLabel.Text = "AUTO"
            end
            SpearBtnData.TargetLabel.Visible = true
        end
        local function Spear_CycleTarget(direction)
            local list = Spear_GetTargetList()
            if #list == 0 then
                SpearBtnData.ManualTarget = nil; SpearBtnData.TargetIndex = 0
                VD_Notify("Spear Aimbot", "Tidak ada target survivor.", 2)
                return
            end
            local curIdx = nil
            if SpearBtnData.ManualTarget then
                for i, p in ipairs(list) do
                    if p == SpearBtnData.ManualTarget then curIdx = i; break end
                end
            end
            local nextIdx
            if curIdx then
                nextIdx = curIdx + direction
                if nextIdx > #list then nextIdx = 1 end
                if nextIdx < 1 then nextIdx = #list end
            else nextIdx = 1 end
            SpearBtnData.TargetIndex  = nextIdx
            SpearBtnData.ManualTarget = list[nextIdx]
            VD_Notify("Spear Aimbot", "Target: " .. SpearBtnData.ManualTarget.Name, 2)
            Spear_UpdateTargetLabel()
        end
        local function Spear_UpdateAim()
            if not VD.SPEAR_Aimbot then return end
            if SpearBtnData and not SpearBtnData.Active then return end
            if GetRole() ~= "Killer" then return end
            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not root then return end
            local target = nil
            if SpearBtnData.ManualTarget then
                local p = SpearBtnData.ManualTarget
                local valid = p.Parent and TeamIs(p, "Survivor") and p.Character
                if valid then
                    local tr = p.Character:FindFirstChild("HumanoidRootPart")
                    local th = p.Character:FindFirstChildOfClass("Humanoid")
                    valid = tr and th and th.MaxHealth > 0 and (th.Health / th.MaxHealth) > 0.25
                end
                if valid then target = p
                else SpearBtnData.ManualTarget = nil; Spear_UpdateTargetLabel() end
            end
            if not target then
                local closest, closestDist = nil, math.huge
                for _, player in ipairs(Players:GetPlayers()) do
                    if player ~= LocalPlayer and TeamIs(player, "Survivor") and player.Character then
                        local tr = player.Character:FindFirstChild("HumanoidRootPart")
                        local th = player.Character:FindFirstChildOfClass("Humanoid")
                        if tr and th and th.MaxHealth > 0 and (th.Health / th.MaxHealth) > 0.25 then
                            local dist = (tr.Position - root.Position).Magnitude
                            if dist < closestDist then closestDist = dist; closest = player end
                        end
                    end
                end
                target = closest
            end
            if target and target.Character then
                local tr = target.Character:FindFirstChild("HumanoidRootPart")
                if tr then
                    local aimPos = SpearAimbotCalc(tr.Position)
                    if aimPos then
                        local cam = Workspace.CurrentCamera
                        if cam then cam.CFrame = CFrame.new(cam.CFrame.Position, aimPos) end
                    end
                end
            end
        end
        local function Spear_SetupButton()
            if SpearBtnData.UI then pcall(function() SpearBtnData.UI:Destroy() end) end
            local pg = SafeGuiParent(); if not pg then return end
            SpearBtnData.UI = Instance.new("ScreenGui")
            SpearBtnData.UI.Name = "GlutoSpearAimbotUI"
            SpearBtnData.UI.ResetOnSpawn = false; SpearBtnData.UI.IgnoreGuiInset = true
            SpearBtnData.UI.Parent = pg
            SpearBtnData.Button = Instance.new("TextButton")
            SpearBtnData.Button.Name = "SpearAimbotButton"
            SpearBtnData.Button.Size = UDim2.new(0, 65, 0, 65)
            SpearBtnData.Button.Position = UDim2.new(0.15, 0, 0.75, 0)
            SpearBtnData.Button.AnchorPoint = Vector2.new(0.5, 0.5)
            SpearBtnData.Button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            SpearBtnData.Button.BackgroundTransparency = 0.15
            SpearBtnData.Button.AutoButtonColor = true
            SpearBtnData.Button.Text = "SPEAR\nAIM"
            SpearBtnData.Button.TextColor3 = _G.GLUTO_THEME
            SpearBtnData.Button.TextSize = 11
            SpearBtnData.Button.Font = Enum.Font.GothamBold
            SpearBtnData.Button.Visible = false
            SpearBtnData.Button.ZIndex = 10
            SpearBtnData.Button.Parent = SpearBtnData.UI
            Instance.new("UICorner", SpearBtnData.Button).CornerRadius = UDim.new(1, 0)
            local spearStk = Instance.new("UIStroke", SpearBtnData.Button)
            spearStk.Color = _G.GLUTO_THEME; spearStk.Thickness = 2; spearStk.Transparency = 0.2
            local lockBtn = Instance.new("TextButton")
            lockBtn.Name = "LockDrag"; lockBtn.Size = UDim2.new(0, 22, 0, 22)
            lockBtn.Position = UDim2.new(1, -5, 0, -5); lockBtn.AnchorPoint = Vector2.new(1, 0)
            lockBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            lockBtn.BackgroundTransparency = 0.3; lockBtn.Text = "L"
            lockBtn.TextSize = 10; lockBtn.Font = Enum.Font.GothamBold
            lockBtn.TextColor3 = _G.GLUTO_THEME; lockBtn.ZIndex = 11
            lockBtn.Parent = SpearBtnData.Button
            Instance.new("UICorner", lockBtn).CornerRadius = UDim.new(1, 0)
            lockBtn.MouseButton1Click:Connect(function()
                SpearBtnData.DragLocked = not SpearBtnData.DragLocked
                lockBtn.Text = SpearBtnData.DragLocked and "X" or "L"
                lockBtn.BackgroundColor3 = SpearBtnData.DragLocked and Color3.fromRGB(230, 80, 100) or Color3.fromRGB(40, 40, 40)
            end)
            local targetLabel = Instance.new("TextLabel")
            targetLabel.Name = "SpearTargetLabel"; targetLabel.Size = UDim2.new(0, 90, 0, 18)
            targetLabel.Position = UDim2.new(0.5, 0, 0, -22); targetLabel.AnchorPoint = Vector2.new(0.5, 0)
            targetLabel.BackgroundTransparency = 1; targetLabel.Text = "AUTO"
            targetLabel.TextColor3 = _G.GLUTO_THEME; targetLabel.TextSize = 12
            targetLabel.Font = Enum.Font.GothamBold; targetLabel.TextTruncate = Enum.TextTruncate.AtEnd
            targetLabel.ZIndex = 11; targetLabel.Visible = false
            targetLabel.Parent = SpearBtnData.Button
            SpearBtnData.TargetLabel = targetLabel
            local leftArrow = Instance.new("TextButton")
            leftArrow.Name = "SpearTargetLeft"; leftArrow.Size = UDim2.new(0, 28, 0, 28)
            leftArrow.Position = UDim2.new(0, -34, 0.5, 0); leftArrow.AnchorPoint = Vector2.new(0.5, 0.5)
            leftArrow.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            leftArrow.BackgroundTransparency = 0.15; leftArrow.Text = "<"
            leftArrow.TextColor3 = _G.GLUTO_THEME_DIM; leftArrow.TextSize = 16
            leftArrow.Font = Enum.Font.GothamBold; leftArrow.ZIndex = 10
            leftArrow.Parent = SpearBtnData.Button
            Instance.new("UICorner", leftArrow).CornerRadius = UDim.new(1, 0)
            local leftStk = Instance.new("UIStroke", leftArrow)
            leftStk.Color = _G.GLUTO_THEME; leftStk.Thickness = 1.5; leftStk.Transparency = 0.3
            SpearBtnData.LeftArrow = leftArrow
            leftArrow.MouseButton1Click:Connect(function() Spear_CycleTarget(-1) end)
            local rightArrow = Instance.new("TextButton")
            rightArrow.Name = "SpearTargetRight"; rightArrow.Size = UDim2.new(0, 28, 0, 28)
            rightArrow.Position = UDim2.new(1, 34, 0.5, 0); rightArrow.AnchorPoint = Vector2.new(0.5, 0.5)
            rightArrow.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            rightArrow.BackgroundTransparency = 0.15; rightArrow.Text = ">"
            rightArrow.TextColor3 = _G.GLUTO_THEME; rightArrow.TextSize = 16
            rightArrow.Font = Enum.Font.GothamBold; rightArrow.ZIndex = 10
            rightArrow.Parent = SpearBtnData.Button
            Instance.new("UICorner", rightArrow).CornerRadius = UDim.new(1, 0)
            local rightStk = Instance.new("UIStroke", rightArrow)
            rightStk.Color = _G.GLUTO_THEME; rightStk.Thickness = 1.5; rightStk.Transparency = 0.3
            SpearBtnData.RightArrow = rightArrow
            rightArrow.MouseButton1Click:Connect(function() Spear_CycleTarget(1) end)
            SpearBtnData.Button.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    if SpearBtnData.DragLocked then return end
                    SpearBtnData.Dragging = true
                    SpearBtnData.DragStart = input.Position
                    SpearBtnData.DragStartPos = SpearBtnData.Button.Position
                end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if SpearBtnData.Dragging and not SpearBtnData.DragLocked and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                    local delta = input.Position - SpearBtnData.DragStart
                    SpearBtnData.Button.Position = UDim2.new(
                        SpearBtnData.DragStartPos.X.Scale, SpearBtnData.DragStartPos.X.Offset + delta.X,
                        SpearBtnData.DragStartPos.Y.Scale, SpearBtnData.DragStartPos.Y.Offset + delta.Y
                    )
                end
            end)
            SpearBtnData.Button.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    SpearBtnData.Dragging = false
                end
            end)
            SpearBtnData.Button.MouseButton1Click:Connect(function()
                SpearBtnData.Active = not SpearBtnData.Active
                if SpearBtnData.Active then
                    SpearBtnData.Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                    SpearBtnData.Button.TextColor3 = Color3.fromRGB(0, 0, 0)
                    spearStk.Color = Color3.fromRGB(255, 255, 255)
                    VD_Notify("Spear Aimbot", "Spear Aimbot AKTIF!", 3)
                else
                    SpearBtnData.Button.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
                    SpearBtnData.Button.TextColor3 = _G.GLUTO_THEME
                    spearStk.Color = _G.GLUTO_THEME
                    VD_Notify("Spear Aimbot", "Spear Aimbot NONAKTIF", 3)
                end
            end)
        end
        RunService.RenderStepped:Connect(function() pcall(Spear_UpdateAim) end)
        RunService.Heartbeat:Connect(function()
            if SpearBtnData and SpearBtnData.Button then
                local shouldShow = VD.SPEAR_Aimbot and GetRole() == "Killer"
                SpearBtnData.Button.Visible = shouldShow
                if shouldShow then pcall(Spear_UpdateTargetLabel) end
            end
        end)
        LocalPlayer.CharacterAdded:Connect(function()
            task.wait(0.5)
            if VD.SPEAR_Aimbot then pcall(Spear_SetupButton) end
        end)
        W.SpearAimbot_SetEnabled = function(v)
            VD.SPEAR_Aimbot = v and true or false
            if v then SpearBtnData.Active = true; Spear_SetupButton()
            else
                if SpearBtnData.UI then pcall(function() SpearBtnData.UI:Destroy() end); SpearBtnData.UI = nil end
                SpearBtnData.Button = nil
            end
        end
        W.SpearAimbot_SetGravity = function(v) VD.SPEAR_Gravity = tonumber(v) or 50 end
        W.SpearAimbot_SetSpeed   = function(v) VD.SPEAR_Speed   = tonumber(v) or 100 end
        W.SpearAimbot_CycleTarget = Spear_CycleTarget
    end

    do
        VD.DashLockEnabled = VD.DashLockEnabled or false
        VD.DashLockDuration = VD.DashLockDuration or 1.5
        VD.DashLockSmoothness = VD.DashLockSmoothness or 0.3
        VD.FreezeDuringDashLock = VD.FreezeDuringDashLock or false
        VD._DashLockActive = false; VD._DashLockTarget = nil; VD._DashLockConnection = nil
        local DashAnimationId = "rbxassetid://98163597193511"
        local function DashLock_Update()
            if not VD.DashLockEnabled or not VD._DashLockActive then return end
            local myChar = LocalPlayer.Character
            local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if not myRoot then VD._DashLockTarget = nil; return end
            local target, targetDist = nil, math.huge
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and TeamIs(player, "Survivor") then
                    local char = player.Character
                    if char then
                        local root = char:FindFirstChild("HumanoidRootPart")
                        local hum = char:FindFirstChildOfClass("Humanoid")
                        if root and hum and hum.Health > 0 then
                            local dist = (myRoot.Position - root.Position).Magnitude
                            if dist < targetDist then targetDist = dist; target = root end
                        end
                    end
                end
            end
            if not target then VD._DashLockTarget = nil; return end
            VD._DashLockTarget = target
            local cam = Workspace.CurrentCamera
            if cam then
                local smooth = VD.DashLockSmoothness or 0.3
                cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position, target.Position), smooth)
            end
            if VD.FreezeDuringDashLock then
                local hum = myChar:FindFirstChildOfClass("Humanoid")
                if hum and hum.WalkSpeed ~= 0 then hum.WalkSpeed = 0 end
            end
        end
        local function DashLock_SetActive(active)
            active = active and true or false
            if active == VD._DashLockActive then return end
            VD._DashLockActive = active
            if active then
                if not VD._DashLockConnection then
                    VD._DashLockConnection = RunService.RenderStepped:Connect(function() pcall(DashLock_Update) end)
                end
            else
                if VD._DashLockConnection then pcall(function() VD._DashLockConnection:Disconnect() end); VD._DashLockConnection = nil end
                VD._DashLockTarget = nil
                if VD.FreezeDuringDashLock then
                    local char = LocalPlayer.Character
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if hum and hum.WalkSpeed == 0 then hum.WalkSpeed = 16 end
                end
            end
        end
        local function DashLock_HookCharacter(char)
            if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid"); if not hum then return end
            local anim = hum:FindFirstChildOfClass("Animator") or hum:WaitForChild("Animator", 5)
            if not anim then return end
            anim.AnimationPlayed:Connect(function(track)
                if not VD.DashLockEnabled then return end
                local aid = track.Animation and track.Animation.AnimationId or ""
                if aid == DashAnimationId then
                    DashLock_SetActive(true)
                    task.delay(VD.DashLockDuration or 1.5, function() DashLock_SetActive(false) end)
                end
            end)
        end
        if LocalPlayer.Character then DashLock_HookCharacter(LocalPlayer.Character) end
        LocalPlayer.CharacterAdded:Connect(function(c) task.wait(0.5); DashLock_HookCharacter(c) end)
        W.DashLock_SetActive = DashLock_SetActive
        W.DashLock_SetEnabled = function(v)
            VD.DashLockEnabled = v and true or false
            if not v then DashLock_SetActive(false) end
        end
    end

    do
        VD.SURV_AutoVault  = VD.SURV_AutoVault  or false
        VD.SURV_FastVault  = VD.SURV_FastVault  or false
        VD.SURF_VaultSpeed = VD.SURF_VaultSpeed or 13
        local _vaultedWindows = {}
        local _lastVaultScan  = 0
        local function SwiftVault_BuildWindowGroups()
            local groups = {}
            local map = Workspace:FindFirstChild("Map"); if not map then return groups end
            local seen = {}
            local function addPart(part)
                if not part or seen[part] then return end
                seen[part] = true
                local rootWindow = part.Parent
                if part.Name == "VaultPoint" and part.Parent and part.Parent.Name == "VaultTrigger" then
                    rootWindow = part.Parent.Parent
                elseif part.Name == "VaultTrigger" then rootWindow = part.Parent end
                if rootWindow then
                    groups[rootWindow] = groups[rootWindow] or {}
                    local exists = false
                    for _, p in ipairs(groups[rootWindow]) do if p == part then exists = true; break end end
                    if not exists then table.insert(groups[rootWindow], part) end
                end
            end
            for _, obj in ipairs(map:GetDescendants()) do
                if obj:IsA("BasePart") and (obj.Name == "VaultTrigger" or obj.Name == "VaultPoint") then
                    addPart(obj)
                end
            end
            return groups
        end
        local function SwiftVault_GetVTPosition(vt)
            if not vt then return nil end
            if vt:IsA("BasePart") then return vt.Position end
            if vt:IsA("Model") then
                if vt.PrimaryPart then return vt.PrimaryPart.Position end
                local bp = vt:FindFirstChildWhichIsA("BasePart", true); if bp then return bp.Position end
            end
            return nil
        end
        RunService.Heartbeat:Connect(function()
            if VD.SURV_FastVault then
                pcall(function()
                    local char = LocalPlayer.Character
                    if char then char:SetAttribute("vaultspeed", (VD.SURF_VaultSpeed or 13) / 10) end
                end)
            end
        end)
        RunService.Heartbeat:Connect(function()
            if not VD.SURV_AutoVault then return end
            if GetRole() ~= "Survivor" then return end
            if tick() - _lastVaultScan < 0.15 then return end
            _lastVaultScan = tick()
            pcall(function()
                local char   = LocalPlayer.Character
                local myRoot = char and char:FindFirstChild("HumanoidRootPart")
                local hum    = char and char:FindFirstChildOfClass("Humanoid")
                if not myRoot or not hum or hum.Health <= 0 then return end
                local vel = myRoot.AssemblyLinearVelocity
                if vel.Magnitude < 1 then return end
                local remotes   = ReplicatedStorage:FindFirstChild("Remotes")
                local winFolder = remotes and remotes:FindFirstChild("Window")
                local vaultEv   = winFolder and winFolder:FindFirstChild("VaultCommit")
                if not vaultEv then return end
                local windowGroups = SwiftVault_BuildWindowGroups()
                for rootWindow, parts in pairs(windowGroups) do
                    local allVTs = {}
                    for _, child in ipairs(rootWindow:GetChildren()) do
                        if child.Name == "VaultTrigger" then table.insert(allVTs, child) end
                    end
                    if #allVTs == 0 then continue end
                    local nearestVT, nearestVTDist = nil, math.huge
                    for _, vt in ipairs(allVTs) do
                        local pos = SwiftVault_GetVTPosition(vt)
                        if pos then
                            local d = (myRoot.Position - pos).Magnitude
                            if d < nearestVTDist then nearestVTDist = d; nearestVT = vt end
                        end
                    end
                    if not nearestVT or nearestVTDist > 6.0 then continue end
                    local lastUsed = _vaultedWindows[rootWindow] or 0
                    if tick() - lastUsed < 3.0 then continue end
                    local finalTarget = nearestVT
                    local remotes2 = ReplicatedStorage:FindFirstChild("Remotes")
                    local winFold  = remotes2 and remotes2:FindFirstChild("Window")
                    if winFold and finalTarget then
                        local vaultEvent     = winFold:FindFirstChild("VaultEvent")
                        local vaultBindable  = winFold:FindFirstChild("Vaultbindable")
                        local fastvault      = winFold:FindFirstChild("fastvault")
                        local vaultComplete1 = winFold:FindFirstChild("VaultCompleteEventpart1")
                        local vaultComplete  = winFold:FindFirstChild("VaultCompleteEvent")
                        if vaultEvent    then pcall(function() vaultEvent:FireServer(finalTarget, true) end) end
                        if vaultBindable then pcall(function() vaultBindable:Fire(finalTarget, true) end) end
                        if fastvault     then pcall(function() fastvault:FireServer(LocalPlayer) end) end
                        if vaultComplete1 then pcall(function() vaultComplete1:FireServer() end) end
                        if vaultComplete  then pcall(function() vaultComplete:FireServer(finalTarget, false) end) end
                    end
                    _vaultedWindows[rootWindow] = tick()
                    break
                end
            end)
        end)
        LocalPlayer.CharacterAdded:Connect(function() task.wait(0.5); _vaultedWindows = {} end)
        W.SwiftVault_SetEnabled = function(v) VD.SURV_AutoVault = v and true or false; _vaultedWindows = {} end
        W.SwiftVaultV2_SetEnabled = function(v)
            VD.SURV_FastVault = v and true or false
            if not v then
                local char = LocalPlayer.Character
                if char then pcall(function() char:SetAttribute("vaultspeed", 1) end) end
            end
        end
        W.SwiftVault_SetSpeed = function(v) VD.SURF_VaultSpeed = tonumber(v) or 13 end
    end

    do
        local WorkspaceSvc = Workspace
        W.Graphics = W.Graphics or {
            Fullbright = false, NoShadow = false, LowGraphics = false,
            NoScreenEffects = false, CleanSky = false,
            ClockTimeEnabled = false, ClockTime = 14, Brightness = 2,
            UnlimitedZoom = false, MaxZoomDistance = 1000,
            FOVEnabled = false, FOV = 70, PotatoEnabled = false,
        }
        local G = W.Graphics
        local original = {
            Brightness = Lighting.Brightness, ClockTime = Lighting.ClockTime,
            Ambient = Lighting.Ambient, OutdoorAmbient = Lighting.OutdoorAmbient,
            GlobalShadows = Lighting.GlobalShadows,
            FOV = WorkspaceSvc.CurrentCamera and WorkspaceSvc.CurrentCamera.FieldOfView or 70,
        }
        local LastState = { Fullbright = nil, NoShadow = nil, Ambient = nil, Brightness = nil, ClockTime = nil }
        local LastOptimize = { LowGraphics = nil, CleanSky = nil }
        local DisabledEffects = {}
        local ScreenEffectTypes = { "ColorCorrectionEffect", "DepthOfFieldEffect", "BlurEffect", "SunRaysEffect", "BloomEffect" }
        local function Graphics_Apply(force)
            if force or LastState.Fullbright ~= G.Fullbright then
                LastState.Fullbright = G.Fullbright
                if G.Fullbright then
                    Lighting.Brightness = 2; Lighting.ClockTime = 14
                    Lighting.Ambient = Color3.fromRGB(255, 255, 255)
                    Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
                else
                    Lighting.Brightness = original.Brightness
                    Lighting.ClockTime = original.ClockTime
                    Lighting.Ambient = original.Ambient
                    Lighting.OutdoorAmbient = original.OutdoorAmbient
                end
            end
            if force or LastState.NoShadow ~= G.NoShadow then
                LastState.NoShadow = G.NoShadow
                Lighting.GlobalShadows = not G.NoShadow
            end
            local ambientChanged = LastState.Ambient ~= G.ClockTimeEnabled or LastState.Brightness ~= G.Brightness or LastState.ClockTime ~= G.ClockTime
            if force or ambientChanged then
                LastState.Ambient = G.ClockTimeEnabled
                LastState.Brightness = G.Brightness
                LastState.ClockTime = G.ClockTime
                if G.ClockTimeEnabled then
                    Lighting.ClockTime = G.ClockTime; Lighting.Brightness = G.Brightness
                elseif not G.Fullbright then
                    Lighting.Brightness = original.Brightness
                    Lighting.ClockTime = original.ClockTime
                end
            end
        end
        local function Graphics_ApplyOptimization(force)
            if force or LastOptimize.LowGraphics ~= G.LowGraphics then
                LastOptimize.LowGraphics = G.LowGraphics
                pcall(function()
                    if G.LowGraphics then settings().Rendering.QualityLevel = Enum.QualityLevel.Level01
                    else settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic end
                end)
            end
            if force or LastOptimize.CleanSky ~= G.CleanSky then
                LastOptimize.CleanSky = G.CleanSky
                if G.CleanSky then
                    for _, v in ipairs(Lighting:GetChildren()) do
                        if v:IsA("Sky") then v:Destroy() end
                    end
                end
            end
        end
        local function Graphics_ApplyNoScreenEffects()
            if G.NoScreenEffects then
                for _, v in pairs(Lighting:GetChildren()) do
                    for _, t in ipairs(ScreenEffectTypes) do
                        if v:IsA(t) then
                            if DisabledEffects[v] == nil then DisabledEffects[v] = v.Enabled end
                            v.Enabled = false
                        end
                    end
                end
            else
                for obj, state in pairs(DisabledEffects) do
                    if obj and obj.Parent then obj.Enabled = state end
                end
                DisabledEffects = {}
            end
        end
        Lighting.ChildAdded:Connect(function(v)
            if not G.NoScreenEffects then return end
            task.wait()
            for _, t in ipairs(ScreenEffectTypes) do
                if v:IsA(t) then
                    if DisabledEffects[v] == nil then DisabledEffects[v] = v.Enabled end
                    v.Enabled = false
                end
            end
        end)
        local function Graphics_ApplyZoom()
            if G.UnlimitedZoom then
                LocalPlayer.CameraMaxZoomDistance = G.MaxZoomDistance
                LocalPlayer.CameraMinZoomDistance = 0
            else
                LocalPlayer.CameraMaxZoomDistance = 128
                LocalPlayer.CameraMinZoomDistance = 0.5
            end
        end
        local function Graphics_ApplyFOV()
            local cam = WorkspaceSvc.CurrentCamera; if not cam then return end
            if G.FOVEnabled then cam.FieldOfView = G.FOV
            else cam.FieldOfView = original.FOV end
        end
        local Potato_Enabled = false
        local Potato_Busy = false
        local Potato_Changed = {}
        local Potato_Connections = {}
        local POTATO_BATCH_SIZE = 40
        local POTATO_BATCH_DELAY = 1
        local function Potato_Save(obj, prop)
            if not Potato_Changed[obj] then Potato_Changed[obj] = {} end
            if Potato_Changed[obj][prop] == nil then
                local ok, val = pcall(function() return obj[prop] end)
                if ok then Potato_Changed[obj][prop] = val end
            end
        end
        local function Potato_Set(obj, prop, value)
            if not obj or not obj.Parent then return end
            Potato_Save(obj, prop)
            pcall(function() obj[prop] = value end)
        end
        local function Potato_Optimize(obj)
            if not Potato_Enabled or not obj then return end
            if obj:IsA("BasePart") then
                Potato_Set(obj, "CastShadow", false)
                Potato_Set(obj, "Reflectance", 0)
                pcall(function() Potato_Set(obj, "Material", Enum.Material.Plastic) end)
            end
            if obj:IsA("MeshPart") then
                pcall(function() Potato_Set(obj, "RenderFidelity", Enum.RenderFidelity.Performance) end)
            end
            if obj:IsA("Texture") or obj:IsA("Decal") then Potato_Set(obj, "Transparency", 1) end
            if obj:IsA("SurfaceAppearance") then
                pcall(function()
                    Potato_Set(obj, "ColorMap", ""); Potato_Set(obj, "MetalnessMap", "")
                    Potato_Set(obj, "NormalMap", ""); Potato_Set(obj, "RoughnessMap", "")
                end)
            end
            if obj:IsA("ParticleEmitter") then Potato_Set(obj, "Enabled", false) end
            if obj:IsA("Trail") then Potato_Set(obj, "Enabled", false) end
            if obj:IsA("Beam") then Potato_Set(obj, "Enabled", false) end
            if obj:IsA("Smoke") or obj:IsA("Fire") or obj:IsA("Sparkles") then Potato_Set(obj, "Enabled", false) end
            if obj:IsA("Clouds") then Potato_Set(obj, "Cover", 0); Potato_Set(obj, "Density", 0) end
        end
        local function Potato_LowLighting()
            Potato_Set(Lighting, "GlobalShadows", false)
            Potato_Set(Lighting, "Brightness", 1)
            pcall(function()
                Potato_Set(Lighting, "EnvironmentDiffuseScale", 0)
                Potato_Set(Lighting, "EnvironmentSpecularScale", 0)
            end)
        end
        local function Potato_LowTerrain()
            local Terrain = WorkspaceSvc:FindFirstChildOfClass("Terrain"); if not Terrain then return end
            Potato_Set(Terrain, "Decoration", false)
            Potato_Set(Terrain, "WaterWaveSize", 0)
            Potato_Set(Terrain, "WaterWaveSpeed", 0)
            Potato_Set(Terrain, "WaterReflectance", 0)
        end
        local function Potato_ProcessMap()
            if Potato_Busy then return end
            Potato_Busy = true
            local objects = WorkspaceSvc:GetDescendants()
            local total = #objects
            local index = 1
            while Potato_Enabled and index <= total do
                local finish = math.min(index + POTATO_BATCH_SIZE - 1, total)
                for i = index, finish do
                    if not Potato_Enabled then break end
                    Potato_Optimize(objects[i])
                end
                RunService.Heartbeat:Wait()
                if index % (POTATO_BATCH_SIZE * 5) == 1 then task.wait(POTATO_BATCH_DELAY / 10) end
                index = finish + 1
            end
            Potato_Busy = false
        end
        local function Potato_StartNewObjectHandler()
            if Potato_Connections.NewObject then return end
            Potato_Connections.NewObject = WorkspaceSvc.DescendantAdded:Connect(function(obj)
                if not Potato_Enabled then return end
                task.defer(function() if Potato_Enabled then Potato_Optimize(obj) end end)
            end)
        end
        local function Potato_Enable()
            if Potato_Enabled then return end
            Potato_Enabled = true
            pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Level01 end)
            Potato_LowLighting(); Potato_LowTerrain(); Potato_StartNewObjectHandler()
            task.spawn(Potato_ProcessMap)
        end
        local function Potato_Disable()
            if not Potato_Enabled then return end
            Potato_Enabled = false
            for name, conn in pairs(Potato_Connections) do
                pcall(function() conn:Disconnect() end); Potato_Connections[name] = nil
            end
            task.spawn(function()
                local count = 0
                for obj, properties in pairs(Potato_Changed) do
                    if obj and obj.Parent then
                        for prop, value in pairs(properties) do
                            pcall(function() obj[prop] = value end)
                            count = count + 1
                            if count >= POTATO_BATCH_SIZE then task.wait(); count = 0 end
                        end
                    end
                end
                Potato_Changed = {}
            end)
            pcall(function() settings().Rendering.QualityLevel = Enum.QualityLevel.Automatic end)
        end
        RunService.RenderStepped:Connect(function()
            if G.FOVEnabled then
                local cam = WorkspaceSvc.CurrentCamera
                if cam and cam.FieldOfView ~= G.FOV then cam.FieldOfView = G.FOV end
            end
        end)
        RunService.RenderStepped:Connect(function()
            if not G.UnlimitedZoom then return end
            if LocalPlayer.CameraMaxZoomDistance ~= G.MaxZoomDistance then
                LocalPlayer.CameraMaxZoomDistance = G.MaxZoomDistance
            end
            if LocalPlayer.CameraMinZoomDistance ~= 0 then LocalPlayer.CameraMinZoomDistance = 0 end
        end)
        W.Graphics_Apply = Graphics_Apply
        W.Graphics_ApplyOptimization = Graphics_ApplyOptimization
        W.Graphics_ApplyNoScreenFx = Graphics_ApplyNoScreenEffects
        W.Graphics_ApplyZoom = Graphics_ApplyZoom
        W.Graphics_ApplyFOV = Graphics_ApplyFOV
        W.Potato_SetEnabled = function(v)
            G.PotatoEnabled = v and true or false
            if G.PotatoEnabled then Potato_Enable() else Potato_Disable() end
        end
        W.Potato_IsEnabled = function() return Potato_Enabled end
        LocalPlayer.CharacterAdded:Connect(function()
            task.wait(1)
            Graphics_Apply(true); Graphics_ApplyOptimization(true)
            Graphics_ApplyNoScreenEffects(); Graphics_ApplyZoom(); Graphics_ApplyFOV()
        end)
    end

--====================================================--
-- 100% FULL VDT LOGIC (PISTOL SILENT AIM + MODERN UI)
--====================================================--
local VDT_Pistol = {}
do
    local tbl = {
        Players = Players,
        UserInputService = UserInputService,
        RunService = RunService,
        ReplicatedStorage = ReplicatedStorage,
        Camera = workspace.CurrentCamera,
        LocalPlayer = LocalPlayer,
        Workspace = workspace,
        TweenService = TweenService
    }
    
    -- SETTINGS TABLE (Bisa diubah dari UI)
    local tbl3 = {
        Pistol_CustomSound = false,
        Pistol_SelectedSound = "Sound 1",
        Aim_Silent = false,
        Pistol_Target = "KILLER",
        AIM_TargetPart = "Torso",
        Pistol_PredictLead = 3.5,
        Pistol_AimOffset = -1,
        Pistol_BlockKnocked = true,
        Pistol_FOVMode = false,
        Pistol_ShowFOV = false,
        Pistol_FOV = 150,
        Pistol_ShowLaser = true,
        Predict = false,
        Aim_Lock = false,
    }
    
    -- STATE TABLES
    local tbl6 = { isChargingPistol = false, currentTouchInput = nil, locked = nil, CurrentPing = 0 }
    local tbl8 = { isChargingPistol = false, currentTouchInput = nil }
    local tbl11 = {}
    
    local function update_tbl11()
        table.clear(tbl11)
        for _, player in ipairs(tbl.Players:GetPlayers()) do
            if player ~= tbl.LocalPlayer then table.insert(tbl11, player) end
        end
    end
    tbl.Players.PlayerAdded:Connect(update_tbl11)
    tbl.Players.PlayerRemoving:Connect(update_tbl11)
    update_tbl11()

    -- HELPER FUNCTIONS
    local function fn6(arg) return arg and arg.Team and arg.Team.Name == "Killer" end
    local function fn11(arg)
        if not arg then return false end
        return arg:GetAttribute("Knocked") == true or arg:GetAttribute("IsHooked") == true
    end
    local function fn12(arg)
        if not arg then return true end
        local playerFromCharacter = tbl.Players:GetPlayerFromCharacter(arg)
        if playerFromCharacter and playerFromCharacter:GetAttribute("IsDead") then return true end
        if arg:GetAttribute("IsCarried") or arg:GetAttribute("IsHooked") or arg:GetAttribute("Knocked") then return true end
        local check = arg:FindFirstChild("CheckInterractable")
        if check then
            for _, v3 in ipairs({"isVaulting", "isSliding", "isDroppingPallet", "isRepairing", "isHealing", "isUnhooking", "isExiting"}) do
                if check:GetAttribute(v3) == true then return true end
            end
        end
        return false
    end

    local function fn57(arg, arg2)
        if not arg then return end
        arg2 = arg2 or 0.2
        tbl.Camera.CFrame = tbl.Camera.CFrame:Lerp(CFrame.lookAt(tbl.Camera.CFrame.Position, arg.Position), arg2)
    end

    local function fn58(arg, arg2, arg3)
        local position3 = arg2.Position
        if not tbl3.Predict then return position3 end
        local parent = arg2.Parent
        parent = parent and parent:FindFirstChildOfClass("Humanoid")
        local n2, vector = 0, Vector3.zero
        if parent then vector = parent.MoveDirection * parent.WalkSpeed; n2 = vector.Magnitude end
        if n2 < 0.1 then return position3 end
        return position3 + vector * ((position3 - arg).Magnitude / arg3 * tbl3.Pistol_PredictLead + math.clamp(tbl6.CurrentPing, 0, 0.25))
    end

    -- TARGET SELECTION (fn51)
    local function fn51(arg)
        local vector2 = Vector2.new(tbl.Camera.ViewportSize.X / 2, tbl.Camera.ViewportSize.Y / 2)
        local character = tbl.LocalPlayer.Character
        local humanoidRootPart2 = character and character:FindFirstChild("HumanoidRootPart")
        if not humanoidRootPart2 then return nil end
        if arg == "Pistol" and tbl3.Pistol_BlockKnocked and fn11(character) then return nil end
        
        local huge, v3 = math.huge, nil
        for _, v4 in ipairs(tbl11) do
            if v4.Character then
                local v5 = fn6(v4)
                if arg == "Pistol" then
                    if (tbl3.Pistol_Target == "KILLER" and v5) or (tbl3.Pistol_Target == "SURVIVOR" and not v5) then
                        local character2 = v4.Character
                        local humanoid2 = character2:FindFirstChildOfClass("Humanoid")
                        if humanoid2 and humanoid2.Health > 0 and not fn11(character2) then
                            local str3 = "HumanoidRootPart"
                            if tbl3.AIM_TargetPart == "Head" then str3 = "Head"
                            elseif tbl3.AIM_TargetPart == "Torso" then str3 = "Torso" end
                            local torso = character2:FindFirstChild(str3) or character2:FindFirstChild("Torso") or character2:FindFirstChild("HumanoidRootPart")
                            if torso then
                                local magnitude = (torso.Position - humanoidRootPart2.Position).Magnitude
                                if tbl3.Pistol_FOVMode then
                                    local v7, v8 = tbl.Camera:WorldToViewportPoint(torso.Position)
                                    if v8 then
                                        local magnitude2 = (Vector2.new(v7.X, v7.Y) - vector2).Magnitude
                                        if magnitude2 < huge and magnitude2 <= tbl3.Pistol_FOV then huge = magnitude2; v3 = torso end
                                    end
                                elseif magnitude < huge then huge = magnitude; v3 = torso end
                            end
                        end
                    end
                end
            end
        end

        if arg == "Pistol" and tbl3.Pistol_Target == "SCP" then
            local map = workspace:FindFirstChild("Map")
            if map then
                for _, scp in ipairs(map:GetDescendants()) do
                    if scp:IsA("Model") and scp.Name:match("^SCP") then
                        local humanoid2 = scp:FindFirstChildOfClass("Humanoid")
                        local humanoidRootPart3 = scp:FindFirstChild("HumanoidRootPart") or scp.PrimaryPart
                        if humanoid2 and humanoidRootPart3 and math.floor(humanoid2.WalkSpeed) > 0 and math.floor(humanoid2.WalkSpeed) ~= 16 then
                            if tbl3.AIM_TargetPart == "Head" and scp:FindFirstChild("Head") then humanoidRootPart3 = scp.Head
                            elseif tbl3.AIM_TargetPart == "Torso" and scp:FindFirstChild("Torso") then humanoidRootPart3 = scp.Torso end
                            
                            local v4, v5 = tbl.Camera:WorldToViewportPoint(humanoidRootPart3.Position)
                            if tbl3.Pistol_FOVMode then
                                if v5 then
                                    local magnitude = (Vector2.new(v4.X, v4.Y) - vector2).Magnitude
                                    if magnitude < huge and magnitude <= tbl3.Pistol_FOV then huge = magnitude; v3 = humanoidRootPart3 end
                                end
                            else
                                local magnitude = (humanoidRootPart3.Position - humanoidRootPart2.Position).Magnitude
                                if magnitude < huge then huge = magnitude; v3 = humanoidRootPart3 end
                            end
                        end
                    end
                end
            end
        end
        return v3
    end

    -- SHOOT LOGIC (fn59)
    local part = Instance.new("Part")
    part.Name = "PLaser"
    part.Material = Enum.Material.Neon
    part.Color = Color3.fromRGB(170, 170, 170)
    part.CanCollide = false
    part.Anchored = true
    part.CastShadow = false
    part.Size = Vector3.new(0.05, 0.05, 1.5)

    local function fn59()
        local Pistol = fn51("Pistol")
        local character = tbl.LocalPlayer.Character
        if tbl3.Pistol_BlockKnocked and fn12(character) then return end
        if Pistol and character then
            local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")
            if humanoidRootPart2 then
                local twistOfFate = character:FindFirstChild("Twist of Fate")
                if twistOfFate then
                    local rightArm = twistOfFate:FindFirstChild("Right Arm")
                    if rightArm then
                        if rightArm:FindFirstChild("EmperorGun") then twistOfFate = rightArm:FindFirstChild("EmperorGun")
                        elseif rightArm:FindFirstChild("gun") then twistOfFate = rightArm:FindFirstChild("gun")
                        else twistOfFate = rightArm end
                    end
                    local position3 = humanoidRootPart2.Position
                    local v3 = fn58(position3, Pistol, 160)
                    if (v3 - position3).Magnitude < 4 then v3 -= Pistol.CFrame.RightVector * -2 end
                    local unit = (v3 + Vector3.new(0, tbl3.Pistol_AimOffset, 0) - position3).Unit
                    local remotes2 = tbl.ReplicatedStorage:FindFirstChild("Remotes")
                    if remotes2 and remotes2:FindFirstChild("Items") and remotes2.Items:FindFirstChild("Twist of Fate") and remotes2.Items["Twist of Fate"]:FindFirstChild("Fire") then
                        remotes2.Items["Twist of Fate"].Fire:FireServer(twistOfFate, unit)
                    end
                end
            end
        end
    end

    -- SOUND LOGIC
    local tbl12 = {
        ["Sound 1"] = "rbxassetid://125027580248269",
        ["Sound 2"] = "rbxassetid://79440711397443",
        ["Sound 3"] = "rbxassetid://102793319115878",
        ["Sound 4"] = "rbxassetid://134840941464861",
    }
    local tbl13 = {}
    local function fn44(arg)
        if not arg or not arg:IsA("Sound") then return end
        if not arg:GetAttribute("OriginalSoundId") then arg:SetAttribute("OriginalSoundId", arg.SoundId) end
        local function fn45()
            if tbl3.Pistol_CustomSound then
                local v3 = tbl12[tbl3.Pistol_SelectedSound]
                if v3 and arg.SoundId ~= v3 then arg.SoundId = v3 end
            else
                local attribute = arg:GetAttribute("OriginalSoundId")
                if attribute and arg.SoundId ~= attribute then arg.SoundId = attribute end
            end
        end
        fn45()
        if not tbl13[arg] then
            tbl13[arg] = arg:GetPropertyChangedSignal("SoundId"):Connect(fn45)
            arg.Played:Connect(function() task.delay(1, function() if arg and arg.IsPlaying then arg:Stop() end end) end)
        end
    end

    local function fn26(arg)
        if not arg then return end
        local function fn45()
            local twistOfFate = arg:FindFirstChild("Twist of Fate") or workspace:FindFirstChild("Twist of Fate", true)
            if twistOfFate then
                for _, descendant in ipairs(twistOfFate:GetDescendants()) do
                    if descendant:IsA("LocalScript") and descendant.Name:lower() == "gun" then
                        local disabled = fn11(arg)
                        disabled = not tbl3.Pistol_BlockKnocked and disabled
                        if descendant.Disabled ~= disabled then descendant.Disabled = disabled end
                    end
                    if descendant:IsA("Sound") and descendant.Name:lower() == "shoot" then fn44(descendant) end
                end
            end
        end
        task.spawn(function() if arg:WaitForChild("Twist of Fate", 5) then fn45() end end)
        fn45()
        for _, v3 in ipairs({"Knocked", "isKnocked", "IsHooked", "isHooked", "IsCarried", "isCarried"}) do
            arg:GetAttributeChangedSignal(v3):Connect(fn45)
        end
    end

    tbl.LocalPlayer.CharacterAdded:Connect(function(c) task.wait(1); fn26(c) end)
    if tbl.LocalPlayer.Character then fn26(tbl.LocalPlayer.Character) end

    -- ==========================================
    -- MOBILE TARGET UI (MODERN & ELEGANT)
    -- ==========================================
    local screenGui2 = Instance.new("ScreenGui")
    screenGui2.Name = "TargetUI"
    screenGui2.Parent = SafeGuiParent()
    screenGui2.IgnoreGuiInset = true
    screenGui2.Enabled = false

    local shadow = Instance.new("ImageLabel")
    shadow.Name = "Shadow"
    shadow.BackgroundTransparency = 1
    shadow.Image = "rbxassetid://6014261993"
    shadow.ImageColor3 = Color3.new(0,0,0)
    shadow.ImageTransparency = 0.5
    shadow.ScaleType = Enum.ScaleType.Slice
    shadow.SliceCenter = Rect.new(49, 49, 450, 450)
    shadow.Size = UDim2.fromOffset(160, 56)
    shadow.Position = UDim2.new(0.5, 0, 0.8, 0)
    shadow.AnchorPoint = Vector2.new(0.5, 0.5)
    shadow.Parent = screenGui2

    local frame4 = Instance.new("Frame")
    frame4.Name = "TargetMainBox"
    frame4.Size = UDim2.fromOffset(140, 36)
    frame4.Position = UDim2.new(0.5, 0, 0.8, 0)
    frame4.AnchorPoint = Vector2.new(0.5, 0.5)
    frame4.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame4.BorderSizePixel = 0
    frame4.ZIndex = 100
    frame4.Parent = screenGui2
    Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 12)

    local bgGrad = Instance.new("UIGradient", frame4)
    bgGrad.Color = ColorSequence.new(Color3.fromRGB(35, 35, 35), Color3.fromRGB(15, 15, 15))
    bgGrad.Rotation = 135

    local uiStroke2 = Instance.new("UIStroke", frame4)
    uiStroke2.Color = Color3.fromRGB(100, 100, 100)
    uiStroke2.Transparency = 0.3
    uiStroke2.Thickness = 1.2

    local targetIcon = Instance.new("ImageLabel", frame4)
    targetIcon.Size = UDim2.fromOffset(14, 14)
    targetIcon.Position = UDim2.new(0, 12, 0.5, -7)
    targetIcon.BackgroundTransparency = 1
    targetIcon.Image = "rbxassetid://6031091004"
    targetIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)

    local textLabel4 = Instance.new("TextLabel")
    textLabel4.Size = UDim2.new(1, -60, 1, 0)
    textLabel4.Position = UDim2.new(0, 32, 0, 0)
    textLabel4.BackgroundTransparency = 1
    textLabel4.Font = Enum.Font.GothamBold
    textLabel4.TextSize = 11
    textLabel4.TextColor3 = Color3.fromRGB(255, 255, 255)
    textLabel4.Text = "KILLER"
    textLabel4.TextXAlignment = Enum.TextXAlignment.Left
    textLabel4.ZIndex = 101
    textLabel4.Parent = frame4

    local textButton = Instance.new("TextButton")
    textButton.Size = UDim2.fromOffset(24, 24)
    textButton.AnchorPoint = Vector2.new(0.5, 0.5)
    textButton.Position = UDim2.new(1, -18, 0.5, 0)
    textButton.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    textButton.Text = ">"
    textButton.Font = Enum.Font.GothamBold
    textButton.TextSize = 16
    textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    textButton.ZIndex = 102
    textButton.AutoButtonColor = false
    textButton.Parent = frame4
    Instance.new("UICorner", textButton).CornerRadius = UDim.new(1, 0)

    local btnStroke = Instance.new("UIStroke", textButton)
    btnStroke.Color = Color3.fromRGB(100, 100, 100)
    btnStroke.Thickness = 1
    btnStroke.Transparency = 0.5

    textButton.MouseEnter:Connect(function()
        tbl.TweenService:Create(textButton, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }):Play()
        tbl.TweenService:Create(textButton, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(10, 10, 10) }):Play()
        tbl.TweenService:Create(btnStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(255, 255, 255) }):Play()
    end)
    textButton.MouseLeave:Connect(function()
        tbl.TweenService:Create(textButton, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(40, 40, 40) }):Play()
        tbl.TweenService:Create(textButton, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(255, 255, 255) }):Play()
        tbl.TweenService:Create(btnStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(100, 100, 100) }):Play()
    end)

    local tbl16 = { "KILLER", "SURVIVOR", "SCP" }
    local n2 = 1
    local function fn62()
        n2 += 1
        if n2 > #tbl16 then n2 = 1 end
        local target = tbl16[n2]
        tbl3.Pistol_Target = target
        
        textLabel4.Text = target
        tbl.TweenService:Create(textLabel4, TweenInfo.new(0.1), { TextTransparency = 0.5 }):Play()
        task.delay(0.1, function()
            tbl.TweenService:Create(textLabel4, TweenInfo.new(0.2), { TextTransparency = 0 }):Play()
        end)
        
        tbl.TweenService:Create(textButton, TweenInfo.new(0.2, Enum.EasingStyle.Back), { Rotation = 180 }):Play()
        task.delay(0.2, function()
            tbl.TweenService:Create(textButton, TweenInfo.new(0.1), { Rotation = 0 }):Play()
        end)

        if VD_Notify then VD_Notify("Pistol Target", target, 1) end
    end
    textButton.MouseButton1Click:Connect(fn62)

    tbl.UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == Enum.KeyCode.T then fn62() end
    end)

    local flag2, v2, position, position2 = false, nil, nil, nil
    frame4.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            flag2 = true; position = input.Position; position2 = frame4.Position
            input.Changed:Connect(function() if input.UserInputState == Enum.UserInputState.End then flag2 = false end end)
        end
    end)
    frame4.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then v2 = input end
    end)
    tbl.UserInputService.InputChanged:Connect(function(input)
        if flag2 and input == v2 then
            local n = input.Position - position
            local newPos = UDim2.new(position2.X.Scale, position2.X.Offset + n.X, position2.Y.Scale, position2.Y.Offset + n.Y)
            frame4.Position = newPos
            shadow.Position = newPos
        end
    end)

    -- ==========================================
    -- FOV GUI
    -- ==========================================
    local frame3 = Instance.new("Frame")
    frame3.BackgroundTransparency = 1
    frame3.AnchorPoint = Vector2.new(0.5, 0.5)
    frame3.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame3.Visible = false
    frame3.Parent = SafeGuiParent()
    Instance.new("UICorner", frame3).CornerRadius = UDim.new(1, 0)
    local uiStroke = Instance.new("UIStroke", frame3)
    uiStroke.Color = Color3.fromRGB(0, 255, 100)
    uiStroke.Thickness = 0.4

    -- ==========================================
    -- INPUTS (Shoot & Aim)
    -- ==========================================
    tbl.UserInputService.InputBegan:Connect(function(input, gameProcessed)
        local flag4 = input.UserInputType == Enum.UserInputType.Touch
        if gameProcessed and not flag4 then return end
        
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            if tbl3.Aim_Silent then tbl8.isChargingPistol = true; tbl6.locked = fn51("Pistol") end
        elseif flag4 then
            if tbl3.Aim_Silent then
                local playerGui = tbl.LocalPlayer:FindFirstChild("PlayerGui")
                local guiMob = playerGui and playerGui:FindFirstChild("Survivor-mob") and playerGui["Survivor-mob"]:FindFirstChild("Controls") and playerGui["Survivor-mob"].Controls:FindFirstChild("Gui-mob")
                if guiMob and guiMob.Visible then
                    local position3 = input.Position
                    local absolutePosition = guiMob.AbsolutePosition
                    local absoluteSize = guiMob.AbsoluteSize
                    if position3.X >= absolutePosition.X and position3.X <= absolutePosition.X + absoluteSize.X and position3.Y >= absolutePosition.Y and position3.Y <= absolutePosition.Y + absoluteSize.Y then
                        tbl8.isChargingPistol = true; tbl8.currentTouchInput = input; tbl6.locked = fn51("Pistol")
                    end
                end
            end
        end
    end)

    tbl.UserInputService.InputEnded:Connect(function(input)
        local flag4 = input.UserInputType == Enum.UserInputType.Touch
        if input.UserInputType == Enum.UserInputType.MouseButton2 then
            if tbl8.isChargingPistol then tbl8.isChargingPistol = false; tbl6.locked = nil; fn59() end
        end
        if flag4 and input == tbl8.currentTouchInput then
            if tbl8.isChargingPistol then
                tbl8.isChargingPistol = false; tbl8.currentTouchInput = nil
                local flag5 = false
                pcall(function()
                    local playerGui = tbl.LocalPlayer:FindFirstChild("PlayerGui")
                    local cancelaim = playerGui and playerGui:FindFirstChild("Survivor-mob") and playerGui["Survivor-mob"]:FindFirstChild("Controls") and playerGui["Survivor-mob"].Controls:FindFirstChild("Gui-mob") and playerGui["Survivor-mob"].Controls["Gui-mob"]:FindFirstChild("cancelaim")
                    if cancelaim and cancelaim.Visible then
                        local position3 = input.Position
                        local absolutePosition = cancelaim.AbsolutePosition
                        local absoluteSize = cancelaim.AbsoluteSize
                        if position3.X >= absolutePosition.X and position3.X <= absolutePosition.X + absoluteSize.X and position3.Y >= absolutePosition.Y and position3.Y <= absolutePosition.Y + absoluteSize.Y then flag5 = true end
                    end
                end)
                if not flag5 then fn59() end
                tbl6.locked = nil
            end
        end
    end)

    -- ==========================================
    -- RENDER LOOP (Laser, FOV, AimLock)
    -- ==========================================
    tbl.RunService.RenderStepped:Connect(function()
        if tbl8.isChargingPistol and tbl3.Aim_Lock then
            if tbl6.locked and tbl6.locked.Parent and tbl6.locked.Parent:FindFirstChild("Humanoid") and tbl6.locked.Parent.Humanoid.Health > 0 then fn57(tbl6.locked)
            else tbl6.locked = fn51("Pistol") end
        end

        local vector2 = Vector2.new(tbl.Camera.ViewportSize.X / 2, tbl.Camera.ViewportSize.Y / 2)
        local color = Color3.fromRGB(255, 255, 255)
        local visible = false
        local aimbotRadius = 0

        if tbl3.Aim_Silent and tbl3.Pistol_ShowFOV and tbl3.Pistol_FOVMode then
            aimbotRadius = tbl3.Pistol_FOV; visible = true
        end

        frame3.Visible = visible
        if visible then
            frame3.Size = UDim2.new(0, aimbotRadius * 2, 0, aimbotRadius * 2)
            frame3.Position = UDim2.new(0, vector2.X, 0, vector2.Y)
            uiStroke.Color = color
        end

        if tbl8.isChargingPistol and tbl3.Aim_Silent then
            local Pistol = fn51("Pistol")
            if Pistol then
                local character = tbl.LocalPlayer.Character
                local leftArm = character:FindFirstChild("Left Arm") or character:FindFirstChild("LeftHand")
                leftArm = leftArm and leftArm.Position or character:GetPivot().Position
                local position5 = Pistol.Position
                local assemblyLinearVelocity = Pistol.AssemblyLinearVelocity
                local n4 = position5 + Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z) * (position5 - leftArm).Magnitude / 400 + Vector3.new(0, tbl3.Pistol_AimOffset, 0)
                if tbl3.Pistol_ShowLaser then
                    part.Parent = workspace
                    local magnitude = (n4 - leftArm).Magnitude
                    part.Size = Vector3.new(0.05, 0.05, magnitude)
                    part.CFrame = CFrame.new(leftArm, n4) * CFrame.new(0, 0, -magnitude / 2)
                elseif part.Parent ~= nil then part.Parent = nil end
            elseif part.Parent ~= nil then part.Parent = nil end
        elseif part.Parent ~= nil then part.Parent = nil end
    end)

    VDT_Pistol = { tbl3 = tbl3, screenGui2 = screenGui2 }
end

    do
        VD.SURV_AutoPallet     = VD.SURV_AutoPallet     or false
        VD.SURV_AutoPalletDist = VD.SURV_AutoPalletDist or 20
        local _lastPalletDrop = 0
        local _usedPallets    = {}
        local function Pallet_GetKillerRoot()
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= LocalPlayer and TeamIs(plr, "Killer") and plr.Character then
                    local hrp = plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then return hrp end
                end
            end
            return nil
        end
        local function Pallet_GetAllPallets()
            local list = {}
            local map = Workspace:FindFirstChild("Map"); if not map then return list end
            for _, obj in ipairs(map:GetDescendants()) do
                if obj.Name == "Palletwrong" and (obj:IsA("Model") or obj:IsA("Folder")) then
                    table.insert(list, obj)
                end
            end
            return list
        end
        local function Pallet_IsDropped(palletModel)
            if not palletModel or not palletModel.Parent then return true end
            if _usedPallets[palletModel] then return true end
            local ok, destroyed = pcall(function() return palletModel:GetAttribute("Destroyed") end)
            if ok and destroyed == true then return true end
            local ok2, broken = pcall(function() return palletModel:GetAttribute("Broken") end)
            if ok2 and broken == true then return true end
            if not palletModel:FindFirstChildWhichIsA("BasePart", true) then return true end
            return false
        end
        local function Pallet_GetPointSlide(model)
            local slide = model:FindFirstChild("PalletPointSlide")
            if slide then return slide end
            for _, child in ipairs(model:GetDescendants()) do
                if child.Name == "PalletPointSlide" then return child end
            end
            return model:FindFirstChild("PalletPoint")
        end
        local _lastPalletScan = 0
        RunService.Heartbeat:Connect(function()
            if not VD.SURV_AutoPallet then return end
            if GetRole() ~= "Survivor" then return end
            local now = tick()
            if now - _lastPalletScan < 0.2 then return end
            _lastPalletScan = now
            if now - _lastPalletDrop < 2.5 then return end
            pcall(function()
                local char   = LocalPlayer.Character
                local myRoot = char and char:FindFirstChild("HumanoidRootPart")
                local hum    = char and char:FindFirstChildOfClass("Humanoid")
                if not myRoot or not hum or hum.Health <= 0 then return end
                local killerRoot = Pallet_GetKillerRoot(); if not killerRoot then return end
                if (myRoot.Position - killerRoot.Position).Magnitude > (VD.SURV_AutoPalletDist or 20) then return end
                local remotes    = ReplicatedStorage:FindFirstChild("Remotes")
                local palletFold = remotes and remotes:FindFirstChild("Pallet")
                local dropEvent  = palletFold and palletFold:FindFirstChild("PalletDropEvent")
                if not dropEvent then return end
                local bestPallet, bestDist = nil, 8
                for _, pal in ipairs(Pallet_GetAllPallets()) do
                    if not Pallet_IsDropped(pal) then
                        local refPart = pal:FindFirstChild("PalletPoint") or pal:FindFirstChild("PalletPointSlide") or pal:FindFirstChildWhichIsA("BasePart", true)
                        if refPart then
                            local d = (myRoot.Position - refPart.Position).Magnitude
                            if d < bestDist then bestDist = d; bestPallet = pal end
                        end
                    end
                end
                if bestPallet then
                    local fireTarget = Pallet_GetPointSlide(bestPallet)
                    if fireTarget then
                        pcall(function() dropEvent:FireServer(fireTarget) end)
                        _usedPallets[bestPallet] = true
                        _lastPalletDrop = tick()
                    end
                end
            end)
        end)
        LocalPlayer.CharacterAdded:Connect(function() task.wait(0.5); _usedPallets = {} end)
        W.PalletReflex_SetEnabled = function(v) VD.SURV_AutoPallet = v and true or false; _usedPallets = {} end
        W.PalletReflex_SetDistance = function(v) VD.SURV_AutoPalletDist = tonumber(v) or 20 end
    end

    do
        VD.CamDBD_SmoothEnabled = VD.CamDBD_SmoothEnabled or false
        VD.CamDBD_SmoothSpeed = VD.CamDBD_SmoothSpeed or 5
        VD.CamDBD_POVEnabled = VD.CamDBD_POVEnabled or false
        VD.CamDBD_TargetPOV = VD.CamDBD_TargetPOV or 85
        VD.CamDBD_POVSmooth = VD.CamDBD_POVSmooth or 9
        local CameraBindName = "Gluto_CameraDBD_Smooth"
        local PreviousPosition = nil; local PreviousRotation = nil; local OriginalPOV = 70
        pcall(function() RunService:UnbindFromRenderStep(CameraBindName) end)
        RunService:BindToRenderStep(
            CameraBindName, Enum.RenderPriority.Camera.Value + 1,
            function(DeltaTime)
                local Camera = Workspace.CurrentCamera; if not Camera then return end
                if Camera.CameraType ~= Enum.CameraType.Custom and Camera.CameraType ~= Enum.CameraType.Follow then
                    PreviousPosition = nil; PreviousRotation = nil; return
                end
                if VD.CamDBD_SmoothEnabled then
                    local CurrentCFrame   = Camera.CFrame
                    local CurrentPosition = CurrentCFrame.Position
                    local CurrentRotation = CurrentCFrame.Rotation
                    if not PreviousPosition or not PreviousRotation then
                        PreviousPosition = CurrentPosition; PreviousRotation = CurrentRotation
                    else
                        local smoothSpeed = tonumber(VD.CamDBD_SmoothSpeed) or 5
                        local posAlpha = 1 - math.exp(-smoothSpeed * DeltaTime)
                        PreviousPosition = PreviousPosition:Lerp(CurrentPosition, posAlpha)
                        local rotAlpha = 1 - math.exp(-(smoothSpeed * 1.90) * DeltaTime)
                        PreviousRotation = PreviousRotation:Lerp(CurrentRotation, rotAlpha)
                        Camera.CFrame = CFrame.new(PreviousPosition) * PreviousRotation
                    end
                else
                    PreviousPosition = nil; PreviousRotation = nil
                end
                if VD.CamDBD_POVEnabled then
                    local povSpeed = tonumber(VD.CamDBD_POVSmooth) or 9
                    local alpha = 1 - math.exp(-povSpeed * DeltaTime)
                    local target = tonumber(VD.CamDBD_TargetPOV) or 85
                    Camera.FieldOfView = Camera.FieldOfView + (target - Camera.FieldOfView) * alpha
                end
            end
        )
        LocalPlayer.CharacterAdded:Connect(function() task.wait(0.5); PreviousPosition = nil; PreviousRotation = nil end)
        W.CamDBD_SetSmooth = function(v)
            VD.CamDBD_SmoothEnabled = v and true or false
            if not v then PreviousPosition = nil; PreviousRotation = nil
            else
                local cam = Workspace.CurrentCamera
                if cam then PreviousPosition = cam.CFrame.Position; PreviousRotation = cam.CFrame.Rotation end
            end
        end
        W.CamDBD_SetSmoothSpeed = function(v) VD.CamDBD_SmoothSpeed = tonumber(v) or 5 end
        W.CamDBD_SetPOVLock = function(v)
            VD.CamDBD_POVEnabled = v and true or false
            if not v then
                local cam = Workspace.CurrentCamera
                if cam then cam.FieldOfView = OriginalPOV end
            else
                local cam = Workspace.CurrentCamera
                if cam then OriginalPOV = cam.FieldOfView end
            end
        end
        W.CamDBD_SetTargetPOV = function(v) VD.CamDBD_TargetPOV = tonumber(v) or 85 end
        W.CamDBD_SetPOVSmooth = function(v) VD.CamDBD_POVSmooth = tonumber(v) or 9 end
    end

local function CreateFloatingButton(cfg)
    local state = cfg.state
    state.Connections = state.Connections or {}
    local function ClearConns()
        for _, c in ipairs(state.Connections) do pcall(function() c:Disconnect() end) end
        state.Connections = {}
    end
    local function DestroyBtn()
        ClearConns()
        if state.Gui then pcall(function() state.Gui:Destroy() end); state.Gui = nil end
    end
    local function UpdateVisual()
        if not state.Gui then return end
        local main = state.Gui:FindFirstChild("MainBtn", true); if not main then return end
        local on = false
        pcall(function() on = cfg.isOn() end)
        local stroke = main:FindFirstChild("BtnStroke")
        if on then
            main.Text = cfg.title .. " : [ON]"
            main.TextColor3 = _G.GLUTO_THEME
            if stroke then stroke.Color = _G.GLUTO_THEME end
        else
            main.Text = cfg.title .. " : [OFF]"
            main.TextColor3 = Color3.fromRGB(35, 35, 35)
            if stroke then stroke.Color = Color3.fromRGB(35, 35, 35) end
        end
    end
    local function ToggleBtn()
        if cfg.locked then
            pcall(function()
                local nf = getgenv().__Gluto_VD_Notify
                if nf then nf("🔒 Locked Feature", (cfg.title or "Feature") .. " tidak bisa diaktifkan", 2) end
            end)
            return
        end
        local s = not cfg.isOn()
        pcall(function() cfg.onToggle(s) end)
        task.wait(0.08)
        UpdateVisual()
        if s then VD_Notify(cfg.notifyTitle, "Enabled", 2) end
    end
    local function CreateBtn()
        DestroyBtn()
        local parent = SafeGuiParent(); if not parent then return end
        local gui = Instance.new("ScreenGui")
        gui.Name = "Gluto" .. cfg.id .. "Btn"; gui.ResetOnSpawn = false
        gui.IgnoreGuiInset = true; gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        gui.Parent = parent; state.Gui = gui
        local btn = Instance.new("TextButton")
        btn.Name = "MainBtn"; btn.Size = UDim2.new(0, 140, 0, 40)
        btn.Position = state.SavedPos or UDim2.new(0.65, 0, 0.20, 0)
        btn.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        btn.BackgroundTransparency = 0.3
        btn.Text = cfg.title .. " : [OFF]"
        btn.TextColor3 = Color3.fromRGB(35, 35, 35)
        btn.TextSize = 13; btn.Font = Enum.Font.GothamBold
        btn.AutoButtonColor = false; btn.Parent = gui
        local corner = Instance.new("UICorner"); corner.CornerRadius = UDim.new(0, 10); corner.Parent = btn
        local stroke = Instance.new("UIStroke")
        stroke.Name = "BtnStroke"; stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Thickness = 1.5; stroke.Color = Color3.fromRGB(35, 35, 35)
        stroke.Transparency = 0; stroke.Parent = btn
        local dragging, dragInput, dragStart, startPos, moved = false, nil, nil, nil, false
        table.insert(state.Connections, btn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true; moved = false; dragInput = input
                dragStart = input.Position; startPos = btn.Position
            end
        end))
        table.insert(state.Connections, btn.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end))
        table.insert(state.Connections, UserInputService.InputChanged:Connect(function(input)
            if not dragging or input ~= dragInput then return end
            local delta = input.Position - dragStart
            if math.abs(delta.X) > 5 or math.abs(delta.Y) > 5 then moved = true end
            btn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
            state.SavedPos = btn.Position
        end))
        table.insert(state.Connections, UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                if dragging and not moved then ToggleBtn() end
                dragging = false
            end
        end))
        UpdateVisual()
    end
    state.Create = CreateBtn
    state.Destroy = DestroyBtn
    state.UpdateVisual = UpdateVisual
    state.SetEnabled = function(en)
        state.Enabled = en and true or false
        if state.Enabled then CreateBtn() else DestroyBtn() end
    end
    return state
end
W.CreateFloatingButton = CreateFloatingButton

    local FastBandageBtnState = { Enabled=false, Gui=nil, SavedPos=UDim2.new(0.03,0,0.28,0), Connections={} }
    local FastBandageFloatingBtn = CreateFloatingButton({
        id = "FastBandage", title = "Bandage", notifyTitle = "Fast Bandage",
        state = FastBandageBtnState,
        isOn = function() return W.FastBandage and W.FastBandage.IsHealing() end,
        onToggle = function(v)
            if not W.FastBandage then return end
            if v then W.FastBandage.Start() else W.FastBandage.Stop() end
        end,
    })
    getgenv().Gluto_FastBandageBtn_SetEnabled = function(en) FastBandageFloatingBtn.SetEnabled(en) end
    getgenv().Gluto_FastBandageBtn_UpdateVisual = function() FastBandageFloatingBtn.UpdateVisual() end

    task.spawn(function()
        local lastState = false
        while task.wait(0.3) do
            local cur = W.FastBandage and W.FastBandage.IsHealing() or false
            if cur ~= lastState then
                lastState = cur
                if getgenv().Gluto_FastBandageBtn_UpdateVisual then pcall(getgenv().Gluto_FastBandageBtn_UpdateVisual) end
            end
        end
    end)

    local SelfHealBtnState = { Enabled=false, DragLocked=false, Gui=nil, SavedPos=UDim2.new(0.03,0,0.28,0), Connections={} }
    local SelfHealState = CreateFloatingButton({
        id="SelfHeal", title="Heal", notifyTitle="Self Heal", state=SelfHealBtnState,
        isOn=function() return W.InstantHealSelf end,
        onToggle=function(v) W.setInstantHealSelf(v) end,
        iconRotation=0,
    })
    getgenv().Gluto_SHB_SetEnabled = function(en) SelfHealState.SetEnabled(en) end
    getgenv().Gluto_SHB_UpdateVisual = function() SelfHealState.UpdateVisual() end

    W.SelfUnhook = W.SelfUnhook or {
        Enabled=false, Following=false, FollowDuration=30, FollowDistance=20,
        MonitorConn=nil, TriggerCount=0, _lastTrigger=0, _cooldown=3,
        _hookPos=nil, _hookCFrame=nil, _activeThread=nil, _wasHooked=false
    }
    local SU = W.SelfUnhook
    function W.SU_IsHooked()
        local char = LocalPlayer.Character; if not char then return false end
        return char:GetAttribute("IsHooked") == true or char:GetAttribute("isHooked") == true
            or char:GetAttribute("Hooked") == true or char:GetAttribute("HookedState") == true
    end
    function W.SU_GetRandomGeneratorPoint()
        local gens = W.GB_GetAllGenerators()
        if not gens or #gens == 0 then return nil end
        local valid = {}
        for _, g in ipairs(gens) do
            if g and g.Parent then
                for _, p in ipairs(W.GB_GetPoints(g)) do
                    if p and p.Parent then table.insert(valid, p) end
                end
            end
        end
        if #valid == 0 then return nil end
        return valid[math.random(1, #valid)]
    end
    function W.SU_GetKillerHRP()
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= LocalPlayer and TeamIs(p, "Killer") and p.Character then
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then return hrp end
            end
        end
        return nil
    end
    function W.SU_Abort()
        SU.Following = false
        if SU._activeThread and coroutine.status(SU._activeThread) ~= "dead" then
            pcall(function() task.cancel(SU._activeThread) end)
        end
        SU._activeThread = nil
    end
    function W.SU_Trigger()
        if SU.Following then return end
        local now = tick()
        if now - SU._lastTrigger < SU._cooldown then return end
        if not W.SU_IsHooked() then return end
        SU._lastTrigger = now; SU.Following = true
        SU.TriggerCount = SU.TriggerCount + 1
        local char = LocalPlayer.Character
        if char then
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then SU._hookPos = hrp.Position; SU._hookCFrame = hrp.CFrame end
        end
        SU._activeThread = task.spawn(function()
            local c = LocalPlayer.Character
            if not c then SU.Following = false; SU._activeThread = nil; return end
            local hrp = c:FindFirstChild("HumanoidRootPart")
            if not hrp then SU.Following = false; SU._activeThread = nil; return end
            local re = ReplicatedStorage:FindFirstChild("Remotes")
                and ReplicatedStorage.Remotes:FindFirstChild("Generator")
                and ReplicatedStorage.Remotes.Generator:FindFirstChild("RepairEvent")
            if not W.SU_IsHooked() then SU.Following = false; SU._activeThread = nil; return end
            local tp = W.SU_GetRandomGeneratorPoint()
            if tp then
                pcall(function() hrp.Velocity = Vector3.zero; hrp.CFrame = tp.CFrame + Vector3.new(0, 3, 0) end)
                task.wait(0.15)
                if re then
                    pcall(function() re:FireServer(tp, true) end); task.wait(0.35)
                    pcall(function() re:FireServer(tp, false) end); task.wait(0.15)
                    pcall(function() re:FireServer(tp, true) end); task.wait(0.35)
                    pcall(function() re:FireServer(tp, false) end)
                end
            end
            local fUntil = tick() + (SU.FollowDuration or 30)
            local bOff = SU.FollowDistance or 20
            while tick() < fUntil and SU.Enabled do
                if not W.SU_IsHooked() then
                    SU.Following = false; SU._activeThread = nil
                    VD_Notify("Bypass Self Unhook", "Udah lepas hook - STOP", 2)
                    return
                end
                local cc = LocalPlayer.Character; if not cc then break end
                local r = cc:FindFirstChild("HumanoidRootPart"); if not r then break end
                local khrp = W.SU_GetKillerHRP()
                if khrp then
                    pcall(function()
                        r.Velocity = Vector3.zero
                        local tPos = Vector3.new(khrp.Position.X, khrp.Position.Y - bOff, khrp.Position.Z)
                        r.CFrame = CFrame.new(tPos, tPos + Vector3.new(0, 0, -1))
                    end)
                end
                task.wait(0.03)
            end
            if W.SU_IsHooked() then
                local c2 = LocalPlayer.Character
                if c2 then
                    local r2 = c2:FindFirstChild("HumanoidRootPart")
                    if r2 then
                        if SU._hookCFrame then pcall(function() r2.Velocity = Vector3.zero; r2.CFrame = SU._hookCFrame end)
                        elseif SU._hookPos then pcall(function() r2.Velocity = Vector3.zero; r2.CFrame = CFrame.new(SU._hookPos + Vector3.new(0, 3, 0)) end) end
                    end
                end
            end
            SU.Following = false; SU._activeThread = nil
        end)
    end
    function W.SU_Start()
        if SU.MonitorConn then return end
        SU._wasHooked = false
        SU.MonitorConn = RunService.Heartbeat:Connect(function()
            if not SU.Enabled then return end
            local char = LocalPlayer.Character; if not char then return end
            local isH = W.SU_IsHooked()
            if not isH then SU._wasHooked = false; return end
            if not SU._wasHooked and not SU.Following then SU._wasHooked = true; W.SU_Trigger() end
        end)
    end
    function W.SU_Stop()
        if SU.MonitorConn then SU.MonitorConn:Disconnect(); SU.MonitorConn = nil end
        W.SU_Abort(); SU._wasHooked = false
    end
    function W.SU_SetEnabled(v)
        SU.Enabled = v
        if v then W.SU_Start() else W.SU_Stop() end
    end

    local SelfUnhookBtnState = { Enabled=false, DragLocked=false, Gui=nil, SavedPos=UDim2.new(0.03,0,0.35,0), Connections={} }
    local SelfUnhookState = CreateFloatingButton({
        id="SelfUnhook", title="Hook", notifyTitle="Self Unhook", state=SelfUnhookBtnState,
        isOn=function() return W.SelfUnhook.Enabled end,
        onToggle=function(v) W.SU_SetEnabled(v) end,
        iconRotation=135,
    })
    getgenv().Gluto_SUB_SetEnabled = function(en) SelfUnhookState.SetEnabled(en) end
    getgenv().Gluto_SUB_UpdateVisual = function() SelfUnhookState.UpdateVisual() end

    local TrollBtnState = { Enabled=false, DragLocked=false, Gui=nil, SavedPos=UDim2.new(0.03,0,0.42,0), Connections={} }
    local TrollState = CreateFloatingButton({
        id="TrollTP", title="T_TP", notifyTitle="Troll Teleport", state=TrollBtnState,
        isOn=function() return W.TrollTeleport.Enabled end,
        onToggle=function(v) W.TrollTeleport_SetEnabled(v) end,
        iconRotation=225,
    })
    getgenv().Gluto_TTB_SetEnabled = function(en) TrollState.SetEnabled(en) end
    getgenv().Gluto_TTB_UpdateVisual = function() TrollState.UpdateVisual() end

local InvisBtnState = { Enabled=false, DragLocked=false, Gui=nil, SavedPos=UDim2.new(0.03,0,0.63,0), Connections={} }
local InvisStateBtn = CreateFloatingButton({
    id="Invisible", title="Invis", notifyTitle="Invisible", state=InvisBtnState,
    locked = false,
    isOn=function() return VDT_Invis.Enabled end,
    onToggle=function(v) 
        ToggleVDTInvis(v) 
        if v then VD_Notify("Invisible", "Enabled (Kamu tidak terlihat)", 2) 
        else VD_Notify("Invisible", "Disabled", 2) end
    end,
    iconRotation=180,
})

getgenv().Gluto_InvisBtn_SetEnabled = function(en) InvisStateBtn.SetEnabled(en) end
getgenv().Gluto_InvisBtn_UpdateVisual = function() InvisStateBtn.UpdateVisual() end

local ParryV3BtnState = { Enabled = false, Gui = nil, SavedPos = UDim2.new(0.03, 0, 0.21, 0), Connections = {} }
local ParryV3FloatingBtn = CreateFloatingButton({
    id = "AutoParryV3",
    title = "Parry V3",
    notifyTitle = "Auto Parry V3",
    state = ParryV3BtnState,
    isOn = function() return VD.AP3_Enabled == true end,
    onToggle = function(v)
        if W.AP3_SetEnabled then
            W.AP3_SetEnabled(v)
        else
            VD.AP3_Enabled = v and true or false
        end
        if v then
            VD_Notify("Auto Parry V3", "Enabled", 2)
        else
            VD_Notify("Auto Parry V3", "Disabled", 2)
        end
    end,
    iconRotation = 0,
})

getgenv().Gluto_AutoParryV3Btn_SetEnabled   = function(en) ParryV3FloatingBtn.SetEnabled(en) end
getgenv().Gluto_AutoParryV3Btn_UpdateVisual = function() ParryV3FloatingBtn.UpdateVisual() end

-- Sync visual kalau state berubah dari UI menu (bukan dari button)
task.spawn(function()
    local last = VD.AP3_Enabled
    while task.wait(0.3) do
        local cur = VD.AP3_Enabled == true
        if cur ~= last then
            last = cur
            if getgenv().Gluto_AutoParryV3Btn_UpdateVisual then
                pcall(getgenv().Gluto_AutoParryV3Btn_UpdateVisual)
            end
        end
    end
end)

    local EscapeBtnState = { Enabled=false, DragLocked=false, Gui=nil, SavedPos=UDim2.new(0.03,0,0.49,0), Connections={} }
    local EscapeState = CreateFloatingButton({
        id="Escape", title="Escape", notifyTitle="Instant Escape", state=EscapeBtnState,
        isOn=function() return W.Escape.Enabled end,
        onToggle=function(v) W.Escape.Enabled = v; if v then W.Escape_Teleport() end end,
        iconRotation=45,
    })
    getgenv().Gluto_Escape_SetEnabled = function(en) EscapeState.SetEnabled(en) end
    getgenv().Gluto_Escape_UpdateVisual = function() EscapeState.UpdateVisual() end

    local MyersGrabBtnState = { Enabled=false, DragLocked=false, Gui=nil, SavedPos=UDim2.new(0.03,0,0.70,0), Connections={} }
    local MyersGrabBtn = CreateFloatingButton({
        id="MyersGrab", title="Grab", notifyTitle="Myers Grab", state=MyersGrabBtnState,
        isOn=function() return W.MyersGrabData.Enabled end,
        onToggle=function(v) W.setMyersGrab(v) end,
        iconRotation=90,
    })
    getgenv().Gluto_MGrabBtn_SetEnabled = function(en) MyersGrabBtn.SetEnabled(en) end
    getgenv().Gluto_MGrabBtn_UpdateVisual = function() MyersGrabBtn.UpdateVisual() end

local AutoParryBtnState = { Enabled=false, Gui=nil, SavedPos=UDim2.new(0.03,0,0.14,0), Connections={} }
local AutoParryFloatingBtn = CreateFloatingButton({
    id = "AutoParry",
    title = "Parry",
    notifyTitle = "Auto Parry",
    state = AutoParryBtnState,
    isOn = function() return VD.Surv_AutoParry end,
    onToggle = function(v)
        VD.Surv_AutoParry = v and true or false
        if getgenv().Gluto_ParryBtn_UpdateVisual then
            pcall(getgenv().Gluto_ParryBtn_UpdateVisual)
        end
        if v then VD_Notify("Auto Parry", "Enabled ", 2)
        else VD_Notify("Auto Parry", "Disabled", 2) end
    end,
})

local ParryVDTBtnState = { Enabled=false, Gui=nil, SavedPos=UDim2.new(0.03,0,0.14,0), Connections={} }
local ParryVDTFloatingBtn = CreateFloatingButton({
    id = "AutoParryVDT",
    title = "Parry V2",
    notifyTitle = "Auto Parry V2",
    state = ParryVDTBtnState,
    isOn = function() 
        return _G.VDT_Parry and (_G.VDT_Parry.tbl3.Surv_Parry or _G.VDT_Parry.tbl3.Surv_ParryV2)
    end,
    onToggle = function(v)
        if _G.VDT_Parry then
            _G.VDT_Parry.tbl3.Surv_Parry = v
            if v then 
                _G.VDT_Parry.tbl3.Surv_ParryV2 = false 
            else
                if _G.VDT_Parry.fn55 then _G.VDT_Parry.fn55(false) end
            end
        end
        if getgenv().Gluto_AutoParryVDTBtn_UpdateVisual then 
            pcall(getgenv().Gluto_AutoParryVDTBtn_UpdateVisual) 
        end
        if v then VD_Notify("Auto Parry V2", "Enabled", 2) 
        else VD_Notify("Auto Parry V2", "Disabled", 2) end
    end,
    iconRotation = 0,
})

getgenv().Gluto_AutoParryVDTBtn_SetEnabled = function(en) ParryVDTFloatingBtn.SetEnabled(en) end
getgenv().Gluto_AutoParryVDTBtn_UpdateVisual = function() ParryVDTFloatingBtn.UpdateVisual() end

getgenv().Gluto_ParryBtn_SetEnabled = function(en) AutoParryFloatingBtn.SetEnabled(en) end
getgenv().Gluto_ParryBtn_UpdateVisual = function() AutoParryFloatingBtn.UpdateVisual() end

task.spawn(function()
    local lastState = VD.Surv_AutoParry
    while task.wait(0.3) do
        local cur = VD.Surv_AutoParry
        if cur ~= lastState then
            lastState = cur
            if getgenv().Gluto_ParryBtn_UpdateVisual then
                pcall(getgenv().Gluto_ParryBtn_UpdateVisual)
            end
        end
    end
end)

    -- [UNLOCKED] Silent Veil Floating Button
    local VeilBtnState = { Enabled=false, DragLocked=false, Gui=nil, SavedPos=UDim2.new(0.03,0,0.77,0), Connections={} }
    local VeilStateBtn = CreateFloatingButton({
        id="SilentVeil", title="Veil", notifyTitle="Silent Veil V1", state=VeilBtnState,
        locked = false,
        isOn=function() return VD.VeilEnabled end,
        onToggle=function(v)
            VD.VeilEnabled = v and true or false
            if not v then
                if W.Veil_HideAllVisuals then pcall(W.Veil_HideAllVisuals) end
            end
            if getgenv().Gluto_VeilBtn_UpdateVisual then pcall(getgenv().Gluto_VeilBtn_UpdateVisual) end
            if v then VD_Notify("Silent Veil V1", "Enabled", 2)
            else VD_Notify("Silent Veil V1", "Disabled", 2) end
        end,
        iconRotation=0,
    })
    getgenv().Gluto_VeilBtn_SetEnabled = function(en) VeilStateBtn.SetEnabled(en) end
    getgenv().Gluto_VeilBtn_UpdateVisual = function() VeilStateBtn.UpdateVisual() end

    W.SkillCheck = W.SkillCheck or { Enabled=false, Mode="Legit", Busy=false, Connection=nil }
    local SC = W.SkillCheck
    local SC_TouchID = 8822
    local SC_ActionPath = "Survivor-mob.Controls.action.check"
    local function SC_PressSpace()
        if not VirtualInputManager then return end
        pcall(function()
            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Space, false, game)
            task.wait()
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Space, false, game)
        end)
    end
    local function SC_GetActionTarget()
        local pGui = LocalPlayer:FindFirstChildOfClass("PlayerGui"); if not pGui then return nil end
        local current = pGui
        for seg in string.gmatch(SC_ActionPath, "[^%.]+") do current = current and current:FindFirstChild(seg) end
        return current
    end
    local function SC_TriggerMobileButton()
        local b = SC_GetActionTarget()
        if b and b:IsA("GuiObject") then
            local p, s = b.AbsolutePosition, b.AbsoluteSize
            local i = GuiService:GetGuiInset()
            local cx, cy = p.X + (s.X/2) + i.X, p.Y + (s.Y/2) + i.Y
            pcall(function()
                VirtualInputManager:SendTouchEvent(SC_TouchID, 0, cx, cy)
                task.wait(0.01)
                VirtualInputManager:SendTouchEvent(SC_TouchID, 2, cx, cy)
            end)
        end
    end
    function W.SkillCheck_Start()
        if SC.Connection then SC.Connection:Disconnect(); SC.Connection = nil end
        SC.Connection = RunService.RenderStepped:Connect(function()
            if not SC.Enabled or SC.Busy then return end
            local pGui = LocalPlayer:FindFirstChildOfClass("PlayerGui"); if not pGui then return end
            local prompt = pGui:FindFirstChild("SkillCheckPromptGui"); if not prompt then return end
            local check = prompt:FindFirstChild("Check"); if not check or not check.Visible then return end
            local line = check:FindFirstChild("Line")
            local goal = check:FindFirstChild("Goal")
            if not line or not goal then return end
            if SC.Mode == "Instant" then
                line.Rotation = goal.Rotation + 109
                SC.Busy = true
                task.spawn(function()
                    if UserInputService.TouchEnabled then SC_TriggerMobileButton() else SC_PressSpace() end
                    task.wait(0.2); SC.Busy = false
                end)
            else
                local lr = line.Rotation % 360
                local gr = goal.Rotation % 360
                local sR = (gr + 102) % 360
                local eR = (gr + 116) % 360
                local success = (sR > eR and (lr >= sR or lr <= eR)) or (lr >= sR and lr <= eR)
                if success then
                    SC.Busy = true
                    task.spawn(function()
                        if UserInputService.TouchEnabled then SC_TriggerMobileButton() else SC_PressSpace() end
                        task.wait(0.05); SC.Busy = false
                    end)
                end
            end
        end)
    end
    function W.SkillCheck_Stop()
        if SC.Connection then SC.Connection:Disconnect(); SC.Connection = nil end
        SC.Busy = false
    end
    function W.SkillCheck_SetEnabled(v)
        SC.Enabled = v and true or false
        if SC.Enabled then W.SkillCheck_Start() else W.SkillCheck_Stop() end
    end

    W.GenBypass = W.GenBypass or {
        Enabled=false, Button=nil, UI=nil, Cache={}, CacheTimer=0,
        Processed={}, HotkeyCode=Enum.KeyCode.B, TriggerRange=8
    }
    local GenBypass = W.GenBypass
    function W.GB_GetAllGeneratorsCached()
        local now = tick()
        if now - GenBypass.CacheTimer < 5 then return GenBypass.Cache end
        GenBypass.Cache = {}; GenBypass.CacheTimer = now
        local mf = Workspace:FindFirstChild("Map"); if not mf then return GenBypass.Cache end
        pcall(function()
            for _, v in pairs(mf:GetDescendants()) do
                if not v:IsA("Model") then continue end
                if v.Name ~= "Generator" then continue end
                local real = v:GetAttribute("RepairProgress") ~= nil
                          or v:GetAttribute("kickcount") ~= nil
                          or v:GetAttribute("ProgressRepair") ~= nil
                if real then table.insert(GenBypass.Cache, v) end
            end
        end)
        return GenBypass.Cache
    end
    function W.GB_WaitRepairing(pt, t)
        local s = tick()
        while tick() - s < (t or 1) do
            if pt:GetAttribute("IsRepairing") == true then return true end
            task.wait(0.05)
        end
        return false
    end
    function W.GB_DoRepair(tp)
        local gm = tp.Parent
        if GenBypass.Processed[gm] then return end
        GenBypass.Processed[gm] = true
        local c = LocalPlayer.Character
        local hrp = c and c:FindFirstChild("HumanoidRootPart")
        if not hrp then GenBypass.Processed[gm] = nil; return end
        local re = ReplicatedStorage:FindFirstChild("Remotes")
            and ReplicatedStorage.Remotes:FindFirstChild("Generator")
            and ReplicatedStorage.Remotes.Generator:FindFirstChild("RepairEvent")
        local og = hrp.CFrame
        pcall(function()
            for _, p in pairs(W.GB_GetPoints(gm)) do
                if p ~= tp and p.Parent then
                    hrp.Anchored = true; hrp.CFrame = p.CFrame
                    task.wait(0.15)
                    pcall(function() if re then re:FireServer(p, true) end end)
                    if not W.GB_WaitRepairing(p, 0.8) then
                        pcall(function() if re then re:FireServer(p, false) end end)
                        task.wait(0.1)
                        hrp.CFrame = p.CFrame
                        task.wait(0.15)
                        pcall(function() if re then re:FireServer(p, true) end end)
                        W.GB_WaitRepairing(p, 0.5)
                    end
                    hrp.Anchored = false
                    task.wait(0.05)
                end
            end
        end)
        pcall(function() if hrp and hrp.Parent then hrp.Anchored = false; hrp.CFrame = og end end)
        task.wait(0.1)
        pcall(function() if re then re:FireServer(tp, false) end end)
    end
    function W.GB_GetNearestPoint()
        local c = LocalPlayer.Character
        local hrp = c and c:FindFirstChild("HumanoidRootPart"); if not hrp then return nil end
        local best, bd = nil, math.huge
        for _, g in pairs(W.GB_GetAllGeneratorsCached()) do
            for _, p in pairs(W.GB_GetPoints(g)) do
                local d = (hrp.Position - p.Position).Magnitude
                if d < bd then bd = d; best = p end
            end
        end
        return best, bd
    end
    function W.GB_IsPromptVisible()
        local ok2, fr = pcall(function() return LocalPlayer.PlayerGui.pcpprompts.Frame.GeneratorRepair end)
        return ok2 and fr and fr.Visible
    end
    function W.GB_UpdateButton()
        if GenBypass.Enabled then
            if not GenBypass._Wrap or not GenBypass.UI or not GenBypass.UI.Parent then
                W.GB_CreateButton(); task.wait(0.05)
            end
            if GenBypass._ShowCard then GenBypass._ShowCard() end
        else
            if GenBypass._HideCard then GenBypass._HideCard() end
        end
    end
    function W.GB_CreateButton()
        local pg = SafeGuiParent(); if not pg then return end
        local old = pg:FindFirstChild("BypassGenUI"); if old then old:Destroy() end
        if GenBypass._StopAnim then pcall(GenBypass._StopAnim); GenBypass._StopAnim = nil end
        GenBypass.UI = Instance.new("ScreenGui")
        GenBypass.UI.Name = "BypassGenUI"; GenBypass.UI.ResetOnSpawn = false
        GenBypass.UI.IgnoreGuiInset = true; GenBypass.UI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        GenBypass.UI.DisplayOrder = 100; GenBypass.UI.Parent = pg
        local wrap = Instance.new("Frame")
        wrap.Name = "Wrap"; wrap.AnchorPoint = Vector2.new(1, 0)
        wrap.Position = UDim2.new(1, -20, 0.48, 0); wrap.Size = UDim2.fromOffset(110, 110)
        wrap.BackgroundTransparency = 1; wrap.Active = true
        wrap.ZIndex = 2; wrap.Parent = GenBypass.UI
        local glow = Instance.new("Frame")
        glow.Name = "Glow"; glow.AnchorPoint = Vector2.new(0.5, 0.5)
        glow.Position = UDim2.new(0.5, 0, 0.5, 0); glow.Size = UDim2.fromOffset(88, 88)
        glow.BackgroundColor3 = _G.GLUTO_THEME; glow.BackgroundTransparency = 0.85
        glow.BorderSizePixel = 0; glow.ZIndex = 1; glow.Parent = wrap
        Instance.new("UICorner", glow).CornerRadius = UDim.new(1, 0)
        local mainCircle = Instance.new("Frame")
        mainCircle.Name = "MainCircle"; mainCircle.AnchorPoint = Vector2.new(0.5, 0.5)
        mainCircle.Position = UDim2.new(0.5, 0, 0.5, 0); mainCircle.Size = UDim2.fromOffset(64, 64)
        mainCircle.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
        mainCircle.BackgroundTransparency = 0.05; mainCircle.BorderSizePixel = 0
        mainCircle.ZIndex = 4; mainCircle.Parent = wrap
        Instance.new("UICorner", mainCircle).CornerRadius = UDim.new(1, 0)
        local mainGrad = Instance.new("UIGradient")
        mainGrad.Rotation = 135
        mainGrad.Color = ColorSequence.new({
            ColorSequenceKeypoint.new(0, Color3.fromRGB(25, 25, 25)),
            ColorSequenceKeypoint.new(1, Color3.fromRGB(10, 10, 10)),
        })
        mainGrad.Parent = mainCircle
        local mainStroke = Instance.new("UIStroke", mainCircle)
        mainStroke.Name = "MainStroke"; mainStroke.Color = _G.GLUTO_THEME
        mainStroke.Thickness = 1.6; mainStroke.Transparency = 0.15
        mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        local genText = Instance.new("TextLabel")
        genText.Name = "GenText"; genText.AnchorPoint = Vector2.new(0.5, 0.5)
        genText.Position = UDim2.new(0.5, 0, 0.5, 0); genText.Size = UDim2.fromOffset(60, 30)
        genText.BackgroundTransparency = 1; genText.Font = Enum.Font.GothamBlack
        genText.Text = "GEN"; genText.TextColor3 = _G.GLUTO_THEME
        genText.TextSize = 20; genText.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
        genText.TextStrokeTransparency = 0.5; genText.ZIndex = 7; genText.Parent = wrap
        local actionBtn = Instance.new("TextButton")
        actionBtn.Name = "ActionBtn"; actionBtn.Size = UDim2.fromScale(1, 1)
        actionBtn.BackgroundTransparency = 1; actionBtn.Text = ""
        actionBtn.AutoButtonColor = false; actionBtn.ZIndex = 10; actionBtn.Parent = wrap
        mainCircle.Size = UDim2.fromOffset(0, 0); glow.Size = UDim2.fromOffset(0, 0)
        genText.TextTransparency = 1; genText.TextStrokeTransparency = 1
        GenBypass._Wrap = wrap; GenBypass._Glow = glow
        GenBypass._MainCircle = mainCircle; GenBypass._MainStroke = mainStroke
        GenBypass._GenText = genText; GenBypass._ActionBtn = actionBtn
        local function ShowCard()
            wrap.Visible = true
            TweenService:Create(glow, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.fromOffset(88, 88), BackgroundTransparency = 0.85,
            }):Play()
            TweenService:Create(mainCircle, TweenInfo.new(0.55, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.fromOffset(64, 64), BackgroundTransparency = 0.05,
            }):Play()
            TweenService:Create(genText, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
                TextTransparency = 0, TextStrokeTransparency = 0.5,
            }):Play()
        end
        local function HideCard()
            TweenService:Create(glow, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Size = UDim2.fromOffset(0, 0), BackgroundTransparency = 1,
            }):Play()
            TweenService:Create(mainCircle, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Size = UDim2.fromOffset(0, 0), BackgroundTransparency = 1,
            }):Play()
            TweenService:Create(genText, TweenInfo.new(0.2), {
                TextTransparency = 1, TextStrokeTransparency = 1,
            }):Play()
            task.delay(0.3, function()
                if GenBypass._StopAnim then pcall(GenBypass._StopAnim); GenBypass._StopAnim = nil end
                if GenBypass.UI then pcall(function() GenBypass.UI:Destroy() end); GenBypass.UI = nil end
                GenBypass._Wrap = nil; GenBypass._ShowCard = nil
                GenBypass._HideCard = nil; GenBypass._SetStatus = nil; GenBypass._Card = nil
            end)
        end
        GenBypass._ShowCard = ShowCard; GenBypass._HideCard = HideCard
        local animActive = true
        GenBypass._StopAnim = function() animActive = false end
        task.spawn(function()
            local t = 0
            while animActive and wrap.Parent do
                t = t + 0.035
                if GenBypass.Enabled then
                    local pulse = (math.sin(t * 3) + 1) * 0.5
                    mainStroke.Transparency = 0.35 - pulse * 0.2
                    mainStroke.Thickness = 1.6 + pulse * 0.4
                    glow.BackgroundTransparency = 0.85 - pulse * 0.12
                    glow.Size = UDim2.fromOffset(88 + pulse * 5, 88 + pulse * 5)
                    genText.Rotation = math.sin(t * 1.2) * 1.5
                end
                task.wait(0.03)
            end
        end)
        local function SetStatus(mode)
            mainStroke.Color = _G.GLUTO_THEME
            genText.TextColor3 = _G.GLUTO_THEME
            glow.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        end
        GenBypass._SetStatus = SetStatus
        local drag = false
        local dStart, sPos
        local dragDist = 0
        wrap.InputBegan:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
                drag = true; dStart = inp.Position; sPos = wrap.Position; dragDist = 0
            end
        end)
        UserInputService.InputChanged:Connect(function(inp)
            if not drag then return end
            if inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch then
                local d = inp.Position - dStart
                dragDist = math.abs(d.X) + math.abs(d.Y)
                wrap.Position = UDim2.new(sPos.X.Scale, sPos.X.Offset + d.X, sPos.Y.Scale, sPos.Y.Offset + d.Y)
            end
        end)
        UserInputService.InputEnded:Connect(function(inp)
            if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
                drag = false
            end
        end)
        actionBtn.MouseButton1Up:Connect(function()
            if not GenBypass.Enabled then return end
            if dragDist > 6 then return end
            TweenService:Create(mainCircle, TweenInfo.new(0.08), { Size = UDim2.fromOffset(54, 54) }):Play()
            task.delay(0.1, function()
                TweenService:Create(mainCircle, TweenInfo.new(0.28, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(64, 64) }):Play()
            end)
            local ripple = Instance.new("Frame")
            ripple.AnchorPoint = Vector2.new(0.5, 0.5); ripple.Position = UDim2.new(0.5, 0, 0.5, 0)
            ripple.Size = UDim2.fromOffset(64, 64); ripple.BackgroundColor3 = _G.GLUTO_THEME
            ripple.BackgroundTransparency = 0.55; ripple.BorderSizePixel = 0
            ripple.ZIndex = 3; ripple.Parent = wrap
            Instance.new("UICorner", ripple).CornerRadius = UDim.new(1, 0)
            TweenService:Create(ripple, TweenInfo.new(0.6), { Size = UDim2.fromOffset(160, 160), BackgroundTransparency = 1 }):Play()
            task.delay(0.6, function() if ripple then ripple:Destroy() end end)
            SetStatus("searching")
            local bp, bd = W.GB_GetNearestPoint()
            if bp and bd <= GenBypass.TriggerRange then
                SetStatus("busy")
                task.spawn(function() W.GB_DoRepair(bp); task.wait(0.5); SetStatus("ready") end)
            else
                task.wait(0.6); SetStatus("standby")
            end
        end)
        task.spawn(function() task.wait(0.1); if GenBypass.Enabled then ShowCard() end end)
    end
    W.GB_CreateButton()
    LocalPlayer.CharacterAdded:Connect(function() task.wait(0.5); W.GB_CreateButton(); W.GB_UpdateButton() end)
    UserInputService.InputBegan:Connect(function(input, gp)
        if gp or isMobile then return end
        if input.KeyCode == GenBypass.HotkeyCode and GenBypass.Enabled then
            if not W.GB_IsPromptVisible() then return end
            local bp, bd = W.GB_GetNearestPoint()
            if not bp or bd > GenBypass.TriggerRange then return end
            if GenBypass.Processed[bp.Parent] then return end
            W.GB_DoRepair(bp)
        end
    end)
    task.spawn(function()
        while true do
            task.wait(2)
            local c = LocalPlayer.Character
            local hrp = c and c:FindFirstChild("HumanoidRootPart")
            if hrp then
                for gm in pairs(GenBypass.Processed) do
                    if not gm or not gm.Parent then GenBypass.Processed[gm] = nil; continue end
                    local near = false
                    for _, p in pairs(W.GB_GetPoints(gm)) do
                        if p.Parent and (hrp.Position - p.Position).Magnitude <= 10 then near = true; break end
                    end
                    if not near then GenBypass.Processed[gm] = nil end
                end
            end
        end
    end)
    function W.setGenBypass(v) GenBypass.Enabled = v; W.GB_UpdateButton() end

    do
        VD.FLASH_SilentAim  = VD.FLASH_SilentAim  or false
        VD.FLASH_Laser      = VD.FLASH_Laser      ~= false
        VD.FLASH_TargetPart = VD.FLASH_TargetPart or "Head"
        VD.FLASH_Range      = VD.FLASH_Range      or 120
        VD.FLASH_Smooth     = VD.FLASH_Smooth     or 0.35
        local FlashState = { Active = false, LaserBeam = nil, FlashlightPart = nil, Connection = nil, Hooked = false }
        local function Flash_GetActivateRemote()
            local r = ReplicatedStorage:FindFirstChild("Remotes")
            local i = r and r:FindFirstChild("Items")
            local f = i and i:FindFirstChild("Flashlight")
            local a = f and f:FindFirstChild("Activate")
            if a and a:IsA("RemoteEvent") then return a end
            return nil
        end
        local function Flash_GetTargetPart(char)
            if not char then return nil end
            local p = char:FindFirstChild(VD.FLASH_TargetPart or "Head")
            if p and p:IsA("BasePart") then return p end
            return char:FindFirstChild("Head") or char:FindFirstChild("UpperTorso")
                or char:FindFirstChild("Torso") or char:FindFirstChild("HumanoidRootPart")
        end
        local function Flash_IsAliveChar(char)
            local hum = char and char:FindFirstChildOfClass("Humanoid")
            if not hum or hum.Health <= 0 then return false end
            return char:GetAttribute("State") ~= "Dead"
        end
        local function Flash_GetTarget()
            local myChar = LocalPlayer.Character
            local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart"); if not myRoot then return nil end
            local maxR = tonumber(VD.FLASH_Range) or 120
            local best, bd = nil, math.huge
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character and Flash_IsAliveChar(p.Character) and TeamIs(p, "Killer") then
                    local part = Flash_GetTargetPart(p.Character)
                    if part then
                        local d = (myRoot.Position - part.Position).Magnitude
                        if d <= maxR and d < bd then bd = d; best = part end
                    end
                end
            end
            return best
        end
        local function Flash_ClearLaser()
            if FlashState.LaserBeam then pcall(function() FlashState.LaserBeam:Destroy() end); FlashState.LaserBeam = nil end
        end
        local function Flash_GetOrigin(cam)
            local src = FlashState.FlashlightPart
            if typeof and typeof(src) == "Instance" then
                if src:IsA("BasePart") then return src.Position end
                local p = src:FindFirstChildWhichIsA("BasePart", true); if p then return p.Position end
            end
            local c = LocalPlayer.Character
            local hand = c and (c:FindFirstChild("RightHand") or c:FindFirstChild("Right Arm") or c:FindFirstChild("HumanoidRootPart"))
            if hand and hand:IsA("BasePart") then return hand.Position end
            return cam and cam.CFrame.Position or nil
        end
        local function Flash_UpdateLaser(op, tp)
            if not FlashState.LaserBeam then
                local l = Instance.new("Part")
                l.Name = "GlutoFlashlightLaser"; l.Anchored = true
                l.CanCollide = false; l.CanTouch = false; l.CanQuery = false; l.CastShadow = false
                l.Material = Enum.Material.Neon; l.Color = _G.GLUTO_THEME
                l.Transparency = 0; l.Parent = Workspace
                FlashState.LaserBeam = l
            end
            local d = (tp - op).Magnitude; if d < 0.1 then return end
            local l = FlashState.LaserBeam
            l.Size = Vector3.new(0.16, 0.16, d)
            l.CFrame = CFrame.new((op + tp) / 2, tp); l.Transparency = 0.35
        end
        local function Flash_Step()
            if not (VD.FLASH_SilentAim and FlashState.Active) then
                if FlashState.LaserBeam then FlashState.LaserBeam.Transparency = 1 end
                return
            end
            local cam = Workspace.CurrentCamera
            local tp = Flash_GetTarget()
            if not (cam and tp) then
                if FlashState.LaserBeam then FlashState.LaserBeam.Transparency = 1 end
                return
            end
            local smooth = math.clamp(tonumber(VD.FLASH_Smooth) or 0.35, 0.05, 1)
            local op = Flash_GetOrigin(cam)
            if VD.FLASH_Laser and op then pcall(Flash_UpdateLaser, op, tp.Position)
            elseif FlashState.LaserBeam then FlashState.LaserBeam.Transparency = 1 end
            pcall(function() cam.CFrame = cam.CFrame:Lerp(CFrame.new(cam.CFrame.Position, tp.Position), smooth) end)
            pcall(function()
                local c = LocalPlayer.Character
                local hrp = c and c:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.CFrame = CFrame.new(hrp.Position, Vector3.new(tp.Position.X, hrp.Position.Y, tp.Position.Z)) end
            end)
        end
        local function Flash_Start()
            if FlashState.Connection then return end
            FlashState.Connection = RunService.RenderStepped:Connect(function() pcall(Flash_Step) end)
        end
        local function Flash_Stop()
            FlashState.Active = false; FlashState.FlashlightPart = nil
            Flash_ClearLaser()
            if FlashState.Connection then pcall(function() FlashState.Connection:Disconnect() end); FlashState.Connection = nil end
        end
        W.Flash_SetEnabled = function(v)
            VD.FLASH_SilentAim = v and true or false
            if v then Flash_Start() else Flash_Stop() end
        end
        W.Flash_SetActive = function(active, part)
            FlashState.Active = active and true or false
            if FlashState.Active and part then FlashState.FlashlightPart = part
            elseif not FlashState.Active then FlashState.FlashlightPart = nil end
            if not FlashState.Active and FlashState.LaserBeam then FlashState.LaserBeam.Transparency = 1 end
        end
        W.Flash_ClearLaser = Flash_ClearLaser
        task.spawn(function()
            pcall(function()
                local remote = Flash_GetActivateRemote(); if not remote then return end
                if typeof(hookmetamethod) ~= "function" then return end
                if FlashState.Hooked then return end
                FlashState.Hooked = true
                local oldNC
                oldNC = hookmetamethod(game, "__namecall", function(self, ...)
                    if getnamecallmethod() == "FireServer" and self == remote then
                        local args = {...}
                        pcall(function() W.Flash_SetActive(args[2] == true, args[1]) end)
                    end
                    return oldNC(self, ...)
                end)
            end)
        end)
    end

    local LockPOV = { Enabled = false, LockedFOV = 80, OriginalFOV = nil, Connection = nil }
    local function LockPOV_Update()
        if not LockPOV.Enabled then return end
        local cam = Workspace.CurrentCamera; if not cam then return end
        if math.abs(cam.FieldOfView - LockPOV.LockedFOV) > 0.1 then cam.FieldOfView = LockPOV.LockedFOV end
    end
    local function LockPOV_SetEnabled(en)
        LockPOV.Enabled = en and true or false
        if LockPOV.Enabled then
            local cam = Workspace.CurrentCamera
            if cam then
                LockPOV.OriginalFOV = cam.FieldOfView
                if LockPOV.Connection then LockPOV.Connection:Disconnect(); LockPOV.Connection = nil end
                cam.FieldOfView = LockPOV.LockedFOV
                LockPOV.Connection = RunService.RenderStepped:Connect(LockPOV_Update)
            end
        else
            if LockPOV.Connection then LockPOV.Connection:Disconnect(); LockPOV.Connection = nil end
            local cam = Workspace.CurrentCamera
            if cam and LockPOV.OriginalFOV then cam.FieldOfView = LockPOV.OriginalFOV end
        end
    end
    W.LockPOV = LockPOV
    W.LockPOV_SetEnabled = LockPOV_SetEnabled

    local ToFState = {
        Connection = nil, LaserBeam = nil, TargetGui = nil,
        InputBegan = nil, InputEnded = nil, TouchInput = nil,
        IsAiming = false, SavedUIPos = UDim2.new(0.5, -100, 0, 110),
        SCPCache = {}, SCPCacheTimer = 0
    }
    local ToFKeyCodes = { None=nil, Q=Enum.KeyCode.Q, E=Enum.KeyCode.E, R=Enum.KeyCode.R, T=Enum.KeyCode.T, F=Enum.KeyCode.F, G=Enum.KeyCode.G, H=Enum.KeyCode.H, J=Enum.KeyCode.J, K=Enum.KeyCode.K, L=Enum.KeyCode.L, X=Enum.KeyCode.X, Z=Enum.KeyCode.Z }
    local function ToF_IsDowned(c)
        if not c then return true end
        local hrp = c:FindFirstChild("HumanoidRootPart"); if not hrp then return true end
        local h = c:FindFirstChildOfClass("Humanoid"); if h and h.Health<=0 then return true end
        if c:GetAttribute("Knocked")==true then return true end
        if c:GetAttribute("IsHooked")==true then return true end
        if c:GetAttribute("IsCarried")==true then return true end
        return false
    end
    local function ToF_IsBlocked()
        if VD.TOF_BlockKnocked == false then return false end
        local c = LocalPlayer.Character; if not c then return true end
        return ToF_IsDowned(c)
    end
    local function ToF_GetEvent()
        local r = ReplicatedStorage:FindFirstChild("Remotes")
        local i = r and r:FindFirstChild("Items")
        local t = i and i:FindFirstChild("Twist of Fate")
        local f = t and t:FindFirstChild("Fire")
        if f and f:IsA("RemoteEvent") then return f end
        return nil
    end
    local function ToF_GetGun()
        local c = LocalPlayer.Character; if not c then return nil end
        local b = c:FindFirstChild("Twist of Fate", true); if not b then return nil end
        local ra = b:FindFirstChild("Right Arm")
        if ra then
            local g = ra:FindFirstChild("gun"); if g then return g end
            local e = ra:FindFirstChild("EmperorGun"); if e then return e end
        end
        return b
    end
    local function ToF_IsVisible(op, tp, tc)
        local d = tp - op; local dist = d.Magnitude
        if dist < 0.1 then return true end
        local rp = RaycastParams.new(); rp.FilterType = Enum.RaycastFilterType.Exclude
        local ex = {}
        local lc = LocalPlayer.Character
        if lc then table.insert(ex, lc) end
        if tc and tc ~= lc then table.insert(ex, tc) end
        if ToFState.LaserBeam then table.insert(ex, ToFState.LaserBeam) end
        rp.FilterDescendantsInstances = ex
        return workspace:Raycast(op, d.Unit * dist, rp) == nil
    end
    local function ToF_GetSCPs()
        if tick() - ToFState.SCPCacheTimer < 0.5 then return ToFState.SCPCache end
        local nt = {}
        local mf = workspace:FindFirstChild("Map")
        if mf then
            for _, c in pairs(mf:GetDescendants()) do
                if c:IsA("Model") then
                    local a = c:GetAttributes()
                    if c:GetAttribute("CorpseCreated0492") or next(a) ~= nil then
                        local r = c:FindFirstChild("HumanoidRootPart"); if r then table.insert(nt, r) end
                    end
                end
            end
        end
        ToFState.SCPCache = nt; ToFState.SCPCacheTimer = tick()
        return nt
    end
    local function ToF_GetTarget()
        local g = ToF_GetGun(); local c = LocalPlayer.Character
        if not (g and c) then return nil,nil,nil,nil end
        local hrp = c:FindFirstChild("HumanoidRootPart"); if not hrp then return nil,nil,nil,nil end
        local mp = hrp.Position
        local op
        if c:GetAttribute("IsCarried") then op = hrp.Position + (hrp.CFrame.LookVector * 2)
        else
            pcall(function() op = g:IsA("BasePart") and g.Position or (g:FindFirstChildOfClass("BasePart") and g:FindFirstChildOfClass("BasePart").Position) end)
            op = op or Vector3.new(mp.X, mp.Y + 1.5, mp.Z)
        end
        local function predict(t, tc)
            local tp = t.Position
            if VD.TOF_WallCheck and not ToF_IsVisible(op, tp, tc) then return nil,nil,nil,nil end
            local tv = Vector3.new(0,0,0)
            local rp = tc and (tc:FindFirstChild("HumanoidRootPart") or t)
            if rp then tv = rp.Velocity end
            local dr = tp - op; local d = dr.Magnitude
            if d < 0.1 then return nil,nil,nil,nil end
            if d < 5 then return dr.Unit, g, op, tp end
            local tt = d/400
            local pp = tp + (tv*tt)
            for _=1,2 do local nd = (pp-op).Magnitude; tt = nd/400; pp = tp + (tv*tt) end
            local fd = pp - op
            if fd.Magnitude < 0.1 then return nil,nil,nil,nil end
            return fd.Unit, g, op, pp
        end
        local mode = VD.TOF_TargetMode or "Killer"
        if mode=="Killer" then
            local bt, bc, bs = nil, nil, math.huge
            for _,p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and TeamIs(p, "Killer") and p.Character then
                    local t = p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or p.Character:FindFirstChild("HumanoidRootPart")
                    if t then local d = (mp-t.Position).Magnitude; if d < bs then bs=d; bt=t; bc=p.Character end end
                end
            end
            if not bt then return nil,nil,nil,nil end
            return predict(bt, bc)
        elseif mode=="Survivors" then
            local bt, bc, bd = nil, nil, -math.huge
            local cam = workspace.CurrentCamera
            local cl = cam.CFrame.LookVector
            for _,p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and TeamIs(p, "Survivor") and p.Character then
                    local t = p.Character:FindFirstChild("Torso") or p.Character:FindFirstChild("UpperTorso") or p.Character:FindFirstChild("HumanoidRootPart")
                    if t then
                        local dt = t.Position - cam.CFrame.Position
                        if dt.Magnitude>0.1 then
                            local dot = cl:Dot(dt.Unit)
                            if dot>0.5 and dot>bd then bd=dot; bt=t; bc=p.Character end
                        end
                    end
                end
            end
            if not bt then return nil,nil,nil,nil end
            return predict(bt, bc)
        elseif mode=="Zombie" then
            local bp, bd = nil, -math.huge
            local cam = workspace.CurrentCamera
            local cl = cam.CFrame.LookVector
            for _,r in ipairs(ToF_GetSCPs()) do
                if r and r.Parent then
                    local dt = r.Position - cam.CFrame.Position
                    if dt.Magnitude>0.1 then
                        local dot = cl:Dot(dt.Unit)
                        if dot>0.5 and dot>bd then bd=dot; bp=r end
                    end
                end
            end
            if not bp then return nil,nil,nil,nil end
            return predict(bp, bp.Parent)
        end
        return nil,nil,nil,nil
    end
    local function ToF_UpdateLaser(op, tp)
        if not ToFState.LaserBeam then
            local l = Instance.new("Part"); l.Name="ToFLaser"; l.Anchored=true
            l.CanCollide=false; l.CanTouch=false; l.CastShadow=false
            l.Material=Enum.Material.Neon; l.Color=_G.GLUTO_THEME; l.Parent=workspace
            ToFState.LaserBeam = l
        end
        local d = (tp-op).Magnitude
        ToFState.LaserBeam.Size = Vector3.new(0.05,0.05,d)
        ToFState.LaserBeam.CFrame = CFrame.new((op+tp)/2, tp)
        ToFState.LaserBeam.Transparency = 0
    end
    local function ToF_ClearLaser()
        if ToFState.LaserBeam then pcall(function() ToFState.LaserBeam:Destroy() end); ToFState.LaserBeam=nil end
    end
    local function ToF_GetMobileBtn()
        local pg = LocalPlayer:FindFirstChild("PlayerGui")
        local sm = pg and pg:FindFirstChild("Survivor-mob")
        local ct = sm and sm:FindFirstChild("Controls")
        local gm = ct and ct:FindFirstChild("Gui-mob")
        if not gm then return nil end
        for _,n in ipairs({"attack","Attack","shoot","Shoot","fire","Fire"}) do
            local b = gm:FindFirstChild(n,true)
            if b and b:IsA("GuiObject") then return b end
        end
        for _,o in ipairs(gm:GetDescendants()) do if o:IsA("GuiButton") and o.Visible then return o end end
        return gm:IsA("GuiObject") and gm or nil
    end
    local function ToF_IsTouchShoot(input)
        local sb = ToF_GetMobileBtn()
        if not (sb and sb.Visible) then return false end
        local p = input.Position; local ap = sb.AbsolutePosition; local az = sb.AbsoluteSize
        return p.X>=ap.X and p.X<=ap.X+az.X and p.Y>=ap.Y and p.Y<=ap.Y+az.Y
    end
    local function ToF_Shoot()
        if not VD.TOF_SilentAim then return end
        if ToF_IsBlocked() then return end
        local td, g, op, tp = ToF_GetTarget()
        if not (td and g and tp and op) then return end
        local e = ToF_GetEvent(); if not e then return end
        local fd = tp - op
        if fd.Magnitude < 0.1 then return end
        pcall(function() e:FireServer(g, fd.Unit) end)
    end
    local ToF_ModeButtons = {}
    local ToF_BgColor = Color3.fromRGB(15, 15, 15)
    local ToF_HoverColor = Color3.fromRGB(25, 25, 25)
    local ToF_ModeConfig = { Killer={Color=_G.GLUTO_THEME,Label="KILLER",Hint="K"}, Survivors={Color=_G.GLUTO_THEME,Label="SURVIVOR",Hint="J"}, Zombie={Color=_G.GLUTO_THEME,Label="ZOMBIE",Hint="L"} }
    local function ToF_RefreshButtons()
        for n, b in pairs(ToF_ModeButtons) do
            if b and b.Parent then
                local isActive = n == (VD.TOF_TargetMode or "Killer")
                local cfg = ToF_ModeConfig[n]
                local ind = b:FindFirstChild("Indicator"); local lb = b:FindFirstChild("ModeLabel")
                local hn = b:FindFirstChild("HintLabel"); local st = b:FindFirstChildOfClass("UIStroke")
                if isActive then
                    TweenService:Create(b, TweenInfo.new(0.25), { BackgroundColor3 = Color3.fromRGB(30, 30, 30) }):Play()
                    if ind then TweenService:Create(ind, TweenInfo.new(0.25), { Size = UDim2.new(0, 3, 0.6, 0), BackgroundColor3 = cfg.Color, BackgroundTransparency = 0 }):Play() end
                    if lb then TweenService:Create(lb, TweenInfo.new(0.25), { TextColor3 = _G.GLUTO_THEME }):Play() end
                    if hn then TweenService:Create(hn, TweenInfo.new(0.25), { TextColor3 = cfg.Color, TextTransparency = 0 }):Play() end
                    if st then TweenService:Create(st, TweenInfo.new(0.25), { Color = _G.GLUTO_THEME, Transparency = 0.2 }):Play() end
                else
                    TweenService:Create(b, TweenInfo.new(0.25), { BackgroundColor3 = Color3.fromRGB(15, 15, 15) }):Play()
                    if ind then TweenService:Create(ind, TweenInfo.new(0.25), { Size = UDim2.new(0, 3, 0, 0), BackgroundTransparency = 1 }):Play() end
                    if lb then TweenService:Create(lb, TweenInfo.new(0.25), { TextColor3 = Color3.fromRGB(170, 170, 170) }):Play() end
                    if hn then TweenService:Create(hn, TweenInfo.new(0.25), { TextColor3 = Color3.fromRGB(120, 120, 120), TextTransparency = 0.3 }):Play() end
                    if st then TweenService:Create(st, TweenInfo.new(0.25), { Color = Color3.fromRGB(60, 60, 60), Transparency = 0.5 }):Play() end
                end
            end
        end
    end
    local function ToF_SetTargetMode(mode, notify)
        if mode ~= "Killer" and mode ~= "Survivors" and mode ~= "Zombie" then return end
        VD.TOF_TargetMode = mode
        ToF_RefreshButtons()
        if notify then VD_Notify("ToF Target", mode, 1) end
    end
    local function ToF_DestroyUI()
        if ToFState.TargetGui then pcall(function() ToFState.TargetGui:Destroy() end); ToFState.TargetGui = nil end
        ToF_ModeButtons = {}
    end
    local function ToF_CreateUI()
    local parent = SafeGuiParent(); if not parent then return end
    if ToFState.TargetGui and ToFState.TargetGui.Parent then return end
    local old = parent:FindFirstChild("ToFTargetSelector"); if old then pcall(function() old:Destroy() end) end
    
    local gui = Instance.new("ScreenGui")
    gui.Name = "ToFTargetSelector"; gui.ResetOnSpawn = false
    gui.IgnoreGuiInset = true; gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.Parent = parent

    -- ===== FRAME UTAMA =====
    local frame = Instance.new("Frame")
    frame.Name = "Main"
    frame.Size = UDim2.new(0, 200, 0, 155)
    frame.Position = ToFState.SavedUIPos
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BorderSizePixel = 0
    frame.Active = true
    frame.ClipsDescendants = true
    frame.ZIndex = 1
    frame.Parent = gui
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 14)
    
    local bgGrad = Instance.new("UIGradient")
    bgGrad.Color = ColorSequence.new(Color3.fromRGB(25, 25, 25), Color3.fromRGB(10, 10, 10))
    bgGrad.Rotation = 135
    bgGrad.Parent = frame

    local outerStroke = Instance.new("UIStroke", frame)
    outerStroke.Color = Color3.fromRGB(80, 80, 80)
    outerStroke.Thickness = 1.2
    outerStroke.Transparency = 0.2
    outerStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    -- Garis Aksen Atas
    local accentBar = Instance.new("Frame")
    accentBar.Size = UDim2.new(1, -24, 0, 2)
    accentBar.Position = UDim2.new(0, 12, 0, 0)
    accentBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    accentBar.BorderSizePixel = 0
    accentBar.ZIndex = 2
    accentBar.Parent = frame
    Instance.new("UICorner", accentBar).CornerRadius = UDim.new(1, 0)
    local acGrad = Instance.new("UIGradient", accentBar)
    acGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1)
    })

    -- ===== HEADER =====
    local header = Instance.new("Frame")
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 38)
    header.Position = UDim2.new(0, 0, 0, 2)
    header.BackgroundTransparency = 1
    header.ZIndex = 2
    header.Parent = frame

    -- Ikon Target
    local ic = Instance.new("Frame")
    ic.Size = UDim2.fromOffset(20, 20)
    ic.Position = UDim2.new(0, 14, 0.5, -10)
    ic.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ic.BackgroundTransparency = 0.9
    ic.BorderSizePixel = 0
    ic.ZIndex = 3
    ic.Parent = header
    Instance.new("UICorner", ic).CornerRadius = UDim.new(1, 0)
    
    local ics = Instance.new("UIStroke", ic)
    ics.Color = Color3.fromRGB(255, 255, 255); ics.Thickness = 1.2; ics.Transparency = 0.4

    local dot = Instance.new("Frame")
    dot.Size = UDim2.fromOffset(6, 6)
    dot.Position = UDim2.new(0.5, -3, 0.5, -3)
    dot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    dot.BorderSizePixel = 0
    dot.ZIndex = 4
    dot.Parent = ic
    Instance.new("UICorner", dot).CornerRadius = UDim.new(1, 0)

    -- Judul
    local title = Instance.new("TextLabel")
    title.Size = UDim2.new(1, -120, 0, 14)
    title.Position = UDim2.new(0, 42, 0, 5)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.Text = "SILENT AIM"
    title.TextColor3 = Color3.fromRGB(255, 255, 255)
    title.TextSize = 11
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.ZIndex = 3
    title.Parent = header

    local sub = Instance.new("TextLabel")
    sub.Size = UDim2.new(1, -120, 0, 10)
    sub.Position = UDim2.new(0, 42, 0, 20)
    sub.BackgroundTransparency = 1
    sub.Font = Enum.Font.GothamMedium
    sub.Text = "Twist of Fate"
    sub.TextColor3 = Color3.fromRGB(150, 150, 150)
    sub.TextSize = 9
    sub.TextXAlignment = Enum.TextXAlignment.Left
    sub.ZIndex = 3
    sub.Parent = header

    -- Status Pill (LIVE)
    local sp = Instance.new("Frame")
    sp.AnchorPoint = Vector2.new(1, 0.5)
    sp.Size = UDim2.fromOffset(44, 18)
    sp.Position = UDim2.new(1, -36, 0.5, 0)
    sp.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    sp.BorderSizePixel = 0
    sp.ZIndex = 3
    sp.Parent = header
    Instance.new("UICorner", sp).CornerRadius = UDim.new(1, 0)
    
    local sps = Instance.new("UIStroke", sp)
    sps.Color = Color3.fromRGB(255, 255, 255); sps.Thickness = 1; sps.Transparency = 0.7

    local sd = Instance.new("Frame")
    sd.Size = UDim2.fromOffset(5, 5)
    sd.Position = UDim2.new(0, 8, 0.5, -2.5)
    sd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sd.BorderSizePixel = 0
    sd.ZIndex = 4
    sd.Parent = sp
    Instance.new("UICorner", sd).CornerRadius = UDim.new(1, 0)

    local st = Instance.new("TextLabel")
    st.Size = UDim2.new(1, -16, 1, 0)
    st.Position = UDim2.new(0, 16, 0, 0)
    st.BackgroundTransparency = 1
    st.Font = Enum.Font.GothamBold
    st.Text = "LIVE"
    st.TextColor3 = Color3.fromRGB(255, 255, 255)
    st.TextSize = 8
    st.TextXAlignment = Enum.TextXAlignment.Left
    st.ZIndex = 4
    st.Parent = sp

    -- Animasi Live Berkedip
    task.spawn(function()
        while sd.Parent do
            TweenService:Create(sd, TweenInfo.new(0.8, Enum.EasingStyle.Sine), { BackgroundTransparency = 0.8 }):Play()
            task.wait(0.8)
            if not sd.Parent then break end
            TweenService:Create(sd, TweenInfo.new(0.8, Enum.EasingStyle.Sine), { BackgroundTransparency = 0 }):Play()
            task.wait(0.8)
        end
    end)

    -- Tombol Minimize
    local minBtn = Instance.new("TextButton")
    minBtn.Name = "MinBtn"
    minBtn.AnchorPoint = Vector2.new(1, 0.5)
    minBtn.Size = UDim2.fromOffset(22, 22)
    minBtn.Position = UDim2.new(1, -8, 0.5, 0)
    minBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    minBtn.BorderSizePixel = 0
    minBtn.Text = "−"
    minBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    minBtn.Font = Enum.Font.GothamBold
    minBtn.TextSize = 14
    minBtn.AutoButtonColor = false
    minBtn.ZIndex = 4
    minBtn.Parent = header
    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)
    
    local mS = Instance.new("UIStroke", minBtn)
    mS.Color = Color3.fromRGB(255, 255, 255); mS.Thickness = 1; mS.Transparency = 0.5

    minBtn.MouseEnter:Connect(function() TweenService:Create(minBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(60, 60, 60) }):Play() end)
    minBtn.MouseLeave:Connect(function() TweenService:Create(minBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(35, 35, 35) }):Play() end)

    -- Divider
    local sep = Instance.new("Frame")
    sep.Name = "Separator"
    sep.Size = UDim2.new(1, -24, 0, 1)
    sep.Position = UDim2.new(0, 12, 0, 38)
    sep.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    sep.BackgroundTransparency = 0.85
    sep.BorderSizePixel = 0
    sep.ZIndex = 2
    sep.Parent = frame

    -- ===== BODY =====
    local body = Instance.new("Frame")
    body.Name = "Body"
    body.Size = UDim2.new(1, -16, 1, -56)
    body.Position = UDim2.new(0, 8, 0, 44)
    body.BackgroundTransparency = 1
    body.ZIndex = 2
    body.Parent = frame

    local bl = Instance.new("UIListLayout", body)
    bl.FillDirection = Enum.FillDirection.Vertical
    bl.SortOrder = Enum.SortOrder.LayoutOrder
    bl.Padding = UDim.new(0, 4)

    ToF_ModeButtons = {}
    for i, m in ipairs({ {Internal="Killer",Order=1}, {Internal="Survivors",Order=2}, {Internal="Zombie",Order=3} }) do
        local cfg = ToF_ModeConfig[m.Internal]
        
        local btn = Instance.new("TextButton")
        btn.Name = "ModeBtn_" .. m.Internal
        btn.Size = UDim2.new(1, 0, 0, 28)
        btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        btn.BorderSizePixel = 0
        btn.Text = ""
        btn.AutoButtonColor = false
        btn.LayoutOrder = m.Order
        btn.ZIndex = 3
        btn.ClipsDescendants = true
        btn.Parent = body
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)
        
        local btnStroke = Instance.new("UIStroke", btn)
        btnStroke.Color = Color3.fromRGB(50, 50, 50)
        btnStroke.Thickness = 1
        btnStroke.Transparency = 0.5

        -- Garis Aksen Kiri (Active Indicator)
        local ind = Instance.new("Frame")
        ind.Name = "Indicator"
        ind.AnchorPoint = Vector2.new(0, 0.5)
        ind.Size = UDim2.new(0, 3, 0, 0)
        ind.Position = UDim2.new(0, 0, 0.5, 0)
        ind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ind.BackgroundTransparency = 1
        ind.BorderSizePixel = 0
        ind.ZIndex = 4
        ind.Parent = btn
        Instance.new("UICorner", ind).CornerRadius = UDim.new(1, 0)

        -- Teks Nama Mode
        local lb = Instance.new("TextLabel")
        lb.Name = "ModeLabel"
        lb.Size = UDim2.new(1, -60, 1, 0)
        lb.Position = UDim2.new(0, 14, 0, 0)
        lb.BackgroundTransparency = 1
        lb.Font = Enum.Font.GothamBold
        lb.Text = cfg.Label
        lb.TextColor3 = Color3.fromRGB(180, 180, 180)
        lb.TextSize = 11
        lb.TextXAlignment = Enum.TextXAlignment.Left
        lb.ZIndex = 4
        lb.Parent = btn

        -- Kotak Keybind (Hint)
        local hn = Instance.new("TextLabel")
        hn.Name = "HintLabel"
        hn.AnchorPoint = Vector2.new(1, 0.5)
        hn.Size = UDim2.fromOffset(20, 18)
        hn.Position = UDim2.new(1, -8, 0.5, 0)
        hn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        hn.BorderSizePixel = 0
        hn.Font = Enum.Font.GothamBold
        hn.Text = cfg.Hint
        hn.TextColor3 = Color3.fromRGB(150, 150, 150)
        hn.TextSize = 9
        hn.ZIndex = 4
        hn.Parent = btn
        Instance.new("UICorner", hn).CornerRadius = UDim.new(0, 4)

        -- Animasi Hover
        btn.MouseEnter:Connect(function()
            if VD.TOF_TargetMode ~= m.Internal then 
                TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(35, 35, 35) }):Play()
                TweenService:Create(btnStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(100, 100, 100) }):Play()
            end
        end)
        btn.MouseLeave:Connect(function()
            if VD.TOF_TargetMode ~= m.Internal then 
                TweenService:Create(btn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(25, 25, 25) }):Play()
                TweenService:Create(btnStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(50, 50, 50) }):Play()
            end
        end)
        
        btn.MouseButton1Click:Connect(function() ToF_SetTargetMode(m.Internal, false) end)
        btn.InputEnded:Connect(function(inp) 
            if inp.UserInputType == Enum.UserInputType.Touch then ToF_SetTargetMode(m.Internal, false) end 
        end)
        
        ToF_ModeButtons[m.Internal] = btn
    end

    -- Footer
    local ft = Instance.new("Frame")
    ft.Name = "Footer"
    ft.AnchorPoint = Vector2.new(0.5, 1)
    ft.Size = UDim2.new(1, -16, 0, 18)
    ft.Position = UDim2.new(0.5, 0, 1, -6)
    ft.BackgroundTransparency = 1
    ft.ZIndex = 3
    ft.Parent = frame

    local flb = Instance.new("TextLabel")
    flb.Size = UDim2.new(1, 0, 1, 0)
    flb.BackgroundTransparency = 1
    flb.Font = Enum.Font.GothamMedium
    flb.Text = "Drag header • K / J / L to swap"
    flb.TextColor3 = Color3.fromRGB(120, 120, 120)
    flb.TextSize = 9
    flb.TextXAlignment = Enum.TextXAlignment.Center
    flb.ZIndex = 4
    flb.Parent = ft

    ToF_RefreshButtons()

    -- Animasi Masuk (Slide In)
    frame.BackgroundTransparency = 1
    frame.Size = UDim2.new(0, 180, 0, 120)
    frame.Rotation = 5
    task.spawn(function()
        task.wait(0.05)
        local eO = TweenInfo.new(0.45, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
        TweenService:Create(frame, eO, { Size = UDim2.new(0, 200, 0, 155), BackgroundTransparency = 0, Rotation = 0 }):Play()
        task.wait(0.08)
        for i, btn in ipairs(body:GetChildren()) do
            if btn:IsA("TextButton") then
                btn.Position = UDim2.new(-0.6, 0, 0, 0)
                btn.BackgroundTransparency = 0.6
                task.delay(i * 0.06, function()
                    TweenService:Create(btn, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Position = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 0 }):Play()
                end)
            end
        end
    end)

    -- Drag Logic
    local drg = false; local ds, sps2
    header.InputBegan:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then
            ds = inp.Position; sps2 = frame.Position; drg = true
        end
    end)
    header.InputEnded:Connect(function(inp)
        if inp.UserInputType == Enum.UserInputType.MouseButton1 or inp.UserInputType == Enum.UserInputType.Touch then drg = false end
    end)
    UserInputService.InputChanged:Connect(function(inp)
        if not drg then return end
        if inp.UserInputType == Enum.UserInputType.MouseMovement or inp.UserInputType == Enum.UserInputType.Touch then
            local d = inp.Position - ds
            local np = UDim2.new(sps2.X.Scale, sps2.X.Offset + d.X, sps2.Y.Scale, sps2.Y.Offset + d.Y)
            frame.Position = np; ToFState.SavedUIPos = np
        end
    end)

    -- Minimize Logic
    local min = false; local origSize = UDim2.new(0, 200, 0, 155)
    minBtn.MouseButton1Click:Connect(function()
        min = not min
        if min then
            origSize = frame.Size
            TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 200, 0, 38) }):Play()
            body.Visible = false; sep.Visible = false; ft.Visible = false
            minBtn.Text = "+"
        else
            TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = origSize }):Play()
            task.wait(0.15)
            body.Visible = true; sep.Visible = true; ft.Visible = true
            minBtn.Text = "−"
        end
    end)
    
    ToFState.TargetGui = gui
end
    local function ToF_StartConn()
        if ToFState.Connection then return end
        ToFState.Connection = RunService.Heartbeat:Connect(function()
            if ToF_IsBlocked() then
                ToFState.IsAiming = false
                if ToFState.TouchInput then ToFState.TouchInput = nil end
                if ToFState.LaserBeam then ToFState.LaserBeam.Transparency = 1 end
                return
            end
            if not VD.TOF_SilentAim or not ToFState.IsAiming then
                if ToFState.LaserBeam then ToFState.LaserBeam.Transparency = 1 end
                return
            end
            local _, _, op, tp = ToF_GetTarget()
            if op and tp then
                pcall(function()
                    local c = LocalPlayer.Character
                    local hrp = c and c:FindFirstChild("HumanoidRootPart")
                    if hrp and not c:GetAttribute("IsCarried") then
                        hrp.CFrame = CFrame.new(hrp.Position, Vector3.new(tp.X, hrp.Position.Y, tp.Z))
                    end
                end)
                if VD.TOF_Laser then ToF_UpdateLaser(op, tp)
                elseif ToFState.LaserBeam then ToFState.LaserBeam.Transparency = 1 end
            elseif ToFState.LaserBeam then ToFState.LaserBeam.Transparency = 1 end
        end)
    end
    local function ToF_StopConn()
        if ToFState.Connection then pcall(function() ToFState.Connection:Disconnect() end); ToFState.Connection = nil end
        ToFState.IsAiming = false; ToF_ClearLaser()
    end
    local SetToFSilentAim
    local function ToF_EnsureInputs()
        if not ToFState.InputBegan then
            ToFState.InputBegan = UserInputService.InputBegan:Connect(function(inp, gp)
                if gp then return end
                local k = ToFKeyCodes[VD.TOF_Key or "None"]
                if k and inp.UserInputType == Enum.UserInputType.Keyboard and inp.KeyCode == k then
                    SetToFSilentAim(not VD.TOF_SilentAim); return
                end
                if not VD.TOF_SilentAim then return end
                if inp.UserInputType == Enum.UserInputType.MouseButton1 or (inp.UserInputType == Enum.UserInputType.Touch and ToF_IsTouchShoot(inp)) then
                    if ToF_IsBlocked() then ToFState.IsAiming = false; return end
                    ToFState.IsAiming = true
                    if inp.UserInputType == Enum.UserInputType.Touch then ToFState.TouchInput = inp end
                    return
                end
                if inp.UserInputType == Enum.UserInputType.Keyboard then
                    if inp.KeyCode == Enum.KeyCode.K then ToF_SetTargetMode("Killer", true)
                    elseif inp.KeyCode == Enum.KeyCode.J then ToF_SetTargetMode("Survivors", true)
                    elseif inp.KeyCode == Enum.KeyCode.L then ToF_SetTargetMode("Zombie", true) end
                end
            end)
        end
        if not ToFState.InputEnded then
            ToFState.InputEnded = UserInputService.InputEnded:Connect(function(inp)
                if inp.UserInputType == Enum.UserInputType.MouseButton1 or (inp.UserInputType == Enum.UserInputType.Touch and inp == ToFState.TouchInput) then
                    local wa = ToFState.IsAiming
                    ToFState.IsAiming = false
                    if inp == ToFState.TouchInput then ToFState.TouchInput = nil end
                    if ToFState.LaserBeam then ToFState.LaserBeam.Transparency = 1 end
                    if wa then
                        if ToF_IsBlocked() then return end
                        ToF_Shoot()
                    end
                end
            end)
        end
    end
    SetToFSilentAim = function(en)
        -- [UNLOCKED] tidak ada guard lagi
        VD.TOF_SilentAim = en and true or false
        ToF_EnsureInputs()
        if VD.TOF_SilentAim then ToF_CreateUI(); ToF_StartConn()
        else ToF_DestroyUI(); ToF_StopConn() end
    end
    W.SetToFSilentAim = SetToFSilentAim
    W.ToF_ClearLaser = ToF_ClearLaser
    W.ToF_SetTargetMode = ToF_SetTargetMode
    ToF_EnsureInputs()
--====================================================--
-- SILENT AIM TOF V3.5 (Fire Bypass When Knocked)
--====================================================--
do
    VD.TOF3_SilentAim       = VD.TOF3_SilentAim       or false
    VD.TOF3_TargetType      = VD.TOF3_TargetType      or "Killer"
    VD.TOF3_FOVRadius       = VD.TOF3_FOVRadius       or 150
    VD.TOF3_AutoPrediction  = VD.TOF3_AutoPrediction  ~= false
    VD.TOF3_AdaptiveDamping = VD.TOF3_AdaptiveDamping ~= false
    VD.TOF3_ShowFOV         = VD.TOF3_ShowFOV         or false
    VD.TOF3_LaserESP        = VD.TOF3_LaserESP        ~= false
    VD.TOF3_ShowTargetUI    = VD.TOF3_ShowTargetUI    or false
    VD.TOF3_LaserRequireTOF = VD.TOF3_LaserRequireTOF or false
    VD.TOF3_AllowShootKnocked = VD.TOF3_AllowShootKnocked ~= false
    VD.TOF3_BlockAimKnocked = VD.TOF3_BlockAimKnocked or false

    local S3 = {
        Active = false, TargetChar = nil, AimPoint = nil,
        Velocity = Vector3.new(0,0,0), Hist = {}, LastChar = nil,
        Debug = nil, FOVGui = nil, HookInstalled = false,
        LaserFrom = nil, LaserTo = nil, LaserPart = nil,
        IsAiming = false, AimTouchInput = nil,
        LastFireTime = 0,
    }

    local TOF3_Remote = nil
    pcall(function()
        TOF3_Remote = ReplicatedStorage:FindFirstChild("Remotes")
            and ReplicatedStorage.Remotes:FindFirstChild("Items")
            and ReplicatedStorage.Remotes.Items:FindFirstChild("Twist of Fate")
            and ReplicatedStorage.Remotes.Items["Twist of Fate"]:FindFirstChild("Fire")
    end)

    local function TOF3_IsSelfKnocked()
        local c = LocalPlayer.Character
        if not c then return false end
        if c:GetAttribute("Knocked") == true then return true end
        if c:GetAttribute("IsHooked") == true then return true end
        if c:GetAttribute("isHooked") == true then return true end
        if c:GetAttribute("IsCarried") == true then return true end
        if c:GetAttribute("isCarried") == true then return true end
        local st = c:GetAttribute("State")
        if st == "Downed" or st == "Dead" then return true end
        return false
    end

    local function TOF3_IsZombieName(name)
        if type(name) ~= "string" or name == "" then return false end
        local ln = string.lower(name)
        if string.find(ln, "zombie", 1, true) then return true end
        if ln == "scp" then return true end
        for i = 1, 9 do
            if ln == ("scp" .. i) then return true end
            if string.find(ln, "^scp%-" .. i) then return true end
        end
        return false
    end

    local function TOF3_GetModelRoot(m)
        if not m then return nil end
        if m.PrimaryPart then return m.PrimaryPart end
        local hrp = m:FindFirstChild("HumanoidRootPart")
        if hrp and hrp:IsA("BasePart") then return hrp end
        for _, c in ipairs(m:GetChildren()) do
            if c:IsA("BasePart") then return c end
        end
        return nil
    end

    local function TOF3_IsDowned(char)
        if not char then return true end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hrp then return true end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum and hum.Health <= 0 then return true end
        local state = char:GetAttribute("State")
        if state == "Downed" or state == "Dead" then return true end
        if char:GetAttribute("Knocked") == true then return true end
        if char:GetAttribute("IsHooked") == true then return true end
        if char:GetAttribute("isHooked") == true then return true end
        if char:GetAttribute("Hooked") == true then return true end
        if char:GetAttribute("IsCarried") == true then return true end
        if char:GetAttribute("isCarried") == true then return true end
        if char:GetAttribute("Carried") == true then return true end
        if char:GetAttribute("IsDown") == true then return true end
        if char:GetAttribute("Downed") == true then return true end
        return false
    end

    local function TOF3_GetTargetPos(char)
        if not char then return nil end
        local upper = char:FindFirstChild("UpperTorso")
        if upper and upper:IsA("BasePart") then return upper.Position end
        local torso = char:FindFirstChild("Torso")
        if torso and torso:IsA("BasePart") then return torso.Position end
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if hrp then return hrp.Position end
        return nil
    end

    -- ==== GUN PART (buat fire bypass) ====
    local function TOF3_GetGunPart()
        local char = LocalPlayer.Character
        if not char then return nil end
        local tof = char:FindFirstChild("Twist of Fate")
        if not tof then return nil end
        local ra = tof:FindFirstChild("Right Arm")
        if ra then
            local gunInner = ra:FindFirstChild("gun")
            if gunInner then
                local nestedGun = gunInner:FindFirstChild("gun")
                if nestedGun and nestedGun:IsA("BasePart") then return nestedGun end
                if gunInner:IsA("BasePart") then return gunInner end
            end
            local eg = ra:FindFirstChild("EmperorGun")
            if eg and eg:IsA("BasePart") then return eg end
            if ra:IsA("BasePart") then return ra end
        end
        return tof
    end

    local function TOF3_GetGunPos()
        local gp = TOF3_GetGunPart()
        if gp and gp:IsA("BasePart") then return gp.Position end
        local char = LocalPlayer.Character
        if not char then return nil end
        local hand = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
        if hand then return hand.Position end
        return nil
    end

    local TOF3_Accum = 0
    local TOF3_Interval = 0.02

    local function TOF3_ClearState()
        S3.TargetChar = nil; S3.AimPoint = nil; S3.Debug = nil
        S3.LaserFrom = nil; S3.LaserTo = nil
    end

    local function TOF3_UpdateTarget()
        if not S3.Active then TOF3_ClearState(); return end
        if VD.TOF3_BlockAimKnocked and TOF3_IsSelfKnocked() then TOF3_ClearState(); return end

        local char = LocalPlayer.Character
        if not char then return end
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        local cam = Workspace.CurrentCamera
        if not cam then return end

        local bestPos, bestChar, bestDist = nil, nil, math.huge
        local mode = VD.TOF3_TargetType or "Killer"

        if mode == "Zombie" then
            local searchRoot = Workspace:FindFirstChild("Map") or Workspace
            for _, m in ipairs(searchRoot:GetDescendants()) do
                if m:IsA("Model") and TOF3_IsZombieName(m.Name) then
                    local isPlayerChar = false
                    if m == char then isPlayerChar = true
                    else
                        for _, p in ipairs(Players:GetPlayers()) do
                            if p.Character == m then isPlayerChar = true; break end
                        end
                    end
                    if not isPlayerChar then
                        local hum = m:FindFirstChildOfClass("Humanoid")
                        local hrp = TOF3_GetModelRoot(m)
                        if hum and hum.Health > 0 and hrp and hrp.Parent then
                            local d = (hrp.Position - root.Position).Magnitude
                            if d < bestDist then bestDist=d; bestPos=hrp.Position; bestChar=m end
                        end
                    end
                end
            end
            if not bestChar and searchRoot ~= Workspace then
                for _, m in ipairs(Workspace:GetDescendants()) do
                    if m:IsA("Model") and TOF3_IsZombieName(m.Name) then
                        local isPlayerChar = false
                        if m == char then isPlayerChar = true
                        else
                            for _, p in ipairs(Players:GetPlayers()) do
                                if p.Character == m then isPlayerChar = true; break end
                            end
                        end
                        if not isPlayerChar then
                            local hum = m:FindFirstChildOfClass("Humanoid")
                            local hrp = TOF3_GetModelRoot(m)
                            if hum and hum.Health > 0 and hrp and hrp.Parent then
                                local d = (hrp.Position - root.Position).Magnitude
                                if d < bestDist then bestDist=d; bestPos=hrp.Position; bestChar=m end
                            end
                        end
                    end
                end
            end
        else
            for _, player in ipairs(Players:GetPlayers()) do
                if player ~= LocalPlayer then
                    local isValid = (mode == "Killer" and TeamIs(player, "Killer"))
                                 or (mode == "Survivor" and TeamIs(player, "Survivor"))
                    if isValid and player.Character then
                        local pc = player.Character
                        local hum = pc:FindFirstChildOfClass("Humanoid")
                        if hum and hum.Health > 0 and not TOF3_IsDowned(pc) then
                            local pos = TOF3_GetTargetPos(pc)
                            if typeof(pos) == "Vector3" then
                                local d = (pos - root.Position).Magnitude
                                if d < bestDist then bestDist=d; bestPos=pos; bestChar=pc end
                            end
                        end
                    end
                end
            end
        end

        local now = tick()
        local vel = S3.Velocity
        local dot = 0

        if typeof(bestPos) == "Vector3" then
            if S3.LastChar ~= bestChar then
                S3.LastChar = bestChar; S3.Hist = {}; vel = Vector3.new(0,0,0)
            end
            local hist = S3.Hist
            table.insert(hist, { pos = bestPos, t = now })
            while #hist > 1 and hist[1].t < now - 0.4 do table.remove(hist, 1) end
            if #hist >= 2 then
                local prev = hist[#hist - 1]
                local cur = hist[#hist]
                local dt = cur.t - prev.t
                if dt > 0.001 then
                    local measured = (cur.pos - prev.pos) / dt
                    local flat = Vector3.new(measured.X, 0, measured.Z)
                    local hrp = bestChar and bestChar:FindFirstChild("HumanoidRootPart")
                    if hrp and hrp:IsA("BasePart") then
                        local ok, av = pcall(function() return hrp.AssemblyLinearVelocity end)
                        if ok and typeof(av) == "Vector3" then
                            local avFlat = Vector3.new(av.X, 0, av.Z)
                            if avFlat.Magnitude > 0.5 and avFlat.Magnitude < 100 then
                                flat = flat:Lerp(avFlat, 0.5)
                            end
                        end
                    end
                    if flat.Magnitude > 65 then flat = flat.Unit * 65 end
                    if VD.TOF3_AdaptiveDamping and vel.Magnitude > 2 and flat.Magnitude > 2 then
                        dot = vel:Dot(flat) / (vel.Magnitude * flat.Magnitude)
                        if dot < 0 then flat = flat * 0.7 end
                    end
                    vel = vel:Lerp(flat, 0.45)
                end
            end
            local vFlat = Vector3.new(vel.X, 0, vel.Z)
            if vFlat.Magnitude > 65 then vFlat = vFlat.Unit * 65 end
            vel = vFlat
        else
            S3.LastChar = nil; S3.Hist = {}; vel = Vector3.new(0,0,0)
        end
        S3.Velocity = vel

        if typeof(bestPos) ~= "Vector3" then TOF3_ClearState(); return end

        local vp, onScreen = cam:WorldToViewportPoint(bestPos)
        local inFOV = onScreen
        if onScreen then
            local center = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y/2)
            local sd = (Vector2.new(vp.X, vp.Y) - center).Magnitude
            if sd > VD.TOF3_FOVRadius then inFOV = false end
        end
        if not inFOV then TOF3_ClearState(); return end

        local origin = TOF3_GetGunPos()
        if typeof(origin) ~= "Vector3" then origin = cam.CFrame.Position end

        local chestPos = bestPos - Vector3.new(0, 1.2, 0)
        local dir = chestPos - origin
        local dist = dir.Magnitude
        if dist < 0.1 then return end

        local aimPos = chestPos
        local tof = dist / 200 + 0.1
        local lead = 0
        local velMag = S3.Velocity.Magnitude

        if VD.TOF3_AutoPrediction then
            local pred = chestPos + S3.Velocity * tof
            local predDir = pred - origin
            if predDir.Magnitude > 0.1 then
                tof = predDir.Magnitude / 200 + 0.1
                pred = chestPos + S3.Velocity * tof
            end
            aimPos = pred
            lead = (pred - chestPos).Magnitude
        end

        local finalDir = aimPos - origin
        local mag = finalDir.Magnitude
        if mag > 0.1 then
            S3.TargetChar = bestChar
            S3.AimPoint = Vector3.new(finalDir.X/mag, finalDir.Y/mag, finalDir.Z/mag)
            S3.LaserFrom = origin
            S3.LaserTo = aimPos
            S3.Debug = { dist=dist, tof=tof, lead=lead, vel=velMag, dot=dot }
        else
            TOF3_ClearState()
        end
    end

    -- ==== FIRE BYPASS (kayak V1/V2 — panggil remote sendiri) ====
    local function TOF3_FireBypass()
        if not S3.Active then return false end
        if not TOF3_Remote then return false end
        if typeof(S3.AimPoint) ~= "Vector3" then return false end
        if VD.TOF3_BlockAimKnocked and TOF3_IsSelfKnocked() then return false end
        if not VD.TOF3_AllowShootKnocked then return false end
        -- Cuma fire manual kalau lu knocked DAN game nggak fire baru-baru ini
        if not TOF3_IsSelfKnocked() then return false end
        if tick() - S3.LastFireTime < 0.1 then return false end

        local gunPart = TOF3_GetGunPart()
        if not gunPart then return false end

        S3.LastFireTime = tick()
        pcall(function()
            TOF3_Remote:FireServer(gunPart, S3.AimPoint)
        end)
        return true
    end

    -- ==== LASER ====
    local function TOF3_EnsureLaser()
        if S3.LaserPart and S3.LaserPart.Parent then return S3.LaserPart end
        local p = Instance.new("Part")
        p.Name = "TOF3_Laser"
        p.Anchored = true; p.CanCollide = false; p.CanQuery = false
        p.CanTouch = false; p.CastShadow = false
        p.Material = Enum.Material.Neon
        p.Color = Color3.fromRGB(255, 0, 0)
        p.Transparency = 1
        p.Size = Vector3.new(0.15, 0.15, 0.15)
        p.Parent = Workspace
        S3.LaserPart = p
        return p
    end

    local function TOF3_HasTOF()
        local c = LocalPlayer.Character
        if not c then return false end
        return c:FindFirstChild("Twist of Fate") ~= nil
    end

    local function TOF3_UpdateLaser()
        local part = TOF3_EnsureLaser()
        if not part then return end
        if VD.TOF3_BlockAimKnocked and TOF3_IsSelfKnocked() then part.Transparency = 1; return end

        local requireOK = true
        if VD.TOF3_LaserRequireTOF then requireOK = TOF3_HasTOF() end

        local show = VD.TOF3_LaserESP
            and S3.Active
            and S3.IsAiming
            and requireOK
            and typeof(S3.LaserFrom) == "Vector3"
            and typeof(S3.LaserTo) == "Vector3"
            and (S3.LaserFrom - S3.LaserTo).Magnitude > 0.1

        if not show then part.Transparency = 1; return end

        local fromPos, toPos = S3.LaserFrom, S3.LaserTo
        local dist = (fromPos - toPos).Magnitude
        part.Size = Vector3.new(0.15, 0.15, dist)
        part.CFrame = CFrame.new(fromPos, toPos) * CFrame.new(0, 0, -dist / 2)
        part.Transparency = 0.3
    end

    -- ==== AIM INPUT ====
    local function TOF3_IsAimButton(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then return true end
        if input.UserInputType == Enum.UserInputType.MouseButton2 then return true end
        if input.UserInputType == Enum.UserInputType.Touch then
            local pg = LocalPlayer:FindFirstChild("PlayerGui")
            if not pg then return false end
            local pos = input.Position
            for _, mobName in ipairs({"Survivor-mob", "Slasher-mob"}) do
                local mob = pg:FindFirstChild(mobName)
                if mob then
                    local controls = mob:FindFirstChild("Controls") or mob:FindFirstChild("Control")
                    if controls then
                        local attack = controls:FindFirstChild("attack", true)
                            or controls:FindFirstChild("Gui-mob", true)
                        if attack and attack:IsA("GuiObject") and attack.Visible then
                            local ap = attack.AbsolutePosition
                            local az = attack.AbsoluteSize
                            if pos.X >= ap.X and pos.X <= ap.X + az.X
                            and pos.Y >= ap.Y and pos.Y <= ap.Y + az.Y then
                                return true
                            end
                        end
                    end
                end
            end
            -- Knocked + allow → tap mana aja dianggap aim
            if VD.TOF3_AllowShootKnocked and TOF3_IsSelfKnocked() then
                return true
            end
            return false
        end
        return false
    end

    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if not S3.Active then return end
        if TOF3_IsAimButton(input) then
            S3.IsAiming = true
            if input.UserInputType == Enum.UserInputType.Touch then
                S3.AimTouchInput = input
            end
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        local wasAiming = S3.IsAiming

        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.MouseButton2 then
            S3.IsAiming = false
            S3.AimTouchInput = nil
        end
        if input == S3.AimTouchInput then
            S3.IsAiming = false
            S3.AimTouchInput = nil
        end

        -- ▼▼ FIRE BYPASS pas lepas aim & knocked ▼▼
        if wasAiming then
            task.defer(function()
                pcall(TOF3_FireBypass)
            end)
        end
    end)

    -- ==== TARGET SELECTOR UI ====
    local TOF3_TargetUI = { Index = 1 }
    local targetLabels = { "KILLER", "SURVIVOR", "SCP" }
    local targetValues = { "Killer", "Survivor", "Zombie" }

    local function TOF3_CreateTargetUI()
        if TOF3_TargetUI.ScreenGui and TOF3_TargetUI.ScreenGui.Parent then return end
        local parent = SafeGuiParent(); if not parent then return end

        local sg = Instance.new("ScreenGui")
        sg.Name = "GlutoTOF3_TargetSelector"
        sg.ResetOnSpawn = false
        sg.IgnoreGuiInset = true
        sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        sg.Parent = parent

        local shadow = Instance.new("ImageLabel")
        shadow.Name = "Shadow"
        shadow.BackgroundTransparency = 1
        shadow.Image = "rbxassetid://6014261993"
        shadow.ImageColor3 = Color3.new(0,0,0)
        shadow.ImageTransparency = 0.5
        shadow.ScaleType = Enum.ScaleType.Slice
        shadow.SliceCenter = Rect.new(49, 49, 450, 450)
        shadow.Size = UDim2.fromOffset(160, 56)
        shadow.Position = UDim2.new(0.5, 0, 0.8, 0)
        shadow.AnchorPoint = Vector2.new(0.5, 0.5)
        shadow.Parent = sg

        local mainFrame = Instance.new("Frame")
        mainFrame.Name = "MainBox"
        mainFrame.Size = UDim2.fromOffset(140, 36)
        mainFrame.Position = UDim2.new(0.5, 0, 0.8, 0)
        mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
        mainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        mainFrame.BorderSizePixel = 0
        mainFrame.Parent = sg
        Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 12)

        local bgGrad = Instance.new("UIGradient", mainFrame)
        bgGrad.Color = ColorSequence.new(Color3.fromRGB(35, 35, 35), Color3.fromRGB(15, 15, 15))
        bgGrad.Rotation = 135

        local uiStroke = Instance.new("UIStroke", mainFrame)
        uiStroke.Color = Color3.fromRGB(100, 100, 100)
        uiStroke.Transparency = 0.3
        uiStroke.Thickness = 1.2

        local targetIcon = Instance.new("ImageLabel", mainFrame)
        targetIcon.Size = UDim2.fromOffset(14, 14)
        targetIcon.Position = UDim2.new(0, 12, 0.5, -7)
        targetIcon.BackgroundTransparency = 1
        targetIcon.Image = "rbxassetid://6031091004"
        targetIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)

        local txt = Instance.new("TextLabel")
        txt.Size = UDim2.new(1, -60, 1, 0)
        txt.Position = UDim2.new(0, 32, 0, 0)
        txt.BackgroundTransparency = 1
        txt.Font = Enum.Font.GothamBold
        txt.TextSize = 11
        txt.TextColor3 = Color3.fromRGB(255, 255, 255)
        txt.Text = targetLabels[TOF3_TargetUI.Index]
        txt.TextXAlignment = Enum.TextXAlignment.Left
        txt.Parent = mainFrame

        local cycleBtn = Instance.new("TextButton")
        cycleBtn.Size = UDim2.fromOffset(24, 24)
        cycleBtn.AnchorPoint = Vector2.new(0.5, 0.5)
        cycleBtn.Position = UDim2.new(1, -18, 0.5, 0)
        cycleBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
        cycleBtn.Text = ">"
        cycleBtn.Font = Enum.Font.GothamBold
        cycleBtn.TextSize = 16
        cycleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
        cycleBtn.AutoButtonColor = false
        cycleBtn.Parent = mainFrame
        Instance.new("UICorner", cycleBtn).CornerRadius = UDim.new(1, 0)

        local btnStroke = Instance.new("UIStroke", cycleBtn)
        btnStroke.Color = Color3.fromRGB(100, 100, 100)
        btnStroke.Thickness = 1
        btnStroke.Transparency = 0.5

        cycleBtn.MouseEnter:Connect(function()
            TweenService:Create(cycleBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(255, 255, 255) }):Play()
            TweenService:Create(cycleBtn, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(10, 10, 10) }):Play()
            TweenService:Create(btnStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(255, 255, 255) }):Play()
        end)
        cycleBtn.MouseLeave:Connect(function()
            TweenService:Create(cycleBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(40, 40, 40) }):Play()
            TweenService:Create(cycleBtn, TweenInfo.new(0.15), { TextColor3 = Color3.fromRGB(255, 255, 255) }):Play()
            TweenService:Create(btnStroke, TweenInfo.new(0.15), { Color = Color3.fromRGB(100, 100, 100) }):Play()
        end)

        local function applyIndex()
            VD.TOF3_TargetType = targetValues[TOF3_TargetUI.Index]
            txt.Text = targetLabels[TOF3_TargetUI.Index]
        end

        local function cycle()
            TOF3_TargetUI.Index = TOF3_TargetUI.Index + 1
            if TOF3_TargetUI.Index > #targetLabels then TOF3_TargetUI.Index = 1 end
            applyIndex()
            VD_Notify("TOF3 Target", targetLabels[TOF3_TargetUI.Index], 1)
            TweenService:Create(txt, TweenInfo.new(0.1), { TextTransparency = 0.5 }):Play()
            task.delay(0.1, function()
                TweenService:Create(txt, TweenInfo.new(0.2), { TextTransparency = 0 }):Play()
            end)
            TweenService:Create(cycleBtn, TweenInfo.new(0.2, Enum.EasingStyle.Back), { Rotation = 180 }):Play()
            task.delay(0.2, function()
                TweenService:Create(cycleBtn, TweenInfo.new(0.1), { Rotation = 0 }):Play()
            end)
        end

        cycleBtn.MouseButton1Click:Connect(cycle)
        UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if input.KeyCode == Enum.KeyCode.T and VD.TOF3_SilentAim then cycle() end
        end)

        TOF3_TargetUI.SyncFromValue = function(val)
            for i, v in ipairs(targetValues) do
                if v == val then
                    TOF3_TargetUI.Index = i
                    txt.Text = targetLabels[i]
                    return
                end
            end
        end

        local dragging, dragStart, startPos = false, nil, nil
        mainFrame.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true; dragStart = input.Position; startPos = mainFrame.Position
            end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
                local delta = input.Position - dragStart
                local newPos = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
                mainFrame.Position = newPos
                shadow.Position = newPos
            end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = false
            end
        end)

        TOF3_TargetUI.ScreenGui = sg
        TOF3_TargetUI.MainFrame = mainFrame
        TOF3_TargetUI.SetVisible = function(v) sg.Enabled = v end
    end

    -- ==== HOOK ====
    local function TOF3_InstallHook()
        if S3.HookInstalled then return end
        if not TOF3_Remote then return end
        if typeof(hookmetamethod) ~= "function" then return end
        task.spawn(function()
            pcall(function()
                local oldNC
                oldNC = hookmetamethod(game, "__namecall", function(self, ...)
                    if getnamecallmethod() == "FireServer" and rawequal(self, TOF3_Remote) then
                        S3.LastFireTime = tick()
                        if S3.Active and typeof(S3.AimPoint) == "Vector3" then
                            local args = table.pack(...)
                            local modified = false
                            if args.n >= 3 and typeof(args[3]) == "Vector3" then
                                args[3] = S3.AimPoint; modified = true
                            elseif args.n >= 2 and typeof(args[2]) == "Vector3" then
                                args[2] = S3.AimPoint; modified = true
                            end
                            if modified then
                                return oldNC(self, table.unpack(args, 1, args.n))
                            end
                        end
                    end
                    return oldNC(self, ...)
                end)
                S3.HookInstalled = true
            end)
        end)
    end

    -- ==== FOV CIRCLE ====
    local function TOF3_InitFOV()
        if S3.FOVGui then return end
        local parent = SafeGuiParent(); if not parent then return end
        local sg = Instance.new("ScreenGui")
        sg.Name = "GlutoTOF3_FOV"; sg.ResetOnSpawn = false
        sg.IgnoreGuiInset = true; sg.DisplayOrder = 999999; sg.Parent = parent
        local frame = Instance.new("Frame")
        frame.Name = "FOV"; frame.AnchorPoint = Vector2.new(0.5, 0.5)
        frame.Position = UDim2.new(0.5, 0, 0.5, 0)
        frame.BackgroundTransparency = 1; frame.Visible = false; frame.Parent = sg
        Instance.new("UICorner", frame).CornerRadius = UDim.new(1, 0)
        local stroke = Instance.new("UIStroke")
        stroke.Color = _G.GLUTO_THEME; stroke.Thickness = 2; stroke.Transparency = 0.2
        stroke.Parent = frame
        S3.FOVGui = { sg = sg, frame = frame }
    end

    local function TOF3_UpdateFOV()
        local show = VD.TOF3_ShowFOV and S3.Active
        if show and not S3.FOVGui then TOF3_InitFOV() end
        if S3.FOVGui and S3.FOVGui.sg.Parent then
            S3.FOVGui.frame.Visible = show
            if show then
                local r = VD.TOF3_FOVRadius * 2
                S3.FOVGui.frame.Size = UDim2.fromOffset(r, r)
            end
        end
    end

    RunService.RenderStepped:Connect(function(dt)
        TOF3_Accum = TOF3_Accum + dt
        if TOF3_Accum >= TOF3_Interval then
            TOF3_Accum = 0
            pcall(TOF3_UpdateTarget)
        end
        pcall(TOF3_UpdateFOV)
        pcall(TOF3_UpdateLaser)
    end)

    TOF3_InstallHook()

    W.TOF3_SetEnabled = function(v)
        VD.TOF3_SilentAim = v and true or false
        S3.Active = VD.TOF3_SilentAim
        if v then
            TOF3_InstallHook()
            if VD.TOF3_ShowTargetUI then
                TOF3_CreateTargetUI()
                if TOF3_TargetUI.SetVisible then TOF3_TargetUI.SetVisible(true) end
            end
        else
            TOF3_ClearState()
            S3.IsAiming = false; S3.AimTouchInput = nil
            if S3.LaserPart then S3.LaserPart.Transparency = 1 end
            if TOF3_TargetUI.SetVisible then TOF3_TargetUI.SetVisible(false) end
        end
    end
    W.TOF3_SetTargetType = function(v)
        VD.TOF3_TargetType = v
        if TOF3_TargetUI.SyncFromValue then
            pcall(TOF3_TargetUI.SyncFromValue, v)
        end
    end
    W.TOF3_SetFOV        = function(v) VD.TOF3_FOVRadius = v end
    W.TOF3_SetPrediction = function(v) VD.TOF3_AutoPrediction = v and true or false end
    W.TOF3_SetDamping    = function(v) VD.TOF3_AdaptiveDamping = v and true or false end
    W.TOF3_SetShowFOV    = function(v) VD.TOF3_ShowFOV = v and true or false end
    W.TOF3_SetLaser      = function(v)
        VD.TOF3_LaserESP = v and true or false
        if not v and S3.LaserPart then S3.LaserPart.Transparency = 1 end
    end
    W.TOF3_SetLaserRequireTOF = function(v) VD.TOF3_LaserRequireTOF = v and true or false end
    W.TOF3_SetAllowShootKnocked = function(v) VD.TOF3_AllowShootKnocked = v and true or false end
    W.TOF3_SetBlockAimKnocked = function(v) VD.TOF3_BlockAimKnocked = v and true or false end
    W.TOF3_SetShowTargetUI = function(v)
        VD.TOF3_ShowTargetUI = v and true or false
        if v and VD.TOF3_SilentAim then
            TOF3_CreateTargetUI()
            if TOF3_TargetUI.SetVisible then TOF3_TargetUI.SetVisible(true) end
        else
            if TOF3_TargetUI.SetVisible then TOF3_TargetUI.SetVisible(false) end
        end
    end
    W.TOF3_GetDebug = function() return S3.Debug end
    W.TOF3_FireBypass = TOF3_FireBypass

    LocalPlayer.CharacterAdded:Connect(function()
        task.wait(1); TOF3_InstallHook()
    end)
end

    local PU = {
        SpeedEnabled = false, SpeedValue = 16,
        SkipEndScreen = false, ShiftLock = false, NoCutscene = false,
        HideSurvivorIcon = false, ShowPingFPS = false, HideName = false,
        UnlimitedZoom = false, Noclip = false,
        _Connections = {}, _FPS = { frames = 0, last = tick(), value = 0, ping = 0 },
        _origIcons = {}, _pingGui = nil, _shiftLockWasActive = false,
        _noCutsceneHooked = false, _hideNameConn = nil, _origCanCollide = {},
    }
    W.PU = PU

    table.insert(PU._Connections, RunService.Heartbeat:Connect(function()
        if not PU.SpeedEnabled then return end
        local char = LocalPlayer.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if hum and hum.WalkSpeed ~= PU.SpeedValue then hum.WalkSpeed = PU.SpeedValue end
    end))

    local function PU_ShowInstantResults()
        if not PU.SkipEndScreen then return end
        pcall(function()
            local cam = workspace.CurrentCamera
            if cam then cam.CameraType = Enum.CameraType.Custom; cam.FieldOfView = 70 end
            UserInputService.MouseIconEnabled = true
            LocalPlayer:SetAttribute("isspectating", true)
            local pg = LocalPlayer:FindFirstChild("PlayerGui")
            if pg then
                local Results  = pg:FindFirstChild("Results")
                local EndScreen= pg:FindFirstChild("EndScreen")
                local Darkness = pg:FindFirstChild("Darkness")
                if Results then Results.Enabled = true end
                if EndScreen then
                    EndScreen.Enabled = true
                    local bo = EndScreen:FindFirstChild("blackout")
                    if bo then bo.BackgroundTransparency = 1 end
                end
                if Darkness then
                    Darkness.Enabled = true
                    local f2 = Darkness:FindFirstChild("Frame2")
                    if f2 then f2.BackgroundTransparency = 1 end
                end
            end
        end)
    end
    task.spawn(function()
        local gf = ReplicatedStorage:WaitForChild("Remotes", 10)
        gf = gf and gf:WaitForChild("Game", 10)
        if not gf then return end
        for _, n in ipairs({"endscreencutscene","cutsceneEnd","cutsceneEnd2","cutsceneEndwithownchar"}) do
            local ev = gf:FindFirstChild(n)
            if ev and ev:IsA("RemoteEvent") then
                table.insert(PU._Connections, ev.OnClientEvent:Connect(PU_ShowInstantResults))
            end
        end
    end)

    table.insert(PU._Connections, RunService.RenderStepped:Connect(function()
        local char = LocalPlayer.Character; if not char then return end
        local hum  = char:FindFirstChildOfClass("Humanoid")
        local root = char:FindFirstChild("HumanoidRootPart")
        local cam  = workspace.CurrentCamera
        if not (hum and root and cam) then return end
        if PU.ShiftLock then
            hum.AutoRotate = false
            PU._shiftLockWasActive = true
            local look = cam.CFrame.LookVector
            local flat = Vector3.new(look.X, 0, look.Z)
            if flat.Magnitude > 0.001 then root.CFrame = CFrame.new(root.Position, root.Position + flat.Unit) end
        elseif PU._shiftLockWasActive then
            hum.AutoRotate = true
            PU._shiftLockWasActive = false
        end
    end))

    local function PU_SetupNoCutsceneHook()
        if PU._noCutsceneHooked then return end
        PU._noCutsceneHooked = true
        pcall(function()
            local mt = getrawmetatable(game); if not mt then return end
            if setreadonly then setreadonly(mt, false) end
            local oldIndex = mt.__index
            local fakeBindable = Instance.new("BindableEvent")
            local fakeRemote   = Instance.new("RemoteEvent")
            mt.__index = newcclosure(function(t, k)
                if PU.NoCutscene and not checkcaller() and typeof(t) == "Instance" then
                    local nm = t.Name
                    if nm == "cutscene" and k == "Event" then
                        local p = t.Parent
                        if p and p.Name == "Game" then return fakeBindable.Event end
                    elseif nm == "cutsceneEnd" or nm == "cutsceneEnd2"
                        or nm == "cutsceneEndwithownchar" or nm == "endscreencutscene" then
                        local p = t.Parent
                        if p and p.Name == "Game" then return fakeRemote.OnClientEvent end
                    end
                end
                return oldIndex(t, k)
            end)
            if setreadonly then setreadonly(mt, true) end
        end)
    end
    task.spawn(PU_SetupNoCutsceneHook)

    local HIDE_ICON_IMAGE = "rbxassetid://118748055443363"
    local HIDE_ICON_TEXT  = "Promers"

    local function PU_ApplyHideSurvivorIcon()
        local pg = LocalPlayer:FindFirstChild("PlayerGui"); if not pg then return end
        for _, gui in ipairs(pg:GetChildren()) do
            if gui:IsA("ScreenGui") and gui.Name:match("%-mob$") then
                local frame = gui:FindFirstChild("Frame")
                if frame then
                    for i = 1, 5 do
                        local sf = frame:FindFirstChild("Survivor" .. i)
                        if sf then
                            local il = sf:FindFirstChild("ImageLabel")
                            local tl = sf:FindFirstChild("TextLabel")
                            if il and il:IsA("ImageLabel") then
                                if not PU._origIcons[il] then
                                    PU._origIcons[il] = { Image = il.Image, ImageTransparency = il.ImageTransparency }
                                end
                                il.Image = HIDE_ICON_IMAGE
                                il.ImageTransparency = 0
                            end
                            if tl and tl:IsA("TextLabel") then
                                if not PU._origIcons[tl] then
                                    PU._origIcons[tl] = { Text = tl.Text, TextTransparency = tl.TextTransparency }
                                end
                                tl.Text = HIDE_ICON_TEXT
                                tl.TextTransparency = 0
                            end
                        end
                    end
                end
            end
        end
    end
    local function PU_RestoreSurvivorIcon()
        for obj, data in pairs(PU._origIcons) do
            if obj and obj.Parent then
                pcall(function()
                    if data.Image ~= nil and obj:IsA("ImageLabel") then
                        obj.Image = data.Image
                        obj.ImageTransparency = data.ImageTransparency
                    end
                    if data.Text ~= nil and obj:IsA("TextLabel") then
                        obj.Text = data.Text
                        obj.TextTransparency = data.TextTransparency
                    end
                end)
            end
        end
        PU._origIcons = {}
    end
    table.insert(PU._Connections, RunService.Heartbeat:Connect(function()
        if PU.HideSurvivorIcon then PU_ApplyHideSurvivorIcon() end
    end))

    local function PU_CreatePingFPS()
    local pg = SafeGuiParent(); if not pg then return end
    if PU._pingGui and PU._pingGui.Parent then return end
    local old = pg:FindFirstChild("GlutoPU_PingFPS"); if old then old:Destroy() end
    
    local sg = Instance.new("ScreenGui")
    sg.Name = "GlutoPU_PingFPS"; sg.ResetOnSpawn = false
    sg.IgnoreGuiInset = true; sg.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    sg.Parent = pg
    
    -- Frame Utama
    local frame = Instance.new("Frame")
    frame.Name = "MainFrame"
    frame.Size = UDim2.fromOffset(130, 48)
    frame.Position = UDim2.new(0, 12, 0, 120)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.Parent = sg
    Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
    
    local grad = Instance.new("UIGradient")
    grad.Color = ColorSequence.new(Color3.fromRGB(35, 35, 35), Color3.fromRGB(10, 10, 10))
    grad.Rotation = 135
    grad.Parent = frame

    local stroke = Instance.new("UIStroke", frame)
    stroke.Color = Color3.fromRGB(80, 80, 80)
    stroke.Thickness = 1.2
    stroke.Transparency = 0.3
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    -- Garis Aksen Atas
    local accent = Instance.new("Frame", frame)
    accent.Size = UDim2.new(1, -20, 0, 2)
    accent.Position = UDim2.new(0, 10, 0, 0)
    accent.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    accent.BorderSizePixel = 0
    Instance.new("UICorner", accent).CornerRadius = UDim.new(1, 0)
    local aGrad = Instance.new("UIGradient", accent)
    aGrad.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1)
    })

    -- Ping Row
    local pingDot = Instance.new("Frame", frame)
    pingDot.Name = "PingDot"
    pingDot.Size = UDim2.fromOffset(6, 6)
    pingDot.Position = UDim2.new(0, 12, 0.5, -12)
    pingDot.BackgroundColor3 = Color3.fromRGB(80, 220, 120)
    pingDot.BorderSizePixel = 0
    Instance.new("UICorner", pingDot).CornerRadius = UDim.new(1, 0)

    local pingLbl = Instance.new("TextLabel", frame)
    pingLbl.Name = "PingLbl"
    pingLbl.Size = UDim2.new(1, -30, 0, 16)
    pingLbl.Position = UDim2.new(0, 24, 0.5, -14)
    pingLbl.BackgroundTransparency = 1
    pingLbl.Font = Enum.Font.GothamBold
    pingLbl.Text = "PING: --ms"
    pingLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    pingLbl.TextSize = 11
    pingLbl.TextXAlignment = Enum.TextXAlignment.Left

    -- FPS Row
    local fpsDot = Instance.new("Frame", frame)
    fpsDot.Name = "FpsDot"
    fpsDot.Size = UDim2.fromOffset(6, 6)
    fpsDot.Position = UDim2.new(0, 12, 0.5, 6)
    fpsDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    fpsDot.BorderSizePixel = 0
    Instance.new("UICorner", fpsDot).CornerRadius = UDim.new(1, 0)

    local fpsLbl = Instance.new("TextLabel", frame)
    fpsLbl.Name = "FpsLbl"
    fpsLbl.Size = UDim2.new(1, -30, 0, 16)
    fpsLbl.Position = UDim2.new(0, 24, 0.5, 4)
    fpsLbl.BackgroundTransparency = 1
    fpsLbl.Font = Enum.Font.GothamBold
    fpsLbl.Text = "FPS: --"
    fpsLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    fpsLbl.TextSize = 11
    fpsLbl.TextXAlignment = Enum.TextXAlignment.Left

    PU._pingGui = sg
end
    local function PU_GetPing()
        local ok, val = pcall(function()
            local stats = game:GetService("Stats")
            local net = stats and stats:FindFirstChild("Network")
            local sv = net and net:FindFirstChild("ServerStatsItem")
            local dp = sv and sv:FindFirstChild("Data Ping")
            if dp and dp.GetValue then return math.floor(dp:GetValue() + 0.5) end
        end)
        if ok and val then return val end
        return nil
    end
    table.insert(PU._Connections, RunService.RenderStepped:Connect(function()
    if not PU.ShowPingFPS then return end
    PU._FPS.frames = PU._FPS.frames + 1
    local now = tick()
    if now - PU._FPS.last < 0.5 then return end
    PU._FPS.value = math.floor(PU._FPS.frames / (now - PU._FPS.last) + 0.5)
    PU._FPS.ping = PU_GetPing() or 0
    PU._FPS.frames = 0; PU._FPS.last = now
    
    if not (PU._pingGui and PU._pingGui.Parent) then PU_CreatePingFPS() end
    
    local pingLbl = PU._pingGui and PU._pingGui:FindFirstChild("PingLbl", true)
    local fpsLbl = PU._pingGui and PU._pingGui:FindFirstChild("FpsLbl", true)
    local pingDot = PU._pingGui and PU._pingGui:FindFirstChild("PingDot", true)
    local fpsDot = PU._pingGui and PU._pingGui:FindFirstChild("FpsDot", true)
    
    if pingLbl and fpsLbl and pingDot and fpsDot then
        local pingVal = PU._FPS.ping
        local fpsVal = PU._FPS.value
        
        -- Update Text
        pingLbl.Text = ("PING: %sms"):format(pingVal > 0 and tostring(pingVal) or "--")
        fpsLbl.Text = ("FPS: %d"):format(fpsVal)
        
        -- Update Warna Ping (Hijau, Kuning, Merah)
        if pingVal == 0 then
            pingLbl.TextColor3 = Color3.fromRGB(150,150,150)
            pingDot.BackgroundColor3 = Color3.fromRGB(150,150,150)
        elseif pingVal <= 80 then
            pingLbl.TextColor3 = Color3.fromRGB(80, 220, 120)
            pingDot.BackgroundColor3 = Color3.fromRGB(80, 220, 120)
        elseif pingVal <= 150 then
            pingLbl.TextColor3 = Color3.fromRGB(255, 200, 60)
            pingDot.BackgroundColor3 = Color3.fromRGB(255, 200, 60)
        else
            pingLbl.TextColor3 = Color3.fromRGB(255, 80, 80)
            pingDot.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
        end
        
        -- Update Warna FPS (Putih, Kuning, Merah)
        if fpsVal >= 45 then
            fpsLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
            fpsDot.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        elseif fpsVal >= 25 then
            fpsLbl.TextColor3 = Color3.fromRGB(255, 200, 60)
            fpsDot.BackgroundColor3 = Color3.fromRGB(255, 200, 60)
        else
            fpsLbl.TextColor3 = Color3.fromRGB(255, 80, 80)
            fpsDot.BackgroundColor3 = Color3.fromRGB(255, 80, 80)
        end
    end
end))

    local function PU_ProcessHideName(obj)
        if not obj then return end
        local ok, isText = pcall(function()
            return obj:IsA("TextLabel") or obj:IsA("TextButton") or obj:IsA("TextBox")
        end)
        if not ok or not isText then return end
        local txt = ""
        pcall(function() txt = tostring(obj.Text or "") end)
        if txt == "" then return end
        if txt == LocalPlayer.Name or txt == LocalPlayer.DisplayName
            or txt:find(LocalPlayer.Name, 1, true) ~= nil then
            pcall(function() obj.Visible = not PU.HideName end)
        end
    end
    local function PU_SetHideName(enabled)
        PU.HideName = enabled and true or false
        if PU._hideNameConn then pcall(function() PU._hideNameConn:Disconnect() end); PU._hideNameConn = nil end
        local pg = LocalPlayer:FindFirstChildOfClass("PlayerGui"); if not pg then return end
        for _, d in ipairs(pg:GetDescendants()) do PU_ProcessHideName(d) end
        if PU.HideName then
            PU._hideNameConn = pg.DescendantAdded:Connect(function(obj) task.defer(PU_ProcessHideName, obj) end)
        end
    end
    W.PU_SetHideName = PU_SetHideName

    table.insert(PU._Connections, RunService.RenderStepped:Connect(function()
        if not PU.UnlimitedZoom then return end
        if LocalPlayer.CameraMaxZoomDistance ~= math.huge then LocalPlayer.CameraMaxZoomDistance = math.huge end
        if LocalPlayer.CameraMinZoomDistance ~= 0 then LocalPlayer.CameraMinZoomDistance = 0 end
    end))

    table.insert(PU._Connections, RunService.Stepped:Connect(function()
        if not PU.Noclip then return end
        local char = LocalPlayer.Character; if not char then return end
        for _, d in ipairs(char:GetDescendants()) do
            if d:IsA("BasePart") then
                if PU._origCanCollide[d] == nil then PU._origCanCollide[d] = d.CanCollide end
                d.CanCollide = false
            end
        end
    end))
    local function PU_RestoreNoclip()
        for part, cc in pairs(PU._origCanCollide) do
            if part and part.Parent then pcall(function() part.CanCollide = cc end) end
        end
        PU._origCanCollide = {}
    end
    W.PU_RestoreNoclip = PU_RestoreNoclip
    LocalPlayer.CharacterRemoving:Connect(function(char)
        if char == LocalPlayer.Character then PU._origCanCollide = {} end
    end)

    W.EmoteSystem = W.EmoteSystem or {
        Enabled = false, CurrentTrack = nil, CurrentSound = nil,
        SelectedEmote = "Friday Night",
        Options = {
            "Friday Night", "WarCry", "24 Hour Cinderella", "Applause",
            "Arm Swing", "Backflip", "California Girls", "Christmas Spirit",
            "Floating Rest", "Ghoul", "Griddy", "Kyoufuu", "OnePlays", "Vulnerable",
        },
        Data = {
            ["Friday Night"]        = { Anim = "rbxassetid://83229063951016",  Sound = "rbxassetid://85355610204255" },
            ["WarCry"]              = { Anim = "rbxassetid://82600868380136",  Sound = "rbxassetid://120101930689931" },
            ["24 Hour Cinderella"]  = { Anim = "rbxassetid://137195203725366", Sound = "rbxassetid://121099446613414" },
            ["Applause"]            = { Anim = "rbxassetid://96328361165090",  Sound = "rbxassetid://115490787020749" },
            ["Arm Swing"]           = { Anim = "rbxassetid://80552139463944",  Sound = "rbxassetid://74216458932348" },
            ["Backflip"]            = { Anim = "rbxassetid://74705617908505",  Sound = nil },
            ["California Girls"]    = { Anim = "rbxassetid://123552803041504", Sound = "rbxassetid://87899327891544" },
            ["Christmas Spirit"]    = { Anim = "rbxassetid://137859761110514", Sound = nil },
            ["Floating Rest"]       = { Anim = "rbxassetid://114593021219597", Sound = nil },
            ["Ghoul"]               = { Anim = "rbxassetid://130415594909401", Sound = "rbxassetid://123004139176580" },
            ["Griddy"]              = { Anim = "rbxassetid://75586690784894",  Sound = nil },
            ["Kyoufuu"]             = { Anim = "rbxassetid://137322894494527", Sound = "rbxassetid://129064643026442" },
            ["OnePlays"]            = { Anim = "rbxassetid://140625405103474", Sound = "rbxassetid://94749073728335" },
            ["Vulnerable"]          = { Anim = "rbxassetid://121773684313913", Sound = "rbxassetid://135265751184744" },
        },
    }
    local ES = W.EmoteSystem
    function W.EmoteSystem_Stop()
        if ES.CurrentTrack then pcall(function() ES.CurrentTrack:Stop() end); ES.CurrentTrack = nil end
        if ES.CurrentSound then pcall(function() ES.CurrentSound:Destroy() end); ES.CurrentSound = nil end
    end
    function W.EmoteSystem_Play()
        W.EmoteSystem_Stop()
        local char = LocalPlayer.Character; if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        local hrp = char:FindFirstChild("HumanoidRootPart")
        if not hum or not hrp then return end
        local data = ES.Data[ES.SelectedEmote]; if not data then return end
        if data.Anim then
            local anim = Instance.new("Animation")
            anim.AnimationId = data.Anim
            local track = hum:LoadAnimation(anim)
            track.Looped = true
            track.Priority = Enum.AnimationPriority.Action
            track:Play()
            ES.CurrentTrack = track
        end
        if data.Sound then
            local snd = Instance.new("Sound")
            snd.SoundId = data.Sound; snd.Looped = true; snd.Volume = 2
            snd.Parent = hrp; snd:Play()
            ES.CurrentSound = snd
        end
    end
    function W.EmoteSystem_SetEnabled(v)
        ES.Enabled = v and true or false
        if ES.Enabled then W.EmoteSystem_Play() else W.EmoteSystem_Stop() end
    end
    function W.EmoteSystem_SelectEmote(name)
        if ES.Data[name] then
            ES.SelectedEmote = name
            if ES.Enabled then W.EmoteSystem_Play() end
        end
    end
    LocalPlayer.CharacterRemoving:Connect(function() W.EmoteSystem_Stop() end)
    LocalPlayer.CharacterAdded:Connect(function()
        task.wait(0.5)
        if ES.Enabled then W.EmoteSystem_Play() end
    end)

    W.JerkTool = W.JerkTool or { Enabled = false, ToolName = "Jerk Off" }
    do
        local JerkTool = W.JerkTool
        local currentJerkTool = nil
        local jerkRunning = false
        function W.JerkOff_Destroy()
            if currentJerkTool then pcall(function() currentJerkTool:Destroy() end); currentJerkTool = nil end
        end
        function W.JerkOff_Create()
            W.JerkOff_Destroy()
            local character = LocalPlayer.Character; if not character then return end
            local humanoid = character:FindFirstChildWhichIsA("Humanoid")
            local backpack = LocalPlayer:FindFirstChildWhichIsA("Backpack")
            if not humanoid or not backpack then return end
            local tool = Instance.new("Tool")
            tool.Name = JerkTool.ToolName
            tool.ToolTip = 'in the stripped club. straight up "jorking it" . and by "it" , haha, well. let\'s just say. My peanits.'
            tool.RequiresHandle = false
            tool.Parent = backpack
            currentJerkTool = tool
            local jorkin = false; local track = nil
            local function stopTomfoolery()
                jorkin = false
                if track then pcall(function() track:Stop() end); track = nil end
            end
            tool.Equipped:Connect(function() jorkin = true end)
            tool.Unequipped:Connect(stopTomfoolery)
            if humanoid.Died then humanoid.Died:Connect(stopTomfoolery) end
            task.spawn(function()
                while jerkRunning do
                    task.wait()
                    if not JerkTool.Enabled or not jorkin then
                        if track then pcall(function() track:Stop() end) end
                        continue
                    end
                    local isR15 = humanoid.RigType == Enum.HumanoidRigType.R15
                    if not track then
                        local anim = Instance.new("Animation")
                        anim.AnimationId = not isR15 and "rbxassetid://72042024" or "rbxassetid://698251653"
                        track = humanoid:LoadAnimation(anim)
                    end
                    track:Play()
                    track:AdjustSpeed(isR15 and 0.7 or 0.65)
                    track.TimePosition = 0.6
                    task.wait(0.1)
                    while track and track.TimePosition < (not isR15 and 0.65 or 0.7) do task.wait(0.1) end
                    if track then pcall(function() track:Stop() end) end
                end
            end)
        end
        function W.JerkOff_SetEnabled(v)
            JerkTool.Enabled = v and true or false
            jerkRunning = JerkTool.Enabled
            if v then W.JerkOff_Create() else W.JerkOff_Destroy() end
        end
        LocalPlayer.CharacterAdded:Connect(function()
            task.wait(1)
            if JerkTool.Enabled then jerkRunning = true; W.JerkOff_Create() end
        end)
    end

    do
        local FallHookInstalled = false
        local function VD_InstallNoFallHook()
            if FallHookInstalled then return end
            FallHookInstalled = true
            task.spawn(function()
                pcall(function()
                    local mt = getrawmetatable and getrawmetatable(game); if not mt then return end
                    local oldNamecall = mt.__namecall
                    if setreadonly then setreadonly(mt, false) end
                    mt.__namecall = newcclosure(function(self, ...)
                        if not checkcaller() and getgenv().VD.NoFallDamage then
                            local method = getnamecallmethod()
                            if method == "FireServer" then
                                local ok, name = pcall(function() return self.Name end)
                                if ok and name == "Fall" then
                                    local par = self.Parent
                                    if par and par.Name == "Mechanics" then return nil end
                                end
                            end
                        end
                        return oldNamecall(self, ...)
                    end)
                    if setreadonly then setreadonly(mt, true) end
                end)
            end)
        end
        VD_InstallNoFallHook()
    end

    do
        local MapPredictState = { Gui = nil, Thread = nil, Enabled = false, LastMap = "Unknown" }
        local function DetectMapName(map)
            if not map then return nil end
            if map:FindFirstChild("random shakes") or map:FindFirstChild("SCP-173 Room") or map:FindFirstChild("SCP-205 Room") then
                return "Site 68"
            elseif map:FindFirstChild("HooksMeat") then return "BLOODBATH! Club"
            elseif map:FindFirstChild("Gate") and map.Gate:FindFirstChild("vfx") then return "Firelink Shrine"
            elseif map:FindFirstChild("Bldg_Addon_RooftopUnit_A") or map:FindFirstChild("Rooftop") then return "Mercy Hospital Rooftop"
            elseif map:FindFirstChild("White Armored Car") then return "Mount Massive Asylum"
            elseif map:FindFirstChild("Dumbster") then return "The Bay Harbor"
            elseif map:FindFirstChild("water pump") then return "Valdelobos Village"
            elseif map:FindFirstChild("LargeBoulder01") then return "Woodview Cabin"
            end
            return nil
        end
        local function BuildMapGui()
            if MapPredictState.Gui then pcall(function() MapPredictState.Gui:Destroy() end) end
            local pg = SafeGuiParent(); if not pg then return end
            local gui = Instance.new("ScreenGui")
            gui.Name = "GlutoMapPredict"; gui.ResetOnSpawn = false
            gui.IgnoreGuiInset = true; gui.DisplayOrder = 50; gui.Parent = pg
            local frame = Instance.new("Frame")
            frame.Name = "MainFrame"; frame.Size = UDim2.new(0, 210, 0, 54)
            frame.Position = UDim2.new(0.5, -105, 0, 110)
            frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
            frame.BackgroundTransparency = 0.15; frame.BorderSizePixel = 0
            frame.Active = true; frame.Parent = gui
            Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 10)
            local stroke = Instance.new("UIStroke", frame)
            stroke.Color = _G.GLUTO_THEME; stroke.Thickness = 1.5
            stroke.Transparency = 0.2; stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            local title = Instance.new("TextLabel")
            title.Size = UDim2.new(1, 0, 0, 15); title.Position = UDim2.new(0, 0, 0, 5)
            title.BackgroundTransparency = 1; title.Text = "NEXT MAP PREDICTION"
            title.TextColor3 = _G.GLUTO_THEME; title.Font = Enum.Font.GothamBold
            title.TextSize = 10; title.Parent = frame
            local mapName = Instance.new("TextLabel")
            mapName.Name = "MapName"; mapName.Size = UDim2.new(1, -12, 0, 18)
            mapName.Position = UDim2.new(0, 6, 0, 21); mapName.BackgroundTransparency = 1
            mapName.Text = "Scanning..."; mapName.TextColor3 = _G.GLUTO_THEME
            mapName.Font = Enum.Font.GothamBold; mapName.TextSize = 13
            mapName.TextXAlignment = Enum.TextXAlignment.Center; mapName.Parent = frame
            local status = Instance.new("TextLabel")
            status.Name = "StatusLabel"; status.Size = UDim2.new(1, -12, 0, 12)
            status.Position = UDim2.new(0, 6, 0, 38); status.BackgroundTransparency = 1
            status.Text = "Status: Waiting"; status.TextColor3 = Color3.fromRGB(170, 170, 170)
            status.Font = Enum.Font.GothamMedium; status.TextSize = 9
            status.TextXAlignment = Enum.TextXAlignment.Center; status.Parent = frame
            local dragging, dragStart, startPos = false, nil, nil
            frame.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = true; dragStart = input.Position; startPos = frame.Position
                end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if not dragging then return end
                if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                    local d = input.Position - dragStart
                    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
                end
            end)
            UserInputService.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                    dragging = false
                end
            end)
            MapPredictState.Gui = gui
        end
        local function Stop()
            MapPredictState.Enabled = false
            if MapPredictState.Thread then pcall(function() task.cancel(MapPredictState.Thread) end); MapPredictState.Thread = nil end
            if MapPredictState.Gui then pcall(function() MapPredictState.Gui:Destroy() end); MapPredictState.Gui = nil end
        end
        local function Start()
            if MapPredictState.Enabled then return end
            MapPredictState.Enabled = true
            BuildMapGui()
            MapPredictState.Thread = task.spawn(function()
                local lastDetected, lastExisted = nil, false
                while MapPredictState.Enabled do
                    local map = Workspace:FindFirstChild("Map")
                    local mapExists = map ~= nil
                    local detected = mapExists and DetectMapName(map) or nil
                    local gui = MapPredictState.Gui
                    local frame = gui and gui:FindFirstChild("MainFrame")
                    local nameLabel = frame and frame:FindFirstChild("MapName")
                    local statusLabel = frame and frame:FindFirstChild("StatusLabel")
                    if nameLabel and statusLabel then
                        if lastExisted and not mapExists then
                            nameLabel.Text = lastDetected or "Unknown"
                            statusLabel.Text = "Status: Loading next map..."
                            statusLabel.TextColor3 = _G.GLUTO_THEME
                        elseif mapExists then
                            lastDetected = detected or "Unknown"
                            nameLabel.Text = detected or "Unknown"
                            statusLabel.Text = "Status: In-Game"
                            statusLabel.TextColor3 = _G.GLUTO_THEME
                        else
                            nameLabel.Text = "Waiting..."
                            statusLabel.Text = "Status: Lobby"
                            statusLabel.TextColor3 = Color3.fromRGB(170, 170, 170)
                        end
                    end
                    lastExisted = mapExists
                    task.wait(0.5)
                end
            end)
        end
        W.NextMapPredict_Start = Start
        W.NextMapPredict_Stop = Stop
        W.NextMapPredict_SetEnabled = function(v)
            VD.NextMapPredict = v and true or false
            if VD.NextMapPredict then Start() else Stop() end
        end
    end

    do
        local RepairEvent = nil
        pcall(function() RepairEvent = ReplicatedStorage.Remotes.Generator.RepairEvent end)
        local REPAIR_ANIM_ID = "rbxassetid://92960319113695"
        local ManualThread, AutoThread = nil, nil
        local ManualPoint, AutoPoint = nil, nil
        local LastFire = 0
        local RepairAnimTrack = nil
        local function IsKillerNearPos(pos, radius)
            for _, pl in ipairs(Players:GetPlayers()) do
                if pl ~= LocalPlayer and TeamIs(pl, "Killer") and pl.Character then
                    local hrp = pl.Character:FindFirstChild("HumanoidRootPart")
                    if hrp and (hrp.Position - pos).Magnitude <= radius then return true end
                end
            end
            return false
        end
        local function GetNearestKillerDist()
            local myChar = LocalPlayer.Character
            local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if not myRoot then return nil, math.huge end
            local best, dist = nil, math.huge
            for _, pl in ipairs(Players:GetPlayers()) do
                if pl ~= LocalPlayer and TeamIs(pl, "Killer") and pl.Character then
                    local hrp = pl.Character:FindFirstChild("HumanoidRootPart")
                    if hrp then
                        local d = (hrp.Position - myRoot.Position).Magnitude
                        if d < dist then dist = d; best = hrp end
                    end
                end
            end
            return best, dist
        end
        local function PlayRepairAnim()
            local char = LocalPlayer.Character; if not char then return end
            local hum = char:FindFirstChildOfClass("Humanoid")
            local animator = hum and hum:FindFirstChildOfClass("Animator"); if not animator then return end
            if RepairAnimTrack and RepairAnimTrack.IsPlaying then return end
            pcall(function()
                local anim = Instance.new("Animation")
                anim.AnimationId = REPAIR_ANIM_ID
                RepairAnimTrack = animator:LoadAnimation(anim)
                RepairAnimTrack.Priority = Enum.AnimationPriority.Action
                RepairAnimTrack:Play()
            end)
        end
        local function StopRepairAnim()
            if RepairAnimTrack and RepairAnimTrack.IsPlaying then pcall(function() RepairAnimTrack:Stop() end) end
            RepairAnimTrack = nil
        end
        local function StopRepair(point)
            StopRepairAnim()
            if point and RepairEvent then pcall(function() RepairEvent:FireServer(point, false) end) end
        end
        local function IsGenDone(gen)
            local p = gen:GetAttribute("RepairProgress") or gen:GetAttribute("ProgressRepair") or 0
            return p >= 100
        end
        local function GetNearestGenPointInReach()
            local myChar = LocalPlayer.Character
            local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if not myRoot then return nil end
            local bestPt, bestDist = nil, 5.5
            for _, gen in ipairs(W.GB_GetAllGenerators()) do
                for _, pt in ipairs(W.GB_GetPoints(gen)) do
                    if pt and pt.Parent then
                        local d = (myRoot.Position - pt.Position).Magnitude
                        if d < bestDist then bestDist = d; bestPt = pt end
                    end
                end
            end
            return bestPt
        end
        local function GetSafeNearestGenPoint()
            local myChar = LocalPlayer.Character
            local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
            if not myRoot then return nil end
            local bestPt, bestDist = nil, math.huge
            for _, gen in ipairs(W.GB_GetAllGenerators()) do
                if IsGenDone(gen) then continue end
                local genPivot
                pcall(function() genPivot = gen:GetPivot().Position end)
                if genPivot and IsKillerNearPos(genPivot, VD.KillerEscapeDist) then continue end
                for _, pt in ipairs(W.GB_GetPoints(gen)) do
                    if pt and pt.Parent then
                        local d = (pt.Position - myRoot.Position).Magnitude
                        if d < bestDist then bestDist = d; bestPt = pt end
                    end
                end
            end
            return bestPt
        end
        local function StartManualThread()
            if ManualThread then pcall(function() task.cancel(ManualThread) end); ManualThread = nil end
            ManualThread = task.spawn(function()
                while VD.ManualGen do
                    local myChar = LocalPlayer.Character
                    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
                    local hum = myChar and myChar:FindFirstChildOfClass("Humanoid")
                    if not myRoot or not hum or hum.Health <= 0 then task.wait(0.2); continue end
                    local _, kd = GetNearestKillerDist()
                    if kd <= VD.KillerEscapeDist then
                        if ManualPoint then
                            StopRepair(ManualPoint); ManualPoint = nil
                            VD_Notify("Manual Gen", "Killer near — release repair", 2)
                        end
                        task.wait(0.3); continue
                    end
                    local pt = GetNearestGenPointInReach()
                    if pt then
                        ManualPoint = pt
                        local now = tick()
                        if now - LastFire >= 0.5 then
                            pcall(function() if RepairEvent then RepairEvent:FireServer(pt, true) end end)
                            PlayRepairAnim(); LastFire = now
                        end
                    else
                        if ManualPoint then StopRepair(ManualPoint); ManualPoint = nil end
                    end
                    task.wait(0.1)
                end
                if ManualPoint then StopRepair(ManualPoint) end
                ManualPoint = nil
            end)
        end
        local function StopManualThread()
            if ManualThread then pcall(function() task.cancel(ManualThread) end); ManualThread = nil end
            if ManualPoint then StopRepair(ManualPoint) end
            ManualPoint = nil
        end
        local function StartAutoThread()
            if AutoThread then pcall(function() task.cancel(AutoThread) end); AutoThread = nil end
            AutoThread = task.spawn(function()
                while VD.AutoGen do
                    local myChar = LocalPlayer.Character
                    local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
                    local hum = myChar and myChar:FindFirstChildOfClass("Humanoid")
                    if not myRoot or not hum or hum.Health <= 0 then task.wait(0.3); continue end
                    local _, kd = GetNearestKillerDist()
                    if kd <= VD.KillerEscapeDist then
                        if AutoPoint then StopRepair(AutoPoint); AutoPoint = nil end
                        local safePt = GetSafeNearestGenPoint()
                        if safePt then
                            AutoPoint = safePt
                            pcall(function() myRoot.CFrame = CFrame.new(safePt.Position + Vector3.new(0, 3, 0)) end)
                            task.wait(0.2)
                        end
                        task.wait(0.2); continue
                    end
                    if AutoPoint and AutoPoint.Parent then
                        local now = tick()
                        if now - LastFire >= 0.5 then
                            pcall(function() if RepairEvent then RepairEvent:FireServer(AutoPoint, true) end end)
                            PlayRepairAnim(); LastFire = now
                        end
                    else
                        local pt = GetNearestGenPointInReach()
                        if pt then AutoPoint = pt
                        else
                            local safePt = GetSafeNearestGenPoint()
                            if safePt then
                                AutoPoint = safePt
                                pcall(function() myRoot.CFrame = CFrame.new(safePt.Position + Vector3.new(0, 3, 0)) end)
                                task.wait(0.2)
                            end
                        end
                    end
                    task.wait(0.1)
                end
                if AutoPoint then StopRepair(AutoPoint) end
                AutoPoint = nil
            end)
        end
        local function StopAutoThread()
            if AutoThread then pcall(function() task.cancel(AutoThread) end); AutoThread = nil end
            if AutoPoint then StopRepair(AutoPoint) end
            AutoPoint = nil
        end
        W.ManualGen_SetEnabled = function(v)
            VD.ManualGen = v and true or false
            if VD.ManualGen then StartManualThread() else StopManualThread() end
        end
        W.AutoGen_SetEnabled = function(v)
            VD.AutoGen = v and true or false
            if VD.AutoGen then StartAutoThread() else StopAutoThread() end
        end
        W.GenAuto_SetDistance = function(v) VD.KillerEscapeDist = tonumber(v) or 30 end
        LocalPlayer.CharacterAdded:Connect(function()
            task.wait(1)
            if VD.ManualGen then StartManualThread() end
            if VD.AutoGen then StartAutoThread() end
        end)
    end

    VD.SURV_AutoDodgeSpear = VD.SURV_AutoDodgeSpear or false
    getgenv().GANKZ_IsDodging = false

    Workspace.ChildAdded:Connect(function(child)
        if not child or child.Name ~= "Spearprojectile" then return end
        if not VD.SURV_AutoDodgeSpear then return end
        if W.GetRole() ~= "Survivor" then return end
        task.spawn(function()
            if getgenv().GANKZ_IsDodging then return end
            local root = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not root then return end
            task.wait(0.05)
            local mainPart = child:WaitForChild("Hitbox", 1)
                or child:WaitForChild("Spear1", 1)
                or child.PrimaryPart
                or child:FindFirstChildWhichIsA("BasePart")
            if not mainPart then return end
            task.wait()
            local originPos = mainPart.Position
            local spearDir  = mainPart.CFrame.UpVector
            local toPlayer  = (root.Position - originPos)
            if toPlayer.Magnitude < 0.1 then return end
            toPlayer = toPlayer.Unit
            local dot = spearDir:Dot(toPlayer)
            if dot > 0.85 then
                getgenv().GANKZ_IsDodging = true
                local originalCFrame = root.CFrame
                local rightVector    = root.CFrame.RightVector
                root.CFrame = root.CFrame + (rightVector * 8)
                VD_Notify("Auto Dodge", "Spear terdeteksi! Menghindar otomatis...", 2)
                task.wait(1)
                local r = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                if r then r.CFrame = originalCFrame end
                getgenv().GANKZ_IsDodging = false
            end
        end)
    end)

    local FastBandage = (function()
        local RSvc   = ReplicatedStorage
        local RSvc2  = RunService
        local CSvc   = CollectionService
        local UISvc  = UserInputService
        local VIM    = VirtualInputManager
        local GSvc   = GuiService
        local lp     = LocalPlayer
        local tbl = {
            AutoStopAtMaxHp = true,
            FastPreClickBugEnabled = true,
            PreClicksCount = 50,
            PreClickDelay = 0.0001,
            AnimationId = "rbxassetid://138299892867437",
        }
        local flag = false
        local v = nil; local v2 = nil; local connection = nil
        local touchEnabled = UISvc.TouchEnabled
        local flag2 = touchEnabled
        if touchEnabled then if UISvc.KeyboardEnabled then flag2 = false else flag2 = true end end
        local n = nil; local flag3 = false; local thread = nil
        local function fn()
            local r = RSvc:FindFirstChild("Remotes"); if not r then return nil end
            local i = r:FindFirstChild("Items"); if not i then return nil end
            local b = i:FindFirstChild("Bandage"); if not b then return nil end
            return b:FindFirstChild("Fire")
        end
        local function fn2()
            local c = lp.Character; if not c then return nil end
            local b = c:FindFirstChild("Bandage"); if not b then return nil end
            local ra = b:FindFirstChild("Right Arm")
            local rh = ra or b:FindFirstChild("RightHand"); if not rh then return nil end
            return rh:FindFirstChild("Bandage")
        end
        local function fn3()
            local pg = lp:FindFirstChild("PlayerGui"); if not pg then return nil end
            local sm = pg:FindFirstChild("Survivor-mob"); if not sm then return nil end
            local ct = sm:FindFirstChild("Controls"); if not ct then return nil end
            local ac = ct:FindFirstChild("action")
            return ac or ct:FindFirstChild("Gui-mob")
        end
        local function fn4()
            local pg = lp:FindFirstChild("PlayerGui"); if not pg then return false end
            local pcp = pg:FindFirstChild("pcprompts")
            if pcp then
                local fr = pcp:FindFirstChild("Frame")
                if fr then
                    local bpg = fr:FindFirstChild("BandagePromptGui")
                    if bpg and bpg.Visible then return true end
                end
            end
            local v4 = fn3()
            if v4 then
                for _, child in pairs(v4:GetChildren()) do
                    if child:IsA("ImageLabel") or child:IsA("ImageButton") then
                        local v5 = string.lower(child.Name)
                        if (v5:find("bandage") or v5:find("heal")) and child.Visible then return true end
                    end
                end
            end
            return false
        end
        local function fn5()
            if flag2 then
                if flag3 then return end
                if not fn4() then return end
                local v4 = fn3(); if not v4 then return end
                pcall(function()
                    local ap = v4.AbsolutePosition; local as = v4.AbsoluteSize
                    local gi = GSvc:GetGuiInset()
                    n = math.random(1000, 9999)
                    VIM:SendTouchEvent(n, 0, ap.X + as.X/2 + gi.X, ap.Y + as.Y/2 + gi.Y)
                    flag3 = true
                    if thread then task.cancel(thread) end
                    thread = task.spawn(function()
                        while flag3 and flag do
                            task.wait(0.05)
                            if flag3 and flag then
                                local ap2 = v4.AbsolutePosition; local as2 = v4.AbsoluteSize
                                local gi2 = GSvc:GetGuiInset()
                                VIM:SendTouchEvent(n, 0, ap2.X + as2.X/2 + gi2.X, ap2.Y + as2.Y/2 + gi2.Y)
                            end
                        end
                    end)
                end)
            else
                pcall(function() VIM:SendKeyEvent(true, Enum.KeyCode.E, false, game) end)
            end
        end
        local function fn6()
            if flag2 then
                if not flag3 then return end
                flag3 = false
                if thread then task.cancel(thread); thread = nil end
                pcall(function() if n then VIM:SendTouchEvent(n, 2, 0, 0); n = nil end end)
            else
                pcall(function() VIM:SendKeyEvent(false, Enum.KeyCode.E, false, game) end)
            end
        end
        local function fn7()
            local c = lp.Character; if not c then return false, "Tidak ada karakter" end
            local h = c:FindFirstChild("Humanoid")
            if not h or h.Health <= 0 then return false, "Karakter mati" end
            local v4 = fn2(); if not v4 then return false, "Tidak ada Bandage" end
            local charge = v4:GetAttribute("charge") or 0
            if type(charge) == "number" and charge <= 0 then return false, "Charge habis" end
            if h.Health < 50 then return false, "HP kurang dari 50" end
            if h.Health >= 80 then return false, "HP sudah full" end
            if CSvc:HasTag(c, "Silenced") or c:HasTag("Antiheal") then return false, "Kena Silenced/Antiheal" end
            if not fn() then return false, "Remote tidak ditemukan" end
            return true, nil
        end
        local function fn8()
            if not flag then return end
            flag = false
            if connection then connection:Disconnect(); connection = nil end
            fn6()
            local c = lp.Character
            local v4 = v2
            local v5 = v4 or fn2()
            local v6 = fn()
            if v6 and v5 then pcall(function() v6:FireServer(false, v5) end) end
            if c then
                c:SetAttribute("Aiming", false)
                c:SetAttribute("overridelookscript", false)
                c:SetAttribute("IsBeingHealed", false)
                local ci = c:FindFirstChild("CheckInterractable")
                if ci then ci:SetAttribute("isHealing", false) end
                local hrp = c:FindFirstChild("HumanoidRootPart")
                if hrp then hrp:RemoveTag("doing action") end
            end
            if v then pcall(function() v:Stop(); v:Destroy() end); v = nil end
            v2 = nil
            if getgenv().Gluto_FastBandageBtn_UpdateVisual then pcall(getgenv().Gluto_FastBandageBtn_UpdateVisual) end
            print("[Bandage Boost] Dimatikan")
        end
        local function fn9()
            if flag then return false, "Sudah healing" end
            local v4, v5 = fn7()
            if not v4 then print("[Bandage Boost] Gagal: " .. tostring(v5)); return false, v5 end
            local c = lp.Character; if not c then return false, "Tidak ada karakter" end
            local v6 = fn2(); if not v6 then return false, "Tidak ada Tool" end
            local h = c:FindFirstChild("Humanoid"); if not h then return false, "Tidak ada Humanoid" end
            if not fn() then return false, "Remote tidak ditemukan" end
            flag = true; v2 = v6
            c:SetAttribute("Aiming", true)
            c:SetAttribute("overridelookscript", true)
            c:SetAttribute("IsBeingHealed", true)
            local ci = c:FindFirstChild("CheckInterractable")
            if ci then ci:SetAttribute("isHealing", true) end
            local hrp = c:FindFirstChild("HumanoidRootPart")
            if hrp then hrp:AddTag("doing action") end
            pcall(function()
                if not v and h then
                    local anim = Instance.new("Animation")
                    anim.AnimationId = tbl.AnimationId
                    v = h:LoadAnimation(anim)
                end
                if v then v:Play(0.1) end
            end)
            fn5()
            task.defer(function()
                if tbl.FastPreClickBugEnabled and tbl.PreClicksCount > 0 then
                    for _ = 1, tbl.PreClicksCount do
                        if not flag then return end
                        local v7 = v2; local v8 = v7 or fn2()
                        local v9 = fn(); if not v9 or not v8 then break end
                        pcall(function()
                            v9:FireServer(true, v8)
                            v9:FireServer(false, v8)
                        end)
                    end
                end
                if flag then
                    local v7 = v2; local v8 = v7 or fn2()
                    local v9 = fn()
                    if v9 and v8 then pcall(function() v9:FireServer(true, v8) end) end
                end
            end)
            if connection then connection:Disconnect() end
            connection = RSvc2.Heartbeat:Connect(function()
                if not flag then return end
                local c2 = lp.Character
                if not c2 then fn8(); return end
                local h2 = c2:FindFirstChild("Humanoid")
                if h2 and h2.Health > 0 then
                    local v7 = v2; local v8 = v7 or fn2()
                    local charge = 0
                    if v8 then charge = v8:GetAttribute("charge") or 0 end
                    if type(charge) == "number" and charge <= 0 then fn8(); print("[Bandage Boost] Charge habis!"); return end
                    if tbl.AutoStopAtMaxHp and h2.Health >= 80 then fn8(); print("[Bandage Boost] HP Full! Berhenti"); return end
                    if not CSvc:HasTag(c2, "Silenced") and not c2:HasTag("Antiheal") then
                        if flag and flag2 and not flag3 then fn5() end
                        return
                    end
                    fn8(); print("[Bandage Boost] Kena Silenced/Antiheal"); return
                end
                fn8()
            end)
            if getgenv().Gluto_FastBandageBtn_UpdateVisual then pcall(getgenv().Gluto_FastBandageBtn_UpdateVisual) end
            print("[Bandage Boost] Healing AKTIF! (Super Cepat)")
            return true, nil
        end
        local function fn10()
            if not flag then return fn9() == true end
            fn8(); return false
        end
        lp.CharacterAdded:Connect(function() if flag then fn8() end end)
        return {
            Start = fn9, Stop = fn8, Toggle = fn10,
            CanHeal = fn7, IsHealing = function() return flag end,
            IsMobile = function() return flag2 end, Config = tbl,
        }
    end)()
    W.FastBandage = FastBandage

    local allSections = {}
    local function MakeSection(tab, name)
        local s = tab:AddSection(name)
        table.insert(allSections, s)
        return s
    end

    local uiOK, uiErr = pcall(function()
        if not UILib then error("UILib tidak tersedia.") end
        local Window = UILib:Window({
            Title = "PROMERS HUB",
            LogoButtonSize = 52,
            Image = "118748055443363",
            Footer = "Violence District",
            Color = NotifyColor,
            ShowInfo = true,
            Version = 1,
            Search = true
        })
        Window:InfoTab({
            Name = "Information", Icon = "97551943296711",
            SectionTitle = "Information",
            Banner = "rbxassetid://124361049319609",
            Version = "v0.4.5 UNLOCKED",
            DiscordLink = "https://discord.gg/NvZAbsYw",
            DiscordName = "Promers Hub - Community",
            DiscordText = "Join Server Discord Promers Untuk Informasi Update Dan Giveaway.",
            Cards = { { Title = "Credits", Description = "Owner = ALFzxzzz\nDev = Vanzxzz\n" } }
        })

        local SurvivorTab = Window:AddTab({ Name = "Survivor", Icon = "11984980776" })
        local VisualsTab  = Window:AddTab({ Name = "Visuals",  Icon = "126002076137663" })
        local KillerTab   = Window:AddTab({ Name = "Killer",   Icon = "15089578350" })
        local MiscTab     = Window:AddTab({ Name = "Misc",     Icon = "9206592117" })
        local ConfigTab   = Window:AddTab({ Name = "Config",   Icon = "121326983291533" })

        -- ============ SURVIVOR TAB ============
        local escSection = MakeSection(SurvivorTab, "Instant Escape")
        escSection:AddToggle({ Title = "Enable Escape Button", Default = false, Callback = function(v)
            if getgenv().Gluto_Escape_SetEnabled then getgenv().Gluto_Escape_SetEnabled(v) end
            if v then VD_Notify("Escape Button", "Shown", 2) end
        end })
        escSection:AddButton({ Title = "Teleport Now", Callback = function() W.Escape_Teleport() end })

        local healSection = MakeSection(SurvivorTab, "Self Heal")
        healSection:AddToggle({ Title = "Self Heal Progress", Default = false, Callback = function(v)
            W.setInstantHealSelf(v)
            if getgenv().Gluto_SHB_UpdateVisual then getgenv().Gluto_SHB_UpdateVisual() end
            if v then VD_Notify("Self Heal", "Enabled", 2) end
        end })
        healSection:AddToggle({ Title = "Auto Heal All", Default = false, Callback = function(v)
            W.setAutoHealAll(v)
            if v then VD_Notify("Auto Heal All", "Enabled", 2) end
        end })
        healSection:AddToggle({ Title = "Show Self Heal Button", Default = false, Callback = function(v)
            if getgenv().Gluto_SHB_SetEnabled then getgenv().Gluto_SHB_SetEnabled(v) end
        end })

        local fbSection = MakeSection(SurvivorTab, "Fast Bandage")
        fbSection:AddParagraph({
            Title = "Fast Bandage",
            Content = "Spam heal bandage super cepat.\nMobile: tombol BANDAGE BOOST di layar.\nPC: hold E buat heal."
        })
        fbSection:AddToggle({
            Title = "Enable Fast Bandage",
            Content = "Auto heal super cepat pakai bandage",
            Default = false, Keybind = true,
            Callback = function(v)
                if not W.FastBandage then return end
                if v then
                    W.FastBandage.Start()
                    if getgenv().Gluto_FastBandageBtn_UpdateVisual then pcall(getgenv().Gluto_FastBandageBtn_UpdateVisual) end
                    VD_Notify("Fast Bandage", "Enabled", 2)
                else
                    W.FastBandage.Stop()
                    if getgenv().Gluto_FastBandageBtn_UpdateVisual then pcall(getgenv().Gluto_FastBandageBtn_UpdateVisual) end
                    VD_Notify("Fast Bandage", "Disabled", 2)
                end
            end
        })
        fbSection:AddToggle({
            Title = "Show Floating Bandage Button",
            Content = "Tampilkan tombol BANDAGE melayang di layar",
            Default = false,
            Callback = function(v)
                if getgenv().Gluto_FastBandageBtn_SetEnabled then getgenv().Gluto_FastBandageBtn_SetEnabled(v) end
            end
        })

        local vaultSection = MakeSection(SurvivorTab, "Swift Vault")
        vaultSection:AddToggle({ Title = "Swift Vault (Auto Vault)", Content = "Auto vault window saat dekat & bergerak",
            Default = VD.SURV_AutoVault, Callback = function(v)
                W.SwiftVault_SetEnabled(v)
                if v then VD_Notify("Swift Vault", "Enabled", 2) else VD_Notify("Swift Vault", "Disabled", 2) end
            end })
        vaultSection:AddToggle({ Title = "Swift Vault V2 (Custom Speed)", Content = "Ubah kecepatan vault",
            Default = VD.SURV_FastVault, Callback = function(v)
                W.SwiftVaultV2_SetEnabled(v)
                if v then VD_Notify("Swift Vault V2", "Enabled", 2) else VD_Notify("Swift Vault V2", "Disabled", 2) end
            end })
        vaultSection:AddSlider({ Title = "Vault Speed", Min = 10, Max = 20, Default = VD.SURF_VaultSpeed, Increment = 1,
            Callback = function(v) W.SwiftVault_SetSpeed(v) end })

        local palletSection = MakeSection(SurvivorTab, "Pallet Reflex")
        palletSection:AddToggle({ Title = "Enable Pallet Reflex", Content = "Auto drop pallet saat killer dekat",
            Default = VD.SURV_AutoPallet, Callback = function(v)
                W.PalletReflex_SetEnabled(v)
                if v then VD_Notify("Pallet Reflex", "Enabled", 2) else VD_Notify("Pallet Reflex", "Disabled", 2) end
            end })
        palletSection:AddSlider({ Title = "Trigger Distance", Min = 5, Max = 50, Default = VD.SURV_AutoPalletDist,
            Increment = 1, Suffix = " studs", Callback = function(v) W.PalletReflex_SetDistance(v) end })

        local dodgeSpearSection = MakeSection(SurvivorTab, "Auto Dodge Veil Spear")
        dodgeSpearSection:AddParagraph({
            Title = "Info",
            Content = "Auto geser ke samping saat killer lempar tombak Veil (Spearprojectile)"
        })
        dodgeSpearSection:AddToggle({
            Title = "Enable Auto Dodge Spear",
            Content = "Deteksi projectile Veil → auto dodge kanan 8 studs",
            Default = false, Keybind = true,
            Callback = function(v)
                VD.SURV_AutoDodgeSpear = v and true or false
                if v then VD_Notify("Auto Dodge Spear", "Enabled", 2)
                else VD_Notify("Auto Dodge Spear", "Disabled", 2) end
            end
        })

        local fleeSection = MakeSection(SurvivorTab, "Auto Flee Killer")
        fleeSection:AddToggle({ Title = "Enable Auto Flee", Content = "Otomatis teleport menjauh dari killer",
            Default = VD.SURV_AutoFlee, Callback = function(v)
                VD.SURV_AutoFlee = v
                if v then VD_Notify("Auto Flee", "Enabled", 2) else VD_Notify("Auto Flee", "Disabled", 2) end
            end })
        fleeSection:AddSlider({ Title = "Detect Distance", Min = 15, Max = 150, Default = VD.SURV_AutoFleeDist,
            Increment = 5, Suffix = " studs", Callback = function(v) VD.SURV_AutoFleeDist = v end })
        fleeSection:AddSlider({ Title = "Flee Cooldown", Min = 0.5, Max = 10, Default = VD.SURV_AutoFleeCooldown,
            Increment = 0.5, Suffix = "s", Callback = function(v) VD.SURV_AutoFleeCooldown = v end })

        local fpSection = MakeSection(SurvivorTab, "Fake Perks")
        fpSection:AddToggle({ Title = "Flowstate (Buff on Vault/Slide)", Default = false, Callback = function(v)
            W.FP_SetupFlowstate(v); if v then VD_Notify("Fake Perks", "Flowstate Enabled", 2) end end })
        fpSection:AddToggle({ Title = "Quick Recovery (Buff on Heal)", Default = false, Callback = function(v)
            W.FP_SetupQuickRecovery(v); if v then VD_Notify("Fake Perks", "Quick Recovery Enabled", 2) end end })
        fpSection:AddToggle({ Title = "Perfect Landing (Buff on Land)", Default = false, Callback = function(v)
            W.FP_SetupPerfectLanding(v); if v then VD_Notify("Fake Perks", "Perfect Landing Enabled", 2) end end })
        fpSection:AddToggle({ Title = "Adrenaline Rush (Buff on Low HP)", Default = false, Callback = function(v)
            W.FP_SetupAdrenalineRush(v); if v then VD_Notify("Fake Perks", "Adrenaline Rush Enabled", 2) end end })
        fpSection:AddSlider({ Title = "Perk Cooldown", Min = 0, Max = 30, Default = 5, Increment = 1, Suffix = "s",
            Callback = function(v) W.FP.CooldownTime = v end })
        fpSection:AddButton({ Title = "Clear All Active Buffs", Callback = function()
            for k in pairs(W.FP.ActiveBuffs) do W.FP.ActiveBuffs[k] = nil end
            local c = LocalPlayer.Character
            if c then c:SetAttribute("speedboost", 1) end
            local h = c and c:FindFirstChildOfClass("Humanoid")
            if h then h.WalkSpeed = 16 end
            ForceNotify("Fake Perks", "Buffs cleared", 2)
        end })

        local skillSection = MakeSection(SurvivorTab, "Auto Skill Check")
        skillSection:AddToggle({ Title = "Enable Auto Skill Check", Default = false, Callback = function(v)
            W.SkillCheck_SetEnabled(v); if v then VD_Notify("Auto Skill Check", "Enabled", 2) end end })
        skillSection:AddDropdown({ Title = "Mode", Options = {"Legit", "Instant"}, Default = "Legit",
            Callback = function(v) W.SkillCheck.Mode = v end })

        local genSection = MakeSection(SurvivorTab, "Bypass Generator")
        genSection:AddToggle({ Title = "Enable Bypass Generator", Default = false, Callback = function(v)
            W.setGenBypass(v); if v then VD_Notify("Bypass Generator", "Enabled (Hotkey: B)", 3) end end })
        genSection:AddSlider({ Title = "Trigger Range", Min = 3, Max = 20, Default = 8, Increment = 1, Suffix = " studs",
            Callback = function(v) W.GenBypass.TriggerRange = v end })
        genSection:AddButton({ Title = "Force Repair Nearest Generator", Callback = function()
            local bp, bd = W.GB_GetNearestPoint()
            if bp and bd <= W.GenBypass.TriggerRange then W.GB_DoRepair(bp); ForceNotify("Bypass Generator", "Forcing repair...", 2)
            else ForceNotify("Bypass Generator", "Terlalu jauh", 2) end
        end })

        local UnlimitedVaultSection = MakeSection(SurvivorTab, "Unlimited Vault")
        local UnlimitedVaultEnabled = false
        local UnlimitedVaultConn = nil
        local function EnableUnlimitedVault()
            if UnlimitedVaultEnabled then return end
            UnlimitedVaultEnabled = true
            if UnlimitedVaultConn then UnlimitedVaultConn:Disconnect() end
            for _, v in ipairs(CollectionService:GetTagged("Blocked")) do
                CollectionService:RemoveTag(v, "Blocked")
            end
            UnlimitedVaultConn = CollectionService:GetInstanceAddedSignal("Blocked"):Connect(function(instance)
                CollectionService:RemoveTag(instance, "Blocked")
            end)
        end
        local function DisableUnlimitedVault()
            UnlimitedVaultEnabled = false
            if UnlimitedVaultConn then UnlimitedVaultConn:Disconnect(); UnlimitedVaultConn = nil end
        end
        UnlimitedVaultSection:AddToggle({ Title = "Unlimited Vault", Content = "Remove 'Blocked' tag dari semua vault",
            Default = false, Keybind = true,
            Callback = function(state)
                if state then EnableUnlimitedVault() else DisableUnlimitedVault() end
                VD_Notify("Unlimited Vault", state and "Enabled" or "Disabled", 2)
            end })

        local AntiSlowVaultSection = MakeSection(SurvivorTab, "Anti Slow Vault")
        local AntiSlowVaultEnabled = false
        local AntiSlowVaultConn = nil
        local function EnableAntiSlowVault()
            if AntiSlowVaultEnabled then return end
            AntiSlowVaultEnabled = true
            for _, v in ipairs(CollectionService:GetTagged("SlowVault")) do
                CollectionService:RemoveTag(v, "SlowVault")
            end
            if AntiSlowVaultConn then AntiSlowVaultConn:Disconnect() end
            AntiSlowVaultConn = CollectionService:GetInstanceAddedSignal("SlowVault"):Connect(function(instance)
                CollectionService:RemoveTag(instance, "SlowVault")
            end)
        end
        local function DisableAntiSlowVault()
            AntiSlowVaultEnabled = false
            if AntiSlowVaultConn then AntiSlowVaultConn:Disconnect(); AntiSlowVaultConn = nil end
        end
        AntiSlowVaultSection:AddToggle({ Title = "Anti Slow Vault", Content = "Remove 'SlowVault' tag — vault selalu full speed",
            Default = false, Keybind = true,
            Callback = function(state)
                if state then EnableAntiSlowVault() else DisableAntiSlowVault() end
                VD_Notify("Anti Slow Vault", state and "Enabled" or "Disabled", 2)
            end })

        local GodSection = MakeSection(SurvivorTab, "God Mode")
        local GodModeEnabled = false
        local GodModeThread = nil
        local function StartGodMode()
            if GodModeThread then task.cancel(GodModeThread) end
            GodModeThread = task.spawn(function()
                while GodModeEnabled do
                    local char = LocalPlayer.Character
                    local hum = char and char:FindFirstChildOfClass("Humanoid")
                    if hum then
                        pcall(function()
                            if hum.Health < hum.MaxHealth and hum.Health > 0 then hum.Health = hum.MaxHealth end
                        end)
                    end
                    task.wait(0.1)
                end
                GodModeThread = nil
            end)
        end
        local function StopGodMode()
            GodModeEnabled = false
            if GodModeThread then task.cancel(GodModeThread); GodModeThread = nil end
        end
        GodSection:AddToggle({ Title = "God Mode", Content = "Auto-heal terus (Health selalu MaxHealth)",
            Default = false, Keybind = true,
            Callback = function(state)
                GodModeEnabled = state
                if state then StartGodMode(); VD_Notify("God Mode", "Enabled", 2)
                else StopGodMode(); VD_Notify("God Mode", "Disabled", 2) end
            end })

        local AutoRunSection = MakeSection(SurvivorTab, "Auto Run")
        local AutoRunPCEnabled = false
        local AutoRunMobileEnabled = false
        local AutoRunPCThread = nil
        local AutoRunMobileThread = nil
        local function StartAutoRunPC()
            if AutoRunPCThread then task.cancel(AutoRunPCThread) end
            AutoRunPCThread = task.spawn(function()
                while AutoRunPCEnabled do
                    pcall(function()
                        if VirtualInputManager then
                            VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftShift, false, LocalPlayer:GetMouse())
                        end
                    end)
                    task.wait(0.1)
                end
                pcall(function()
                    if VirtualInputManager then VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftShift, false, LocalPlayer:GetMouse()) end
                end)
                AutoRunPCThread = nil
            end)
        end
        local function StopAutoRunPC()
            AutoRunPCEnabled = false
            if AutoRunPCThread then task.cancel(AutoRunPCThread); AutoRunPCThread = nil end
            pcall(function()
                if VirtualInputManager then VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftShift, false, LocalPlayer:GetMouse()) end
            end)
        end
        local function GetMobileSprintButton()
            local pg = LocalPlayer:FindFirstChild("PlayerGui"); if not pg then return nil end
            local mob = pg:FindFirstChild("Survivor-mob"); if not mob then return nil end
            local controls = mob:FindFirstChild("Controls"); if not controls then return nil end
            local sprint = controls:FindFirstChild("sprint"); if not sprint then return nil end
            if sprint:IsA("GuiButton") then return sprint end
            local icon = sprint:FindFirstChild("icon")
            if icon and icon:IsA("GuiButton") then return icon end
            if icon and icon.Parent and icon.Parent:IsA("GuiButton") then return icon.Parent end
            if sprint.Parent and sprint.Parent:IsA("GuiButton") then return sprint.Parent end
            return sprint
        end
        local function PressSprint()
            local btn = GetMobileSprintButton(); if not btn then return false end
            pcall(function()
                if type(firesignal) == "function" then
                    firesignal(btn.MouseButton1Click)
                    firesignal(btn.MouseButton1Down)
                    task.wait(0.04)
                    firesignal(btn.MouseButton1Up)
                elseif VirtualInputManager and GuiService then
                    local pos = btn.AbsolutePosition; local size = btn.AbsoluteSize
                    local inset = GuiService:GetGuiInset()
                    local x = pos.X + size.X / 2 + inset.X
                    local y = pos.Y + size.Y / 2 + inset.Y
                    local id = 9901
                    VirtualInputManager:SendTouchEvent(id, 0, x, y)
                    task.wait(0.04)
                    VirtualInputManager:SendTouchEvent(id, 2, x, y)
                end
            end)
            return true
        end
        local function IsMoving()
            local char = LocalPlayer.Character; if not char then return false end
            local hum = char:FindFirstChildOfClass("Humanoid"); if not hum then return false end
            if hum.MoveDirection.Magnitude > 0.12 then return true end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if hrp then
                local v = hrp.AssemblyLinearVelocity
                if Vector3.new(v.X, 0, v.Z).Magnitude > 1.5 then return true end
            end
            return false
        end
        local function IsCrouching()
            local char = LocalPlayer.Character; if not char then return false end
            return char:GetAttribute("Crouching") == true or char:GetAttribute("Crouchingserver") == true
        end
        local function IsActuallySprinting()
            local char = LocalPlayer.Character; if not char then return false end
            return char:GetAttribute("Sprinting") == true or char:GetAttribute("IsRunning") == true
        end
        local function StartAutoRunMobile()
            if AutoRunMobileThread then return end
            AutoRunMobileThread = task.spawn(function()
                while AutoRunMobileEnabled do
                    local moving = IsMoving()
                    local crouching = IsCrouching()
                    local sprinting = IsActuallySprinting()
                    if crouching then if sprinting then PressSprint() end
                    else
                        if moving and not sprinting then PressSprint()
                        elseif not moving and sprinting then PressSprint() end
                    end
                    task.wait(0.12)
                end
                if IsActuallySprinting() then PressSprint() end
                AutoRunMobileThread = nil
            end)
        end
        local function StopAutoRunMobile() AutoRunMobileEnabled = false end
        AutoRunSection:AddToggle({ Title = "Auto Run [PC]", Content = "Auto hold LeftShift",
            Default = false, Callback = function(v)
                AutoRunPCEnabled = v
                if v then StartAutoRunPC() else StopAutoRunPC() end
                VD_Notify("Auto Run PC", v and "Enabled" or "Disabled", 2)
            end })
        AutoRunSection:AddToggle({ Title = "Auto Run [Mobile]", Content = "Auto sprint di mobile",
            Default = false, Callback = function(v)
                AutoRunMobileEnabled = v
                if v then StartAutoRunMobile(); VD_Notify("Auto Run Mobile", "Enabled", 2)
                else StopAutoRunMobile(); VD_Notify("Auto Run Mobile", "Disabled", 2) end
            end })
        LocalPlayer.CharacterAdded:Connect(function()
            task.wait(1)
            if AutoRunPCEnabled then StartAutoRunPC() end
            if AutoRunMobileEnabled then AutoRunMobileThread = nil; StartAutoRunMobile() end
        end)

        local trollSection = MakeSection(SurvivorTab, "Troll Teleport")
        trollSection:AddToggle({ Title = "Enable Troll Teleport", Default = false, Callback = function(v)
            W.TrollTeleport_SetEnabled(v)
            if getgenv().Gluto_TTB_UpdateVisual then getgenv().Gluto_TTB_UpdateVisual() end
            if v then VD_Notify("Troll Teleport", "Enabled", 2) end
        end })
        trollSection:AddToggle({ Title = "Show Troll TP Button", Default = false, Callback = function(v)
            if getgenv().Gluto_TTB_SetEnabled then getgenv().Gluto_TTB_SetEnabled(v) end
        end })

        local autoCrouchSection = MakeSection(SurvivorTab, "Auto Crouch Dodge")
        autoCrouchSection:AddToggle({ Title = "Enable Auto Crouch Dodge", Content = "Auto crouch saat killer pakai Abyssal S1",
            Default = VD.AutoCrouch, Callback = function(v)
                VD.AutoCrouch = v
                if v then VD_Notify("Auto Crouch Dodge", "Enabled", 2) else VD_Notify("Auto Crouch Dodge", "Disabled", 2) end
            end })
local autoParrySection = MakeSection(SurvivorTab, "Auto Parry (Dagger)")
autoParrySection:AddToggle({
    Title = "Enable Auto Parry",
    Content = "Auto parry serangan killer pakai Parrying Dagger",
    Default = VD.Surv_AutoParry,
    Callback = function(v)
        VD.Surv_AutoParry = v
        if v then VD_Notify("Auto Parry", "Enabled", 2)
        else VD_Notify("Auto Parry", "Disabled", 2) end
    end
})
autoParrySection:AddCheckbox({
    Title = "Safety Parry",
    Content = "Skip parry kalau lagi sibuk (vault/heal/repair)",
    Default = VD.Surv_ParrySafety,
    Callback = function(v) VD.Surv_ParrySafety = v end
})
autoParrySection:AddCheckbox({
    Title = "Show Parry Gui",
    Content = "Tampilkan tombol PARRY melayang di layar",
    Default = false,
    Callback = function(v)
        if getgenv().Gluto_ParryBtn_SetEnabled then
            getgenv().Gluto_ParryBtn_SetEnabled(v)
        end
    end
})
autoParrySection:AddCheckbox({
    Title = "Aggressive Mode",
    Content = "Parry dari jarak lebih jauh + tracker 1.5s",
    Default = VD.Surv_ParryAggressive,
    Callback = function(v) VD.Surv_ParryAggressive = v end
})
autoParrySection:AddCheckbox({
    Title = "Anti Fake Hit",
    Content = "Hanya parry kalau killer benar-benar menghadap kita",
    Default = VD.Surv_ParryAntiFake,
    Callback = function(v) VD.Surv_ParryAntiFake = v end
})
autoParrySection:AddToggle({
    Title = "Show Parry Radius",
    Default = VD.Surv_ParryCircle,
    Callback = function(v) VD.Surv_ParryCircle = v end
})
autoParrySection:AddSlider({
    Title = "Parry Radius", Min = 5, Max = 25,
    Default = VD.Surv_ParryRadius, Increment = 1, Suffix = " studs",
    Callback = function(v) VD.Surv_ParryRadius = v end
})
autoParrySection:AddSlider({
    Title = "Facing Angle", Min = 15, Max = 120,
    Default = VD.Surv_ParryFacingAngle, Increment = 5, Suffix = "°",
    Callback = function(v) VD.Surv_ParryFacingAngle = v end
})
autoParrySection:AddSlider({
    Title = "Face Treshold", Min = -10, Max = 10,
    Default = math.floor((VD.Surv_ParryFace or 0.7) * 10), Increment = 1,
    Callback = function(v) VD.Surv_ParryFace = v / 10 end
})
autoParrySection:AddDropdown({
    Title = "Ignore Skills", Multi = true,
    Options = {
        "Hidden S1", "Abyssal S1"
    },
    Default = VD.Ignored_Skills_List,
    Callback = function(v)
        local parsed = {}
        if type(v) == "table" then
            for k, mv in pairs(v) do
                if type(k) == "string" and mv then parsed[k] = true
                elseif type(mv) == "string" then parsed[mv] = true end
            end
        end
        VD.Ignored_Skills_List = parsed
    end
})

local autoParrySection = MakeSection(SurvivorTab, "Auto Parry V2")

autoParrySection:AddToggle({ 
    Title = "Auto Parry V1", 
    Default = false, 
    Callback = function(v)
        _G.VDT_Parry.tbl3.Surv_Parry = v
        if v then _G.VDT_Parry.tbl3.Surv_ParryV2 = false end
    end 
})

autoParrySection:AddToggle({ 
    Title = "Auto Parry V2", 
    Default = false, 
    Callback = function(v)
        _G.VDT_Parry.tbl3.Surv_ParryV2 = v
        _G.VDT_Parry.fn55(v)
        if v then _G.VDT_Parry.tbl3.Surv_Parry = false end
    end 
})

autoParrySection:AddCheckbox({ 
    Title = "Safety Parry", 
    Content = "Tidak Parry pada saat Vault,Pallet,Gen",
    Default = false, 
    Callback = function(v) _G.VDT_Parry.tbl3.Surv_ParrySafety = v end 
})

autoParrySection:AddCheckbox({ 
    Title = "Show Parry Gui", 
    Content = "Memunculkan Tombol Parry Gui",
    Default = false, 
    Callback = function(v)
        if getgenv().Gluto_AutoParryVDTBtn_SetEnabled then 
            getgenv().Gluto_AutoParryVDTBtn_SetEnabled(v) 
        end
    end 
})

autoParrySection:AddCheckbox({ 
    Title = "Aggressive parry", 
    Content = "Mode Nggak urus arah killer",
    Default = false, 
    Callback = function(v) _G.VDT_Parry.tbl3.Surv_ParryAggressive = v end 
})

autoParrySection:AddToggle({ 
    Title = "Esp Range", 
    Content = "memunculkan lingkaran di bawah karakter",
    Default = true, 
    Callback = function(v) _G.VDT_Parry.tbl3.Surv_ParryCircle = v end 
})

autoParrySection:AddSlider({ 
    Title = "Parry Radius", Min = 5, Max = 25, Default = 15, Increment = 1, 
    Callback = function(v) _G.VDT_Parry.tbl3.Surv_ParryRadius = v end 
})

autoParrySection:AddSlider({ 
    Title = "Face Sensitivity", Min = -10, Max = 10, Default = 7, Increment = 1, 
    Callback = function(v) _G.VDT_Parry.tbl3.Surv_ParryFace = v / 10 end 
})

autoParrySection:AddDropdown({ 
    Title = "Ignore Skills", 
    Options = { "Hidden S1", "Abyssal S1" }, 
    Multi = true, 
    Default = {}, 
    Callback = function(v)
        local parsed = {}
        if type(v) == "table" then
            for k, mv in pairs(v) do
                if type(k) == "string" and mv then parsed[k] = true
                elseif type(mv) == "string" then parsed[mv] = true end
            end
        end
        _G.VDT_Parry.tbl3.Ignored_Skills_List = parsed
    end 
})
local ap3Section = MakeSection(SurvivorTab, "Auto Parry V3")
ap3Section:AddParagraph({
    Title = "Auto Parry V3.1",
    Content = "Exact port BolongHub + Fixes:\n• Multi-method press (remote → Gui-mob → VIM → Space)\n• Re-track killer saat respawn / team change\n• Force parry kalau super dekat (< 3.5 studs)\n• Debug notify (tiap parry & anim)\n• Radar 32 neon parts"
})
ap3Section:AddToggle({
    Title = "Enable Auto Parry V3",
    Default = false,
    Callback = function(v)
        W.AP3_SetEnabled(v)
        if v then VD_Notify("Auto Parry V3", "Enabled", 2)
        else VD_Notify("Auto Parry V3", "Disabled", 2) end
    end
})
ap3Section:AddToggle({
    Title = "Force Parry Close",
    Content = "Auto parry kalau killer < 3.5 studs (bypass LOS & anim)",
    Default = true,
    Callback = function(v) W.AP3_SetForceClose(v) end
})
ap3Section:AddCheckbox({
    Title = "Show Floating Parry V3 Button",
    Content = "Tombol Parry V3 melayang di layar (tap buat on/off)",
    Default = false,
    Callback = function(v)
        if getgenv().Gluto_AutoParryV3Btn_SetEnabled then
            getgenv().Gluto_AutoParryV3Btn_SetEnabled(v)
        end
    end
})
ap3Section:AddToggle({
    Title = "Show Rangw Circle",
    Content = "Lingkaran putih di bawah karakter",
    Default = false,
    Callback = function(v) W.AP3_SetRadiusESP(v) end
})
ap3Section:AddSlider({
    Title = "Parry Radius Settings", Min = 4, Max = 40, Default = 11, Increment = 1,
    Suffix = " studs",
    Callback = function(v) W.AP3_SetRadius(v) end
})
ap3Section:AddSlider({
    Title = "Aim Strictness Settings", Min = -1, Max = 1, Default = 0.1, Increment = 0.1,
    Callback = function(v) W.AP3_SetStrictness(v) end
})

        local fallSection = MakeSection(SurvivorTab, "Anti Fall Damage")
        fallSection:AddToggle({
            Title = "Enable No Fall Damage",
            Content = "Block fall damage remote (Mechanics.Fall)",
            Default = false,
            Callback = function(v)
                VD.NoFallDamage = v and true or false
                if v then VD_Notify("No Fall Damage", "Enabled", 2)
                else VD_Notify("No Fall Damage", "Disabled", 2) end
            end
        })

        local mapPredictSection = MakeSection(SurvivorTab, "Next Map Prediction")
        mapPredictSection:AddToggle({
            Title = "Enable Map Prediction",
            Content = "Floating GUI shows detected/next map",
            Default = false,
            Callback = function(v)
                if W.NextMapPredict_SetEnabled then W.NextMapPredict_SetEnabled(v) end
                if v then VD_Notify("Map Prediction", "Enabled", 2)
                else VD_Notify("Map Prediction", "Disabled", 2) end
            end
        })

        local manualGenSection = MakeSection(SurvivorTab, "Manual Generator")
        manualGenSection:AddToggle({
            Title = "Enable Manual Generator",
            Content = "Auto repair nearest gen in reach. Release when killer near.",
            Default = false,
            Callback = function(v)
                if W.ManualGen_SetEnabled then W.ManualGen_SetEnabled(v) end
                if v then VD_Notify("Manual Gen", "Enabled", 2)
                else VD_Notify("Manual Gen", "Disabled", 2) end
            end
        })
        manualGenSection:AddSlider({
            Title = "Killer Escape Distance", Min = 10, Max = 80, Default = 30,
            Increment = 5, Suffix = " studs",
            Callback = function(v) if W.GenAuto_SetDistance then W.GenAuto_SetDistance(v) end end
        })

        local autoGenSection = MakeSection(SurvivorTab, "Auto Generator")
        autoGenSection:AddToggle({
            Title = "Enable Auto Generator",
            Content = "Auto TP to safe gen when killer approaches",
            Default = false,
            Callback = function(v)
                if W.AutoGen_SetEnabled then W.AutoGen_SetEnabled(v) end
                if v then VD_Notify("Auto Gen", "Enabled", 2)
                else VD_Notify("Auto Gen", "Disabled", 2) end
            end
        })

        local unhookSection = MakeSection(SurvivorTab, "Bypass Self Unhook")
        unhookSection:AddToggle({ Title = "Enable Bypass Self Unhook", Default = false, Callback = function(v)
            W.SU_SetEnabled(v)
            if getgenv().Gluto_SUB_UpdateVisual then getgenv().Gluto_SUB_UpdateVisual() end
            if v then VD_Notify("Bypass Self Unhook", "Enabled", 2) end
        end })
        unhookSection:AddCheckbox({ Title = "Show Self Unhook Button", Default = false, Callback = function(v)
            if getgenv().Gluto_SUB_SetEnabled then getgenv().Gluto_SUB_SetEnabled(v) end
        end })
        unhookSection:AddSlider({ Title = "Follow Duration", Min = 5, Max = 120, Default = 30, Increment = 5, Suffix = "s", Callback = function(v) W.SelfUnhook.FollowDuration = v end })
        unhookSection:AddSlider({ Title = "Follow Distance", Min = 5, Max = 60, Default = 20, Increment = 1, Suffix = " studs", Callback = function(v) W.SelfUnhook.FollowDistance = v end })

        -- [UNLOCKED] Silent Aim TOF
        local tofSection = MakeSection(SurvivorTab, "Silent Aim TOF")
        tofSection:AddToggle({ Title = "Enable Silent Aim", Default = false, Locked = false, Callback = function(v)
            SetToFSilentAim(v); if v then VD_Notify("Silent Aim TOF", "Enabled", 2) end end })
        tofSection:AddKeybind({ Title = "Toggle Key", Default = Enum.KeyCode.Q, Callback = function(kc) VD.TOF_Key = kc and kc.Name or "None" end })
        tofSection:AddDropdown({ Title = "Target Mode", Options = { "Killer", "Survivors", "Zombie" }, Default = "Killer", Callback = function(v) ToF_SetTargetMode(v, true) end })
        tofSection:AddCheckbox({ Title = "Show Laser Beam", Default = true, Callback = function(v) VD.TOF_Laser = v; if not v then ToF_ClearLaser() end end })
        tofSection:AddCheckbox({ Title = "Wall Check", Default = true, Callback = function(v) VD.TOF_WallCheck = v end })
        tofSection:AddCheckbox({ Title = "Block When Knocked", Default = true, Callback = function(v) VD.TOF_BlockKnocked = v end })
-- ==========================================
-- UI SILENT AIM PISTOL V2 (FULL VDT)
-- ==========================================
local tof2Section = MakeSection(SurvivorTab, "Silent Aim Pistol V2")

tof2Section:AddToggle({ Title = "Pistol (Silent Aim)", Default = false, Callback = function(v) VDT_Pistol.tbl3.Aim_Silent = v end })
tof2Section:AddDropdown({ 
    Title = "Pistol Target", Options = { "KILLER", "SURVIVOR", "SCP" }, Default = "KILLER", 
    Callback = function(v) 
        local val = type(v) == "table" and v[1] or v
        VDT_Pistol.tbl3.Pistol_Target = val 
    end 
})
tof2Section:AddDropdown({ 
    Title = "Target Aim", Options = { "Head", "Torso", "Root" }, Default = "Torso", 
    Callback = function(v) 
        local val = type(v) == "table" and v[1] or v
        VDT_Pistol.tbl3.AIM_TargetPart = val 
    end 
})
tof2Section:AddToggle({ Title = "Block Aim Knocked", Default = true, Callback = function(v) VDT_Pistol.tbl3.Pistol_BlockKnocked = v end })
tof2Section:AddToggle({ Title = "Aim Lock (Camera)", Default = false, Callback = function(v) VDT_Pistol.tbl3.Aim_Lock = v end })
tof2Section:AddToggle({ Title = "Auto Prediksi", Default = false, Callback = function(v) VDT_Pistol.tbl3.Predict = v end })
tof2Section:AddSlider({ Title = "Prediction Lead", Min = 5, Max = 50, Default = 35, Increment = 1, Callback = function(v) VDT_Pistol.tbl3.Pistol_PredictLead = v / 10 end })
tof2Section:AddSlider({ Title = "Aim Offset (Y)", Min = -2, Max = 0, Default = -1, Increment = 0.1, Callback = function(v) VDT_Pistol.tbl3.Pistol_AimOffset = v end })
tof2Section:AddToggle({ Title = "Show Laser", Default = true, Callback = function(v) VDT_Pistol.tbl3.Pistol_ShowLaser = v end })

tof2Section:AddParagraph({ Title = "--- FOV ---", Content = "" })
tof2Section:AddToggle({ Title = "Pistol FOV Mode", Default = false, Callback = function(v) VDT_Pistol.tbl3.Pistol_FOVMode = v end })
tof2Section:AddToggle({ Title = "Pistol Show FOV", Default = false, Callback = function(v) VDT_Pistol.tbl3.Pistol_ShowFOV = v end })
tof2Section:AddSlider({ Title = "Pistol FOV Radius", Min = 50, Max = 300, Default = 150, Increment = 1, Callback = function(v) VDT_Pistol.tbl3.Pistol_FOV = v end })

tof2Section:AddParagraph({ Title = "--- Target UI ---", Content = "" })
tof2Section:AddToggle({ 
    Title = "Show Mobile Target Shortcut", Default = false, 
    Callback = function(v) VDT_Pistol.screenGui2.Enabled = v end 
})

tof2Section:AddParagraph({ Title = "--- Sound TOF ---", Content = "" })
tof2Section:AddToggle({ 
    Title = "Sound TOF Custom", Default = false, 
    Callback = function(v) 
        VDT_Pistol.tbl3.Pistol_CustomSound = v 
        if LocalPlayer.Character then
            local tof = LocalPlayer.Character:FindFirstChild("Twist of Fate") or workspace:FindFirstChild("Twist of Fate", true)
            if tof then
                for _, d in ipairs(tof:GetDescendants()) do
                    if d:IsA("Sound") and string.lower(d.Name) == "shoot" then
                        if v then
                            local id = VDT_Pistol.tbl3.Pistol_SelectedSound == "Sound 1" and "rbxassetid://125027580248269" or VDT_Pistol.tbl3.Pistol_SelectedSound == "Sound 2" and "rbxassetid://79440711397443" or VDT_Pistol.tbl3.Pistol_SelectedSound == "Sound 3" and "rbxassetid://102793319115878" or "rbxassetid://134840941464861"
                            d.SoundId = id
                        else
                            local orig = d:GetAttribute("OriginalSoundId")
                            if orig then d.SoundId = orig end
                        end
                    end
                end
            end
        end
    end 
})
tof2Section:AddDropdown({ 
    Title = "Pilih Sound", Options = { "Sound 1", "Sound 2", "Sound 3", "Sound 4" }, Default = "Sound 1", 
    Callback = function(v) 
        local val = type(v) == "table" and v[1] or v
        VDT_Pistol.tbl3.Pistol_SelectedSound = val 
        if VDT_Pistol.tbl3.Pistol_CustomSound and LocalPlayer.Character then
            local tof = LocalPlayer.Character:FindFirstChild("Twist of Fate") or workspace:FindFirstChild("Twist of Fate", true)
            if tof then
                for _, d in ipairs(tof:GetDescendants()) do
                    if d:IsA("Sound") and string.lower(d.Name) == "shoot" then
                        local id = val == "Sound 1" and "rbxassetid://125027580248269" or val == "Sound 2" and "rbxassetid://79440711397443" or val == "Sound 3" and "rbxassetid://102793319115878" or "rbxassetid://134840941464861"
                        d.SoundId = id
                    end
                end
            end
        end
    end 
})
local tof3Section = MakeSection(SurvivorTab, "Silent Aim TOF V3")
tof3Section:AddParagraph({
    Title = "Silent Aim TOF V3.4",
    Content = "Exact port BolongHub + Fixes:\n• Target closest 3D → filter FOV\n• Aim chest (UpperTorso -1.2)\n• Skip survivor Knocked/IsHooked/IsCarried/Downed\n• SCP detect: SCP1-SCP9, SCP-1.., Zombie\n• Target Selector UI (klik > atau tekan T)\n• Laser nyala cuma pas hold aim\n• Bisa nembak pas knocked (bypass client-side)"
})
tof3Section:AddToggle({
    Title = "Enable Silent Aim V3",
    Default = false,
    Callback = function(v)
        W.TOF3_SetEnabled(v)
        if v then VD_Notify("Silent Aim V3", "Enabled", 2)
        else VD_Notify("Silent Aim V3", "Disabled", 2) end
    end
})
tof3Section:AddDropdown({
    Title = "Target Type",
    Options = {"Killer", "Survivor", "Zombie"},
    Default = "Killer",
    Callback = function(v)
        local val = type(v) == "table" and v[1] or v
        W.TOF3_SetTargetType(val or "Killer")
    end
})
tof3Section:AddToggle({
    Title = "Show Target Selector UI",
    Content = "Frame KILLER/SURVIVOR/SCP melayang (klik > atau tekan T buat ganti)",
    Default = false,
    Callback = function(v) W.TOF3_SetShowTargetUI(v) end
})
tof3Section:AddSlider({
    Title = "FOV Radius", Min = 30, Max = 500, Default = 150, Increment = 5,
    Callback = function(v) W.TOF3_SetFOV(v) end
})
tof3Section:AddToggle({
    Title = "Show FOV Circle", Default = false,
    Callback = function(v) W.TOF3_SetShowFOV(v) end
})
tof3Section:AddToggle({
    Title = "Auto Prediction", Default = true,
    Callback = function(v) W.TOF3_SetPrediction(v) end
})
tof3Section:AddToggle({
    Title = "Adaptive Damping (Anti Strafe)", Default = true,
    Callback = function(v) W.TOF3_SetDamping(v) end
})
tof3Section:AddToggle({
    Title = "Laser ESP (Hold Aim)",
    Content = "Laser nyala cuma pas hold M1/M2/tombol attack",
    Default = true,
    Callback = function(v) W.TOF3_SetLaser(v) end
})
tof3Section:AddToggle({
    Title = "Laser Require Twist of Fate",
    Content = "Laser cuma nyala kalau lu emang megang pistol Twist of Fate",
    Default = false,
    Callback = function(v) W.TOF3_SetLaserRequireTOF(v) end
})
-- ▼▼ NEW: Knocked toggles ▼▼
tof3Section:AddToggle({
    Title = "Allow Shoot While Knocked",
    Content = "Bypass client-side Knocked/IsHooked/IsCarried — biar tetep bisa nembak pas knocked",
    Default = true,
    Callback = function(v)
        W.TOF3_SetAllowShootKnocked(v)
        if v then VD_Notify("TOF3 Knocked", "Allow Shoot: ON", 2)
        else VD_Notify("TOF3 Knocked", "Allow Shoot: OFF", 2) end
    end
})
tof3Section:AddToggle({
    Title = "Block Aim While Knocked",
    Content = "Kalau ON, silent aim berhenti ngunci + laser mati pas lu knocked",
    Default = false,
    Callback = function(v)
        W.TOF3_SetBlockAimKnocked(v)
        if v then VD_Notify("TOF3 Knocked", "Block Aim: ON", 2)
        else VD_Notify("TOF3 Knocked", "Block Aim: OFF", 2) end
    end
})

        local flashSection = MakeSection(SurvivorTab, "Silent Flashlight")
        flashSection:AddToggle({ Title = "Enable Silent Flashlight", Content = "Auto-aim flashlight ke Killer",
            Default = VD.FLASH_SilentAim, Callback = function(v)
                W.Flash_SetEnabled(v)
                if v then VD_Notify("Silent Flashlight", "Enabled", 2) else VD_Notify("Silent Flashlight", "Disabled", 2) end
            end })
        flashSection:AddDropdown({ Title = "Target Part", Options = {"Head", "UpperTorso", "Torso", "HumanoidRootPart"},
            Default = VD.FLASH_TargetPart, Callback = function(v) VD.FLASH_TargetPart = type(v) == "table" and v[1] or v or "Head" end })
        flashSection:AddSlider({ Title = "Max Range", Min = 20, Max = 250, Default = VD.FLASH_Range, Increment = 5, Suffix = " studs", Callback = function(v) VD.FLASH_Range = v end })
        flashSection:AddSlider({ Title = "Smoothness", Min = 0.05, Max = 1, Default = VD.FLASH_Smooth, Increment = 0.05, Callback = function(v) VD.FLASH_Smooth = v end })
        flashSection:AddToggle({ Title = "Show Laser", Default = VD.FLASH_Laser, Callback = function(v)
            VD.FLASH_Laser = v; if not v and W.Flash_ClearLaser then W.Flash_ClearLaser() end end })

        local aimlockGunSection = MakeSection(SurvivorTab, "Aim Lock Gun")
        aimlockGunSection:AddToggle({
            Title = "Enable Aim Lock Gun",
            Content = "Hold M2 / attack button → camera kunci ke target",
            Default = false, Keybind = true,
            Callback = function(v)
                if W.GunAim_Cfg then W.GunAim_Cfg.Enabled = v end
                if v and W.GunAim_Start then W.GunAim_Start() end
                if v then VD_Notify("Aim Lock Gun", "Hold M2 to lock", 2) end
            end
        })
        aimlockGunSection:AddDropdown({ Title = "Target Mode", Options = { "Killer", "Survivor" }, Default = "Killer",
            Callback = function(v)
                local val = type(v) == "table" and v[1] or v
                if W.GunAim_Cfg then W.GunAim_Cfg.TargetMode = val end
            end })
        aimlockGunSection:AddSlider({ Title = "FOV Radius", Min = 50, Max = 1000, Default = 250, Increment = 10,
            Callback = function(v) if W.GunAim_Cfg then W.GunAim_Cfg.FOV = v end end })
        aimlockGunSection:AddSlider({ Title = "Aim Smoothness", Min = 0.1, Max = 1, Default = 0.5, Increment = 0.05,
            Callback = function(v) if W.GunAim_Cfg then W.GunAim_Cfg.Strength = v end end })
        aimlockGunSection:AddSlider({ Title = "Prediction Strength", Min = 0, Max = 1, Default = 0.12, Increment = 0.01,
            Callback = function(v) if W.GunAim_Cfg then W.GunAim_Cfg.PredictStrength = v end end })
        aimlockGunSection:AddToggle({ Title = "Visibility Check", Default = true,
            Callback = function(v) if W.GunAim_Cfg then W.GunAim_Cfg.VisibilityCheck = v end end })

        local MoonwalkSection = MakeSection(SurvivorTab, "Moonwalk")
        local moonwalkEnabled = false
        local moonwalkConn = nil
        local MOONWALK_SIDE_SPEED = 0.9
        local MOONWALK_BACK_SPEED = 1.2
        local MOONWALK_INTERVAL = 0.07
        local function stopMoonwalk()
            if moonwalkConn then moonwalkConn:Disconnect(); moonwalkConn = nil end
        end
        local function startMoonwalk()
            stopMoonwalk()
            local char = LocalPlayer.Character; if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            local hum = char:FindFirstChildOfClass("Humanoid")
            if not hrp or not hum then return end
            local lastSwitch = 0; local direction = 1
            moonwalkConn = RunService.RenderStepped:Connect(function()
                if not moonwalkEnabled then return end
                local c = LocalPlayer.Character; if not c then return end
                local cHrp = c:FindFirstChild("HumanoidRootPart")
                local cHum = c:FindFirstChildOfClass("Humanoid")
                if not cHrp or not cHum or cHum.Health <= 0 then return end
                local now = tick()
                if now - lastSwitch >= MOONWALK_INTERVAL then direction = direction * -1; lastSwitch = now end
                local back = cHrp.CFrame.LookVector * -MOONWALK_BACK_SPEED
                local side = cHrp.CFrame.RightVector * (direction * MOONWALK_SIDE_SPEED)
                cHum:Move(back + side, false)
            end)
        end
        local function setMoonwalk(state)
            moonwalkEnabled = state
            if state then startMoonwalk() else stopMoonwalk() end
            if getgenv().Gluto_MoonwalkBtn_UpdateVisual then pcall(getgenv().Gluto_MoonwalkBtn_UpdateVisual) end
        end
        local MoonwalkBtnState = { Enabled=false, DragLocked=false, Gui=nil, SavedPos=UDim2.new(0.03,0,0.84,0), Connections={} }
        local MoonwalkFloatingState = CreateFloatingButton({
            id = "Moonwalk", title = "Moonwalk", notifyTitle = "Moonwalk", state = MoonwalkBtnState,
            isOn = function() return moonwalkEnabled end,
            onToggle = function(v) setMoonwalk(v) end, iconRotation = 0,
        })
        getgenv().Gluto_MoonwalkBtn_SetEnabled   = function(en) MoonwalkFloatingState.SetEnabled(en) end
        getgenv().Gluto_MoonwalkBtn_UpdateVisual = function() MoonwalkFloatingState.UpdateVisual() end
        MoonwalkSection:AddToggle({ Title = "Moonwalk", Content = "Moonwalk",
            Default = false, Keybind = true,
            Callback = function(v) setMoonwalk(v); VD_Notify("Moonwalk", v and "Enabled" or "Disabled", 2) end })
        MoonwalkSection:AddSlider({ Title = "Side Speed", Min = 0.1, Max = 3, Default = 0.9, Increment = 0.1, Callback = function(v) MOONWALK_SIDE_SPEED = v end })
        MoonwalkSection:AddSlider({ Title = "Back Speed", Min = 0.1, Max = 3, Default = 1.2, Increment = 0.1, Callback = function(v) MOONWALK_BACK_SPEED = v end })
        MoonwalkSection:AddSlider({ Title = "Switch Interval", Min = 0.02, Max = 0.5, Default = 0.07, Increment = 0.01, Callback = function(v) MOONWALK_INTERVAL = v end })
        MoonwalkSection:AddCheckbox({ Title = "Show Moonwalk Gui", Default = false, Callback = function(v)
            if getgenv().Gluto_MoonwalkBtn_SetEnabled then getgenv().Gluto_MoonwalkBtn_SetEnabled(v) end
        end })
        UserInputService.InputBegan:Connect(function(input, gp)
            if gp then return end
            if input.KeyCode == Enum.KeyCode.F8 then setMoonwalk(not moonwalkEnabled) end
        end)
        LocalPlayer.CharacterAdded:Connect(function()
            task.wait(2)
            if moonwalkEnabled then startMoonwalk() end
        end)

        local TrollKillerSection = MakeSection(SurvivorTab, "Troll Killer")
        local function TK_GetKillerHRP()
            local myChar = LocalPlayer.Character
            local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
            local best, bestDist = nil, math.huge
            for _, p in ipairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and TeamIs(p, "Killer") and p.Character then
                    local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                    local hum = p.Character:FindFirstChildOfClass("Humanoid")
                    if hrp and hum and hum.Health > 0 then
                        local d = myRoot and (hrp.Position - myRoot.Position).Magnitude or 0
                        if d < bestDist then bestDist = d; best = hrp end
                    end
                end
            end
            return best
        end
        local HeadSitEnabled  = false
        local HeadSitConn     = nil
        local HeadSitOffset   = 5
        local function TK_HeadSit_Start()
            if HeadSitConn then HeadSitConn:Disconnect() end
            HeadSitConn = RunService.Heartbeat:Connect(function()
                if not HeadSitEnabled then return end
                local myChar = LocalPlayer.Character; if not myChar then return end
                local myHRP = myChar:FindFirstChild("HumanoidRootPart")
                local myHum = myChar:FindFirstChildOfClass("Humanoid")
                if not myHRP or not myHum or myHum.Health <= 0 then return end
                local kHRP = TK_GetKillerHRP(); if not kHRP then return end
                pcall(function()
                    myHRP.AssemblyLinearVelocity = Vector3.zero
                    myHRP.CFrame = kHRP.CFrame * CFrame.new(0, HeadSitOffset, 0)
                end)
            end)
        end
        local function TK_HeadSit_Stop()
            if HeadSitConn then HeadSitConn:Disconnect(); HeadSitConn = nil end
        end
        local FollowBehindEnabled  = false
        local FollowBehindConn     = nil
        local FollowBehindDistance = 6
        local FollowBehindHeight   = 3
        local function TK_FollowBehind_Start()
            if FollowBehindConn then FollowBehindConn:Disconnect() end
            FollowBehindConn = RunService.Heartbeat:Connect(function()
                if not FollowBehindEnabled then return end
                local myChar = LocalPlayer.Character; if not myChar then return end
                local myHRP = myChar:FindFirstChild("HumanoidRootPart")
                local myHum = myChar:FindFirstChildOfClass("Humanoid")
                if not myHRP or not myHum or myHum.Health <= 0 then return end
                local kHRP = TK_GetKillerHRP(); if not kHRP then return end
                pcall(function()
                    myHRP.AssemblyLinearVelocity = Vector3.zero
                    local behindDir = kHRP.CFrame.LookVector * -FollowBehindDistance
                    local targetPos = kHRP.Position + behindDir + Vector3.new(0, FollowBehindHeight, 0)
                    local lookAt    = kHRP.Position + Vector3.new(0, FollowBehindHeight, 0)
                    myHRP.CFrame = CFrame.new(targetPos, lookAt)
                end)
            end)
        end
        local function TK_FollowBehind_Stop()
            if FollowBehindConn then FollowBehindConn:Disconnect(); FollowBehindConn = nil end
        end
        TrollKillerSection:AddToggle({
            Title = "Head Sit Killer",
            Content = "Duduk di kepala killer, ikut kemana pun dia pergi",
            Default = false, Keybind = true,
            Callback = function(v)
                HeadSitEnabled = v
                if v then TK_HeadSit_Start(); VD_Notify("Troll Killer", "Head Sit: ON", 2)
                else TK_HeadSit_Stop(); VD_Notify("Troll Killer", "Head Sit: OFF", 2) end
            end
        })
        TrollKillerSection:AddSlider({
            Title = "Head Sit Height", Min = 1, Max = 5, Default = 5, Increment = 0.1, Suffix = " studs",
            Callback = function(v) HeadSitOffset = v end
        })
        TrollKillerSection:AddToggle({
            Title = "Follow Behind Killer",
            Content = "Ikutin killer dari belakang kayak bodyguard",
            Default = false, Keybind = true,
            Callback = function(v)
                FollowBehindEnabled = v
                if v then TK_FollowBehind_Start(); VD_Notify("Troll Killer", "Follow Behind: ON", 2)
                else TK_FollowBehind_Stop(); VD_Notify("Troll Killer", "Follow Behind: OFF", 2) end
            end
        })
        TrollKillerSection:AddSlider({
            Title = "Follow Distance", Min = 2, Max = 20, Default = 6, Increment = 1, Suffix = " studs",
            Callback = function(v) FollowBehindDistance = v end
        })
        TrollKillerSection:AddSlider({
            Title = "Follow Height", Min = 0, Max = 10, Default = 3, Increment = 0.5, Suffix = " studs",
            Callback = function(v) FollowBehindHeight = v end
        })
        LocalPlayer.CharacterAdded:Connect(function()
            task.wait(1)
            if HeadSitEnabled then TK_HeadSit_Start() end
            if FollowBehindEnabled then TK_FollowBehind_Start() end
        end)

        -- ============ VISUALS TAB ============
        local ESPBox = MakeSection(VisualsTab, "Full ESP System")
        ESPBox:AddToggle({ Title = "ESP Survivor", Default = false, Callback = function(v) FESP.Survivor = v end })
        ESPBox:AddColorPicker({ Title = "Survivor Color", Default = FESPC.Survivor, Save = false, Callback = function(c) FESPC.Survivor = c end })
        ESPBox:AddToggle({ Title = "ESP Killer", Default = false, Callback = function(v) FESP.Killer = v end })
        ESPBox:AddColorPicker({ Title = "Killer Color", Default = FESPC.Killer, Save = false, Callback = function(c) FESPC.Killer = c end })
        ESPBox:AddToggle({ Title = "ESP Generator", Default = false, Callback = function(v) FESP.Generator = v end })
        ESPBox:AddColorPicker({ Title = "Generator Color", Default = FESPC.Generator, Save = false, Callback = function(c) FESPC.Generator = c end })
        ESPBox:AddToggle({ Title = "ESP Pallet", Default = false, Callback = function(v) FESP.Pallet = v end })
        ESPBox:AddColorPicker({ Title = "Pallet Color", Default = FESPC.Pallet, Save = false, Callback = function(c) FESPC.Pallet = c end })
        ESPBox:AddToggle({ Title = "ESP Window", Default = false, Callback = function(v)
            FESP.Window = v; _G.GlutoWindowScanned = false
        end })
        ESPBox:AddColorPicker({ Title = "Window Color", Default = FESPC.Window, Save = false, Callback = function(c) FESPC.Window = c end })
        ESPBox:AddToggle({ Title = "ESP SCP", Default = false, Callback = function(v) FESP.SCP = v end })
        ESPBox:AddColorPicker({ Title = "SCP Color", Default = FESPC.SCP, Save = false, Callback = function(c) FESPC.SCP = c end })
        ESPBox:AddSlider({ Title = "ESP Radius", Min = 10, Max = 1000, Default = 500, Increment = 10, Callback = function(v) FESP.Distance = v end })

        local ESPStatusBox = MakeSection(VisualsTab, "ESP Status")
        ESPStatusBox:AddToggle({ Title = "Enable Status ESP", Default = false, Callback = function(v) FESPS.Enabled = v end })
        ESPStatusBox:AddToggle({ Title = "Show Name", Default = true, Callback = function(v) FESPS.ShowName = v end })
        ESPStatusBox:AddToggle({ Title = "Show Distance", Default = true, Callback = function(v) FESPS.ShowDistance = v end })
        ESPStatusBox:AddToggle({ Title = "Show Avatar", Default = true, Callback = function(v) FESPS.ShowAvatar = v end })
        ESPStatusBox:AddToggle({ Title = "Show Action", Default = true, Callback = function(v) FESPS.ShowAction = v end })
        ESPStatusBox:AddToggle({ Title = "Show Health Bar", Default = false, Callback = function(v) FESPS.ShowHealth = v end })
        ESPStatusBox:AddSlider({ Title = "Status Radius", Min = 20, Max = 1000, Default = 500, Increment = 10, Callback = function(v) FESPS.Radius = v end })

        local killerFOVSection = MakeSection(VisualsTab, "Killer FOV")
        killerFOVSection:AddParagraph({
            Title = "Killer FOV Visualizer",
            Content = "Nampilin arah pandang killer sebagai cone / garis di lantai.\nFull port from Hypnosis."
        })
        killerFOVSection:AddToggle({
            Title = "Enable Killer FOV",
            Content = "Show killer facing direction cone on ground",
            Default = VD.KillerFOV_Enabled,
            Callback = function(v)
                VD.KillerFOV_Enabled = v and true or false
                if _G.GLUTO_KillerFOV_SetEnabled then
                    _G.GLUTO_KillerFOV_SetEnabled(VD.KillerFOV_Enabled)
                end
                if v then VD_Notify("Killer FOV", "Enabled", 2)
                else VD_Notify("Killer FOV", "Disabled", 2) end
            end
        })
        killerFOVSection:AddToggle({
            Title = "Visible Through Walls",
            Content = "Garis FOV tetap kelihatan walau ketutup dinding",
            Default = VD.KillerFOV_ThroughWalls,
            Callback = function(v) VD.KillerFOV_ThroughWalls = v and true or false end
        })
        killerFOVSection:AddDropdown({
            Title = "FOV Style",
            Options = { "Outline Cone", "Dotted Arc" },
            Default = VD.KillerFOV_Style,
            Callback = function(v)
                local val = type(v) == "table" and v[1] or v
                VD.KillerFOV_Style = val or "Outline Cone"
            end
        })
        killerFOVSection:AddColorPicker({
            Title = "FOV Color",
            Default = VD.KillerFOV_Color,
            Callback = function(c) VD.KillerFOV_Color = c end
        })
        killerFOVSection:AddSlider({
            Title = "FOV Distance", Min = 5, Max = 40, Default = VD.KillerFOV_Range,
            Increment = 1, Suffix = " studs",
            Callback = function(v) VD.KillerFOV_Range = v end
        })
        killerFOVSection:AddSlider({
            Title = "FOV Angle", Min = 30, Max = 160, Default = VD.KillerFOV_Angle,
            Increment = 5, Suffix = "°",
            Callback = function(v) VD.KillerFOV_Angle = v end
        })
        killerFOVSection:AddSlider({
            Title = "Line Width", Min = 0.05, Max = 0.5, Default = VD.KillerFOV_Width,
            Increment = 0.05,
            Callback = function(v) VD.KillerFOV_Width = v end
        })
        killerFOVSection:AddSlider({
            Title = "Transparency", Min = 0, Max = 1, Default = VD.KillerFOV_Transparency,
            Increment = 0.05,
            Callback = function(v) VD.KillerFOV_Transparency = v end
        })

        local graphicsSection = MakeSection(VisualsTab, "Graphics")
        graphicsSection:AddToggle({ Title = "Fullbright", Default = false, Callback = function(v) W.Graphics.Fullbright = v; W.Graphics_Apply() end })
        graphicsSection:AddToggle({ Title = "No Shadow", Default = false, Callback = function(v) W.Graphics.NoShadow = v; W.Graphics_Apply() end })
        graphicsSection:AddToggle({ Title = "Low Graphics", Default = false, Callback = function(v) W.Graphics.LowGraphics = v; W.Graphics_ApplyOptimization() end })
        graphicsSection:AddToggle({ Title = "No Screen Effects", Default = false, Callback = function(v) W.Graphics.NoScreenEffects = v; W.Graphics_ApplyNoScreenFx() end })
        graphicsSection:AddToggle({ Title = "Clean Sky", Default = false, Callback = function(v) W.Graphics.CleanSky = v; W.Graphics_ApplyOptimization() end })
        graphicsSection:AddToggle({ Title = "Potato Mode", Content = "EXTREME low graphics", Default = false, Callback = function(v)
            if W.Potato_SetEnabled then
                W.Potato_SetEnabled(v)
                if v then VD_Notify("Potato Mode", "Enabled", 3) else VD_Notify("Potato Mode", "Disabled", 3) end
            end
        end })

        local timeSection = MakeSection(VisualsTab, "Clock & Ambient")
        timeSection:AddToggle({ Title = "Enable Clock Override", Default = false, Callback = function(v) W.Graphics.ClockTimeEnabled = v; W.Graphics_Apply() end })
        timeSection:AddSlider({ Title = "Clock Time", Min = 0, Max = 24, Default = 14, Increment = 1, Callback = function(v)
            W.Graphics.ClockTime = v; W.Graphics.ClockTimeEnabled = true; W.Graphics_Apply() end })
        timeSection:AddSlider({ Title = "Brightness", Min = 0, Max = 5, Default = 2, Increment = 0.1, Callback = function(v)
            W.Graphics.Brightness = v; W.Graphics.ClockTimeEnabled = true; W.Graphics_Apply() end })

        local zoomSection = MakeSection(VisualsTab, "Zoom & FOV")
        zoomSection:AddToggle({ Title = "Unlimited Zoom", Default = false, Callback = function(v) W.Graphics.UnlimitedZoom = v; W.Graphics_ApplyZoom() end })
        zoomSection:AddSlider({ Title = "Max Zoom Distance", Min = 100, Max = 5000, Default = 1000, Increment = 50, Callback = function(v)
            W.Graphics.MaxZoomDistance = v; if W.Graphics.UnlimitedZoom then W.Graphics_ApplyZoom() end end })
        zoomSection:AddToggle({ Title = "Custom FOV", Default = false, Callback = function(v) W.Graphics.FOVEnabled = v; W.Graphics_ApplyFOV() end })
        zoomSection:AddSlider({ Title = "Camera FOV", Min = 40, Max = 120, Default = 70, Increment = 5, Callback = function(v)
            W.Graphics.FOV = v; if W.Graphics.FOVEnabled then W.Graphics_ApplyFOV() end end })

        -- ============ KILLER TAB ============
        local autoAttackSection = MakeSection(KillerTab, "Auto Attack")
        autoAttackSection:AddToggle({ Title = "Enable Auto Attack", Content = "Auto fire BasicAttack",
            Default = VD.KILLER_AutoAttack, Callback = function(v) VD.KILLER_AutoAttack = v
                if v then VD_Notify("Auto Attack", "Enabled", 2) else VD_Notify("Auto Attack", "Disabled", 2) end
            end })
        autoAttackSection:AddSlider({ Title = "Attack Range", Min = 5, Max = 30, Default = VD.KILLER_AutoAttackRange, Increment = 1, Suffix = " studs", Callback = function(v) VD.KILLER_AutoAttackRange = v end })
        autoAttackSection:AddSlider({ Title = "Attack Cooldown", Min = 0.05, Max = 1, Default = VD.KILLER_AutoAttackCooldown, Increment = 0.05, Suffix = "s", Callback = function(v) VD.KILLER_AutoAttackCooldown = v end })

        local infLungeSection = MakeSection(KillerTab, "Infinite Lunge")
        infLungeSection:AddToggle({
            Title = "Infinite Lunge (Basic Attack)",
            Default = false,
            Callback = function(v) VD.KILLER_InfLunge = v end
        })

        local veilV1Section = MakeSection(KillerTab, "Silent Veil V2")
        veilV1Section:AddToggle({
            Title = "Enable Silent Veil V2",
            Content = "Ballistic spear aimbot (fixed tracker)",
            Default = false,
            Locked = false,
            Keybind = true,
            Callback = function(v)
                VD.VeilEnabled = v and true or false
                if getgenv().Gluto_VeilBtn_UpdateVisual then pcall(getgenv().Gluto_VeilBtn_UpdateVisual) end
                if v then VD_Notify("Silent Veil V2", "Enabled", 2)
                else
                    VD_Notify("Silent Veil V2", "Disabled", 2)
                    if W.Veil_HideAllVisuals then pcall(W.Veil_HideAllVisuals) end
                end
            end
        })
        veilV1Section:AddToggle({
            Title = "Show FOV Circle", Default = VD.VeilShowFOV,
            Callback = function(v) VD.VeilShowFOV = v and true or false end
        })
        veilV1Section:AddToggle({
            Title = "Show Target Tracker",
            Content = "Auto-hide saat target keluar FOV / di belakang camera",
            Default = VD.VeilShowTracker,
            Callback = function(v) VD.VeilShowTracker = v and true or false end
        })
        veilV1Section:AddToggle({
            Title = "Auto Predict", Default = VD.VeilAutoPredict,
            Callback = function(v) VD.VeilAutoPredict = v and true or false end
        })
        veilV1Section:AddSlider({
            Title = "FOV Size", Min = 50, Max = 500, Default = VD.VeilFOV, Increment = 10,
            Callback = function(v) VD.VeilFOV = v end
        })
        veilV1Section:AddSlider({
            Title = "Max Distance", Min = 50, Max = 1000, Default = VD.VeilMaxDist, Increment = 10, Suffix = " studs",
            Callback = function(v) VD.VeilMaxDist = v end
        })
        veilV1Section:AddSlider({
            Title = "Spear Speed", Min = 50, Max = 400, Default = VD.VeilSpearSpeed, Increment = 5,
            Callback = function(v) VD.VeilSpearSpeed = v end
        })
        veilV1Section:AddSlider({
            Title = "Spear Gravity", Min = 10, Max = 300, Default = VD.VeilGravity, Increment = 1,
            Callback = function(v) VD.VeilGravity = v end
        })
        veilV1Section:AddSlider({
            Title = "Aura Spear Speed", Min = 50, Max = 400, Default = VD.VeilAuraSpearSpeed, Increment = 5,
            Callback = function(v) VD.VeilAuraSpearSpeed = v end
        })
        veilV1Section:AddSlider({
            Title = "Aura Spear Gravity", Min = 10, Max = 300, Default = VD.VeilAuraSpearGravity, Increment = 1,
            Callback = function(v) VD.VeilAuraSpearGravity = v end
        })
        veilV1Section:AddSlider({
            Title = "Lead Multiplier", Min = 0.1, Max = 5, Default = VD.VeilLeadMultiplier, Increment = 0.1,
            Callback = function(v) VD.VeilLeadMultiplier = v end
        })
        veilV1Section:AddToggle({
            Title = "Show Floating Veil Button",
            Content = "Tampilkan tombol VEIL melayang di layar",
            Default = false,
            Callback = function(v)
                if getgenv().Gluto_VeilBtn_SetEnabled then getgenv().Gluto_VeilBtn_SetEnabled(v) end
            end
        })

local veilSection = MakeSection(KillerTab, "Silent Veil V1")

veilSection:AddToggle({ 
    Title = "Enable Silent Veil", 
    Default = false, 
    Callback = function(v) 
        _G.VDT_VeilLogic.Aim_SilentVeil = v 
        if v then VD_Notify("Silent Veil", "Enabled", 2)
        else VD_Notify("Silent Veil", "Disabled", 2) end
    end 
})
veilSection:AddToggle({ 
    Title = "Smart Predict Mode", 
    Default = false, 
    Callback = function(v) _G.VDT_VeilLogic.SmartPredict = v end 
})
veilSection:AddSlider({ 
    Title = "Smart Predict Lead", 
    Min = 10, Max = 50, Default = 17, Increment = 1, 
    Callback = function(v) _G.VDT_VeilLogic.Veil_LeadMultiplier = v / 10 end 
})
veilSection:AddToggle({ 
    Title = "Show FOV", 
    Default = true, 
    Callback = function(v) _G.VDT_VeilLogic.Veil_ShowFOV = v end 
})
veilSection:AddSlider({ 
    Title = "FOV Radius", 
    Min = 50, Max = 300, Default = 150, Increment = 1, 
    Callback = function(v) _G.VDT_VeilLogic.Veil_FOV = v end 
})
veilSection:AddToggle({ 
    Title = "Show Laser / Snapline", 
    Default = true, 
    Callback = function(v) _G.VDT_VeilLogic.Veil_ShowLaser = v end 
})
veilSection:AddSlider({ 
    Title = "Spear Speed", 
    Min = 50, Max = 300, Default = 165, Increment = 1, 
    Callback = function(v) _G.VDT_VeilLogic.SPEAR_Speed = v end 
})
veilSection:AddSlider({ 
    Title = "Spear Gravity", 
    Min = 0, Max = 200, Default = 103, Increment = 1, 
    Callback = function(v) _G.VDT_VeilLogic.SPEAR_Gravity = v end 
})

        local AimLockSection = MakeSection(KillerTab, "Aim Lock Hidden")
        local AimLockEnabled = false
        local AimLockThread = nil
        local AimLockAiming = false
        local AimLockHoldKey = Enum.KeyCode.E
        local AimLockMobileHooks = {}
        local function AimLock_GetClosestTarget()
            local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if not hrp then return nil end
            local myTeam = LocalPlayer.Team and LocalPlayer.Team.Name or ""
            local myIsKiller = string.find(string.lower(myTeam), "killer", 1, true) ~= nil
            local closestTarget, shortestDist = nil, math.huge
            for _, player in pairs(Players:GetPlayers()) do
                if player ~= LocalPlayer and player.Character then
                    local targetHrp = player.Character:FindFirstChild("HumanoidRootPart")
                    local hum = player.Character:FindFirstChildOfClass("Humanoid")
                    local playerTeam = player.Team and player.Team.Name or ""
                    local theirIsKiller = string.find(string.lower(playerTeam), "killer", 1, true) ~= nil
                    if targetHrp and hum and hum.Health > 0 then
                        local isEnemy = (myIsKiller and not theirIsKiller) or ((not myIsKiller) and theirIsKiller)
                        if isEnemy then
                            local dist = (targetHrp.Position - hrp.Position).Magnitude
                            if dist < shortestDist then shortestDist = dist; closestTarget = targetHrp end
                        end
                    end
                end
            end
            return closestTarget
        end
        local function AimLock_Start()
            if AimLockThread then task.cancel(AimLockThread) end
            AimLockThread = task.spawn(function()
                while AimLockEnabled do
                    if AimLockAiming then
                        local target = AimLock_GetClosestTarget()
                        if target then
                            pcall(function()
                                Workspace.CurrentCamera.CFrame = CFrame.new(Workspace.CurrentCamera.CFrame.Position, target.Position + Vector3.new(0, 2.5, 0))
                            end)
                        end
                    end
                    task.wait()
                end
            end)
        end
        UserInputService.InputBegan:Connect(function(input, gp)
            if gp or not AimLockEnabled then return end
            if input.UserInputType == Enum.UserInputType.MouseButton2 then AimLockAiming = true end
            if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == AimLockHoldKey then AimLockAiming = true end
        end)
        UserInputService.InputEnded:Connect(function(input)
            if not AimLockEnabled then return end
            if input.UserInputType == Enum.UserInputType.MouseButton2 then AimLockAiming = false end
            if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == AimLockHoldKey then AimLockAiming = false end
        end)
        local function AimLock_DisconnectMobile()
            for _, c in pairs(AimLockMobileHooks) do pcall(function() c:Disconnect() end) end
            AimLockMobileHooks = {}
        end
        local function AimLock_SetupMobile()
            if not UserInputService.TouchEnabled then return end
            AimLock_DisconnectMobile()
            task.spawn(function()
                local pGui = LocalPlayer:FindFirstChildOfClass("PlayerGui"); if not pGui then return end
                local NAMES = {"attack","shoot","fire","basicattack","tembak","hidden","skill","ability","power","skill1","ability1","gui-mob"}
                local function isBtn(obj)
                    if not obj then return false end
                    if not (obj:IsA("GuiButton") or obj:IsA("ImageButton") or obj:IsA("TextButton")) then return false end
                    local l = obj.Name:lower()
                    for _, n in ipairs(NAMES) do if l == n or l:find(n, 1, true) then return true end end
                    return false
                end
                local function hook(btn)
                    if not btn or btn:GetAttribute("AimLockHooked") then return end
                    btn:SetAttribute("AimLockHooked", true)
                    table.insert(AimLockMobileHooks, btn.InputBegan:Connect(function(i)
                        if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
                            if AimLockEnabled then AimLockAiming = true end
                        end
                    end))
                    table.insert(AimLockMobileHooks, btn.InputEnded:Connect(function(i)
                        if i.UserInputType == Enum.UserInputType.Touch or i.UserInputType == Enum.UserInputType.MouseButton1 then
                            AimLockAiming = false
                        end
                    end))
                    table.insert(AimLockMobileHooks, btn:GetPropertyChangedSignal("Visible"):Connect(function()
                        if not btn.Visible then AimLockAiming = false end
                    end))
                end
                local function scan()
                    for _, ch in ipairs(pGui:GetChildren()) do
                        local ctrl = ch:FindFirstChild("Controls")
                        if ctrl then
                            for _, obj in ipairs(ctrl:GetDescendants()) do
                                if isBtn(obj) then hook(obj) end
                            end
                        end
                    end
                end
                scan()
                table.insert(AimLockMobileHooks, pGui.ChildAdded:Connect(function() task.wait(0.3); scan() end))
            end)
        end
        if UserInputService.TouchEnabled then AimLock_SetupMobile() end
        LocalPlayer.CharacterAdded:Connect(function()
            AimLockAiming = false
            if UserInputService.TouchEnabled then task.wait(2); AimLock_SetupMobile() end
        end)
        AimLockSection:AddToggle({
            Title = "Aim Lock Hidden (Hold)",
            Content = "Tahan M2 / tombol attack → kamera ngunci ke target",
            Default = false, Keybind = true,
            Callback = function(state)
                AimLockEnabled = state
                if state then AimLock_Start(); VD_Notify("Aim Lock Hidden", "Enabled — Hold M2/E", 2)
                else
                    AimLockAiming = false
                    if AimLockThread then task.cancel(AimLockThread); AimLockThread = nil end
                    VD_Notify("Aim Lock Hidden", "Disabled", 2)
                end
            end
        })
        AimLockSection:AddInput({
            Title = "Hold Keybind", Content = "Default: E",
            Default = "E", Placeholder = "E / Q / F / LeftShift",
            Callback = function(input)
                input = tostring(input or ""):gsub("%s+", "")
                if input == "" then return end
                local map = {
                    ["leftshift"]=Enum.KeyCode.LeftShift,["rightshift"]=Enum.KeyCode.RightShift,
                    ["leftalt"]=Enum.KeyCode.LeftAlt,["rightalt"]=Enum.KeyCode.RightAlt,
                    ["leftctrl"]=Enum.KeyCode.LeftControl,["rightctrl"]=Enum.KeyCode.RightControl,
                    ["leftcontrol"]=Enum.KeyCode.LeftControl,["rightcontrol"]=Enum.KeyCode.RightControl,
                    ["space"]=Enum.KeyCode.Space,["tab"]=Enum.KeyCode.Tab,
                }
                local newKey = map[input:lower()]
                if not newKey then
                    local ok, kc = pcall(function() return Enum.KeyCode[input:upper():sub(1,1) .. input:lower():sub(2)] end)
                    if ok and kc then newKey = kc end
                end
                if newKey then
                    AimLockHoldKey = newKey
                    VD_Notify("Aim Lock", "Hold key: " .. newKey.Name, 2)
                end
            end
        })

        local aimlockAttackSection = MakeSection(KillerTab, "Aim Lock Attack")
        aimlockAttackSection:AddToggle({
            Title = "Enable Aim Lock Attack",
            Content = "Hold M2 / attack button → camera kunci ke survivor terdekat",
            Default = false, Keybind = true,
            Callback = function(v)
                if W.AttackAim_Cfg then W.AttackAim_Cfg.Enabled = v end
                if v and W.AttackAim_Start then W.AttackAim_Start() end
                if v then VD_Notify("Aim Lock Attack", "Hold M2 to lock", 2) end
            end
        })
        aimlockAttackSection:AddSlider({ Title = "FOV Radius", Min = 50, Max = 1000, Default = 250, Increment = 10,
            Callback = function(v) if W.AttackAim_Cfg then W.AttackAim_Cfg.FOV = v end end })
        aimlockAttackSection:AddSlider({ Title = "Aim Smoothness", Min = 0.1, Max = 1, Default = 1, Increment = 0.05,
            Callback = function(v) if W.AttackAim_Cfg then W.AttackAim_Cfg.Strength = v end end })
        aimlockAttackSection:AddSlider({ Title = "Prediction Strength", Min = 0, Max = 1, Default = 0.12, Increment = 0.01,
            Callback = function(v) if W.AttackAim_Cfg then W.AttackAim_Cfg.PredictStrength = v end end })
        aimlockAttackSection:AddDropdown({ Title = "Aim Part", Options = { "Head", "HumanoidRootPart", "UpperTorso", "Torso" }, Default = "HumanoidRootPart",
            Callback = function(v)
                local val = type(v) == "table" and v[1] or v
                if W.AttackAim_Cfg then W.AttackAim_Cfg.AimPart = val end
            end })
        aimlockAttackSection:AddToggle({ Title = "Visibility Check", Default = true,
            Callback = function(v) if W.AttackAim_Cfg then W.AttackAim_Cfg.VisibilityCheck = v end end })

        local antiBlindSection = MakeSection(KillerTab, "Anti Blind")
        antiBlindSection:AddToggle({
            Title = "Anti Blind (Flashlight)",
            Content = "Block efek pusing dari flashlight survivor",
            Default = false,
            Callback = function(v)
                VD.KILLER_AntiBlind = v
                if v and W.SetupAntiBlind then pcall(W.SetupAntiBlind) end
                if v then VD_Notify("Anti Blind", "Enabled", 2) end
            end
        })

        local destroyPalletSection = MakeSection(KillerTab, "Destroy Pallet")
        destroyPalletSection:AddToggle({
            Title = "Auto Destroy Pallet",
            Content = "Auto hancurkan pallet terdekat (radius 6 studs)",
            Default = false, Keybind = true,
            Callback = function(v)
                VD.KILLER_DestroyPallets = v
                if v then VD_Notify("Destroy Pallet", "Enabled", 2) end
            end
        })

        local maskedSection = MakeSection(KillerTab, "Select Masked Power")
        maskedSection:AddDropdown({ Title = "Masked Power", Options = Masked.Powers, Default = Masked.CurrentPower,
            Callback = function(v)
                local val = type(v) == "table" and v[1] or v
                Masked.CurrentPower = val
                VD_Notify("Select Masked", "Selected: " .. val, 1)
            end })
        maskedSection:AddButton({ Title = "Activate Power", Callback = function() W.Masked_Activate() end })
        maskedSection:AddButton({ Title = "Deactivate Power", Callback = function() W.Masked_Deactivate() end })

        local bypassSection = MakeSection(KillerTab, "Bypass No Cooldown")
        bypassSection:AddToggle({ Title = "Hidden - Leap Bypass", Default = false,
            Callback = function(v) W.BYPASS_SetHiddenLeap(v); if v then VD_Notify("Bypass", "Hidden Leap: ON", 2) end end })
        bypassSection:AddToggle({ Title = "Myers - Infinite Grab", Content = "Hotkey H", Default = false,
            Callback = function(v) W.setMyersGrab(v); if v then VD_Notify("Bypass", "Inf Grab: ON (H)", 2) end end })
        bypassSection:AddToggle({ Title = "Slasher - Infinite LakeMist", Default = false,
            Callback = function(v) W.MAWWW_SetLakeMist(v) end })
        bypassSection:AddToggle({ Title = "Slasher - Infinite Pursuit", Default = false,
            Callback = function(v) W.MAWWW_SetPursuit(v) end })
        bypassSection:AddToggle({ Title = "Abyss - Bypass Cooldown", Default = false,
            Callback = function(v) W.MAWWW_SetAbyssBypass(v) end })
        bypassSection:AddToggle({ Title = "Jeff - Infinite Frenzy", Default = false,
            Callback = function(v) W.MAWWW_SetJeffFrenzy(v) end })
        bypassSection:AddButton({ Title = "Auto-Fix Boolean Math", Callback = function()
            pcall(function()
                local b = true
                local mt = debug.getmetatable(b)
                if not mt then mt = {}; debug.setmetatable(b, mt) end
                if setreadonly then setreadonly(mt, false) end
                mt.__div = function() return 0 end
                mt.__mul = function() return 0 end
                mt.__add = function() return 0 end
                mt.__sub = function() return 0 end
                if setreadonly then setreadonly(mt, true) end
            end)
            ForceNotify("Bypass", "Boolean failsafe applied", 2)
        end })

        local UnlockSkillSection = MakeSection(KillerTab, "Unlock Skill While Carrying")
        if not W.W424_CarryConfig then W.W424_CarryConfig = { Enabled = false, Hooked = false } end
        local CarryCfg = W.W424_CarryConfig
        local function SetupCarryHook()
            if CarryCfg.Hooked then return end
            if typeof(getrawmetatable) ~= "function" then return end
            pcall(function()
                local mt = getrawmetatable(game)
                if setreadonly then setreadonly(mt, false) end
                local oldNamecall = mt.__namecall
                mt.__namecall = newcclosure(function(self, ...)
                    local method = getnamecallmethod()
                    local args = {...}
                    if CarryCfg.Enabled and method == "GetAttribute" and not checkcaller() then
                        if args[1] == "IsCarrying" then return false end
                    end
                    return oldNamecall(self, ...)
                end)
                if setreadonly then setreadonly(mt, true) end
                CarryCfg.Hooked = true
            end)
        end
        UnlockSkillSection:AddToggle({
            Title = "Unlock Skill While Carrying",
            Content = "Bisa pakai skill killer walaupun sedang ngangkat survivor",
            Default = false,
            Callback = function(v)
                CarryCfg.Enabled = v
                if v then SetupCarryHook(); VD_Notify("Unlock Carry", "Enabled", 2)
                else VD_Notify("Unlock Carry", "Disabled", 2) end
            end
        })

        local spearSection = MakeSection(KillerTab, "Spear Aimbot")
        spearSection:AddToggle({ Title = "Enable Spear Aimbot", Content = "Auto-aim spear ke survivor",
            Default = VD.SPEAR_Aimbot, Callback = function(v)
                W.SpearAimbot_SetEnabled(v)
                if v then VD_Notify("Spear Aimbot", "Enabled", 2) else VD_Notify("Spear Aimbot", "Disabled", 2) end
            end })
        spearSection:AddSlider({ Title = "Spear Gravity", Min = 10, Max = 200, Default = VD.SPEAR_Gravity, Increment = 1, Callback = function(v) W.SpearAimbot_SetGravity(v) end })
        spearSection:AddSlider({ Title = "Spear Speed", Min = 50, Max = 300, Default = VD.SPEAR_Speed, Increment = 5, Callback = function(v) W.SpearAimbot_SetSpeed(v) end })

        local killerAbilitySection = MakeSection(KillerTab, "Killer Abilities")
        killerAbilitySection:AddToggle({ Title = "Auto Stalk (Myers)", Default = KA.AutoStalk, Callback = function(v)
            W.KA_SetAutoStalk(v); VD_Notify("Auto Stalk", v and "Enabled" or "Disabled", 2) end })
        killerAbilitySection:AddSlider({ Title = "Auto Stalk Range", Min = 20, Max = 500, Default = KA.AutoStalkRange, Increment = 10, Suffix = " studs", Callback = function(v) KA.AutoStalkRange = v; VD.KA_AutoStalkRange = v end })
        killerAbilitySection:AddToggle({ Title = "Auto Kill All", Default = KA.AutoKillAll, Callback = function(v)
            W.KA_SetAutoKillAll(v); VD_Notify("Auto Kill All", v and "Enabled" or "Disabled", 2) end })
        killerAbilitySection:AddToggle({ Title = "Drop All Pallet", Default = KA.DropAllPallet, Callback = function(v)
            W.KA_SetDropAllPallet(v); VD_Notify("Drop All Pallet", v and "Enabled" or "Disabled", 2) end })

        -- [UNLOCKED] Block All Vault
        killerAbilitySection:AddToggle({ Title = "Block All Vault", Default = false, Locked = false, Callback = function(v)
            W.KA_SetBlockAllVault(v); VD_Notify("Block All Vault", v and "Enabled" or "Disabled", 2) end })

        killerAbilitySection:AddButton({ Title = "Instant Auto Kill (1x)", Callback = function()
            local saved = KA.AutoKillAll; KA.AutoKillAll = true
            task.spawn(function() task.wait(0.3); KA.AutoKillAll = saved end)
            VD_Notify("Auto Kill", "Triggered once", 2)
        end })
        killerAbilitySection:AddButton({ Title = "Instant Drop All Pallet (1x)", Callback = function()
            lastDropAllPallet = 0; pcall(W.KA_DropAllPallets)
        end })
        killerAbilitySection:AddButton({ Title = "Instant Block All Vault (1x)", Callback = function()
            lastBlockVault = 0; pcall(W.KA_BlockAllVaults)
        end })
        killerAbilitySection:AddButton({ Title = "Unblock All Vault (1x)", Callback = function()
            local VaultCompleteEvent = ReplicatedStorage:FindFirstChild("Remotes")
                and ReplicatedStorage.Remotes:FindFirstChild("Window")
                and ReplicatedStorage.Remotes.Window:FindFirstChild("VaultCompleteEvent")
            if not VaultCompleteEvent then return end
            local count = 0
            local map = workspace:FindFirstChild("Map"); if not map then return end
            for _, trigger in ipairs(map:GetDescendants()) do
                if trigger.Name == "VaultPointInUse" then
                    local vaultParent = trigger.Parent
                    if vaultParent then
                        pcall(function()
                            VaultCompleteEvent:FireServer(vaultParent, false)
                            count = count + 1
                        end)
                    end
                end
            end
            ForceNotify("Block Vault", "Unblock " .. count .. " vaults!", 3)
        end })
        killerAbilitySection:AddToggle({ Title = "Auto Hook", Content = "Auto carry & hook downed survivor",
            Default = false, Keybind = true,
            Callback = function(v)
                if W.KA_SetAutoHook then W.KA_SetAutoHook(v) end
                if v then VD_Notify("Auto Hook", "Enabled", 2) else VD_Notify("Auto Hook", "Disabled", 2) end
            end })

        local counterParrySection = MakeSection(KillerTab, "Counter Parry")
        counterParrySection:AddToggle({
            Title = "Counter Auto Parry",
            Content = "Spam parry anim pas dekat survivor → burn cooldown dagger mereka",
            Default = false, Keybind = true,
            Callback = function(v)
                W.CounterParry_SetEnabled(v)
                if v then VD_Notify("Counter Parry", "Enabled", 2)
                else VD_Notify("Counter Parry", "Disabled", 2) end
            end
        })

        local perksDisplaySection = MakeSection(SurvivorTab, "Killer Perks Display")
        perksDisplaySection:AddToggle({
            Title = "Enable Killer Perks Display",
            Content = "Floating GUI showing killer perks",
            Default = false,
            Callback = function(v)
                if W.KillerPerksDisplay_SetEnabled then W.KillerPerksDisplay_SetEnabled(v) end
                if v then VD_Notify("Killer Perks Display", "Enabled", 2)
                else VD_Notify("Killer Perks Display", "Disabled", 2) end
            end
        })

        -- [UNLOCKED] Silent Flask
        local flaskSection = MakeSection(KillerTab, "Silent Flask (The Cure)")
        flaskSection:AddToggle({ Title = "Enable Silent Flask", Default = false, Locked = false, Callback = function(v)
            W.Flask_SetEnabled(v)
            if v then VD_Notify("Silent Flask", "Enabled", 2) else VD_Notify("Silent Flask", "Disabled", 2) end
        end })
        flaskSection:AddToggle({ Title = "Show Beam", Default = VD.FLASK_ShowBeam, Callback = function(v) VD.FLASK_ShowBeam = v and true or false end })
        flaskSection:AddToggle({ Title = "Show Landing Marker", Default = VD.FLASK_ShowLanding, Callback = function(v) VD.FLASK_ShowLanding = v and true or false end })
        flaskSection:AddToggle({ Title = "Enable Prediction", Default = VD.FLASK_Predict, Callback = function(v) VD.FLASK_Predict = v and true or false end })
        flaskSection:AddColorPicker({ Title = "Beam Color", Default = VD.FLASK_BeamColor, Save = false, Callback = function(c) W.Flask_SetBeamColor(c) end })
        flaskSection:AddColorPicker({ Title = "Accent Color", Default = VD.FLASK_AccentColor, Save = false, Callback = function(c) W.Flask_SetAccentColor(c) end })
        flaskSection:AddSlider({ Title = "Flask Speed", Min = 30, Max = 200, Default = VD.FLASK_Speed, Increment = 5, Callback = function(v) W.Flask_SetSpeed(v) end })
        flaskSection:AddSlider({ Title = "Flask Gravity", Min = 50, Max = 400, Default = VD.FLASK_Gravity, Increment = 5, Callback = function(v) W.Flask_SetGravity(v) end })
        flaskSection:AddSlider({ Title = "Lead Multiplier", Min = 0, Max = 3, Default = VD.FLASK_LeadMult, Increment = 0.1, Callback = function(v) W.Flask_SetLead(v) end })
        flaskSection:AddSlider({ Title = "Max Range", Min = 50, Max = 500, Default = VD.FLASK_Range, Increment = 10, Suffix = " studs", Callback = function(v) W.Flask_SetRange(v) end })

        local dashLockSection = MakeSection(KillerTab, "Dash Lock")
        dashLockSection:AddToggle({ Title = "Enable Dash Lock", Content = "Auto-lock camera saat pakai dash",
            Default = VD.DashLockEnabled, Callback = function(v)
                W.DashLock_SetEnabled(v)
                if v then VD_Notify("Dash Lock", "Enabled", 2) else VD_Notify("Dash Lock", "Disabled", 2) end
            end })
        dashLockSection:AddSlider({ Title = "Lock Duration", Min = 0.5, Max = 5, Default = VD.DashLockDuration, Increment = 0.1, Suffix = "s", Callback = function(v) VD.DashLockDuration = v end })
        dashLockSection:AddSlider({ Title = "Camera Smoothness", Min = 0.05, Max = 1, Default = VD.DashLockSmoothness, Increment = 0.05, Callback = function(v) VD.DashLockSmoothness = v end })
        dashLockSection:AddToggle({ Title = "Freeze Character During Lock", Default = VD.FreezeDuringDashLock, Callback = function(v)
            VD.FreezeDuringDashLock = v and true or false
            if not v then
                local char = LocalPlayer.Character
                local hum = char and char:FindFirstChildOfClass("Humanoid")
                if hum and hum.WalkSpeed == 0 then hum.WalkSpeed = 16 end
            end
        end })

        -- ============ MISC TAB ============
        local settingsSection = MakeSection(MiscTab, "Settings")
        settingsSection:AddToggle({ Title = "Enable Notifications", Default = true, Callback = function(v)
            W.NotifyEnabled = v
            if v then ForceNotify("Settings", "Notifications Enabled") end
        end })

        local MusicPlayerSongs = {
            ["Sound 1"]              = "90089940136467",
            ["Sound 2"]              = "139197283079137",
            ["Sound 3"]              = "105107170823684",
            ["Sound 4"]              = "76767355656506",
            ["Sound 5"]              = "109627753619575",
            ["Sound 6"]              = "138061809475625",
            ["Sound 7"]              = "83768816338009",
            ["Sound 8"]              = "136708860877320",
            ["Suatu Yg Sempurna"]    = "113639353301886",
            ["CRY FOR ME FUNK"]      = "125230341990848",
            ["No On Noticed"]        = "135609653444873",
            ["Stop it"]              = "72140400888980",
            ["Jangan Pura²"]         = "96568301359656",
            ["Teruskan atau lanjutkan"] = "125097664530702",
            ["Baby Rap A"]           = "1847418280",
            ["Absurd Sound"]         = "112088206507457",
            ["Sweat ice cream"]      = "73450908453508",
            ["Mamak muda"]           = "134073539670673",
            ["Sakit tapi ku rindu"]  = "116986630959929",
        }
        getgenv().GlutoMusicPlayer = getgenv().GlutoMusicPlayer or {
            Sound = nil, CurrentId = nil, SelectedName = "Sound 1",
            CustomId = "", Volume = 1.5, Looped = true
        }
        local MP = getgenv().GlutoMusicPlayer
        local function MusicPlayer_Stop()
            if MP.Sound then
                pcall(function() MP.Sound:Stop(); MP.Sound:Destroy() end)
                MP.Sound = nil; MP.CurrentId = nil
            end
        end
        local function MusicPlayer_Play(id)
            MusicPlayer_Stop()
            if not id or tostring(id) == "" then ForceNotify("Music Player", "ID kosong!", 2); return end
            local ok, snd = pcall(function()
                local s = Instance.new("Sound")
                s.Name = "GlutoMusicPlayer"
                s.SoundId = "rbxassetid://" .. tostring(id)
                s.Volume = MP.Volume or 1.5
                s.Looped = MP.Looped ~= false
                s.Parent = SoundService; s:Play()
                return s
            end)
            if not ok or not snd then ForceNotify("Music Player", "Gagal play (ID invalid?)", 2); return end
            MP.Sound = snd; MP.CurrentId = tostring(id)
            ForceNotify("Music Player", "▶ Playing: " .. tostring(id), 2)
        end
        task.spawn(function()
            if MP.Sound then pcall(function() MP.Sound:Stop(); MP.Sound:Destroy() end); MP.Sound = nil end
        end)

        local musicSection = MakeSection(MiscTab, "Music Player")
        musicSection:AddParagraph({
            Title = "Music Player",
            Content = "Pilih lagu preset dari dropdown, atau pakai Custom ID Roblox audio."
        })
        musicSection:AddDropdown({
            Title = "Pilih Lagu",
            Options = {
                "Sound 1", "Sound 2", "Sound 3", "Sound 4",
                "Sound 5", "Sound 6", "Sound 7", "Sound 8",
                "Suatu Yg Sempurna", "CRY FOR ME FUNK",
                "No On Noticed", "Stop it", "Jangan Pura²",
                "Teruskan atau lanjutkan", "Baby Rap A",
                "Absurd Sound", "Sweat ice cream",
                "Mamak muda", "Sakit tapi ku rindu"
            },
            Default = MP.SelectedName,
            Flag = "Misc_MusicPlayer_SelectedSong",
            Callback = function(v)
                local val = type(v) == "table" and v[1] or v
                MP.SelectedName = val or "Sound 1"
            end
        })
        musicSection:AddButton({
            Title = "▶ Play Selected Song",
            Callback = function()
                local id = MusicPlayerSongs[MP.SelectedName]
                if not id then ForceNotify("Music Player", "Lagu gak ditemukan", 2); return end
                MusicPlayer_Play(id)
            end
        })
        musicSection:AddButton({
            Title = "■ Stop Music",
            Callback = function() MusicPlayer_Stop(); ForceNotify("Music Player", "■ Stopped", 2) end
        })
        local customMusicInput = musicSection:AddInput({
            Title = "Custom Sound ID", Placeholder = "contoh: 90089940136467",
            Default = MP.CustomId, Flag = "Misc_MusicPlayer_CustomId",
            Callback = function(text) MP.CustomId = tostring(text or "") end
        })
        musicSection:AddButton({
            Title = "▶ Play Custom ID",
            Callback = function()
                local id = customMusicInput:Get()
                if not id or id == "" then ForceNotify("Music Player", "Masukin ID dulu!", 2); return end
                id = id:gsub("rbxassetid://", ""):gsub("%s+", "")
                MusicPlayer_Play(id)
            end
        })
        musicSection:AddSlider({
            Title = "Volume", Min = 0, Max = 10, Default = MP.Volume or 1.5, Increment = 0.1,
            Flag = "Misc_MusicPlayer_Volume",
            Callback = function(v) MP.Volume = v; if MP.Sound then MP.Sound.Volume = v end end
        })
        musicSection:AddToggle({
            Title = "Looped", Default = MP.Looped ~= false,
            Flag = "Misc_MusicPlayer_Looped",
            Callback = function(v) MP.Looped = v; if MP.Sound then MP.Sound.Looped = v end end
        })
        musicSection:AddParagraph({
            Title = "Daftar Lagu",
            Content = "Sound 1-7 + CRY FOR ME FUNK"
        })

        local stunSection = MakeSection(MiscTab, "Stun Indicator")
        stunSection:AddToggle({ Title = "Enable Stun Indicator", Default = false, Callback = function(v)
            W.SInd_SetEnabled(v); if v then VD_Notify("Stun Indicator", "Enabled", 2) end end })
        stunSection:AddDropdown({ Title = "Stun Sound",
            Options = { "Default", "Clash Royale", "Blash", "Coin", "Kururin Kuru", "Spongebob", "Fahhhh", "Cave", "Aughhh", "Samsung", "iPhone", "Siren" },
            Default = "Default", Callback = function(v)
                local val = type(v) == "table" and v[1] or v
                SInd.SelectedSound = val
                ForceNotify("Stun Indicator", "Sound: " .. val, 2)
            end })
        stunSection:AddToggle({ Title = "Stun Sound Alert", Default = true, Callback = function(v) SInd.SoundEnabled = v end })
        stunSection:AddButton({ Title = "Preview Sound", Callback = function()
            pcall(function()
                local snd = Instance.new("Sound")
                snd.SoundId = "rbxassetid://" .. tostring(SInd_GetActiveSoundId())
                snd.Volume = SInd.SoundVolume or 1.5
                snd.Parent = LocalPlayer:FindFirstChildOfClass("PlayerGui") or Workspace
                snd:Play()
                snd.Ended:Connect(function() pcall(function() snd:Destroy() end) end)
                task.delay(5, function() pcall(function() if snd and snd.Parent then snd:Destroy() end end) end)
            end)
        end })
        stunSection:AddSlider({ Title = "Detect Range", Min = 50, Max = 2000, Default = 500, Increment = 25, Suffix = " studs", Callback = function(v) SInd.Range = v end })
        stunSection:AddSlider({ Title = "Sound Volume", Min = 0, Max = 5, Default = 1.5, Increment = 0.1, Callback = function(v) SInd.SoundVolume = v end })

-- 🔓 UNLOCKED: VDT Invisible FE
local invisSection = MakeSection(MiscTab, "Invisibility (VDT)")
invisSection:AddParagraph({ Title = "VDT Bypass", Content = "Bikin karakter lu ilang di layar orang lain (FE Bypass)." })
invisSection:AddToggle({ 
    Title = "Enable Invisibility", 
    Default = false, 
    Callback = function(v)
        ToggleVDTInvis(v)
        if v then VD_Notify("Invisible", "Enabled (Kamu tidak terlihat)", 2)
        else VD_Notify("Invisible", "Disabled", 2) end
    end 
})
invisSection:AddToggle({ 
    Title = "Show Invisible Gui", 
    Default = false, 
    Callback = function(v)
        if getgenv().Gluto_InvisBtn_SetEnabled then 
            getgenv().Gluto_InvisBtn_SetEnabled(v) 
        end
    end 
})

        local camDBDSection = MakeSection(MiscTab, "Camera DBD")
        camDBDSection:AddToggle({ Title = "DBD Camera (Smooth Follow)", Default = false, Callback = function(v)
            W.CamDBD_SetSmooth(v); VD_Notify("Camera DBD", v and "Smooth ON" or "Smooth OFF", 2) end })
        camDBDSection:AddSlider({ Title = "Camera Smoothness", Min = 1, Max = 30, Default = 4, Increment = 1, Callback = function(v) W.CamDBD_SetSmoothSpeed(v) end })
        camDBDSection:AddToggle({ Title = "POV Lock", Default = false, Callback = function(v)
            W.CamDBD_SetPOVLock(v); VD_Notify("Camera DBD", v and "POV Lock ON" or "POV Lock OFF", 2) end })
        camDBDSection:AddSlider({ Title = "POV Value", Min = 60, Max = 120, Default = 85, Increment = 1, Suffix = "°", Callback = function(v) W.CamDBD_SetTargetPOV(v) end })
        camDBDSection:AddSlider({ Title = "POV Smoothness", Min = 3, Max = 20, Default = 9, Increment = 1, Callback = function(v) W.CamDBD_SetPOVSmooth(v) end })

        local puSection = MakeSection(MiscTab, "Player Utility")
        puSection:AddToggle({ Title = "Speed Hack", Default = false, Callback = function(v)
            PU.SpeedEnabled = v and true or false
            if not v then
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then hum.WalkSpeed = 16 end
            end
            if v then VD_Notify("Player Utility", "Speed Hack ON", 2) end
        end })
        puSection:AddSlider({ Title = "Speed Value", Min = 16, Max = 200, Default = 16, Increment = 1, Callback = function(v) PU.SpeedValue = v end })
        puSection:AddToggle({ Title = "Skip End Screen", Default = false, Callback = function(v)
            PU.SkipEndScreen = v and true or false
            if v then VD_Notify("Player Utility", "Skip End Screen ON", 2) end
        end })
        puSection:AddToggle({ Title = "Shift Lock", Default = false, Callback = function(v)
            PU.ShiftLock = v and true or false
            if not v and PU._shiftLockWasActive then
                local hum = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                if hum then pcall(function() hum.AutoRotate = true end) end
                PU._shiftLockWasActive = false
            end
            if v then VD_Notify("Player Utility", "Shift Lock ON", 2) end
        end })
        puSection:AddToggle({ Title = "Hide Survivor Icon", Default = false, Callback = function(v)
            PU.HideSurvivorIcon = v and true or false
            if v then PU_ApplyHideSurvivorIcon() else PU_RestoreSurvivorIcon() end
        end })
        puSection:AddToggle({ Title = "Show Ping & FPS", Default = false, Callback = function(v)
            PU.ShowPingFPS = v and true or false
            if v then
                PU_CreatePingFPS()
                PU._FPS.frames = 0; PU._FPS.last = tick()
                VD_Notify("Player Utility", "Ping & FPS ON", 2)
            elseif PU._pingGui then
                pcall(function() PU._pingGui:Destroy() end)
                PU._pingGui = nil
            end
        end })
        puSection:AddToggle({ Title = "Hide Name", Default = false, Callback = function(v)
            PU_SetHideName(v); if v then VD_Notify("Player Utility", "Hide Name ON", 2) end
        end })
        puSection:AddToggle({ Title = "Unlimited Zoom", Default = false, Callback = function(v)
            PU.UnlimitedZoom = v and true or false
            if not v then
                pcall(function()
                    LocalPlayer.CameraMaxZoomDistance = 128
                    LocalPlayer.CameraMinZoomDistance = 0.5
                end)
            end
        end })
        puSection:AddToggle({ Title = "Noclip", Default = false, Callback = function(v)
            PU.Noclip = v and true or false
            if not v then PU_RestoreNoclip() end
            if v then VD_Notify("Player Utility", "Noclip ON", 2) end
        end })

        local sbSection = MakeSection(MiscTab, "Speed Boost")
        sbSection:AddToggle({
            Title = "Enable Speed Boost",
            Content = "Auto-apply WalkSpeed, disabled saat stun/attack/downed",
            Default = false, Keybind = true,
            Callback = function(v)
                if W.SpeedBoost_SetEnabled then W.SpeedBoost_SetEnabled(v) end
                if v then VD_Notify("Speed Boost", "Enabled", 2)
                else VD_Notify("Speed Boost", "Disabled", 2) end
            end
        })
        sbSection:AddSlider({
            Title = "Speed Value", Min = 16, Max = 100, Default = 30, Increment = 1,
            Callback = function(v) if W.SpeedBoost_SetValue then W.SpeedBoost_SetValue(v) end end
        })

        local cursorSection = MakeSection(MiscTab, "Cursor Feature")
        cursorSection:AddParagraph({
            Title = "Cursor Unlock",
            Content = "Unlock cursor & disable auto-rotate. Hotkey: Left/Right Alt"
        })
        cursorSection:AddToggle({
            Title = "Enable Cursor Unlock",
            Content = "Show cursor & disable camera auto-rotate (ALT toggle)",
            Default = false, Keybind = true,
            Callback = function(v)
                if W.Cursor_SetEnabled then W.Cursor_SetEnabled(v) end
                if v then VD_Notify("Cursor Unlock", "Enabled", 2)
                else VD_Notify("Cursor Unlock", "Disabled", 2) end
            end
        })
        cursorSection:AddButton({
            Title = "Toggle Cursor Now",
            Content = "Quick toggle without unchecking",
            Callback = function()
                if W.Cursor_SetEnabled then W.Cursor_SetEnabled(not VD.CursorEnabled) end
                VD_Notify("Cursor Unlock", VD.CursorEnabled and "ON" or "OFF", 2)
            end
        })

        local jerkSection = MakeSection(MiscTab, "Jerk Off")
        jerkSection:AddParagraph({
            Title = "Jerk Off Tool",
            Content = "Tool dengan animasi & tooltip meme. Equip buat mulai."
        })
        jerkSection:AddToggle({
            Title = "Enable Jerk Off Tool",
            Content = "Auto-spawn tool Jerk Off ke Backpack",
            Default = false, Keybind = true,
            Callback = function(v)
                W.JerkOff_SetEnabled(v)
                if v then VD_Notify("Jerk Off", "Tool spawned!", 2)
                else VD_Notify("Jerk Off", "Tool removed", 2) end
            end
        })

        local flySection = MakeSection(MiscTab, "Fly GUI")
        flySection:AddParagraph({
            Title = "Fly GUI",
            Content = "Load external Fly GUI Remake dari ScriptBlox. Klik tombol di bawah buat inject."
        })
        flySection:AddButton({
            Title = "Load Fly GUI",
            Callback = function()
                local ok, err = pcall(function()
                    loadstring(game:HttpGet("https://scriptblox.com/raw/Universal-Script-Fly-GUI-Remake-231469"))()
                end)
                if ok then ForceNotify("Fly GUI", "berhasil di-load!", 3)
                else ForceNotify("Fly GUI", "Gagal load: " .. tostring(err), 4) end
            end
        })

        local emoteSection = MakeSection(MiscTab, "Emote")
        emoteSection:AddToggle({ Title = "Enable Emote", Default = false, Callback = function(v)
            W.EmoteSystem_SetEnabled(v)
            if v then VD_Notify("Emote", "Playing: " .. W.EmoteSystem.SelectedEmote, 2)
            else VD_Notify("Emote", "Stopped", 2) end
        end })
        emoteSection:AddDropdown({ Title = "Select Emote", Options = W.EmoteSystem.Options, Default = "Friday Night", Multi = false,
            Callback = function(v)
                local val = type(v) == "table" and v[1] or v
                W.EmoteSystem_SelectEmote(val or "Friday Night")
                VD_Notify("Emote", "Selected: " .. W.EmoteSystem.SelectedEmote, 2)
            end })
        emoteSection:AddButton({ Title = "Stop Emote", Callback = function()
            W.EmoteSystem_Stop(); W.EmoteSystem.Enabled = false; VD_Notify("Emote", "Stopped", 2)
        end })
        emoteSection:AddButton({ Title = "Replay Current Emote", Callback = function()
            if not W.EmoteSystem.Enabled then VD_Notify("Emote", "Enable dulu!", 2); return end
            W.EmoteSystem_Play()
            VD_Notify("Emote", "Replaying: " .. W.EmoteSystem.SelectedEmote, 2)
        end })

        local FakeAvatarSection = MakeSection(MiscTab, "Fake Avatar")
        local FakeAvatarEnabled = false
        local SelectedFakeAva = LocalPlayer.UserId
        local function LoadAppearanceIntoChar(appearance, character, head)
            local items = appearance:GetChildren()
            local function applyMesh(obj)
                if obj:IsA("CharacterMesh") or obj:IsA("BodyColors") or obj:IsA("Shirt") or obj:IsA("Pants") then
                    local existing = character:FindFirstChild(obj.Name)
                    if existing and existing.ClassName == obj.ClassName then existing:Destroy() end
                    obj:Clone().Parent = character
                end
            end
            for _, item in pairs(items) do
                if item:IsA("Folder") or item:IsA("Model") then
                    for _, subItem in pairs(item:GetChildren()) do applyMesh(subItem) end
                else applyMesh(item) end
            end
            for _, item in pairs(items) do
                if item:IsA("SpecialMesh") and head then
                    local targetMesh = head:FindFirstChildOfClass("SpecialMesh") or Instance.new("SpecialMesh", head)
                    targetMesh.MeshType = Enum.MeshType.FileMesh
                    targetMesh.MeshId = item.MeshId
                    targetMesh.TextureId = item.TextureId
                elseif item:IsA("Decal") and item.Name == "face" and head then
                    if head:FindFirstChild("face") then head.face:Destroy() end
                    item:Clone().Parent = head
                end
            end
            for _, item in pairs(items) do
                if item:IsA("Accessory") then
                    local clone = item:Clone()
                    local handle = clone:FindFirstChild("Handle")
                    if handle then
                        local att = handle:FindFirstChildOfClass("Attachment")
                        if att then
                            local targetAtt = character:FindFirstChild(att.Name, true)
                            if targetAtt then
                                local weld = Instance.new("Weld")
                                weld.Part0 = handle; weld.Part1 = targetAtt.Parent
                                weld.C0 = att.CFrame; weld.C1 = targetAtt.CFrame
                                weld.Parent = handle
                            end
                        end
                        handle.CanCollide = false; handle.Massless = true; clone.Parent = character
                    end
                end
            end
        end
        local function ApplyFakeAvatar()
            local character = LocalPlayer.Character
            if not character or not SelectedFakeAva then return end
            local humanoid = character:FindFirstChildOfClass("Humanoid"); if not humanoid then return end
            task.spawn(function()
                local success, appearance = pcall(function()
                    return game:GetService("Players"):GetCharacterAppearanceAsync(SelectedFakeAva)
                end)
                if not success or not appearance then warn("[FakeAvatar] Gagal load data avatar!"); return end
                for _, obj in pairs(character:GetChildren()) do
                    if obj:IsA("Accessory") or obj:IsA("Shirt") or obj:IsA("Pants")
                    or obj:IsA("BodyColors") or obj:IsA("CharacterMesh") or obj:IsA("ShirtGraphic") then
                        obj:Destroy()
                    end
                end
                local head = character:FindFirstChild("Head")
                if head then
                    for _, hObj in pairs(head:GetChildren()) do
                        if hObj:IsA("SpecialMesh") or hObj:IsA("Decal") then hObj:Destroy() end
                    end
                    local m = Instance.new("SpecialMesh", head)
                    m.MeshType = Enum.MeshType.Head; m.Scale = Vector3.new(1, 1, 1)
                end
                local scaleDefaults = { BodyDepthScale = 1, BodyHeightScale = 1, BodyWidthScale = 1, HeadScale = 1, BodyTypeScale = 0, BodyProportionScale = 0 }
                for scaleName, val in pairs(scaleDefaults) do
                    local s = humanoid:FindFirstChild(scaleName); if s then s.Value = val end
                end
                task.wait(0.1)
                LoadAppearanceIntoChar(appearance, character, head)
                pcall(function()
                    local info = game:GetService("Players"):GetCharacterAppearanceInfoAsync(SelectedFakeAva)
                    if head and info.assets then
                        for _, asset in pairs(info.assets) do
                            if asset.assetType.name == "Face" then
                                if head:FindFirstChild("face") then head.face:Destroy() end
                                local f = Instance.new("Decal", head)
                                f.Name = "face"; f.Texture = "rbxassetid://" .. asset.id
                                break
                            end
                        end
                    end
                end)
            end)
        end
        FakeAvatarSection:AddDropdown({ Title = "Fake Avatar Preset",
            Options = { "Self Avatar", "Random 1", "Random 2", "Random 3", "Random 4", "Random 5", "Random 6", "Random 7",
                "WoozyNate", "Nicholas", "yvlyf", "traevp", "J0LLY", "LucashDev", "CEOofIsaac", "Stealthy", "Wildes", "Talon",
                "Relukt", "Sammy", "Diesel", "S4ans03", "Aura", "iJava", "White Guy", "Purple King", "Kachaaaa Gay", "Mpruyyy" },
            Default = "Self Avatar",
            Callback = function(option)
                local ids = {
                    ["Self Avatar"] = LocalPlayer.UserId, ["Random 1"] = 2888298851, ["Random 2"] = 10074747755,
                    ["Random 3"] = 5209567453, ["Random 4"] = 8991982843, ["Random 5"] = 5796319029, ["Random 6"] = 9744452117,
                    ["Random 7"] = 8476755006, ["WoozyNate"] = 146089324, ["Nicholas"] = 909635, ["yvlyf"] = 181751703,
                    ["traevp"] = 471607078, ["J0LLY"] = 1073847038, ["LucashDev"] = 2525651744, ["CEOofIsaac"] = 63238912,
                    ["Stealthy"] = 56602747, ["Wildes"] = 40397833, ["Talon"] = 75974130, ["Relukt"] = 65042011,
                    ["Sammy"] = 2678001507, ["Diesel"] = 9123921576, ["S4ans03"] = 35439794, ["Aura"] = 2275806428,
                    ["iJava"] = 276557820, ["White Guy"] = 8843268357, ["Purple King"] = 9070758608,
                    ["Kachaaaa Gay"] = 8956318334, ["Mpruyyy"] = 8340163775
                }
                SelectedFakeAva = ids[option] or LocalPlayer.UserId
                if FakeAvatarEnabled then ApplyFakeAvatar() end
            end })
        FakeAvatarSection:AddToggle({ Title = "Enable Fake Avatar", Default = false, Keybind = true, Callback = function(state)
            FakeAvatarEnabled = state
            if state then ApplyFakeAvatar() end
        end })
        local UsernameInput = ""
        FakeAvatarSection:AddInput({ Title = "Fake Avatar Via Username", Placeholder = "username (tanpa @)",
            Callback = function(input) UsernameInput = (input or ""):gsub("^@", "") end })
        FakeAvatarSection:AddButton({ Title = "Apply From Username", Callback = function()
            if UsernameInput == "" then ForceNotify("Fake Avatar", "Masukkan username dulu!", 2); return end
            local ok, userId = pcall(function() return game:GetService("Players"):GetUserIdFromNameAsync(UsernameInput) end)
            if not ok or not userId then ForceNotify("Fake Avatar", "Username tidak ditemukan: " .. UsernameInput, 2); return end
            SelectedFakeAva = userId
            ApplyFakeAvatar()
            ForceNotify("Fake Avatar", "Applied: @" .. UsernameInput, 2)
        end })
        LocalPlayer.CharacterAdded:Connect(function()
            if FakeAvatarEnabled then task.wait(1); ApplyFakeAvatar() end
        end)

        local KorlessSection = MakeSection(MiscTab, "Fake Korless")
        local KorlessMorph = { Enabled = false, Connection = nil }
        local function ApplyKorless()
            local plr = LocalPlayer
            local function Morph()
                repeat task.wait() until plr.Character
                    and plr.Character:FindFirstChild("HumanoidRootPart")
                    and plr.Character:FindFirstChild("Right Leg")
                task.wait(0.1)
                local char = plr.Character
                pcall(function()
                    char.Head.Transparency = 1
                    local face = char.Head:FindFirstChild("face")
                    if face then face:Destroy() end
                    char["Right Leg"].Transparency = 1
                    local old = char:FindFirstChild("KorlessHead")
                    if old then old:Destroy() end
                    local mesh = Instance.new("MeshPart")
                    mesh.Name = "KorlessHead"
                    mesh.Size = Vector3.new(1.5, 1.5, 1.5)
                    mesh.CanCollide = false
                    mesh.MeshId = "rbxassetid://902942096"
                    mesh.TextureID = "rbxassetid://902843398"
                    mesh.CFrame = char["Right Leg"].CFrame * CFrame.new(0, 0.5, 0)
                    mesh.Parent = char
                    local weld = Instance.new("WeldConstraint")
                    weld.Part0 = char["Right Leg"]
                    weld.Part1 = mesh
                    weld.Parent = mesh
                end)
            end
            Morph()
            if KorlessMorph.Connection then KorlessMorph.Connection:Disconnect() end
            KorlessMorph.Connection = plr.CharacterAdded:Connect(function()
                task.wait(1); Morph()
            end)
        end
        local function RemoveKorless()
            local char = LocalPlayer.Character
            if char then
                local mesh = char:FindFirstChild("KorlessHead")
                if mesh then mesh:Destroy() end
                if char:FindFirstChild("Head") then char.Head.Transparency = 0 end
                if char:FindFirstChild("Right Leg") then char["Right Leg"].Transparency = 0 end
            end
            if KorlessMorph.Connection then
                KorlessMorph.Connection:Disconnect()
                KorlessMorph.Connection = nil
            end
        end
        KorlessSection:AddToggle({
            Title = "Korless Morph",
            Content = "Ganti kepala jadi Korless (mesh ditaruh di kaki kanan)",
            Default = false,
            Callback = function(v)
                KorlessMorph.Enabled = v
                if v then ApplyKorless(); VD_Notify("Korless Morph", "Enabled", 2)
                else RemoveKorless(); VD_Notify("Korless Morph", "Disabled", 2) end
            end
        })

        local HeaderSection = MakeSection(MiscTab, "Header Title")
        local HeaderEnabled = false
        local HeaderText = "Promers"
        local HeaderState = { Billboard = nil, TextLabel = nil, ShineLabel = nil, ShineGradient = nil, SizeConnection = nil }
        local BASE_WIDTH = isMobile and 90 or 140
        local BASE_HEIGHT = isMobile and 20 or 32
        local BASE_DISTANCE = 12
        local MIN_SCALE = 0.6
        local MAX_SCALE = isMobile and 1.1 or 1.4
        local function Header_Create()
            if HeaderState.Billboard then HeaderState.Billboard:Destroy() end
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            if not character:FindFirstChild("Head") then return end
            local billboard = Instance.new("BillboardGui")
            billboard.Name = "GlutoHeaderBillboard"
            billboard.Adornee = character.Head
            billboard.Size = UDim2.new(0, BASE_WIDTH, 0, BASE_HEIGHT)
            billboard.StudsOffset = Vector3.new(0, 1.5, 0)
            billboard.AlwaysOnTop = true; billboard.LightInfluence = 0
            billboard.Parent = character
            HeaderState.Billboard = billboard
            local textLabel = Instance.new("TextLabel")
            textLabel.Name = "BaseText"; textLabel.Size = UDim2.new(1, 0, 1, 0)
            textLabel.BackgroundTransparency = 1; textLabel.TextScaled = true
            textLabel.Font = Enum.Font.GothamBold; textLabel.TextStrokeTransparency = 0.5
            textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
            textLabel.TextColor3 = _G.GLUTO_THEME
            textLabel.Text = HeaderText; textLabel.ZIndex = 1; textLabel.Parent = billboard
            HeaderState.TextLabel = textLabel
            local shineLabel = Instance.new("TextLabel")
            shineLabel.Name = "ShineText"; shineLabel.Size = UDim2.new(1, 0, 1, 0)
            shineLabel.BackgroundTransparency = 1; shineLabel.TextScaled = true
            shineLabel.Font = Enum.Font.GothamBold; shineLabel.TextStrokeTransparency = 1
            shineLabel.Text = HeaderText; shineLabel.TextColor3 = _G.GLUTO_THEME
            shineLabel.ZIndex = 2; shineLabel.Parent = billboard
            HeaderState.ShineLabel = shineLabel
            local shineGradient = Instance.new("UIGradient")
            shineGradient.Name = "ShineGradient"; shineGradient.Rotation = 20
            shineGradient.Transparency = NumberSequence.new({
                NumberSequenceKeypoint.new(0.00, 1), NumberSequenceKeypoint.new(0.30, 1),
                NumberSequenceKeypoint.new(0.42, 0), NumberSequenceKeypoint.new(0.58, 0),
                NumberSequenceKeypoint.new(0.70, 1), NumberSequenceKeypoint.new(1.00, 1),
            })
            shineGradient.Offset = Vector2.new(-1, 0); shineGradient.Parent = shineLabel
            HeaderState.ShineGradient = shineGradient
            if HeaderState.SizeConnection then HeaderState.SizeConnection:Disconnect() end
            HeaderState.SizeConnection = RunService.RenderStepped:Connect(function()
                if not billboard or not billboard.Parent then HeaderState.SizeConnection:Disconnect(); return end
                local head = character:FindFirstChild("Head"); if not head then return end
                local dist = (Workspace.CurrentCamera.CFrame.Position - head.Position).Magnitude
                local scaleFactor = math.clamp(BASE_DISTANCE / dist, MIN_SCALE, MAX_SCALE)
                billboard.Size = UDim2.new(0, BASE_WIDTH * scaleFactor, 0, BASE_HEIGHT * scaleFactor)
            end)
            task.spawn(function()
                while shineLabel and shineLabel.Parent and shineGradient and shineGradient.Parent do
                    shineGradient.Offset = Vector2.new(-1, 0)
                    local tween = TweenService:Create(shineGradient, TweenInfo.new(4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { Offset = Vector2.new(1, 0) })
                    tween:Play(); tween.Completed:Wait(); task.wait(2)
                end
            end)
        end
        local function Header_UpdateText(text)
            HeaderText = text or "Promers"
            if HeaderState.TextLabel then HeaderState.TextLabel.Text = HeaderText end
            if HeaderState.ShineLabel then HeaderState.ShineLabel.Text = HeaderText end
        end
        local function Header_Toggle(enabled)
            if enabled then Header_Create()
            else
                if HeaderState.SizeConnection then HeaderState.SizeConnection:Disconnect(); HeaderState.SizeConnection = nil end
                if HeaderState.Billboard then HeaderState.Billboard:Destroy() end
                HeaderState.Billboard = nil; HeaderState.TextLabel = nil
                HeaderState.ShineLabel = nil; HeaderState.ShineGradient = nil
            end
        end
        HeaderSection:AddInput({ Title = "Header Text", Default = "Promers", Placeholder = "Nama header lu...",
            Callback = function(input) Header_UpdateText(input) end })
        HeaderSection:AddToggle({ Title = "Enable Header Title", Default = false, Callback = function(v)
            HeaderEnabled = v; Header_Toggle(v) end })
        HeaderSection:AddColorPicker({ Title = "Header Color", Default = _G.GLUTO_THEME, Save = false,
            Callback = function(c)
                if HeaderState.TextLabel then HeaderState.TextLabel.TextColor3 = c end
                if HeaderState.ShineLabel then HeaderState.ShineLabel.TextColor3 = _G.GLUTO_THEME end
            end })
        LocalPlayer.CharacterAdded:Connect(function()
            task.wait(1)
            if HeaderEnabled then Header_Toggle(true) end
        end)

        -- ============ SPECTATOR COUNTER ============
local SpecSection = MakeSection(MiscTab, "Spectator Counter")
local SpecEnabled = false
local SpecGui = nil
local SpecLabel = nil
local SpecThread = nil
local SpecExpanded = true
local SpecEyeIcon = nil
local SpecIconGlow = nil

local function Spec_CreateUI()
    if SpecGui then SpecGui:Destroy(); SpecGui = nil end
    local safeParent = SafeGuiParent()
    
    SpecGui = Instance.new("ScreenGui")
    SpecGui.Name = "PromersSpectatorCounter"
    SpecGui.ResetOnSpawn = false
    SpecGui.IgnoreGuiInset = true
    SpecGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    SpecGui.Parent = safeParent
    
    -- Container Utama
    local mainFrame = Instance.new("Frame", SpecGui)
    mainFrame.Name = "MainBox"
    mainFrame.AnchorPoint = Vector2.new(0.5, 0)
    mainFrame.Position = UDim2.new(0.5, 0, 0.40, 0)
    mainFrame.Size = UDim2.new(0, 160, 0, 52)
    mainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
    mainFrame.BorderSizePixel = 0
    mainFrame.Active = true
    
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 10)
    
    local bgGrad = Instance.new("UIGradient", mainFrame)
    bgGrad.Color = ColorSequence.new(Color3.fromRGB(28, 28, 28), Color3.fromRGB(10, 10, 10))
    bgGrad.Rotation = 135
    
    local stroke = Instance.new("UIStroke", mainFrame)
    stroke.Color = Color3.fromRGB(80, 80, 80)
    stroke.Thickness = 1.2
    stroke.Transparency = 0.2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    -- Garis Aksen Atas
    local topBar = Instance.new("Frame", mainFrame)
    topBar.Size = UDim2.new(1, -24, 0, 2)
    topBar.Position = UDim2.new(0, 12, 0, 0)
    topBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    topBar.BorderSizePixel = 0
    Instance.new("UICorner", topBar).CornerRadius = UDim.new(1, 0)
    local topGlow = Instance.new("UIGradient", topBar)
    topGlow.Transparency = NumberSequence.new({
        NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(0.5, 0), NumberSequenceKeypoint.new(1, 1)
    })

    -- Header (Area Drag & Minimize)
    local header = Instance.new("Frame", mainFrame)
    header.Name = "Header"
    header.Size = UDim2.new(1, 0, 0, 20)
    header.Position = UDim2.new(0, 0, 0, 4)
    header.BackgroundTransparency = 1
    
    local title = Instance.new("TextLabel", header)
    title.Size = UDim2.new(1, -30, 1, 0)
    title.Position = UDim2.new(0, 12, 0, 0)
    title.BackgroundTransparency = 1
    title.Font = Enum.Font.GothamBold
    title.Text = "SPECTATORS"
    title.TextColor3 = Color3.fromRGB(200, 200, 200)
    title.TextSize = 10
    title.TextXAlignment = Enum.TextXAlignment.Left

    local minBtn = Instance.new("TextButton", header)
    minBtn.Name = "MinBtn"
    minBtn.Size = UDim2.new(0, 20, 0, 20)
    minBtn.Position = UDim2.new(1, -24, 0, 0)
    minBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    minBtn.Text = "−"
    minBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    minBtn.Font = Enum.Font.GothamBold
    minBtn.TextSize = 14
    minBtn.AutoButtonColor = false
    Instance.new("UICorner", minBtn).CornerRadius = UDim.new(0, 6)
    
    minBtn.MouseEnter:Connect(function() TweenService:Create(minBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(60,60,60) }):Play() end)
    minBtn.MouseLeave:Connect(function() TweenService:Create(minBtn, TweenInfo.new(0.15), { BackgroundColor3 = Color3.fromRGB(30,30,30) }):Play() end)

    -- Divider
    local divider = Instance.new("Frame", mainFrame)
    divider.Name = "Divider"
    divider.Size = UDim2.new(1, -24, 0, 1)
    divider.Position = UDim2.new(0, 12, 0, 24)
    divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    divider.BackgroundTransparency = 0.85
    divider.BorderSizePixel = 0

    -- Body (Isi)
    local body = Instance.new("Frame", mainFrame)
    body.Name = "Body"
    body.Size = UDim2.new(1, 0, 1, -26)
    body.Position = UDim2.new(0, 0, 0, 26)
    body.BackgroundTransparency = 1
    body.ClipsDescendants = true
    
    local bodyLayout = Instance.new("UIListLayout", body)
    bodyLayout.FillDirection = Enum.FillDirection.Horizontal
    bodyLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    bodyLayout.VerticalAlignment = Enum.VerticalAlignment.Center
    bodyLayout.Padding = UDim.new(0, 8)

    -- Ikon Mata dengan Efek Glow
    local iconWrap = Instance.new("Frame", body)
    iconWrap.Size = UDim2.new(0, 24, 0, 24)
    iconWrap.BackgroundTransparency = 1
    
    SpecIconGlow = Instance.new("ImageLabel", iconWrap)
    SpecIconGlow.Size = UDim2.new(0, 24, 0, 24)
    SpecIconGlow.BackgroundTransparency = 1
    SpecIconGlow.Image = "rbxassetid://13321848320" -- Ikon Mata
    SpecIconGlow.ImageColor3 = Color3.fromRGB(255, 255, 255)
    SpecIconGlow.ImageTransparency = 0.8
    
    SpecEyeIcon = Instance.new("ImageLabel", iconWrap)
    SpecEyeIcon.Size = UDim2.new(0, 18, 0, 18)
    SpecEyeIcon.Position = UDim2.new(0, 3, 0, 3)
    SpecEyeIcon.BackgroundTransparency = 1
    SpecEyeIcon.Image = "rbxassetid://13321848320"
    SpecEyeIcon.ImageColor3 = Color3.fromRGB(255, 255, 255)

    -- Teks Angka & Label
    SpecLabel = Instance.new("TextLabel", body)
    SpecLabel.Name = "CountLabel"
    SpecLabel.BackgroundTransparency = 1
    SpecLabel.Font = Enum.Font.GothamBold
    SpecLabel.Text = "0 Spectating"
    SpecLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
    SpecLabel.TextSize = 13
    SpecLabel.AutomaticSize = Enum.AutomaticSize.X

    -- Animasi Glow Berkedip
    task.spawn(function()
        while SpecIconGlow and SpecIconGlow.Parent do
            TweenService:Create(SpecIconGlow, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { ImageTransparency = 0.4, Size = UDim2.new(0, 28, 0, 28), Position = UDim2.new(0, -2, 0, -2) }):Play()
            task.wait(1)
            if not SpecIconGlow or not SpecIconGlow.Parent then break end
            TweenService:Create(SpecIconGlow, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { ImageTransparency = 0.9, Size = UDim2.new(0, 24, 0, 24), Position = UDim2.new(0, 0, 0, 0) }):Play()
            task.wait(1)
        end
    end)

    local function setExpanded(state)
        SpecExpanded = state
        if state then
            TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 160, 0, 52) }):Play()
            divider.Visible = true; body.Visible = true; minBtn.Text = "−"
        else
            TweenService:Create(mainFrame, TweenInfo.new(0.3, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), { Size = UDim2.new(0, 160, 0, 26) }):Play()
            divider.Visible = false; body.Visible = false; minBtn.Text = "+"
        end
    end
    
    minBtn.MouseButton1Click:Connect(function() setExpanded(not SpecExpanded) end)
    setExpanded(true)

    -- Logika Drag
    local dragging, dragStart, startPos = false, nil, nil
    header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true; dragStart = input.Position; startPos = mainFrame.Position
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if not dragging then return end
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then 
            dragging = false 
        end
    end)
end

local function Spec_Update()
    if not SpecEnabled or not SpecLabel then return end
    local count = 0
    for _, p in ipairs(Players:GetPlayers()) do
        if p.Team and p.Team.Name == "Spectator" then count = count + 1 end
    end
    
    if count == 0 then
        SpecLabel.Text = "0 Spectating"
        SpecLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
        if SpecEyeIcon then SpecEyeIcon.ImageColor3 = Color3.fromRGB(150, 150, 150) end
    else
        SpecLabel.Text = count .. " Spectating"
        SpecLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
        if SpecEyeIcon then SpecEyeIcon.ImageColor3 = Color3.fromRGB(255, 255, 255) end
    end
end

SpecSection:AddToggle({ Title = "Enable Spectator Counter", Default = false, Callback = function(state)
    SpecEnabled = state
    if SpecThread then task.cancel(SpecThread); SpecThread = nil end
    if state then
        Spec_CreateUI(); Spec_Update()
        SpecThread = task.spawn(function()
            while SpecEnabled do Spec_Update(); task.wait(1.2) end
        end)
    else
        if SpecGui then SpecGui:Destroy(); SpecGui = nil; SpecLabel = nil end
    end
end })

        -- ============ CONFIG TAB ============
        do
            local cfgSection = MakeSection(ConfigTab, "Config Manager")
            local currentName = ""
            local selectedConfig = nil
            local configList = nil
            local function ConfigFolderPath() return "Gluto/Config" end
            local function EnsureConfigFolder()
                if isfolder and makefolder then
                    if not isfolder("Gluto") then makefolder("Gluto") end
                    if not isfolder(ConfigFolderPath()) then makefolder(ConfigFolderPath()) end
                end
            end
            EnsureConfigFolder()
            local function RefreshConfigList()
                local list = {}
                if listfiles then
                    EnsureConfigFolder()
                    local ok2, files = pcall(listfiles, ConfigFolderPath())
                    if ok2 and files then
                        for _, f in ipairs(files) do
                            local n = string.match(f, "([^/\\]+)%.json$")
                            if n and n ~= "_autoload" then table.insert(list, n) end
                        end
                    end
                end
                if configList and configList.SetValues then configList:SetValues(list, selectedConfig, true) end
                return list
            end
            local function ApplyConfig(data)
    if type(data) ~= "table" then return 0, 0 end
    local applied, missing = 0, 0
    
    -- Kumpulin dulu semua key yang mau di-load
    local keysToLoad = {}
    for k, v in pairs(data) do
        if k ~= "_version" and k ~= "_autoload" then
            table.insert(keysToLoad, k)
        end
    end
    
    -- Eksekusi satu per satu pake task.spawn biar gak nge-lag
    for _, k in ipairs(keysToLoad) do
        local v = data[k]
        ConfigData[k] = v
        
        if Elements[k] then
            -- task.spawn biar script gak freeze pas nge-load puluhan fitur sekaligus
            task.spawn(function()
                -- UBAH PARAMETER KEDUA JADI FALSE BIAR CALLBACK NYALA!
                pcall(function() Elements[k]:Set(v, false) end)
            end)
            applied = applied + 1
        else
            missing = missing + 1
        end
        task.wait(0.01) -- Jeda dikit tiap load 1 fitur
    end
    
    return applied, missing
end
            cfgSection:AddInput({
                Title = "Config Name", Placeholder = "MyConfig", Save = false,
                Callback = function(text) currentName = text end
            })
            configList = cfgSection:AddDropdown({
                Title = "Saved Configs", Multi = false, Options = {}, Save = false,
                Callback = function(v) selectedConfig = v end
            })
            task.defer(RefreshConfigList)
            cfgSection:AddButton({
                Title = "Save Config",
                Callback = function()
                    if not currentName or currentName == "" then ForceNotify("Config", "Isi nama config dulu!", 2); return end
                    if not writefile or not HttpService then ForceNotify("Config", "Executor gak support writefile", 2); return end
                    EnsureConfigFolder()
                    local snapshot = {}
                    for k, v in pairs(ConfigData) do snapshot[k] = v end
                    local okEnc, encoded = pcall(function() return HttpService:JSONEncode(snapshot) end)
                    if not okEnc or not encoded then ForceNotify("Config", "Gagal encode JSON", 2); return end
                    local okW = pcall(writefile, ConfigFolderPath() .. "/" .. currentName .. ".json", encoded)
                    if not okW then ForceNotify("Config", "Gagal save (folder/permission)", 2); return end
                    local count = 0
                    for _ in pairs(snapshot) do count = count + 1 end
                    ForceNotify("Config", "Saved: " .. currentName .. " (" .. count .. " keys)", 3)
                    RefreshConfigList()
                end
            })
            cfgSection:AddButton({
                Title = "Load Config",
                Callback = function()
                    if not selectedConfig or selectedConfig == "" then ForceNotify("Config", "Pilih config dulu!", 2); return end
                    if not readfile or not isfile then ForceNotify("Config", "Executor gak support readfile", 2); return end
                    local path = ConfigFolderPath() .. "/" .. selectedConfig .. ".json"
                    if not isfile(path) then ForceNotify("Config", "File gak ketemu", 2); return end
                    local okR, raw = pcall(readfile, path)
                    if not okR or not raw then ForceNotify("Config", "Gagal baca file", 2); return end
                    local okD, dec = pcall(function() return HttpService:JSONDecode(raw) end)
                    if not okD or type(dec) ~= "table" then ForceNotify("Config", "File corrupt / bukan JSON", 2); return end
                    local applied, missing = ApplyConfig(dec)
                    ForceNotify("Config", "Loaded: " .. selectedConfig .. " (" .. applied .. " ok, " .. missing .. " skip)", 3)
                end
            })
            cfgSection:AddButton({
                Title = "Delete Config",
                Callback = function()
                    if not selectedConfig or selectedConfig == "" then ForceNotify("Config", "Pilih config dulu!", 2); return end
                    local path = ConfigFolderPath() .. "/" .. selectedConfig .. ".json"
                    if isfile and delfile and isfile(path) then
                        pcall(delfile, path)
                        ForceNotify("Config", "Deleted: " .. selectedConfig, 2)
                        selectedConfig = nil
                        RefreshConfigList()
                    else ForceNotify("Config", "Gagal delete / file gak ada", 2) end
                end
            })
            cfgSection:AddButton({
                Title = "Refresh List",
                Callback = function() RefreshConfigList(); ForceNotify("Config", "List refreshed", 2) end
            })
            local initAutoLoad = true
            cfgSection:AddToggle({
                Title = "Auto Save", Default = AutoSaveEnabled ~= false, Save = false,
                Callback = function(v)
                    AutoSaveEnabled = v
                    ForceNotify("Config", "Auto Save: " .. (v and "ON" or "OFF"), 2)
                end
            })
            cfgSection:AddToggle({
                Title = "Auto Load on Start", Default = false, Save = false,
                Callback = function(v)
                    if initAutoLoad then return end
                    if v and selectedConfig and selectedConfig ~= "" then
                        if writefile then
                            pcall(writefile, ConfigFolderPath() .. "/_autoload.json",
                                HttpService:JSONEncode({ Name = selectedConfig }))
                            ForceNotify("Config", "Auto Load: " .. selectedConfig, 2)
                        end
                    else
                        if writefile then
                            pcall(writefile, ConfigFolderPath() .. "/_autoload.json",
                                HttpService:JSONEncode({ Name = "" }))
                        end
                        if v then ForceNotify("Config", "Pilih config dulu di dropdown", 2) end
                    end
                end
            })
            initAutoLoad = false
            local importJsonStr = ""
            cfgSection:AddInput({
                Title = "Import JSON (paste di sini)",
                Placeholder = '{"Flag_Name": value, ...}',
                Save = false,
                Callback = function(text) importJsonStr = text end
            })
            cfgSection:AddButton({
                Title = "Import from Input",
                Callback = function()
                    if importJsonStr == "" then ForceNotify("Config", "Paste JSON dulu", 2); return end
                    local okD, dec = pcall(function() return HttpService:JSONDecode(importJsonStr) end)
                    if not okD or type(dec) ~= "table" then ForceNotify("Config", "JSON invalid", 2); return end
                    local applied = ApplyConfig(dec)
                    ForceNotify("Config", "Imported! (" .. applied .. " keys)", 2)
                end,
                SubTitle = "Import from Clipboard",
                SubCallback = function()
                    if not getclipboard then ForceNotify("Config", "Clipboard gak support", 2); return end
                    local clip = getclipboard()
                    if not clip or clip == "" then ForceNotify("Config", "Clipboard kosong", 2); return end
                    local okD, dec = pcall(function() return HttpService:JSONDecode(clip) end)
                    if not okD or type(dec) ~= "table" then ForceNotify("Config", "JSON invalid", 2); return end
                    local applied = ApplyConfig(dec)
                    ForceNotify("Config", "Imported from clipboard! (" .. applied .. " keys)", 2)
                end
            })
            cfgSection:AddButton({
                Title = "Export to Clipboard",
                Callback = function()
                    if not setclipboard then ForceNotify("Config", "Clipboard gak support", 2); return end
                    local snapshot = {}
                    for k, v in pairs(ConfigData) do snapshot[k] = v end
                    local okE, encoded = pcall(function() return HttpService:JSONEncode(snapshot) end)
                    if okE and encoded then
                        setclipboard(encoded)
                        ForceNotify("Config", "Copied to clipboard!", 2)
                    else ForceNotify("Config", "Gagal export", 2) end
                end
            })
            local cfgInfoSection = MakeSection(ConfigTab, "Config Info")
            cfgInfoSection:AddParagraph({
                Title = "Cara Pakai Config",
                Content = "• Save: isi nama, klik Save\n• Load: pilih dropdown, klik Load\n• Auto Save / Auto Load tersedia\n• Flag format: Tab_Section_Title"
            })
            task.defer(function()
                if not isfile or not readfile then return end
                local p = ConfigFolderPath() .. "/_autoload.json"
                if not isfile(p) then return end
                local okR, raw = pcall(readfile, p)
                if not okR or not raw then return end
                local okD, dec = pcall(function() return HttpService:JSONDecode(raw) end)
                if not okD or type(dec) ~= "table" then return end
                if not dec.Name or dec.Name == "" then return end
                local path = ConfigFolderPath() .. "/" .. dec.Name .. ".json"
                if not isfile(path) then return end
                local okR2, raw2 = pcall(readfile, path)
                if not okR2 or not raw2 then return end
                local okD2, dec2 = pcall(function() return HttpService:JSONDecode(raw2) end)
                if not okD2 or type(dec2) ~= "table" then return end
                task.wait(1)
                local applied = ApplyConfig(dec2)
                ForceNotify("Config", "Auto-loaded: " .. dec.Name .. " (" .. applied .. " keys)", 3)
            end)
        end
    end)

    if not uiOK then warn("[Promers] Gagal membuat UI:", uiErr) end

    ForceNotify("Promers v0.4.5", "fitur dibuka!", 6)

end

__Gluto_Init_Main__()
