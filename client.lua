local lastMovement = GetGameTimer()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if IsControlJustPressed(0, 32) or IsControlJustPressed(0, 34) or IsControlJustPressed(0, 31) or IsControlJustPressed(0, 30) then
            lastMovement = GetGameTimer()
        end

        if GetGameTimer() - lastMovement > 900000 then -- 15 minut
            TriggerServerEvent("afk:kick")
        end
    end
end)

RegisterNetEvent("afk:warn")
AddEventHandler("afk:warn", function(time)
    TriggerEvent('chat:addMessage', {args = {"[AFK]", "Budeš vykopnut za neaktivitu za " .. time .. " sekund!"}})
end)
