Config = {}

Config.Framework = 'auto'           -- 'auto' detects framework automatically or use: 'qbox' / 'qbcore' / 'esx'

Config.Command = 'info'

Config.Keybind = false

Config.CurrencySymbol = '£'

Config.DirtyMoney = 'black_money'   -- item name for your dirty money item

Config.Show = {
    name = { -- character name
        enabled = true,
        icon = 'id-card',
        color = false,
    },
    playerID = { -- server / player ID
        enabled = true,
        icon = 'hashtag',
        color = false,
    },
    bank = {
        enabled = true,
        icon = 'building-columns',
        color = false,
    },
    cash = {
        enabled = true,
        icon = 'money-bill',
        color = false,
    },
    dirtyMoney = {
        enabled = true,
        icon = 'sack-dollar',
        color = '#ca4242',
    },
    job = {
        enabled = true,
        icon = 'briefcase',
        color = false,
        rank = true, -- rank in the job description
        pay = true,  -- pay in the job description
    },
}
