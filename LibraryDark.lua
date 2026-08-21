local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local Library = {}
Library.__index = Library

local COLORS = {
    Background = Color3.fromRGB(8, 8, 9),
    Sidebar = Color3.fromRGB(12, 12, 13),
    Panel = Color3.fromRGB(14, 14, 15),
    Panel2 = Color3.fromRGB(17, 17, 18),
    Element = Color3.fromRGB(22, 22, 23),
    ElementHover = Color3.fromRGB(27, 27, 28),
    Border = Color3.fromRGB(28, 28, 30),
    Text = Color3.fromRGB(222, 222, 226),
    SubText = Color3.fromRGB(112, 112, 118),
    Muted = Color3.fromRGB(74, 74, 80),
    Accent = Color3.fromRGB(144, 91, 255),
    Accent2 = Color3.fromRGB(166, 110, 255),
    Green = Color3.fromRGB(86, 205, 119),
    Red = Color3.fromRGB(230, 82, 92),
}

local function New(className, props)
    local obj = Instance.new(className)
    for k, v in pairs(props or {}) do
        obj[k] = v
    end
    return obj
end

local function Corner(parent, radius)
    return New("UICorner", {
        Parent = parent,
        CornerRadius = UDim.new(0, radius or 7),
    })
end

local function Stroke(parent, color, thickness, transparency)
    return New("UIStroke", {
        Parent = parent,
        Color = color or COLORS.Border,
        Thickness = thickness or 1,
        Transparency = transparency or 0,
    })
end

local function Padding(parent, left, right, top, bottom)
    return New("UIPadding", {
        Parent = parent,
        PaddingLeft = UDim.new(0, left or 0),
        PaddingRight = UDim.new(0, right or 0),
        PaddingTop = UDim.new(0, top or 0),
        PaddingBottom = UDim.new(0, bottom or 0),
    })
end

local function Text(parent, text, size, color, font)
    return New("TextLabel", {
        Parent = parent,
        BackgroundTransparency = 1,
        Text = text or "",
        TextColor3 = color or COLORS.Text,
        TextSize = size or 13,
        Font = font or Enum.Font.Gotham,
        TextXAlignment = Enum.TextXAlignment.Left,
        TextYAlignment = Enum.TextYAlignment.Center,
        BorderSizePixel = 0,
    })
end

local function Button(parent, text, size)
    local b = New("TextButton", {
        Parent = parent,
        BackgroundTransparency = 1,
        Text = text or "",
        TextColor3 = COLORS.Text,
        TextSize = size or 13,
        Font = Enum.Font.Gotham,
        AutoButtonColor = false,
        BorderSizePixel = 0,
    })
    return b
end

local function Tween(obj, info, props)
    TweenService:Create(obj, info, props):Play()
end

local function SetVisible(obj, value)
    if obj then
        obj.Visible = value
    end
end

