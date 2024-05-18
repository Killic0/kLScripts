ESX = nil
ESX = exports['es_extended']:getSharedObject()


RegisterServerEvent('Vigne:Vin')
AddEventHandler('Vigne:Vin', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local raisin = xPlayer.getInventoryItem("raisin").count

	if raisin >= 100 then

	xPlayer.removeInventoryItem("raisin", 100)
	xPlayer.addInventoryItem("vin", 1)
    end

	
end)

RegisterServerEvent('recolteraisin')
AddEventHandler('recolteraisin', function()

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.addInventoryItem("raisin", 100)

end)

RegisterServerEvent('Vigne:Disp')
AddEventHandler('Vigne:Disp', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'VIGNERON', '~r~INFO', 'Vigneron Disponible', 'CHAR_VIGNE', 8)
	end
end)


RegisterServerEvent('Vigne:Indisp')
AddEventHandler('Vigne:Indisp', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'VIGNERON', '~r~INFO', 'Vigneron Indisponible', 'CHAR_VIGNE', 8)
	end
end)

RegisterServerEvent('Vigne:Recrut')
AddEventHandler('Vigne:Recrut', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers	= ESX.GetPlayers()
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'VIGNERON', '~r~INFO', 'Les vignerons recrutent, rendez vous la bas pour être recruter', 'CHAR_VIGNE', 8)
	end
end)


