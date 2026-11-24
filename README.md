<div align="center">

# s4t4n667_playerinfo

A lightweight player info menu using ox_lib. Players can see their character name, server ID, bank, cash and dirty money balances along with current job (optional rank and pay).

[**Documentation:**](https://s4t4n667.gitbook.io/asgaard-developments/free-scripts/player-info) | [**Store**](https://asgaard-developments.tebex.io/)

<a href="https://5metrics.dev/resource/s4t4n667_playerinfo">
  <img src="https://badges.5metrics.dev/s4t4n667_playerinfo/servers.svg?style=for-the-badge" alt="Servers">
</a>

</div>

## ✨ Features:
- Use a command or keybind to open the menu
- Useable by all players
- Every field is optional - ID, cash, bank balance, dirty money, job
- Locales: English, German, French

<div align="center">
<img width="326" height="324" alt="player-info-menu" src="https://github.com/user-attachments/assets/046fba6c-6f19-4c80-a836-a6e910aceb2e" />
</div>

## 🔐 Dependencies:
- [ESX](https://github.com/esx-framework/esx_core), [QBCore](https://github.com/qbcore-framework) or [Qbox](https://github.com/Qbox-project/)
- [ox_lib](https://github.com/overextended/ox)

## ⚙️ How to install:
1) Download the latest release
2) Add `s4t4n667_playerinfo` to your server's `resource` folder
3) Adjust the `config.lua` to your liking
4) Restart your server

## 📊 Resmon:
0.00ms when idle, quickly changes to 0.01ms then back to 0.00ms when opening

## Exports:
- Client: `exports.s4t4n667_playerinfo:openPlayerInfo()`
- Server: `TriggerClientEvent('s4t4n667_playerinfo:open', playerId)`

## 📌 Asgaard Developments
I’m a solo FiveM developer creating scripts, custom clothing, logos and graphics, liveries, MLO retextures and Discord servers. Lots of different packages available, along with plenty of free assets and scripts for the community to enjoy.  

Join the Discord: [here](https://discord.gg/eFsB5ZFxeq)
