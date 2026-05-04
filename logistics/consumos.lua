-- LifeOS-System: Gestión de Consumos
-- Desarrollado por: jsjuhsju

local PayCheckTime = 60 * 60000 -- Se ejecuta cada 60 minutos (1 hora)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(PayCheckTime)
        
        local players = GetPlayers()
        for i=1, #players do
            local source = players[i]
            local xPlayer = exports.qbit_core:GetPlayer(source)
            
            if xPlayer then
                -- Lógica de cobro: Cantidad a cobrar por servicios básicos
                local amount = 150 
                
                -- Quitamos el dinero del banco
                xPlayer.Functions.RemoveMoney('bank', amount, "LifeOS: Pago de Servicios")
                
                -- Avisamos al jugador
                TriggerClientEvent('ox_lib:notify', source, {
                    title = 'Servicios Públicos',
                    description = 'Se han debitado $' .. amount .. ' de tu cuenta por servicios.',
                    type = 'inform'
                })
                print("^3[LifeOS]^7 Cobro de servicios realizado a ID: " .. source)
            end
        end
    end
end)
