ESX = nil
ESX = exports['es_extended']:getSharedObject()


Citizen.CreateThread(function()
    while true do
        if IsControlJustPressed(1, 167) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "vigneron" then
            MenuF6()
        end
        Wait(1)
    end
end)

function MenuF6()
    lib.registerContext({
        id = 'F6',
        title = 'Menu Vigneron',
        options = {
            {
                title = "⬇ Travail ⬇"
            },
            {
                title = "Récolter",
                onSelect = function()
                    OpenMenuRecolte()
                end
            },
            {
                title = "⬇ Facturation ⬇"
            },
            {
                title = "Facturation",
                onSelect = function()
                    local closestPlayer, x, closestDistance = lib.getClosestPlayer(GetEntityCoords(PlayerPedId()), 2.0, true)
                    local input = lib.inputDialog("Facturation",{
                        {type= "number", label = "Choisissez le montant", required = true}
                    })
                    if input then
                        TriggerServerEvent('esx_billing:sendBill', GetPlayerServerId(closestPlayer), 'society_livreur', 'Livreur', input[1])
                    end
                end
            },
            {
                title = "⬇ Notification ⬇"
            },
            {
                title = "Notification",
                onSelect = function()
                    OpenNotifMenu()
                end
            },
            {
                title = "⬇ Autre ⬇",
                onSelect = function()
                    OpenAutreMenu()
                end
            }
        }
        
    })
    lib.showContext("F6")
end


function OpenNotifMenu()
    lib.registerContext({
        id = "Notif:Menu",
        title = "Choix de la notification",
        options = {
            {
                title = "Disponible",
                onSelect = function()
                    TriggerServerEvent('Vigne:Disp')
                end
            },
            {
                title = "Indisponible",
                onSelect = function()
                    TriggerServerEvent('Vigne:Indisp')
                end
            },
            {
                title = "Recrutement",
                onSelect = function()
                    TriggerServerEvent('Vigne:Recrut')
                end
            }
        }
    })
    lib.showContext("Notif:Menu")


end

function OpenMenuRecolte()
    lib.registerContext({
        id = "Recolt:Menu",
        title = "Choix du travail",
        options = {
            {
                title = "Récolter du raisin",
                onSelect = function()
                    ESX.ShowNotification("Rendez vous au point sur votre carte", "info", 5000)
                    RecolteRaisin()
                end
            }
        }
    })
    lib.showContext("Recolt:Menu")


end


function RecolteRaisin()
    while true do

        
    local interval = 1 
    local pos = GetEntityCoords(PlayerPedId())
    local dest = vector3(-1850.1462402344, 2105.6350097656, 136.814453125)
    local distance = GetDistanceBetweenCoords(pos, dest, true)
        
        if distance > 15 then
            Citizen.Wait(2000)
        interval = 200
        else
        interval = 1
        end

        Wait(0)
        DrawMarker(2, -1850.1462402344, 2105.6350097656, 136.814453125, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 170, 0, 1, false, true, nil, nil, false)
        SetNewWaypoint(-1850.1462402344, 2105.6350097656)

        if distance < 1 then
            interval = 200
    
        AddTextEntry("E", "Appuyer sur ~b~E ~w~pour récolter du raisin.")
        DisplayHelpTextThisFrame("E", false) 
        if IsControlJustPressed(1, 51) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "vigneron"  then
                TriggerServerEvent('recolteraisin')  
                ESX.ShowNotification("Rendez vous devant le garage pour faire du vin", "info", 5000)
                SetWaypointOff()
                FabricationVin()
        end 
    end
    end
end

function FabricationVin()
    while true do
            
    local interval = 1 
    local pos = GetEntityCoords(PlayerPedId())
    local dest = vector3(-1924.6707763672, 2048.9870605469, 140.83145141602)
    local distance = GetDistanceBetweenCoords(pos, dest, true)

    if distance > 15 then
        Citizen.Wait(2000)
    interval = 200
    else
    interval = 1
    end


    Wait(0)
    DrawMarker(2, -1924.6707763672, 2048.9870605469, 140.83145141602, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 170, 0, 1, false, true, nil, nil, false)
    SetNewWaypoint(-1924.6707763672, 2048.9870605469)

    if distance < 1 then
        interval = 200

    AddTextEntry("E", "Appuyer sur ~b~E ~w~pour faire du vin.")
    DisplayHelpTextThisFrame("E", false) 
    if IsControlJustPressed(1, 51) then
        TriggerServerEvent('Vigne:Vin')
    end
    end
end
end


function OpenAutreMenu()
    lib.registerContext({
        id = "Recolt:Autre",
        title = "Autre",
        options = {
            {
                title = "Enlever le GPS",
                onSelect = function()
                    SetWaypointOff()
                end
            }
        }
    })
    lib.showContext("Recolt:Autre")
end
