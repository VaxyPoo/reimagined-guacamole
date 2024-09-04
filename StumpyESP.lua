local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/miroeramaa/TurtleLib/main/TurtleUiLib.lua"))()
local w = library:Window("OPP ESP, by VaxyPoo")
local highlight = Instance.new("Highlight")
highlight.Name = "ESP"
getgenv().esp = false

-- Toggle function to control ESP highlighting
w:Toggle("Toggle", false, function(bool)
    esp = bool
    if esp then
        -- Main loop that runs while esp is true
        while true do
            -- Exit the loop if esp is set to false
            if not esp then break end
            
            -- Iterate through all players in the game
            for _, player in pairs(game.Players:GetPlayers()) do
                -- Check if the player's character exists and doesn't already have an ESP highlight
                if player.Character and not player.Character:FindFirstChild("ESP") then
                    -- Create a clone of the highlight and set its parent to the player's character
                    local espHighlight = highlight:Clone()
                    espHighlight.Parent = player.Character
                end
            end
            
            -- Wait briefly before continuing the loop
            wait()
        end
    else
        -- If esp is set to false, remove ESP highlight from each player's character
        for _, player in pairs(game.Players:GetPlayers()) do
            -- Find and destroy the ESP highlight on the player's character
            local espHighlight = player.Character and player.Character:FindFirstChild("ESP")
            if espHighlight then
                espHighlight:Destroy()
            end
        end
    end
end)

-- Add label and button
w:Label("Tbh opps are annoying", Color3.fromRGB(127, 143, 166))
w:Button("Destroy Gui", function()
    -- Set esp to false and destroy the library UI
    esp = false
    library:Destroy()
end)
