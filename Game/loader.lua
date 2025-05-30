local a = {}
local b = "https://raw.githubusercontent.com/getscript-vn/ZENOXHub/refs/heads/main/Game/Load/"
local c = "Zenox LOADER Status :"
local d = game:GetService("CoreGui")
local e = game:GetService("Lighting")
local f = game:GetService("Players")
local g = f.LocalPlayer
local h = tostring(game.PlaceId)
local i = {"Solara", "Xeno"}
local j = {}
local k
pcall(
    function()
        k = identifyexecutor and identifyexecutor() or getexecutorname and getexecutorname()
    end
)
k = k or "Unknown"
local l, m, n, o, p
local function q(r)
    g:Kick(r)
end
local function s()
    if l then
        l:Destroy()
    end
    if o then
        o:Destroy()
    end
    task.spawn(function()
 while wait() do
    if game:GetService('Lighting'):FindFirstChildOfClass('BlurEffect') then
         game:GetService('Lighting'):FindFirstChildOfClass('BlurEffect'):Destroy()
    end
 end
end)
end
local function t()
    l = Instance.new("ScreenGui")
    l.Name = "ShadowFrame"
    l.ResetOnSpawn = false
    l.IgnoreGuiInset = true
    l.DisplayOrder = 999
    l.Parent = d
    m = Instance.new("Frame")
    m.Size = UDim2.new(1, 0, 1, 0)
    m.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
    m.BackgroundTransparency = 0.5
    m.Parent = l
    n = Instance.new("BlurEffect")
    n.Size = 24
    n.Name = "Effect_" .. tostring(math.random(1000, 9999))
    n.Parent = e
    o = Instance.new("ScreenGui", d)
    o.Name = "LoaderUI"
    o.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    p = Instance.new("TextLabel", o)
    p.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    p.BackgroundTransparency = 1
    p.Position = UDim2.new(0.4, 0, 0.5, 0)
    p.Size = UDim2.new(0, 835, 0, 50)
    p.Font = Enum.Font.GothamBold
    p.Text = c .. " Nul"
    p.TextColor3 = Color3.fromRGB(255, 255, 255)
    p.TextSize = 15
    p.TextXAlignment = Enum.TextXAlignment.Left
end
local function u()
    p.Text = c .. " Waiting Get Asset."
    local v, w =
        pcall(
        function()
            return game:HttpGet(b .. h)
        end
    )
    p.Text = c .. " Checkings File."
    wait(0.3)
    if not v then
        p.Text = c .. " Get Failed Error Code."
        wait(3)
        q("Get Failed Error Code.\n Thử Chạy Lại Script")
        return "Error"
    end
    if v and string.find(w, "404: Not Found") then
        p.Text = c .. " Get File Is Error Code."
        wait(3)
        q("Get File Error\nKhông Tìm Thấy File hoặc game không support")
        return "Error"
    end
    if v and type(w) == "string" then
        p.Text = c .. " Waiting Load Asset 1."
        local x, y = loadstring(w)
        if x then
            p.Text = c .. " Loaded. Running script..."
            local z, A = pcall(x)
            if not z then
                p.Text = c .. " Script runtime error."
                warn("Script Runtime Error: ", A)
                wait(3)
                q("Lỗi khi chạy script.\nVui lòng thử lại sau.")
                return "Error"
            end
            s()
        else
            warn("Error Load Script: ", y)
            p.Text = c .. " Get Failed Load Script."
            wait(3)
            q("Get Failed Load Script.\n Script Đang Bị Lỗi.")
            return "Error"
        end
    end
end
function a.Init()
    if j[h] then
        h = j[h]
    end
        for i,v in pairs(i) do
            if v == k or string.find(v,k) then
                q("Executor is Blacklist: " .. k .."\n Change Exec")
            end
        end
    t()
    u()
end
a.Init()
