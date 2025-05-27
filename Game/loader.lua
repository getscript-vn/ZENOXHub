local a = tostring(game.PlaceId)
local b = identifyexecutor() or getexecutorname()
local c = {"Solara", "Xeno"}
local d = {}
if d[a] then
    a = d[a]
end
if table.find(c, b) then
    game.Players.LocalPlayer:Kick("Executor is Blacklist")
end
local function e()
    local f, g =
        pcall(
        function()
            return game:HttpGet(
                "https://raw.githubusercontent.com/getscript-vn/ZENOXHub/refs/heads/main/Game/Load/" .. a
            )
        end
    )
    if f and type(g) == "string" then
        local h, i = loadstring(g)
        if h then
            pcall(h)
        else
            warn("Error Load Script: ", i)
        end
    else
        warn("Error Get Script")
    end
end
e()
