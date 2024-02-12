
local Player = game.Players
local LocalPlayer = Player.LocalPlayer
local userid = LocalPlayer.UserId
local username = LocalPlayer.Name
local MarketplaceService = game:GetService("MarketplaceService")
local placeId = game.PlaceId
local localplrURL = "https://www.roblox.com/users/" .. userid
local gameURL = "https://www.roblox.com/games/" .. placeId
local playerCount = Player:GetPlayers()

-- // actual code and what not
function SendMessage(url, message) -- // Send Message Function
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["content"] = message
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
    print("Sent Message")
end

function SendMessageEMBED(url, embed) -- // Send Embeded Message Function
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                }
            }
        }
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
  print("Sent Embed")
end


-- // Examples 

local url = "" -- // WebHook Here
SendMessage(url)


local embed = {
    ["title"] = "This is an embedded message",
    ["description"] = "This message has an embed with fields and a footer",
    ["color"] = 1752220,
    ["fields"] = {
        {
            ["name"] = "Field 1: UserURL",
            ["value"] = localplrURL
        },
        {
            ["name"] = "Field 2: Game Url",
            ["value"] = gameURL
        },
      {
        ["name"] = "Player Count",
        ["value"] = #playerCount
      }
    },
    ["footer"] = {
        ["text"] = "Test"
    }
}
SendMessageEMBED(url, embed)
