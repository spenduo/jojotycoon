local tycoons = game.Workspace["Zednov's Tycoon Kit"].Tycoons
local runservice = game:GetService("RunService")
_G.rebirth = false
_G.money = true

game.Players.LocalPlayer.CanRebirth.Changed:Connect(function()
    if _G.rebirth == true then
        if game.Players.LocalPlayer.CanRebirth.Value == true then
            game.ReplicatedStorage["RebirthEvent (Don't Move)"]:FireServer()
            wait(5)
            for i,v in pairs(tycoons:GetChildren()) do
                if game.Players.LocalPlayer.Team.Name == v.Name then
                    if game.Players.LocalPlayer.Character:FindFirstChild("Torso") then
                        firetouchinterest(game.Players.LocalPlayer.Character.Torso, v.Entrance["Touch to claim!"].Head, 1)
                        firetouchinterest(game.Players.LocalPlayer.Character.Torso, v.Entrance["Touch to claim!"].Head, 0)
                    end
                end
            end
        end
    end
end)


while runservice.Heartbeat:Wait() do
    if _G.money == true then
        for i, v in pairs(tycoons:GetChildren()) do
            if v.Owner.Value == game.Players.LocalPlayer then
                for i, v in pairs(v.Buttons:GetChildren()) do
                    if game.Players.LocalPlayer.Character:FindFirstChild("Left Leg") then
                        firetouchinterest(game.Players.LocalPlayer.Character['Left Leg'], v.Head, 1)
                        firetouchinterest(game.Players.LocalPlayer.Character['Left Leg'], v.Head, 0)
                    end
                end
                repeat
                    runservice.Heartbeat:Wait()
                until v.PurchasedObjects:FindFirstChild("Mine")
                fireclickdetector(v.PurchasedObjects.Mine.Clicker.ClickDetector)
                if game.Players.LocalPlayer.Character:FindFirstChild("Right Leg") then
                    firetouchinterest(game.Players.LocalPlayer.Character['Right Leg'], v.Essentials.Giver, 1)
                    firetouchinterest(game.Players.LocalPlayer.Character['Right Leg'], v.Essentials.Giver, 0)
                end
            end
        end
    end
end