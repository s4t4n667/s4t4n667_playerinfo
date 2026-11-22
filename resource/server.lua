lib.locale()

local function detectFramework()
    if Config.Framework ~= 'auto' then
        return Config.Framework
    end

    if GetResourceState('qbx_core') == 'started' then
        return 'qbox'
    end

    if GetResourceState('qb-core') == 'started' then
        return 'qbcore'
    end

    if GetResourceState('es_extended') == 'started' then
        return 'esx'
    end
end

local framework = detectFramework()

local function getDirtyCount(src)
    if GetResourceState('ox_inventory') ~= 'started' then
        return 0
    end

    return exports.ox_inventory:Search(src, 'count', Config.DirtyMoney) or 0
end

local function fromQBPlayer(src, player)
    if not player then
        return
    end

    local playerData = player.PlayerData
    local charinfo = playerData.charinfo
    local job = playerData.job or {}

    return {
        name = ('%s %s'):format(charinfo.firstname, charinfo.lastname),
        job = job.label or locale('unemployed'),
        grade = job.grade and job.grade.name or locale('not_available'),
        pay = job.payment or 0,
        cash = playerData.money.cash or 0,
        bank = playerData.money.bank or 0,
        dirty = getDirtyCount(src),
    }
end

local function fromESXPlayer(src, xPlayer)
    if not xPlayer then
        return
    end

    local job = xPlayer.getJob()
    local bank = xPlayer.getAccount('bank')

    local dirty
    if GetResourceState('ox_inventory') == 'started' then
        dirty = getDirtyCount(src)
    else
        local account = xPlayer.getAccount(Config.DirtyMoney)
        dirty = account and account.money or 0
    end

    return {
        name = xPlayer.getName(),
        job = job.label or locale('unemployed'),
        grade = job.grade_label or locale('not_available'),
        pay = job.grade_salary or 0,
        cash = xPlayer.getMoney() or 0,
        bank = bank and bank.money or 0,
        dirty = dirty,
    }
end

if framework == 'qbox' then
    getPlayerData = function(src)
        return fromQBPlayer(src, exports.qbx_core:GetPlayer(src))
    end
elseif framework == 'qbcore' then
    local QBCore = exports['qb-core']:GetCoreObject()

    getPlayerData = function(src)
        return fromQBPlayer(src, QBCore.Functions.GetPlayer(src))
    end
elseif framework == 'esx' then
    local ESX = exports.es_extended:getSharedObject()

    getPlayerData = function(src)
        return fromESXPlayer(src, ESX.GetPlayerFromId(src))
    end
else
    return lib.print.error(locale('framework_error', framework or locale('framework_none')))
end

lib.callback.register('s4t4n667_playerinfo:getData', function(source)
    return getPlayerData(source)
end)
