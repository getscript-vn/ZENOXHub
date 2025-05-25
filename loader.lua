local placeId = tostring(game.PlaceId)
local baseUrl = "https://raw.githubusercontent.com/getscript-vn/ZENOXHub/main/Game/"
local url = baseUrl .. placeId
local StarterGui = game:GetService("StarterGui")
local success, response = pcall(function()
    return game:HttpGet(url)
end)

if success and response and response:match("%S") then
    loadstring(response)()
else
    warn("Not Supported:", placeId)
  StarterGui:SetCore("SendNotification", {
    Title = "ZENOXHub",
    Text = "Game Not Supported: " .. placeId,
    Duration = 3
})
end
