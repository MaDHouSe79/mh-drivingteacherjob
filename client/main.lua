--[[ ===================================================== ]]--
--[[        QBCore Driving Teacher Job by MaDHouSe         ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local zones = {}
local garageCombo = {}
local currentTestDriving = false
local currentStudentID = nil
local currentDriveTest = nil
local currentVehicle = nil
local currenVehicleName = nil
local currentPlate = nil
local inDuty

local function SetFuel(vehicle, fuel)
    if type(fuel) == 'number' and fuel >= 0 and fuel <= 100 then
        SetVehicleFuelLevel(vehicle, fuel + 0.0)
	DecorSetFloat(vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(vehicle))
    end
end

local function SpawnAirplane(licence)
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(coords)
    local tmpSpawnPosition = vector3(coords.x + 5.0, coords.y + 1.0, coords.z)
    if not QBCore.Functions.SpawnClear(tmpSpawnPosition, 5.0) then
        QBCore.Functions.Notify(Lang:t('error.area_is_obstructed'), 'error', 5000)
	return
    else
        QBCore.Functions.SpawnVehicle(Config.VehicleModels[licence], function(_vehicle)
            vehicle = _vehicle
            local plate = 'TL' .. string.format('%06d', math.random(1, 999999))
            currentVehicle = vehicle
            currentPlate = plate
            currenVehicleName = Config.VehicleModels[licence]
            SetVehicleNumberPlateText(vehicle, plate)
            SetEntityHeading(vehicle, heading)
            SetFuel(vehicle, 100.0)
            SetVehicleOnGroundProperly(vehicle)
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            SetVehicleEngineHealth(vehicle, 1000.0)
            SetVehicleBodyHealth(vehicle, 1000.0)
            SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
            SetVehicleDirtLevel(vehicle, 0)
            SetVehicleUndriveable(vehicle, false)
            WashDecalsFromVehicle(vehicle, 1.0)
            SetVehRadioStation(vehicle, 'OFF')
            TriggerEvent('qb-drivingteacherjob:client:giveKeys', plate)
        end, vector3(tmpSpawnPosition.x, tmpSpawnPosition.y, tmpSpawnPosition.z + 1.0), true)
    end
end

local function SpawnHelikoper(licence)
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(coords)
    local tmpSpawnPosition = vector3(coords.x + 5.0, coords.y + 1.0, coords.z)
    if not QBCore.Functions.SpawnClear(tmpSpawnPosition, 5.0) then
        QBCore.Functions.Notify(Lang:t('error.area_is_obstructed'), 'error', 5000)
	return
    else
        QBCore.Functions.SpawnVehicle(Config.VehicleModels[licence], function(_vehicle)
            vehicle = _vehicle
            local plate = 'TL' .. string.format('%06d', math.random(1, 999999))
            currentVehicle = vehicle
            currentPlate = plate
            currenVehicleName = Config.VehicleModels[licence]
            SetVehicleNumberPlateText(vehicle, plate)
            SetEntityHeading(vehicle, heading)
            SetFuel(vehicle, 100.0)
            SetVehicleOnGroundProperly(vehicle)
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            SetVehicleEngineHealth(vehicle, 1000.0)
            SetVehicleBodyHealth(vehicle, 1000.0)
            SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
            SetVehicleDirtLevel(vehicle, 0)
            SetVehicleUndriveable(vehicle, false)
            WashDecalsFromVehicle(vehicle, 1.0)
            SetVehRadioStation(vehicle, 'OFF')
            TriggerEvent('qb-drivingteacherjob:client:giveKeys', plate)
        end, vector3(tmpSpawnPosition.x, tmpSpawnPosition.y, tmpSpawnPosition.z + 1.0), true)
    end
end

local function SpawnBoat(licence)
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(coords)
    local tmpSpawnPosition = vector3(coords.x + 5.0, coords.y + 1.0, coords.z)
    if not QBCore.Functions.SpawnClear(tmpSpawnPosition, 5.0) then
        QBCore.Functions.Notify(Lang:t('error.area_is_obstructed'), 'error', 5000)
	return
    else
        QBCore.Functions.SpawnVehicle(Config.VehicleModels[licence], function(_vehicle)
            vehicle = _vehicle
            local plate = 'TL' .. string.format('%06d', math.random(1, 999999))
            currentVehicle = vehicle
            currentPlate = plate
            currenVehicleName = Config.VehicleModels[licence]
            SetVehicleNumberPlateText(vehicle, plate)
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            SetEntityHeading(vehicle, heading)
            SetFuel(vehicle, 100.0)
            SetVehicleEngineHealth(vehicle, 1000.0)
            SetVehicleBodyHealth(vehicle, 1000.0)
            SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
            SetVehicleDirtLevel(vehicle, 0)
            SetVehicleUndriveable(vehicle, false)
            WashDecalsFromVehicle(vehicle, 1.0)
            SetVehRadioStation(vehicle, 'OFF')
            TriggerEvent('qb-drivingteacherjob:client:giveKeys', plate)
        end, vector3(tmpSpawnPosition.x, tmpSpawnPosition.y, tmpSpawnPosition.z + 1.0), true)

    end
end

local function SpawnTruckAndTrailer(licence)
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(coords)
    local tmpSpawnPosition = vector3(coords.x + 5.0, coords.y + 1.0, coords.z)
    local vehiclePosition
    local vehicleHeading
    if not QBCore.Functions.SpawnClear(tmpSpawnPosition, 5.0) then
        QBCore.Functions.Notify(Lang:t('error.area_is_obstructed'), 'error', 5000)
	    return
    else
        QBCore.Functions.SpawnVehicle(Config.VehicleModels[licence], function(veh)
            local vehicle = veh
            vehiclePosition = GetEntityCoords(vehicle)
            vehicleHeading = GetEntityHeading(vehicle)
            SetVehicleNumberPlateText(vehicle, 'TR_LR_' .. string.format('%06d', math.random(1, 99)))
            SetEntityHeading(vehicle, heading)
            local plate = QBCore.Functions.GetPlate(vehicle)
            currentVehicle = vehicle
            currentPlate = plate
            currenVehicleName = Config.VehicleModels[licence]
            SetFuel(vehicle, 100.0)
            SetVehicleOnGroundProperly(vehicle)
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            SetVehicleCustomPrimaryColour(loading, 0, 0, 0)
            SetVehicleDirtLevel(vehicle, 0)
            WashDecalsFromVehicle(vehicle, 1.0)
            SetVehRadioStation(vehicle, 'OFF')
            SetVehicleEngineHealth(vehicle, 1000.0)
            SetVehicleBodyHealth(vehicle, 1000.0)
            TriggerEvent('qb-drivingteacherjob:client:giveKeys', plate)
        end, tmpSpawnPosition, true)
	    Wait(100)
        if Config.Trailers.CE ~= '' then
            QBCore.Functions.SpawnVehicle(Config.Trailers.CE, function(loading)
                SetVehicleNumberPlateText(loading, 'B_LR_' .. string.format('%06d', math.random(1, 99)))
                SetEntityHeading(loading, vehicleHeading)
                SetVehicleCustomPrimaryColour(loading, 0, 0, 0)
                SetVehicleDirtLevel(loading)
                WashDecalsFromVehicle(loading, 1.0)
                AttachEntityToEntity(loading, vehicle, 20, 0.0, -1.0, 0.25, 0.0, 0.0, 0.0, false, false, true, false, 20, true)
            end, vector3(vehiclePosition.x, vehiclePosition.y - 5.0, vehiclePosition.z + 0.5), true)
        end
    end
end

local function SpawnBusAndTrailer(licence)
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(coords)
    local tmpSpawnPosition = vector3(coords.x + 5.0, coords.y + 1.0, coords.z)
    local vehiclePosition
    local vehicleHeading
    if not QBCore.Functions.SpawnClear(tmpSpawnPosition, 5.0) then
        QBCore.Functions.Notify(Lang:t('error.area_is_obstructed'), 'error', 5000)
	    return
    else
        QBCore.Functions.SpawnVehicle(Config.VehicleModels[licence], function(veh)
            local vehicle = veh
            vehiclePosition = GetEntityCoords(vehicle)
            vehicleHeading = GetEntityHeading(vehicle)
            SetVehicleNumberPlateText(vehicle, 'TR_LR_' .. string.format('%06d', math.random(1, 99)))
            SetEntityHeading(vehicle, heading)
            local plate = QBCore.Functions.GetPlate(vehicle)
            currentVehicle = vehicle
            currentPlate = plate
            currenVehicleName = Config.VehicleModels[licence]
            SetFuel(vehicle, 100.0)
            SetVehicleOnGroundProperly(vehicle)
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            SetVehicleCustomPrimaryColour(loading, 0, 0, 0)
            SetVehicleDirtLevel(vehicle, 0)
            WashDecalsFromVehicle(vehicle, 1.0)
            SetVehRadioStation(vehicle, 'OFF')
            SetVehicleEngineHealth(vehicle, 1000.0)
            SetVehicleBodyHealth(vehicle, 1000.0)
            TriggerEvent('qb-drivingteacherjob:client:giveKeys', plate)
        end, tmpSpawnPosition, true)
        Wait(100)
        if Config.Trailers.DE ~= '' then
            QBCore.Functions.SpawnVehicle(Config.Trailers.DE, function(loading)
                SetVehicleNumberPlateText(loading, 'B_LR_' .. string.format('%06d', math.random(1, 99)))
                SetEntityHeading(loading, vehicleHeading)
                SetVehicleCustomPrimaryColour(loading, 0, 0, 0)
                SetVehicleDirtLevel(loading)
                WashDecalsFromVehicle(loading, 1.0)
                AttachEntityToEntity(loading, vehicle, 20, 0.0, -1.0, 0.25, 0.0, 0.0, 0.0, false, false, true, false, 20, true)
            end, vector3(vehiclePosition.x, vehiclePosition.y - 5.0, vehiclePosition.z + 0.5), true)
        end
    end
end

local function SpawnBoatTrailer(licence)
    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(coords)
    local tmpSpawnPosition = vector3(coords.x + 5.0, coords.y + 1.0, coords.z)
    local vehicle
    local vehiclebone
    local trailer
    local trailerbone
    local vehiclePosition
    local vehicleHeading
    local trailerPosition
    local trailerHeading
    if not QBCore.Functions.SpawnClear(tmpSpawnPosition, 5.0) then
        QBCore.Functions.Notify(Lang:t('error.area_is_obstructed'), 'error', 5000)
	    return
    else
        QBCore.Functions.SpawnVehicle(Config.VehicleModels[licence], function(_vehicle)
            vehicle = _vehicle
            local plate = 'TL' .. string.format('%06d', math.random(1, 999999))
            SetVehicleNumberPlateText(vehicle, plate)
            SetEntityHeading(vehicle, heading)
            vehiclePosition = GetEntityCoords(vehicle)
            vehicleHeading = GetEntityHeading(vehicle)
            currenVehicleName = Config.VehicleModels[licence]
            vehiclebone = GetEntityBoneIndexByName(vehicle, 'attach_male')
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            SetFuel(vehicle, 100.0)
            SetVehicleOnGroundProperly(vehicle)
            SetVehicleEngineHealth(vehicle, 1000.0)
            SetVehicleBodyHealth(vehicle, 1000.0)
            SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
            SetVehicleDirtLevel(vehicle, 0)
            SetVehicleUndriveable(vehicle, false)
            WashDecalsFromVehicle(vehicle, 1.0)
            SetVehRadioStation(vehicle, 'OFF')
            currentVehicle = vehicle
            currentPlate = plate
            TriggerEvent('qb-drivingteacherjob:client:giveKeys', plate)
        end, tmpSpawnPosition, true)
        Wait(100)
        QBCore.Functions.SpawnVehicle(Config.Trailers.BE, function(_trailer)
            trailer = _trailer
            trailerPosition = GetEntityCoords(trailer)
            trailerHeading = GetEntityHeading(trailer)
            trailerbone = GetEntityBoneIndexByName(trailer, 'attach_female')
            local plate = 'TR_LR_' .. string.format('%06d', math.random(1, 99))
            SetVehicleNumberPlateText(trailer, plate)
            SetEntityHeading(trailer, heading)
            SetVehicleCustomPrimaryColour(trailer, 0, 0, 0)
            SetVehicleDirtLevel(trailer)
            WashDecalsFromVehicle(trailer, 1.0)
            AttachEntityToEntity(trailerbone, vehiclebone, 1, 0.0, -1.0, 0.25, 0.0, 0.0, 0.0, false, false, true, false, 20, true)
        end, vector3(vehiclePosition.x + 0.2, vehiclePosition.y - 6.5, vehiclePosition.z), true)
        Wait(100)
        if Config.TrailerLoads.BE ~= '' then
            QBCore.Functions.SpawnVehicle(Config.TrailerLoads.BE, function(loading)
                SetVehicleNumberPlateText(loading, 'B_LR_' .. string.format('%06d', math.random(1, 99)))
                SetEntityHeading(loading, trailerHeading)
                AttachEntityToEntity(loading, trailer, 20, 0.0, -1.0, 0.25, 0.0, 0.0, 0.0, false, false, true, false, 20, true)
                SetVehicleCustomPrimaryColour(loading, 0, 0, 0)
                SetVehicleDirtLevel(loading)
                WashDecalsFromVehicle(loading, 1.0)
                SetFuel(loading, 100.0)
            end, vector3(trailerPosition.x, trailerPosition.y, trailerPosition.z + 1.0), true)
        end
    end
end

local function SpawnTestVehicle(licence)
    local coords  = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(coords)
    local tmpSpawnPosition = vector3(coords.x + 3.0, coords.y + 1.0, coords.z)
    if not QBCore.Functions.SpawnClear(tmpSpawnPosition, 5.0) then
        QBCore.Functions.Notify(Lang:t('error.area_is_obstructed'), 'error', 5000)
	    return
    else
        QBCore.Functions.SpawnVehicle(Config.VehicleModels[licence], function(_vehicle)
            vehicle = _vehicle
            local plate = 'TL' .. string.format('%06d', math.random(1, 999999))
            currentVehicle = vehicle
            currentPlate = plate
            currenVehicleName = Config.VehicleModels[licence]
            SetVehicleNumberPlateText(vehicle, plate)
            SetEntityHeading(vehicle, heading)
            SetFuel(vehicle, 100.0)
            SetVehicleOnGroundProperly(vehicle)
            SetVehicleEngineHealth(vehicle, 1000.0)
            SetVehicleBodyHealth(vehicle, 1000.0)
            SetVehicleCustomPrimaryColour(vehicle, 0, 0, 0)
            SetVehicleDirtLevel(vehicle, 0)
            SetVehicleUndriveable(vehicle, false)
            WashDecalsFromVehicle(vehicle, 1.0)
            SetVehRadioStation(vehicle, 'OFF')
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            TriggerEvent('qb-drivingteacherjob:client:giveKeys', plate)
        end, tmpSpawnPosition, true)
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(data)
    PlayerData = data
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerData = QBCore.Functions.GetPlayerData()
    end
end)

RegisterNetEvent('qb-drivingteacherjob:client:giveKeys', function(plate)
    TriggerServerEvent(Config.GiveKeyScriptTrigger, plate)	
end)

RegisterNetEvent('qb-drivingteacherjob:client:removeKeys', function(plate)
    TriggerEvent(Config.RemoveKeyScriptTrigger, plate)		
end)

RegisterNetEvent('mh-drivingteacherjob:client:giveLicinceMenu', function()
    local playerlist = {}
    QBCore.Functions.TriggerCallback('mh-drivingteacherjob:server:GetOnlinePlayers', function(online)
        for key, v in pairs(online) do
            playerlist[#playerlist + 1] = {value = v.source, text = "(ID:"..v.source..") "..v.fullname}
        end
        local menu = exports["qb-input"]:ShowInput({
            header = Lang:t('menu.main_give_header'),
            submitText = Lang:t('menu.give_help'),
            inputs = {
                {
                    text = Lang:t('licence.select_player'),
                    name = "id",
                    type = "select",
                    options = playerlist,
                    isRequired = true
                },
                {
                    text = Lang:t('licence.select_licence'),
                    name = "licence",
                    type = "select",
                    options = {
                        { value = "N", text = Lang:t('licence.licence_n') },
                        { value = "AM", text = Lang:t('licence.licence_am')},
                        { value = "A", text = Lang:t('licence.licence_a') },
                        { value = "B", text = Lang:t('licence.licence_b') },
                        { value = "BE", text = Lang:t('licence.licence_be') },
                        { value = "C", text = Lang:t('licence.licence_c') },
                        { value = "CE", text = Lang:t('licence.licence_ce') },
                        { value = "D", text = Lang:t('licence.licence_d') },
                        { value = "DE", text = Lang:t('licence.licence_de') },
                        { value = "T", text = Lang:t('licence.licence_t') },
                        { value = "H", text = Lang:t('licence.licence_h') },
                        { value = "P", text = Lang:t('licence.licence_p') },
                        { value = "R", text = Lang:t('licence.licence_r') },
                        { value = "AMB", text = Lang:t('licence.licence_amb') },
                        { value = "POL", text = Lang:t('licence.licence_pol') },
                    },
                    isRequired = true
                }
            }
        })
        if menu then
            if not menu.id and not menu.licence then
                return
            else
                TriggerServerEvent('mh-drivingteacherjob:server:givelicince', tonumber(menu.id), tostring(menu.licence))
            end
        end
    end)
end)

RegisterNetEvent('mh-drivingteacherjob:client:takeLicinceMenu', function()
    local playerlist = {}
    QBCore.Functions.TriggerCallback('mh-drivingteacherjob:server:GetOnlinePlayers', function(online)
        for key, v in pairs(online) do
            playerlist[#playerlist + 1] = {value = v.source, text = "(ID:"..v.source..") "..v.fullname}
        end
        local menu = exports["qb-input"]:ShowInput({
            header = Lang:t('menu.main_take_header'),
            submitText = Lang:t('menu.remove_help'),
            inputs = {
                {
                    text = Lang:t('licence.select_player'),
                    name = "id",
                    type = "select",
                    options = playerlist,
                    isRequired = true
                },
            }
        })
        if menu then
            if not menu.id then
                return
            else
                TriggerServerEvent('mh-drivingteacherjob:server:takelicince', tonumber(menu.id))
            end
        end
    end)
end)

-- Threads
CreateThread(function()
    for _, station in pairs(Config.Locations["stations"]) do
        if station.showBlip then
            local blip = AddBlipForCoord(station.coords.x, station.coords.y, station.coords.z)
            SetBlipSprite(blip, station.blipSprite)
            SetBlipAsShortRange(blip, true)
            SetBlipScale(blip, station.blipScale)
            SetBlipColour(blip, station.blipColour)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(station.label)
            EndTextCommandSetBlipName(blip)
        end
    end
end)

-- Toggle Duty in an event.
RegisterNetEvent('qb-drivingteacherjob:client:ToggleDuty', function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)


CreateThread(function()
    -- Toggle Duty
    for k, v in pairs(Config.Locations["duty"]) do
        exports['qb-target']:AddBoxZone("drivingteacher_"..k, v, 1, 1, {
            name = "drivingteacher_"..k,
            heading = 11,
            debugPoly = Config.debugPoly,
            minZ = v.z - 1,
            maxZ = v.z + 1,
        }, {
            options = {
                {
                    type = "client",
                    event = "qb-drivingteacherjob:client:ToggleDuty",
                    icon = "fas fa-sign-in-alt",
                    label = "Sign In",
                    job = "drivingteacher",
                },
            },
            distance = 1.5
        })
    end
end)


for k, v in pairs(Config.Garages) do
    for _, garage in pairs(v) do
        zones[#zones + 1] = PolyZone:Create({table.unpack(garage.zones)}, {
            name = garage.name,
            minZ = garage.minZ,
            maxZ = garage.maxZ,
            debugPoly = Config.debugPoly,
        })
    end
end
garageCombo = ComboZone:Create(zones, { name = "GarageCombo2", debugPoly = Config.DebugPoly })

RegisterNetEvent('mh-drivingteacherjob:client:vehicleMenu', function()
    local playerlist = {}
    local menu = exports["qb-input"]:ShowInput({
        header = Lang:t('menu.main_give_header'),
        submitText = Lang:t('menu.give_help'),
        inputs = {
            {
                text = "Selecteer Voertuig",
                name = "licence",
                type = "select",
                options = {
                    { value = "AM", text = "Brommer Rijbewijs"},
                    { value = "A", text = "Motor Rijbewijs" },
                    { value = "B", text = "Auto Rijbewijs" },
                    { value = "BE", text = "Auto + Aanhanger Rijbewijs" },
                    { value = "C", text = "Vrachtwagen Rijbewijs" },
                    { value = "CE", text = "Vrachtwagen + Aanhanger Rijbewijs" },
                    { value = "D", text = "Bus Rijbewijs" },
                    { value = "DE", text = "Bus + Aanhanger Rijbewijs" },
                    { value = "T", text = "Vaarbewijs Boten" },
                    { value = "H", text = "Vliegbrevet Helikopter" },
                    { value = "P", text = "Vliegbrevet Vliegtuig" },
                    { value = "R", text = "Race licantie" },
                    { value = "AMB", text = "Ambulance licantie" },
                    { value = "POL", text = "Politie licantie" },
                },
                isRequired = true
            }
        }
    })
    if menu then
        if not menu.id and not menu.licence then
            return
        else
            if menu.licence == "AM" then SpawnTestVehicle('AM') end
            if menu.licence == "A" then SpawnTestVehicle('A') end
            if menu.licence == "B" then SpawnTestVehicle('B') end
            if menu.licence == "BE" then SpawnBoatTrailer('BE') end
            if menu.licence == "C" then SpawnTestVehicle('C') end
            if menu.licence == "CE" then SpawnTruckAndTrailer('CE') end
            if menu.licence == "D" then SpawnTestVehicle('D') end
            if menu.licence == "DE" then SpawnTestVehicle('D') end
            if menu.licence == "T" then SpawnBoat('T') end
            if menu.licence == "H" then SpawnHelikoper('H') end
            if menu.licence == "P" then SpawnAirplane('P') end
            if menu.licence == "R" then SpawnTestVehicle('R') end
            if menu.licence == "AMB" then SpawnTestVehicle('AMB') end
            if menu.licence == "POL" then SpawnTestVehicle('POL') end
        end
    end
end)

CreateThread(function()
    while true do
        if LocalPlayer.state.isLoggedIn then
            if IsControlJustReleased(0, 38) and isInside then
                local ped = PlayerPedId()
                local pos = GetEntityCoords(PlayerPedId())
                if PlayerData.job.name == 'drivingteacher' and PlayerData.job.onduty then
                    if IsPedInAnyVehicle(ped, false) then
                        local veh = GetVehiclePedIsIn(ped)
                        local plate = QBCore.Functions.GetPlate(veh)
                        if plate == currentPlate then
                            TaskLeaveVehicle(ped, veh)
                            Wait(1500)
                            if Config.UseMHVehicleKeyItem then exports['mh-vehiclekeyitem']:DeleteKey(QBCore.Functions.GetPlate(veh)) end
                            QBCore.Functions.DeleteVehicle(veh)
                        else
                            QBCore.Functions.Notify(Lang:t('notify.wrong_vehicle_to_park'))
                        end
                    else
                        TriggerEvent('mh-drivingteacherjob:client:vehicleMenu', pos)
                    end
                end
            end
        end
        Wait(10)
    end
end)

CreateThread(function()
    Wait(1000)
    while true do
        if LocalPlayer.state.isLoggedIn then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local isPointInside = garageCombo:isPointInside(pos)
            if isPointInside then
                if IsPedInAnyVehicle(ped, false) then
                    exports['qb-core']:DrawText(Lang:t('menu.park_vehicle'))
                else
                    exports['qb-core']:DrawText(Lang:t('menu.open_garage'))
                end
                isInside = true
            else
                if isInside then
                    exports['qb-core']:HideText()
                end
                isInside = false
            end
        end
        Wait(1000)
    end
end)

