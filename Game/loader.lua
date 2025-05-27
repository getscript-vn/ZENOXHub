local a = tostring(game.PlaceId)
local b = {}
if b[a] then
    a = b[a]
end
local function c()
    local d, e =
        pcall(
        function()
            return game:HttpGet(
                "https://raw.githubusercontent.com/getscript-vn/ZENOXHub/refs/heads/main/Game/Load/" .. a
            )
        end
    )
    if d and type(e) == "string" then
        local f, g = loadstring(e)
        if f then
            pcall(f)
        else
            warn("Error Load Script: ", g)
        end
    else
        warn("Error Get Script")
    end
end
c()
