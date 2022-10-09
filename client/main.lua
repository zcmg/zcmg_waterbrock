local reparar = false

Citizen.CreateThread(function()
    local ligado = false
    
    while true do
        local PlayerPed = PlayerPedId()
        local wait = 500
        local coords = GetEntityCoords(PlayerPed)
        if Vdist(coords.x,coords.y,coords.z, Config.Blip.x,Config.Blip.y,Config.Blip.z) <= Config.BlipDistancia then
            wait=1
            DrawMarker(Config.BlipTipo, Config.Blip.x, Config.Blip.y, Config.Blip.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, Config.BlipTamanho.x, Config.BlipTamanho.y, Config.BlipTamanho.z, Config.BlipCor.r, Config.BlipCor.g, Config.BlipCor.b, 100, false, true, 2, false, false, false, false)
            if Vdist(coords.x,coords.y,coords.z, Config.Blip.x,Config.Blip.y,Config.Blip.z) <= 2 then
                if not ligado then
                    exports['zcmg_notificacao']:Alerta("REPARAÇÃO", "Pressiona <span style='color:#1c77ff'><b>[E]</b></span> para reparar os seus equipamentos!", 'ligada', 'informacao')
                    ligado = true
                end
                if IsControlJustPressed(0, 38) then
                    local anim_lib, anim_dict = "amb@prop_human_bum_bin@idle_a", "idle_a"
                    local x,y,z = table.unpack(GetEntityCoords(PlayerPed))

                    ESX.TriggerServerCallback('zcmg_waterbrock:verificaritens', function(cb)
                        if cb > 0 then
                            if not reparar then
                                reparar = true
                                ESX.Streaming.RequestAnimDict(anim_lib, function()
                                    TaskPlayAnim(PlayerPed, anim_lib, anim_dict, 8.0, -8.0, -1, 1, 0, false, false, false)
                                    FreezeEntityPosition(PlayerPed, true)
                                    exports['zcmg_barra']:Iniciar(Config.RepairTime*cb,'A reparar...', true)
                                    ClearPedTasks(PlayerPed)
                                    FreezeEntityPosition(PlayerPed, false)
                                    TriggerServerEvent('zcmg_waterbrock:reparar')
                                    reparar = false
                                end)
                            end
                        else
                            exports['zcmg_notificacao']:Alerta("REPARAÇÃO", "Não tem itens para reparação.", 5000, 'erro')
                        end
                    end)
                end
            else
                if ligado then
                    exports['zcmg_notificacao']:Alerta("", "", 'desligada', '')
                    ligado = false
                end
            end
        end

        if IsPedSwimming(PlayerPed) then
            TriggerServerEvent('zcmg_waterbrock:itens')
        end
        Citizen.Wait(wait)
    end
end)

Citizen.CreateThread(function()
    while true do 
        local wait = 1000        
        
        if reparar then
            wait = 0   
            DisableAllControlActions(0)
        end 
        Citizen.Wait(wait)
	end
end)