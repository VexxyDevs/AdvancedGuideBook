
local settings = CFG.SETTINGS
-- edit made by rico :) (original  made by sheen) https://forum.cfx.re/t/free-guidebook-ui/5241521

if settings.framework == 'qb-core' then 
    local QBCore = exports['qb-core']:GetCoreObject()
    QBCore.Functions.CreateUseableItem(settings.item, function(source, item)
        local Player = QBCore.Functions.GetPlayer(source)
        if Player then
            SetNuiFocus(true, true)
            SendNUIMessage({ action = 'SHOW_UI' })
        end
    end)
elseif settings.framework == 'old_esx' then 
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

    ESX.RegisterUsableItem(settings.item, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            SetNuiFocus(true, true)
            SendNUIMessage({ action = 'SHOW_UI' })
        end
    end)
elseif  settings.framework == 'esx' then 
    ESX = nil
    ESX = exports["es_extended"]:getSharedObject()

    ESX.RegisterUsableItem(settings.item, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer then
            SetNuiFocus(true, true)
            SendNUIMessage({ action = 'SHOW_UI' })
        end
    end)
end 

-- NUI Callbacks --
RegisterNUICallback('CLOSE_UI', function()
    SetNuiFocus(false, false)
end)
