local QBCore = exports['qb-core']:GetCoreObject()

local pinkcage = {
    [1] = {locked = true},
    [2] = {locked = true},
    [3] = {locked = true},
    [4] = {locked = true},
    [5] = {locked = true},
    [6] = {locked = true},
    [7] = {locked = true},
    [8] = {locked = true},
    [9] = {locked = true},
    [10]= {locked = true},
    [11]= {locked = true},
    [12]= {locked = true},
    [13]= {locked = true},
    [14]= {locked = true},
}

RegisterNetEvent('m3:motel:server:getLockStates')
AddEventHandler('m3:motel:server:getLockStates', function()
    local src = source
    TriggerClientEvent('m3:motel:client:sendDoorlockState', src, pinkcage)
end)

RegisterNetEvent('m3:motel:server:toggleDoorlock')
AddEventHandler('m3:motel:server:toggleDoorlock', function(doorid, lockstate)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    
    pinkcage[doorid].locked = lockstate
    TriggerClientEvent('m3:motel:client:sendDoorlockState2', -1, doorid, lockstate)
end)

QBCore.Functions.CreateCallback('m3:motel:server:getPlayerOutfit', function(source, cb, num)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)

	if Player then
		QBCore.Functions.ExecuteSql(false, "SELECT * FROM `player_outfits` WHERE `citizenid` = '"..Player.PlayerData.citizenid.."'", function(result)
			if result[1] ~= nil then
				cb(result)
			else
				cb(nil)
			end
		end)
	end
end)


