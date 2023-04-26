local QBCore = exports['qb-core']:GetCoreObject()

--USABLE ITEMS
QBCore.Functions.CreateUseableItem('briefcase', function(source, item)
    local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
	TriggerClientEvent('nebula_briefcase:client:casemenu',src, item)
end)
--ADD VALUE TO BRIEFCASE
RegisterNetEvent('nebula_briefcase:server:addvalue', function(cash, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        Player.PlayerData.items[data.slot].info.cash = Player.PlayerData.items[data.slot].info.cash + cash
        Player.Functions.SetInventory(Player.PlayerData.items)
        Player.Functions.RemoveMoney('cash', cash)
end)
--REMOVE VALUE FROM BRIEFCASE
RegisterNetEvent('nebula_briefcase:server:remvalue', function(cash, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        Player.PlayerData.items[data.slot].info.cash = Player.PlayerData.items[data.slot].info.cash - cash
        Player.Functions.SetInventory(Player.PlayerData.items)
        Player.Functions.AddMoney('cash', cash)
end)