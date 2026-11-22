lib.locale()

local function formatMoney(amount)
    local formatted = tostring(math.floor(tonumber(amount) or 0))
    local replaced
    repeat
        formatted, replaced = formatted:gsub('^(-?%d+)(%d%d%d)', '%1,%2')
    until replaced == 0
    return Config.CurrencySymbol .. formatted
end

local function buildOptions(data)
    local options = {}

    local entries = {
        { key = 'playerID', title = locale('player_id', GetPlayerServerId(PlayerId())) },
        { key = 'bank', title = locale('bank', formatMoney(data.bank)) },
        { key = 'cash', title = locale('cash', formatMoney(data.cash)) },
        { key = 'dirtyMoney', title = locale('dirty_money', formatMoney(data.dirty)) },
    }

    for _, item in ipairs(entries) do
        local config = Config.Show[item.key]

        if config and config.enabled then
            options[#options + 1] = {
                title = item.title,
                icon = config.icon,
                iconColor = config.color,
                readOnly = true,
            }
        end
    end

    local job = Config.Show.job
    if job and job.enabled then
        local details = {}

        if job.rank then details[#details + 1] = locale('job_rank', data.grade) end
        if job.pay then details[#details + 1] = locale('job_pay', formatMoney(data.pay)) end

        options[#options + 1] = {
            title = data.job,
            description = #details > 0 and table.concat(details, ' | '),
            icon = job.icon,
            iconColor = job.color,
            readOnly = true,
        }
    end

    return options
end

local function openPlayerInfo()
    local data = lib.callback.await('s4t4n667_playerinfo:getData', false)

    if not data then
        return lib.notify({ title = locale('menu_title'), description = locale('load_error'), type = 'error' })
    end

    lib.registerContext({
        id = 's4t4n667_playerinfo',
        title = data.name,
        options = buildOptions(data),
    })
    lib.showContext('s4t4n667_playerinfo')
end

exports('openPlayerInfo', openPlayerInfo)

RegisterNetEvent('s4t4n667_playerinfo:open', function()
    openPlayerInfo()
end)

if Config.Command then
    RegisterCommand(Config.Command, function()
        openPlayerInfo()
    end, false)
    TriggerEvent('chat:addSuggestion', '/' .. Config.Command, locale('command_help'))
end

if Config.Keybind then
    lib.addKeybind({
        name = 's4t4n667_playerinfo',
        description = locale('keybind_desc'),
        defaultKey = Config.Keybind,
        onPressed = openPlayerInfo,
    })
end