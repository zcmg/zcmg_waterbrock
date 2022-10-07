Citizen.CreateThread(function()
    local PlayerPed = PlayerPedId()
    local wait = 1
    while true do
        if IsPedSwimmingUnderWater(PlayerPed) then
            wait = 1000
            TriggerServerEvent('zcmg_waterbrock:itens')
        else
            wait = 1
        end
        Citizen.Wait(wait)
    end
end)