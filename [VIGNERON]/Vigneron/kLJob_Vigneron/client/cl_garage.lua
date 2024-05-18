ESX = nil
ESX = exports['es_extended']:getSharedObject()

Citizen.CreateThread(function()
    while true do 

        local interval = 1 
        local pos = GetEntityCoords(PlayerPedId())
        local dest = vector3(-1923.9799804688, 2053.6608886719, 140.83172607422)
        local distance = GetDistanceBetweenCoords(pos, dest, true)

        if distance > 15 then
            Citizen.Wait(2000)
        interval = 200
        else
        interval = 1
        end


        Wait(0)
        DrawMarker(2, -1923.9799804688, 2053.6608886719, 140.83172607422, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 170, 0, 1, false, true, nil, nil, false)

        if distance < 1 then
            interval = 200
    
        AddTextEntry("E", "Appuyer sur ~b~E ~w~pour ouvrir le garage.")
        DisplayHelpTextThisFrame("E", false) 
        if IsControlJustPressed(1, 51) and ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == "vigneron"  then
            OpenMenuGarage()
        end

    end
end
end)

function OpenMenuGarage()
    local model = GetHashKey("kangoo")
    RequestModel(model)
    lib.registerContext({
        id = "Garage:Menu",
        title = "Garage",
        options = {
            {
                title = "Renault Kangoo",
                onSelect = function()
                    while not HasModelLoaded(model) do Citizen.Wait(10) end
                    local car = CreateVehicle(model, -1920.501953125, 2053.1108398438, 140.73477172852, 256.8073425293, 90.0, true, false)
                    TaskWarpPedIntoVehicle(PlayerPedId(), car, -1)
                end
            }
        }
    })
    lib.showContext("Garage:Menu")
end