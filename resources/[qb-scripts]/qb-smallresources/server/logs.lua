local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = '',
    ['testwebhook'] = '',

    -- M Logs
    ['carboosting'] = 'https://discord.com/api/webhooks/1122155522620141569/0seC8N6ifamvmx5JEpkNIR097_7TcrjOr-Ii6puemg65NfNorOBanA8Zwqmw0AVuWgVw',
    ['cuffing'] = 'https://discord.com/api/webhooks/1122156052205535242/cKiJxHE1BvryZQ6fTCQch7F2JeGJ0I3t5ml_x0MiP3Ntc3BpYOnrjTuTBqKUVr1PCYBZ',
    -- need to add charsuicide when suicide script is in    ['charsuicide'] = '',
    ['death'] = 'https://discord.com/api/webhooks/1122156187115327569/1RcgJEJY8yGB0c9cPL2VQNYpfvT9jG48oDWO1lFEy4NkmTB_FBjTPh9Q6t4tLXSKSCse',
    ['drop'] = 'https://discord.com/api/webhooks/1122156306158080090/IffnUnh6iCh3YrBt_t-cFKBsOwQTs0xof19gT2Rjm-nAzaA6um04eahbsZdieqebP5G2',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1122156552682487938/NTt-l7yHWKs2lXzFzeJO7fGwOaYw7EGRHI5ZML2GZ41RrxSfirV9pXu9ijKa6E_dQ0Oa',
    ['joinleave'] = 'https://discord.com/api/webhooks/1122156648572657755/OHXPQDF_KoBgz_OYilYr3P0SjlAs3rBqfl3KplL6jjZCMErHsNC5Y18ZKaR1SKN-u9xN',
    ['me'] = 'https://discord.com/api/webhooks/1122156818366476349/dQBy994t0lZkk51k276biHIoVxKB5vp_LcHv5mkXi-UvvCyAUq3e38BaPgtNrOjWuuC3',
    ['ooc'] = 'https://discord.com/api/webhooks/1122157041708970004/n-U-ddzHk_p9g1UOBZ8RVpR2WmCp5qdyG5WRv_FXaGlG7WkdyQT4zOgJ7MVjhrzztdx1',
    ['robbing'] = 'https://discord.com/api/webhooks/1122157182792777808/FwNrBb9wn2uDbL3z4BiwBn_A3sP4ORQ0xQVYjE8tZ5-nuV1TqJRbDjatjpQIyYjN2I7X',
    ['shops'] = 'https://discord.com/api/webhooks/1122157369791631429/TzXRP9i0jX9mousq8UgYz7ZXEZDRC1oyuDWxS7W-Ndv0UPHERcKnnZhCGFiS6oTn0aci',
    ['vehicleshop'] = 'https://discord.com/api/webhooks/1122159232205205524/7EQn00C4rIkEmQqi6o_1yIkVBdZcUP_NHmb5lZaae5ruitGU8w0RLAiA69woDPgrD1l2',

    -- A Logs
    -- admin screenshots
    -- anticheat
    ['bossmenu'] = 'https://discord.com/api/webhooks/1122160064103448709/tv8tuFsS-6oworuPyJslku8kCQ4IeHGLKQnvljkKBRiR7LG4tBogcG2L_IVXIOQDXemq',
    -- drug script logs
    ['glovebox'] = 'https://discord.com/api/webhooks/1122160219544375406/VH3xWLbCNC46KsRrrtOjSKAbGxzqPpmvgg8gpknf6-pbdAGJW9s5fSjMa6zdmdDIbdw6',
    ['house'] = 'https://discord.com/api/webhooks/1122160447303471104/5gKw5eqG09G7gRvtUbfpfJ6bkhKiJ99kTbPATBQsj_clx6AKh3fjal6A8VCUlFV5uV_u',
    ['qbjobs'] = 'https://discord.com/api/webhooks/1122160549204070513/N90nMN39nA90raaNQgYuK4Revxk9JgO344q5sqXyZXyzt_ClI1JMIQa3WaKAjkrCHjd6',
    ['playermoney'] = 'https://discord.com/api/webhooks/1122160682335490128/dYaN4nMY9xwglOfoH2IeWDO7c0hb0tipKF01MnVA3-qWqOyGPiyb6OXMP6mKu8gDDBsP',
    -- phone logs
    ['report'] = 'https://discord.com/api/webhooks/1122160855761559552/ooZhQZuMiujR-4Qijx7zOU1tMjxLqDj5S80pTwzDfqcleI8Donb6sGcJDs0alABBAAGL',
    ['stash'] = 'https://discord.com/api/webhooks/1122160984988070060/XpvQcnx8IMpliyXewQjHYHuRVmZL2ouekYBSnjrlP_EuJtWQwdZs0eOrKKKlYlJ2NfOo',
    ['trunk'] = 'https://discord.com/api/webhooks/1122157471700635778/AwwWG2zZShaef55DZhz15hrB1HehVYRIUuKqX2t90-hAZTYX9a6O3mnLZrcLz3Fbi9rg',

    -- A+ Logs
    -- mod+admin command/panel logs
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

local logQueue = {}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'QBCore Logs',
                ['icon_url'] = 'https://media.discordapp.net/attachments/870094209783308299/870104331142189126/Logo_-_Display_Picture_-_Stylized_-_Red.png?width=670&height=670',
            },
        }
    }

    if not logQueue[name] then logQueue[name] = {} end
    logQueue[name][#logQueue[name]+1] = {webhook = webHook, data = embedData}

    if #logQueue[name] >= 10 then
        local postData = { username = 'QB Logs', embeds = {} }

        for i = 1, #logQueue[name] do
            postData.embeds[#postData.embeds+1] = logQueue[name][i].data[1]
        end

        PerformHttpRequest(logQueue[name][1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })

        logQueue[name] = {}
    end
end)

Citizen.CreateThread(function()
    local timer = 0
    while true do
        Wait(1000)
        timer = timer + 1
        if timer >= 60 then -- If 60 seconds have passed, post the logs
            timer = 0
            for name, queue in pairs(logQueue) do
                if #queue > 0 then
                    local postData = { username = 'QB Logs', embeds = {} }
                    for i = 1, #queue do
                        postData.embeds[#postData.embeds+1] = queue[i].data[1]
                    end
                    PerformHttpRequest(queue[1].webhook, function() end, 'POST', json.encode(postData), { ['Content-Type'] = 'application/json' })
                    logQueue[name] = {}
                end
            end
        end
    end
end)

QBCore.Commands.Add('testwebhook', 'Test Your Discord Webhook For Logs (God Only)', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Webhook setup successfully')
end, 'god')