function Library.new(options)
    options = options or {}

    local self = setmetatable({}, Library)
    self.Name = options.Name or "Xenon Hub"
    self.Size = options.Size or UDim2.fromOffset(1090, 725)
    self.Accent = options.Accent or COLORS.Accent
    self.Tabs = {}
    self.SidebarItems = {}
    self.CurrentTab = nil
    self.SearchText = ""
    self._connections = {}
    self._destroyed = false

    local old = PlayerGui:FindFirstChild(self.Name)
    if old then
        old:Destroy()
    end

    self.Gui = New("ScreenGui", {
        Name = self.Name,
        Parent = PlayerGui,
        ResetOnSpawn = false,
        IgnoreGuiInset = true,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        DisplayOrder = 100,
    })

    self.Root = New("Frame", {
        Parent = self.Gui,
        Name = "Window",
        Size = self.Size,
        Position = UDim2.fromScale(0.5, 0.5),
        AnchorPoint = Vector2.new(0.5, 0.5),
        BackgroundColor3 = COLORS.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
    })
    Corner(self.Root, 12)
    Stroke(self.Root, Color3.fromRGB(36, 36, 38), 1)

    self.Shadow = New("ImageLabel", {
        Parent = self.Gui,
        Name = "Shadow",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = self.Root.Position,
        Size = self.Size + UDim2.fromOffset(35, 35),
        BackgroundTransparency = 1,
        Image = "rbxassetid://6014261993",
        ImageTransparency = 0.42,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 450, 450),
        ZIndex = 0,
    })
    self.Root.ZIndex = 2
    self.Shadow.ZIndex = 1

    self.Sidebar = New("Frame", {
        Parent = self.Root,
        Name = "Sidebar",
        Size = UDim2.new(0, 245, 1, 0),
        BackgroundColor3 = COLORS.Sidebar,
        BorderSizePixel = 0,
        ZIndex = 3,
    })

    local logo = New("Frame", {
        Parent = self.Sidebar,
        Size = UDim2.new(1, 0, 0, 68),
        BackgroundTransparency = 1,
    })
    Text(logo, "◈", 22, self.Accent, Enum.Font.GothamBold).Size = UDim2.fromOffset(34, 68)
    local logoText = Text(logo, self.Name, 17, COLORS.Text, Enum.Font.GothamBold)
    logoText.Position = UDim2.fromOffset(45, 0)
    logoText.Size = UDim2.new(1, -55, 1, 0)

    self.Search = New("TextBox", {
        Parent = self.Sidebar,
        Name = "Search",
        Position = UDim2.fromOffset(16, 69),
        Size = UDim2.new(1, -32, 0, 40),
        BackgroundColor3 = COLORS.Element,
        BorderSizePixel = 0,
        PlaceholderText = "Search",
        PlaceholderColor3 = COLORS.SubText,
        Text = "",
        TextColor3 = COLORS.Text,
        TextSize = 13,
        Font = Enum.Font.Gotham,
        ClearTextOnFocus = false,
    })
    Corner(self.Search, 8)
    Stroke(self.Search, COLORS.Border, 1)
    Padding(self.Search, 38, 10, 0, 0)

    local searchIcon = Text(self.Search, "⌕", 20, COLORS.SubText)
    searchIcon.Position = UDim2.fromOffset(-30, 0)
    searchIcon.Size = UDim2.fromOffset(28, 40)

    self.SidebarScroll = New("ScrollingFrame", {
        Parent = self.Sidebar,
        Name = "Navigation",
        Position = UDim2.fromOffset(8, 119),
        Size = UDim2.new(1, -16, 1, -177),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = Color3.fromRGB(45, 45, 48),
        CanvasSize = UDim2.fromOffset(0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
    })
    Padding(self.SidebarScroll, 4, 4, 10, 10)
    New("UIListLayout", {
        Parent = self.SidebarScroll,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 2),
    })

    self.ConfigButton = Button(self.Sidebar, "●   no config", 12)
    self.ConfigButton.Position = UDim2.new(0, 16, 1, -53)
    self.ConfigButton.Size = UDim2.new(1, -32, 0, 36)
    self.ConfigButton.TextColor3 = COLORS.SubText
    self.ConfigButton.BackgroundColor3 = COLORS.Element
    self.ConfigButton.BackgroundTransparency = 0
    Corner(self.ConfigButton, 8)
    Stroke(self.ConfigButton, COLORS.Border, 1)

    self.Main = New("Frame", {
        Parent = self.Root,
        Name = "Main",
        Position = UDim2.fromOffset(245, 0),
        Size = UDim2.new(1, -245, 1, 0),
        BackgroundColor3 = COLORS.Background,
        BorderSizePixel = 0,
        ZIndex = 3,
    })

    self.Topbar = New("Frame", {
        Parent = self.Main,
        Name = "Topbar",
        Size = UDim2.new(1, 0, 0, 76),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
    })

    self.PageTitle = Text(self.Topbar, "Auto Block", 19, COLORS.Text, Enum.Font.GothamBold)
    self.PageTitle.Position = UDim2.fromOffset(24, 9)
    self.PageTitle.Size = UDim2.new(1, -150, 0, 28)

    self.PageSubtitle = Text(self.Topbar, "Automatically blocks attacks, punishes and counters", 11, COLORS.SubText)
    self.PageSubtitle.Position = UDim2.fromOffset(24, 37)
    self.PageSubtitle.Size = UDim2.new(1, -150, 0, 22)

    self.Minimize = Button(self.Topbar, "−", 20)
    self.Minimize.Position = UDim2.new(1, -76, 0, 17)
    self.Minimize.Size = UDim2.fromOffset(28, 28)
    self.Minimize.TextColor3 = COLORS.SubText

    self.Close = Button(self.Topbar, "×", 22)
    self.Close.Position = UDim2.new(1, -43, 0, 17)
    self.Close.Size = UDim2.fromOffset(28, 28)
    self.Close.TextColor3 = COLORS.SubText

    self.Tabbar = New("Frame", {
        Parent = self.Main,
        Position = UDim2.fromOffset(20, 72),
        Size = UDim2.new(1, -40, 0, 42),
        BackgroundTransparency = 1,
    })
    self.TabLayout = New("UIListLayout", {
        Parent = self.Tabbar,
        FillDirection = Enum.FillDirection.Horizontal,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 3),
    })

    self.Content = New("ScrollingFrame", {
        Parent = self.Main,
        Position = UDim2.fromOffset(20, 120),
        Size = UDim2.new(1, -40, 1, -137),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 2,
        ScrollBarImageColor3 = Color3.fromRGB(46, 46, 50),
        CanvasSize = UDim2.fromOffset(0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
    })
    Padding(self.Content, 2, 4, 8, 20)

    self.ContentLayout = New("UIGridLayout", {
        Parent = self.Content,
        CellPadding = UDim2.fromOffset(14, 14),
        CellSize = UDim2.new(0.5, -7, 0, 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })

    self._connections[#self._connections + 1] = self.Search:GetPropertyChangedSignal("Text"):Connect(function()
        self.SearchText = string.lower(self.Search.Text)
        self:_FilterSidebar()
    end)

    self._connections[#self._connections + 1] = self.Minimize.MouseButton1Click:Connect(function()
        self:SetOpen(not self.Root.Visible)
    end)

    self._connections[#self._connections + 1] = self.Close.MouseButton1Click:Connect(function()
        self:Destroy()
    end)

    self:_MakeDraggable()

    return self
end

function Library:_MakeDraggable()
    local dragging = false
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        self.Root.Position = UDim2.new(
            startPos.X.Scale, startPos.X.Offset + delta.X,
            startPos.Y.Scale, startPos.Y.Offset + delta.Y
        )
        self.Shadow.Position = self.Root.Position
    end

    self._connections[#self._connections + 1] = self.Topbar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = self.Root.Position
        end
    end)

    self._connections[#self._connections + 1] = UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            update(input)
        end
    end)

    self._connections[#self._connections + 1] = UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

function Library:SetOpen(value)
    if value then
        self.Root.Visible = true
        self.Shadow.Visible = true
    else
        self.Root.Visible = false
        self.Shadow.Visible = false
    end
end

function Library:Toggle()
    self:SetOpen(not self.Root.Visible)
end

function Library:BindToggle(key, callback)
    self._connections[#self._connections + 1] = UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == key then
            callback()
        end
    end)
end

function Library:_FilterSidebar()
    local query = self.SearchText
    for _, item in ipairs(self.SidebarItems) do
        local hay = string.lower(item.SearchName or item.Name)
        item.Button.Visible = query == "" or string.find(hay, query, 1, true) ~= nil
    end
end

function Library:_CreateSidebarCategory(name)
    local category = New("TextButton", {
        Parent = self.SidebarScroll,
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundTransparency = 1,
        Text = "",
        AutoButtonColor = false,
        LayoutOrder = #self.SidebarItems + 1,
    })

    local title = Text(category, name, 10, COLORS.SubText, Enum.Font.GothamBold)
    title.Position = UDim2.fromOffset(8, 0)
    title.Size = UDim2.new(1, -30, 1, 0)

    local arrow = Text(category, "⌄", 13, COLORS.SubText)
    arrow.Position = UDim2.new(1, -24, 0, 0)
    arrow.Size = UDim2.fromOffset(18, 30)

    local state = true
    category.MouseButton1Click:Connect(function()
        state = not state
        arrow.Text = state and "⌄" or "›"
    end)

    return category
end

function Library:_CreateSidebarItem(name, icon, callback)
    local item = {
        Name = name,
        SearchName = name,
    }

    local button = Button(self.SidebarScroll, "", 12)
    button.Size = UDim2.new(1, 0, 0, 38)
    button.Text = ""
    button.LayoutOrder = #self.SidebarItems + 1
    Corner(button, 7)

    local iconLabel = Text(button, icon or "•", 17, COLORS.SubText)
    iconLabel.Position = UDim2.fromOffset(12, 0)
    iconLabel.Size = UDim2.fromOffset(25, 38)
    iconLabel.TextXAlignment = Enum.TextXAlignment.Center

    local label = Text(button, name, 12, COLORS.SubText)
    label.Position = UDim2.fromOffset(44, 0)
    label.Size = UDim2.new(1, -52, 1, 0)

    item.Button = button
    item.Label = label
    item.Icon = iconLabel

    button.MouseEnter:Connect(function()
        if self.CurrentTab and self.CurrentTab.SidebarItem ~= item then
            Tween(button, TweenInfo.new(0.12), {BackgroundColor3 = COLORS.ElementHover})
        end
    end)

    button.MouseLeave:Connect(function()
        if self.CurrentTab and self.CurrentTab.SidebarItem ~= item then
            Tween(button, TweenInfo.new(0.12), {BackgroundColor3 = COLORS.Sidebar})
        end
    end)

    button.MouseButton1Click:Connect(function()
        callback(item)
    end)

    table.insert(self.SidebarItems, item)
    return item
end

function Library:_SelectSidebarItem(item)
    for _, other in ipairs(self.SidebarItems) do
        if other == item then
            other.Button.BackgroundColor3 = Color3.fromRGB(27, 23, 35)
            other.Label.TextColor3 = COLORS.Text
            other.Icon.TextColor3 = self.Accent
        else
            other.Button.BackgroundColor3 = COLORS.Sidebar
            other.Label.TextColor3 = COLORS.SubText
            other.Icon.TextColor3 = COLORS.SubText
        end
    end
end

function Library:AddCategory(name)
    return self:_CreateSidebarCategory(name)
end

function Library:AddSection(name, icon)
    local sidebarItem = self:_CreateSidebarItem(name, icon or "◉", function(item)
        self:_SelectSidebarItem(item)
        self:SelectTab(name)
    end)

    return sidebarItem
end

function Library:AddTab(name, subtitle)
    local tab = {
        Name = name,
        Subtitle = subtitle or "",
        Groups = {},
    }

    local button = Button(self.Tabbar, name, 11)
    button.AutomaticSize = Enum.AutomaticSize.X
    button.Size = UDim2.fromOffset(math.max(70, #name * 7 + 28), 32)
    button.BackgroundColor3 = COLORS.Element
    button.BackgroundTransparency = 1
    button.TextColor3 = COLORS.SubText
    Corner(button, 7)

    local indicator = New("Frame", {
        Parent = button,
        Position = UDim2.new(0, 9, 1, -3),
        Size = UDim2.new(1, -18, 0, 2),
        BackgroundColor3 = self.Accent,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
    })
    Corner(indicator, 2)

    tab.Button = button
    tab.Indicator = indicator
    tab.Content = New("Frame", {
        Name = name,
        Parent = self.Content,
        Size = UDim2.new(1, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
        Visible = false,
    })

    New("UIGridLayout", {
        Parent = tab.Content,
        CellPadding = UDim2.fromOffset(14, 14),
        CellSize = UDim2.new(0.5, -7, 0, 0),
        SortOrder = Enum.SortOrder.LayoutOrder,
    })

    button.MouseButton1Click:Connect(function()
        self:SelectTab(name)
    end)

    self.Tabs[name] = tab

    if not self.CurrentTab then
        self:SelectTab(name)
    end

    return tab
end

function Library:SelectTab(name)
    local tab = self.Tabs[name]
    if not tab then return end

    self.CurrentTab = tab
    self.PageTitle.Text = tab.Name
    self.PageSubtitle.Text = tab.Subtitle

    for _, other in pairs(self.Tabs) do
        other.Content.Visible = false
        other.Button.TextColor3 = COLORS.SubText
        other.Button.BackgroundTransparency = 1
        other.Indicator.BackgroundTransparency = 1
    end

    tab.Content.Visible = true
    tab.Button.TextColor3 = COLORS.Text
    tab.Button.BackgroundTransparency = 0
    tab.Indicator.BackgroundTransparency = 0
end

function Library:_NewGroup(tab, title)
    local group = New("Frame", {
        Parent = tab.Content,
        BackgroundColor3 = COLORS.Panel,
        BorderSizePixel = 0,
        Size = UDim2.new(0, 0, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
    })
    Corner(group, 10)
    Stroke(group, COLORS.Border, 1)

    local header = Text(group, title, 11, COLORS.SubText, Enum.Font.GothamBold)
    header.Position = UDim2.fromOffset(16, 10)
    header.Size = UDim2.new(1, -32, 0, 22)

    local body = New("Frame", {
        Parent = group,
        Position = UDim2.fromOffset(12, 39),
        Size = UDim2.new(1, -24, 0, 0),
        AutomaticSize = Enum.AutomaticSize.Y,
        BackgroundTransparency = 1,
    })
    Padding(body, 4, 4, 0, 12)

    New("UIListLayout", {
        Parent = body,
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 5),
    })

    group.Body = body
    group.Title = header
    return group
end

function Library:AddGroupbox(tabOrName, title)
    local tab
    if type(tabOrName) == "string" then
        tab = self.Tabs[tabOrName]
    else
        tab = tabOrName
    end
    assert(tab, "AddGroupbox: invalid tab")

    local group = self:_NewGroup(tab, title)
    table.insert(tab.Groups, group)

    local API = {}

    function API:AddLabel(text, opts)
        opts = opts or {}
        local label = Text(group.Body, text, opts.Size or 12, opts.Color or COLORS.SubText)
        label.Size = UDim2.new(1, 0, 0, opts.Height or 28)
        label.TextWrapped = opts.Wrap == true
        return label
    end

    function API:AddToggle(text, opts)
        opts = opts or {}
        local state = opts.Default == true
        local row = New("Frame", {
            Parent = group.Body,
            Size = UDim2.new(1, 0, 0, 39),
            BackgroundTransparency = 1,
        })

        local box = New("TextButton", {
            Parent = row,
            Position = UDim2.fromOffset(0, 4),
            Size = UDim2.fromOffset(25, 25),
            BackgroundColor3 = COLORS.Element,
            Text = "",
            AutoButtonColor = false,
            BorderSizePixel = 0,
        })
        Corner(box, 6)
        Stroke(box, COLORS.Border, 1)

        local check = Text(box, "✓", 14, Color3.new(1,1,1), Enum.Font.GothamBold)
        check.Size = UDim2.fromScale(1, 1)
        check.TextXAlignment = Enum.TextXAlignment.Center
        check.Visible = false

        local lbl = Text(row, text, 12, COLORS.Text)
        lbl.Position = UDim2.fromOffset(36, 0)
        lbl.Size = UDim2.new(1, -145, 1, 0)

        local bind = Text(row, opts.Keybind or "NONE", 10, COLORS.SubText, Enum.Font.GothamMedium)
        bind.Position = UDim2.new(1, -112, 0, 7)
        bind.Size = UDim2.fromOffset(108, 25)
        bind.BackgroundColor3 = COLORS.Element
        bind.BackgroundTransparency = 0
        bind.TextXAlignment = Enum.TextXAlignment.Center
        Corner(bind, 6)

        local function render()
            if state then
                box.BackgroundColor3 = self.Accent
                check.Visible = true
            else
                box.BackgroundColor3 = COLORS.Element
                check.Visible = false
            end
        end

        local control = {}
        function control:Set(value)
            state = value == true
            render()
            if opts.Callback then opts.Callback(state) end
        end
        function control:Get()
            return state
        end
        function control:Toggle()
            self:Set(not state)
        end

        box.MouseButton1Click:Connect(function()
            control:Toggle()
        end)

        render()
        if opts.Default and opts.Callback then opts.Callback(true) end
        return control
    end

    function API:AddKeybind(text, opts)
        opts = opts or {}
        local current = opts.Default or Enum.KeyCode.Unknown
        local listening = false

        local row = New("Frame", {
            Parent = group.Body,
            Size = UDim2.new(1, 0, 0, 39),
            BackgroundTransparency = 1,
        })

        local lbl = Text(row, text, 12, COLORS.Text)
        lbl.Size = UDim2.new(1, -130, 1, 0)

        local key = Button(row, current.Name == "Unknown" and "NONE" or current.Name, 10)
        key.Position = UDim2.new(1, -112, 0, 5)
        key.Size = UDim2.fromOffset(108, 28)
        key.BackgroundColor3 = COLORS.Element
        key.BackgroundTransparency = 0
        key.TextColor3 = COLORS.SubText
        Corner(key, 6)
        Stroke(key, COLORS.Border, 1)

        local function display()
            key.Text = listening and "PRESS KEY" or (current.Name == "Unknown" and "NONE" or current.Name)
        end

        key.MouseButton1Click:Connect(function()
            listening = true
            display()
        end)

        local conn
        conn = UserInputService.InputBegan:Connect(function(input, processed)
            if processed or not listening then return end
            if input.UserInputType == Enum.UserInputType.Keyboard then
                current = input.KeyCode
                listening = false
                display()
                if opts.Callback then opts.Callback(current) end
            end
        end)
        table.insert(self._connections, conn)

        return {
            Get = function() return current end,
            Set = function(_, value)
                current = value
                listening = false
                display()
            end
        }
    end

    function API:AddSlider(text, opts)
        opts = opts or {}
        local min = opts.Min or 0
        local max = opts.Max or 100
        local value = math.clamp(opts.Default or min, min, max)
        local suffix = opts.Suffix or ""

        local row = New("Frame", {
            Parent = group.Body,
            Size = UDim2.new(1, 0, 0, 56),
            BackgroundTransparency = 1,
        })

        local lbl = Text(row, text, 12, COLORS.Text)
        lbl.Position = UDim2.fromOffset(0, 0)
        lbl.Size = UDim2.new(0.7, 0, 0, 24)

        local valueLabel = Text(row, tostring(value) .. suffix, 11, COLORS.Text, Enum.Font.GothamMedium)
        valueLabel.Position = UDim2.new(1, -70, 0, 0)
        valueLabel.Size = UDim2.fromOffset(70, 24)
        valueLabel.TextXAlignment = Enum.TextXAlignment.Right

        local track = New("Frame", {
            Parent = row,
            Position = UDim2.fromOffset(0, 31),
            Size = UDim2.new(1, 0, 0, 5),
            BackgroundColor3 = COLORS.Element,
            BorderSizePixel = 0,
        })
        Corner(track, 4)

        local fill = New("Frame", {
            Parent = track,
            Size = UDim2.fromScale(0, 1),
            BackgroundColor3 = self.Accent,
            BorderSizePixel = 0,
        })
        Corner(fill, 4)

        local knob = New("Frame", {
            Parent = track,
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.fromScale(0, 0.5),
            Size = UDim2.fromOffset(11, 11),
            BackgroundColor3 = COLORS.Text,
            BorderSizePixel = 0,
        })
        Corner(knob, 99)

        local dragging = false
        local control = {}

        local function setFromX(x)
            local pct = math.clamp((x - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
            local raw = min + (max - min) * pct
            if opts.Rounding then
                local p = 10 ^ opts.Rounding
                raw = math.floor(raw * p + 0.5) / p
            else
                raw = math.floor(raw + 0.5)
            end
            value = raw
            local normalized = (value - min) / (max - min)
            fill.Size = UDim2.fromScale(normalized, 1)
            knob.Position = UDim2.fromScale(normalized, 0.5)
            valueLabel.Text = tostring(value) .. suffix
            if opts.Callback then opts.Callback(value) end
        end

        track.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
                setFromX(input.Position.X)
            end
        end)

        UserInputService.InputChanged:Connect(function(input)
            if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                setFromX(input.Position.X)
            end
        end)

        UserInputService.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)

        function control:Set(v)
            value = math.clamp(v, min, max)
            local normalized = (value - min) / (max - min)
            fill.Size = UDim2.fromScale(normalized, 1)
            knob.Position = UDim2.fromScale(normalized, 0.5)
            valueLabel.Text = tostring(value) .. suffix
            if opts.Callback then opts.Callback(value) end
        end
        function control:Get() return value end

        control:Set(value)
        return control
    end

    function API:AddDropdown(text, opts)
        opts = opts or {}
        local values = opts.Values or {}
        local selected = opts.Default or values[1] or "None"
        local open = false

        local row = New("Frame", {
            Parent = group.Body,
            Size = UDim2.new(1, 0, 0, 67),
            BackgroundTransparency = 1,
            ZIndex = 5,
        })

        local lbl = Text(row, text, 12, COLORS.Text)
        lbl.Position = UDim2.fromOffset(0, 0)
        lbl.Size = UDim2.new(1, 0, 0, 24)

        local select = Button(row, tostring(selected), 11)
        select.Position = UDim2.fromOffset(0, 27)
        select.Size = UDim2.new(1, 0, 0, 35)
        select.BackgroundColor3 = COLORS.Element
        select.BackgroundTransparency = 0
        select.TextColor3 = COLORS.Text
        select.TextXAlignment = Enum.TextXAlignment.Left
        Corner(select, 7)
        Stroke(select, COLORS.Border, 1)
        Padding(select, 12, 30, 0, 0)

        local arrow = Text(select, "⌄", 13, COLORS.SubText)
        arrow.Position = UDim2.new(1, -28, 0, 0)
        arrow.Size = UDim2.fromOffset(24, 35)
        arrow.TextXAlignment = Enum.TextXAlignment.Center

        local menu = New("Frame", {
            Parent = row,
            Position = UDim2.fromOffset(0, 64),
            Size = UDim2.new(1, 0, 0, math.min(#values * 31 + 8, 170)),
            BackgroundColor3 = COLORS.Panel2,
            BorderSizePixel = 0,
            Visible = false,
            ZIndex = 20,
        })
        Corner(menu, 7)
        Stroke(menu, COLORS.Border, 1)
        Padding(menu, 4, 4, 4, 4)

        local layout = New("UIListLayout", {
            Parent = menu,
            Padding = UDim.new(0, 2),
            SortOrder = Enum.SortOrder.LayoutOrder,
        })

        for _, option in ipairs(values) do
            local optionButton = Button(menu, tostring(option), 11)
            optionButton.Size = UDim2.new(1, 0, 0, 28)
            optionButton.TextXAlignment = Enum.TextXAlignment.Left
            optionButton.TextColor3 = COLORS.SubText
            Corner(optionButton, 5)
            Padding(optionButton, 9, 5, 0, 0)

            optionButton.MouseEnter:Connect(function()
                optionButton.BackgroundTransparency = 0
                optionButton.BackgroundColor3 = COLORS.ElementHover
            end)
            optionButton.MouseLeave:Connect(function()
                optionButton.BackgroundTransparency = 1
            end)

            optionButton.MouseButton1Click:Connect(function()
                selected = option
                select.Text = tostring(selected)
                menu.Visible = false
                open = false
                arrow.Text = "⌄"
                if opts.Callback then opts.Callback(selected) end
            end)
        end

        select.MouseButton1Click:Connect(function()
            open = not open
            menu.Visible = open
            arrow.Text = open and "⌃" or "⌄"
        end)

        local control = {}
        function control:Set(v)
            selected = v
            select.Text = tostring(v)
            if opts.Callback then opts.Callback(v) end
        end
        function control:Get() return selected end
        return control
    end

    function API:AddButton(text, callback)
        local row = New("Frame", {
            Parent = group.Body,
            Size = UDim2.new(1, 0, 0, 39),
            BackgroundTransparency = 1,
        })

        local btn = Button(row, text, 11)
        btn.Size = UDim2.new(1, 0, 1, 0)
        btn.BackgroundColor3 = COLORS.Element
        btn.BackgroundTransparency = 0
        Corner(btn, 7)
        Stroke(btn, COLORS.Border, 1)

        btn.MouseEnter:Connect(function()
            Tween(btn, TweenInfo.new(0.1), {BackgroundColor3 = COLORS.ElementHover})
        end)
        btn.MouseLeave:Connect(function()
            Tween(btn, TweenInfo.new(0.1), {BackgroundColor3 = COLORS.Element})
        end)
        btn.MouseButton1Click:Connect(function()
            if callback then callback() end
        end)

        return btn
    end

    function API:AddDivider()
        local divider = New("Frame", {
            Parent = group.Body,
            Size = UDim2.new(1, 0, 0, 1),
            BackgroundColor3 = COLORS.Border,
            BorderSizePixel = 0,
        })
        return divider
    end

    return API
end

function Library:Notify(title, message, duration)
    duration = duration or 3

    local holder = New("Frame", {
        Parent = self.Gui,
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, -24, 1, -24),
        Size = UDim2.fromOffset(310, 72),
        BackgroundColor3 = COLORS.Panel2,
        BorderSizePixel = 0,
        ZIndex = 50,
    })
    Corner(holder, 9)
    Stroke(holder, COLORS.Border, 1)

    local titleLabel = Text(holder, title or "Notification", 12, COLORS.Text, Enum.Font.GothamBold)
    titleLabel.Position = UDim2.fromOffset(14, 9)
    titleLabel.Size = UDim2.new(1, -28, 0, 22)

    local messageLabel = Text(holder, message or "", 11, COLORS.SubText)
    messageLabel.Position = UDim2.fromOffset(14, 31)
    messageLabel.Size = UDim2.new(1, -28, 0, 28)
    messageLabel.TextWrapped = true

    holder.Position = UDim2.new(1, 330, 1, -24)
    Tween(holder, TweenInfo.new(0.22, Enum.EasingStyle.Quint), {
        Position = UDim2.new(1, -24, 1, -24)
    })

    task.delay(duration, function()
        if holder.Parent then
            Tween(holder, TweenInfo.new(0.18), {
                Position = UDim2.new(1, 330, 1, -24)
            })
            task.wait(0.2)
            holder:Destroy()
        end
    end)
end

function Library:Destroy()
    if self._destroyed then return end
    self._destroyed = true

    for _, connection in ipairs(self._connections) do
        pcall(function()
            connection:Disconnect()
        end)
    end

    if self.Gui then
        self.Gui:Destroy()
    end
    if self.Shadow then
        self.Shadow:Destroy()
    end
end

return Library
