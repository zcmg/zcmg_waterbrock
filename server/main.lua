RegisterServerEvent('zcmg_waterbrock:itens')
AddEventHandler('zcmg_waterbrock:itens', function()
    local xPlayer = ESX.GetPlayerFromId(source)

    for i=1, #Config.Itens, 1 do
        local quantidade = xPlayer.getInventoryItem(Config.Itens[i].remove).count
        local msg = "O teu dispositivo <b>"..ESX.GetItemLabel(Config.Itens[i].remove).."</b> está avariado!"
        if quantidade > 0 then
            if quantidade > 1 then
                msg = "Os teus dispositivos <b>"..ESX.GetItemLabel(Config.Itens[i].remove).."</b> estão avariados!"
            end
                
            xPlayer.removeInventoryItem(Config.Itens[i].remove, quantidade)
            xPlayer.addInventoryItem(Config.Itens[i].add, quantidade)
            xPlayer.triggerEvent('zcmg_notificacao:Alerta', "INVENTÁRIO", msg, 5000, 'aviso')
        end
    end
end)

PerformHttpRequest('https://raw.githubusercontent.com/zcmg/'..GetCurrentResourceName()..'/main/fxmanifest.lua', function(code, res, headers)
	local version = GetResourceMetadata(GetCurrentResourceName(), 'description')
	local versao = ''
	local update = ''

	if res ~= nil then
		local t = {}
		for i = 1, #res do
			t[i] = res:sub(i, i)
		end
		versao = t[73]..t[74]..t[75]..t[76]

		if versao == version then
			update = "Ultima Versão"
		else
			update = "^2Precisa de atualizar^1"
		end

	else
		update = "Impossivel verificar a versão"
	end

	

	print(([[^1--------------------------------------------------------------------------
	███████╗ ██████╗███╗   ███╗ ██████╗      ██████╗ ██████╗ ██████╗ ███████╗
	╚══███╔╝██╔════╝████╗ ████║██╔════╝     ██╔════╝██╔═══██╗██╔══██╗██╔════╝
	  ███╔╝ ██║     ██╔████╔██║██║  ███╗    ██║     ██║   ██║██████╔╝█████╗  
	 ███╔╝  ██║     ██║╚██╔╝██║██║   ██║    ██║     ██║   ██║██╔══██╗██╔══╝  
	███████╗╚██████╗██║ ╚═╝ ██║╚██████╔╝    ╚██████╗╚██████╔╝██║  ██║███████╗
	╚══════╝ ╚═════╝╚═╝     ╚═╝ ╚═════╝      ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝ 
	-----------------------^0https://www.github.com/zcmg/^1----------------------- 
	
	--------------------------------------------------------------------------
	-- ESX DEVELOPER PORTUGAL (^0https://discord.gg/Qt5WraEMxf^1)
	-- Versão: %s (%s)
	--------------------------------------------------------------------------^0]]):format(versao, update))

end,'GET')