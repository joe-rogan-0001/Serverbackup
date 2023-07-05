-- Pre-load the language
local lang = Languages[Config.language]

-- @desc Handle /me command
local function onMeCommand(source, args)
    local playerId = source
    local playerName = GetPlayerName(playerId)
    local text = "* " .. lang.prefix .. table.concat(args, " ") .. " *"
    local logMessage = 'Player: ' .. playerName .. ' | ID: ' .. playerId .. ' | Message: ' .. text
    TriggerClientEvent('3dme:shareDisplay', -1, text, source)
    TriggerEvent('qb-log:server:CreateLog', 'me', 'ME', 'white', logMessage, false)
end

-- Register the command
RegisterCommand(lang.commandName, onMeCommand)