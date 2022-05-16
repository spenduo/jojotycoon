local player = game.Players.LocalPlayer
local team = player.Team.Name
local tycoon = game.Workspace["Zednov's Tycoon Kit"].Tycoons[team]
local runservice = game:GetService("RunService")

getgenv().money = true
getgenv().rebirth = true

player.CanRebirth.Changed:Connect(function()
    if player.CanRebirth.Value == true and rebirth == true then
        game:GetService("ReplicatedStorage")["RebirthEvent (Don't Move)"]:FireServer()
        repeat
            wait()
        until tycoon.Entrance:FindFirstChild("Touch to claim!")
        firetouchinterest(player.Character.HumanoidRootPart, tycoon.Entrance["Touch to claim!"].Head, 0)
        firetouchinterest(player.Character.HumanoidRootPart, tycoon.Entrance["Touch to claim!"].Head, 1)
    end
end)

while wait(0.1) do
    if money == true then
        for i,v in pairs(tycoon.Buttons:GetChildren()) do
            if v.Head.Transparency == 0  and player.Character:FindFirstChild("HumanoidRootPart") then
                firetouchinterest(player.Character.HumanoidRootPart, v.Head, 0)
                firetouchinterest(player.Character.HumanoidRootPart, v.Head, 1)
            end
        end
        fireclickdetector(tycoon.PurchasedObjects:WaitForChild("Mine").Clicker.ClickDetector)
    end
end