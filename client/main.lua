--[[ ===================================================== ]]--
--[[        QBCore Driving Teacher Job by MaDHouSe         ]]--
--[[ ===================================================== ]]--

local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local zones = {}
local blips = {}
local garageCombo = {}
local garageSpawn = nil
local currentVehicle = nil
local currenVehicleName = nil
local currentPlate = nil
local garageType = nil
local isInside = false
local isLoggedIn = false

for k, v in pairs(Config.Garages) do
    for _, garage in pairs(v) do
        zones[#zones + 1] = PolyZone:Create(garage.zones, {
            name = garage.name,
            minZ = garage.minZ,
            maxZ = garage.maxZ,
            debugPoly = garage.debugPoly,
        })
    end
end
garageCombo = ComboZone:Create(zones, { name = "garagecombo001", debugPoly = false })

local function SetFuel(vehicle, fuel)
    exports[Config.FuelScript]:SetFuel(vehicle, fuel + 0.0)
end

local function GetDistance(from, to)
    return #(vector3(from.x, from.y, from.z) - vector3(to.x, to.y, to.z))
end

local function GetNeerestGarage()
    local playerPed = PlayerPedId()
	local coords = GetEntityCoords(PlayerPedId())
    for key, garage in pairs(Config.Locations["stations"]) do
        local distance = GetDistance(coords, garage.coords)
        if distance < 25 then
            garageType = garage.type
            garageSpawn = garage.spawn
        end
    end
end

local function GenerateNewVehiclePlate()
    local plate = QBCore.Shared.RandomInt(1) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(3) .. QBCore.Shared.RandomStr(2)
    return plate:upper()
end

local function SpawnAirplane(licence)
    local playerPed = PlayerPedId()
	local coords = garageSpawn
    local heading = coords.w
    local tmpSpawnPosition = vector3(coords.x, coords.y, coords.z)
    if not QBCore.Functions.SpawnClear(tmpSpawnPosition, 5.0) then
        QBCore.Functions.Notify(Lang:t('error.area_is_obstructed'), 'error', 5000)
	    return
    else
        QBCore.Functions.SpawnVehicle(Config.VehicleModels[licence], function(_vehicle)
            local plate = GenerateNewVehiclePlate()
            currentVehicle = _vehicle
            currentPlate = plate
            currenVehicleName = Config.VehicleModels[licence]
            SetVehicleNumberPlateText(_vehicle, plate)
            SetEntityHeading(_vehicle, heading)
            SetFuel(_vehicle, 100.0)
            SetVehicleOnGroundProperly(_vehicle)
            TaskWarpPedIntoVehicle(playerPed, _vehicle, -1)
            SetVehicleEngineHealth(_vehicle, 1000.0)
            SetVehicleBodyHealth(_vehicle, 1000.0)
            SetVehicleCustomPrimaryColour(_vehicle, 0, 0, 0)
            SetVehicleDirtLevel(_vehicle, 0)
            SetVehicleUndriveable(_vehicle, false)
            WashDecalsFromVehicle(_vehicle, 1.0)
            SetVehRadioStation(_vehicle, 'OFF')
            TriggerEvent('mh-drivingteacherjob:client:giveKeys', plate)
        end, vector4(coords.x, coords.y, coords.z, heading), true)
    end
end

local function SpawnHelikoper(licence)
    local playerPed = PlayerPedId()
	local coords = garageSpawn
    local heading = coords.w
    local tmpSpawnPosition = vector3(coords.x, coords.y, coords.z)
    if not QBCore.Functions.SpawnClear(tmpSpawnPosition, 5.0) then
        QBCore.Functions.Notify(Lang:t('error.area_is_obstructed'), 'error', 5000)
	    return
    else
        QBCore.Functions.SpawnVehicle(Config.VehicleModels[licence], function(_vehicle)
            local plate = GenerateNewVehiclePlate()
            currentVehicle = _vehicle
            currentPlate = plate
            currenVehicleName = Config.VehicleModels[licence]
            SetVehicleNumberPlateText(_vehicle, plate)
            SetEntityHeading(_vehicle, heading)
            SetFuel(_vehicle, 100.0)
            SetVehicleOnGroundProperly(_vehicle)
            TaskWarpPedIntoVehicle(playerPed, _vehicle, -1)
            SetVehicleEngineHealth(_vehicle, 1000.0)
            SetVehicleBodyHealth(_vehicle, 1000.0)
            SetVehicleCustomPrimaryColour(_vehicle, 0, 0, 0)
            SetVehicleDirtLevel(_vehicle, 0)
            SetVehicleUndriveable(_vehicle, false)
            WashDecalsFromVehicle(_vehicle, 1.0)
            SetVehRadioStation(_vehicle, 'OFF')
            TriggerEvent('mh-drivingteacherjob:client:giveKeys', plate)
        end, vector4(coords.x, coords.y, coords.z, heading), true)
    end
end

local function SpawnBoat(licence)
    local playerPed = PlayerPedId()
	local coords = garageSpawn
    local heading = coords.w
    local tmpSpawnPosition = vector3(coords.x, coords.y, coords.z)
    if not QBCore.Functions.SpawnClear(tmpSpawnPosition, 5.0) then
        QBCore.Functions.Notify(Lang:t('error.area_is_obstructed'), 'error', 5000)
	    return
    else
        QBCore.Functions.SpawnVehicle(Config.VehicleModels[licence], function(_vehicle)
            local plate = GenerateNewVehiclePlate()
            currentVehicle = _vehicle
            currentPlate = plate
            currenVehicleName = Config.VehicleModels[licence]
            SetVehicleNumberPlateText(_vehicle, plate)
            TaskWarpPedIntoVehicle(playerPed, _vehicle, -1)
            SetEntityHeading(_vehicle, heading)
            SetFuel(_vehicle, 100.0)
            SetVehicleEngineHealth(_vehicle, 1000.0)
            SetVehicleBodyHealth(_vehicle, 1000.0)
            SetVehicleCustomPrimaryColour(_vehicle, 0, 0, 0)
            SetVehicleDirtLevel(_vehicle, 0)
            SetVehicleUndriveable(_vehicle, false)
            WashDecalsFromVehicle(_vehicle, 1.0)
            SetVehRadioStation(_vehicle, 'OFF')
            TriggerEvent('mh-drivingteacherjob:client:giveKeys', plate)
        end, vector4(coords.x, coords.y, coords.z, heading), true)
    end
end

local function SpawnTruckAndTrailer(licence)
    local playerPed = PlayerPedId()
    local coords = garageSpawn
    local heading = coords.w
    local tmpSpawnPosition = vector3(coords.x, coords.y, coords.z)
    local vehiclePosition, vehicleHeading
    if not QBCore.Functions.SpawnClear(tmpSpawnPosition, 5.0) then
        QBCore.Functions.Notify(Lang:t('error.area_is_obstructed'), 'error', 5000)
	    return
    else
        QBCore.Functions.SpawnVehicle(Config.VehicleModels[licence], function(_vehicle)
            local plate = GenerateNewVehiclePlate()
            vehiclePosition = GetOffsetFromEntityInWorldCoords(_vehicle, 0.0, -7.5, 0.0) -- GetEntityCoords(_vehicle)
            vehicleHeading = GetEntityHeading(_vehicle)
            currentVehicle = _vehicle
            currentPlate = plate
            currenVehicleName = Config.VehicleModels[licence]
            SetVehicleNumberPlateText(_vehicle, plate)
            SetEntityHeading(_vehicle, heading)
            SetFuel(_vehicle, 100.0)
            SetVehicleOnGroundProperly(_vehicle)
            TaskWarpPedIntoVehicle(playerPed, _vehicle, -1)
            SetVehicleCustomPrimaryColour(loading, 0, 0, 0)
            SetVehicleDirtLevel(_vehicle, 0)
            WashDecalsFromVehicle(_vehicle, 1.0)
            SetVehRadioStation(_vehicle, 'OFF')
            SetVehicleEngineHealth(_vehicle, 1000.0)
            SetVehicleBodyHealth(_vehicle, 1000.0)
            TriggerEvent('mh-drivingteacherjob:client:giveKeys', plate)
        end, vector4(coords.x, coords.y, coords.z, heading), true)
	    Wait(100)
        if Config.Trailers.CE ~= '' then
            QBCore.Functions.SpawnVehicle(Config.Trailers.CE, function(loading)
                SetVehicleNumberPlateText(loading, 'B_LR_' .. string.format('%06d', math.random(1, 99)))
                SetEntityHeading(loading, vehicleHeading)
                SetVehicleCustomPrimaryColour(loading, 0, 0, 0)
                SetVehicleDirtLevel(loading)
                WashDecalsFromVehicle(loading, 1.0)
                AttachEntityToEntity(loading, _vehicle, 20, 0.0, -1.0, 0.25, 0.0, 0.0, 0.0, false, false, true, false, 20, true)
            end, vector3(vehiclePosition.x, vehiclePosition.y, vehiclePosition.z), true)
        end
    end
end

local function SpawnBusAndTrailer(licence)
    local playerPed = PlayerPedId()
    local coords = garageSpawn
    local heading = coords.w
    local tmpSpawnPosition = vector3(coords.x, coords.y, coords.z)
    local vehiclePosition, vehicleHeading
    if not QBCore.Functions.SpawnClear(tmpSpawnPosition, 5.0) then
        QBCore.Functions.Notify(Lang:t('error.area_is_obstructed'), 'error', 5000)
	    return
    else
        QBCore.Functions.SpawnVehicle(Config.VehicleModels[licence], function(_vehicle)
            vehiclePosition = GetEntityCoords(_vehicle)
            vehicleHeading = GetEntityHeading(_vehicle)
            SetVehicleNumberPlateText(_vehicle, 'TR_LR_' .. string.format('%06d', math.random(1, 99)))
            SetEntityHeading(_vehicle, heading)
            local plate = QBCore.Functions.GetPlate(_vehicle)
            currentVehicle = _vehicle
            currentPlate = plate
            currenVehicleName = Config.VehicleModels[licence]
            SetFuel(_vehicle, 100.0)
            SetVehicleOnGroundProperly(_vehicle)
            TaskWarpPedIntoVehicle(playerPed, _vehicle, -1)
            SetVehicleCustomPrimaryColour(loading, 0, 0, 0)
            SetVehicleDirtLevel(_vehicle, 0)
            WashDecalsFromVehicle(_vehicle, 1.0)
            SetVehRadioStation(_vehicle, 'OFF')
            SetVehicleEngineHealth(_vehicle, 1000.0)
            SetVehicleBodyHealth(_vehicle, 1000.0)
            TriggerEvent('mh-drivingteacherjob:client:giveKeys', plate)
        end, vector4(coords.x, coords.y, coords.z, heading), true)
        Wait(100)
        if Config.Trailers.DE ~= '' then
            QBCore.Functions.SpawnVehicle(Config.Trailers.DE, function(loading)
                SetVehicleNumberPlateText(loading, 'B_LR_' .. string.format('%06d', math.random(1, 99)))
                SetEntityHeading(loading, vehicleHeading)
                SetVehicleCustomPrimaryColour(loading, 0, 0, 0)
                SetVehicleDirtLevel(loading)
                WashDecalsFromVehicle(loading, 1.0)
                AttachEntityToEntity(loading, _vehicle, 20, 0.0, -1.0, 0.25, 0.0, 0.0, 0.0, false, false, true, false, 20, true)
            end, vector3(vehiclePosition.x, vehiclePosition.y - 5.0, vehiclePosition.z + 0.5), true)
        end
    end
end

local function SpawnBoatTrailer(licence)
    local playerPed = PlayerPedId()
	local coords = garageSpawn
    local heading = coords.w
    local tmpSpawnPosition = vector3(coords.x, coords.y, coords.z)
    local vehiclebone = nil
    local trailer, trailerbone = nil, nil
    local vehiclePosition, vehicleHeading = nil, nil
    local trailerPosition, trailerHeading = nil, nil
    if not QBCore.Functions.SpawnClear(tmpSpawnPosition, 5.0) then
        QBCore.Functions.Notify(Lang:t('error.area_is_obstructed'), 'error', 5000)
	    return
    else
        QBCore.Functions.SpawnVehicle(Config.VehicleModels[licence], function(_vehicle)
            local plate = GenerateNewVehiclePlate()
            currentPlate = plate
            currentVehicle = _vehicle
            SetVehicleNumberPlateText(_vehicle, plate)
            SetEntityHeading(_vehicle, coords.w)
            vehiclePosition = GetOffsetFromEntityInWorldCoords(_vehicle, 0.0, -6.5, 0.0) -- GetEntityCoords(_vehicle)
            vehicleHeading = GetEntityHeading(coords.w)
            currenVehicleName = Config.VehicleModels[licence]
            vehiclebone = GetEntityBoneIndexByName(_vehicle, 'attach_male')
            TaskWarpPedIntoVehicle(playerPed, _vehicle, -1)
            SetFuel(_vehicle, 100.0)
            SetVehicleOnGroundProperly(_vehicle)
            SetVehicleEngineHealth(_vehicle, 1000.0)
            SetVehicleBodyHealth(_vehicle, 1000.0)
            SetVehicleCustomPrimaryColour(_vehicle, 0, 0, 0)
            SetVehicleDirtLevel(_vehicle, 0)
            SetVehicleUndriveable(_vehicle, false)
            WashDecalsFromVehicle(_vehicle, 1.0)
            SetVehRadioStation(_vehicle, 'OFF')
            TriggerEvent('mh-drivingteacherjob:client:giveKeys', plate)
        end, vector4(coords.x, coords.y, coords.z, coords.w), true)
        Wait(100)
        QBCore.Functions.SpawnVehicle(Config.Trailers.BE, function(_trailer)
            trailer = _trailer
            trailerPosition = GetEntityCoords(_trailer)
            trailerHeading = GetEntityHeading(_trailer)
            trailerbone = GetEntityBoneIndexByName(_trailer, 'attach_female')
            local plate = 'TR_LR_' .. string.format('%06d', math.random(1, 99))
            SetVehicleNumberPlateText(_trailer, plate)
            SetEntityHeading(_trailer, coords.w)
            SetVehicleCustomPrimaryColour(_trailer, 0, 0, 0)
            SetVehicleDirtLevel(_trailer)
            WashDecalsFromVehicle(_trailer, 1.0)
            AttachEntityToEntity(trailerbone, vehiclebone, 1, 0.0, -1.0, 0.25, 0.0, 0.0, 0.0, false, false, true, false, 20, true)
        end, vector3(vehiclePosition.x, vehiclePosition.y, vehiclePosition.z), true)
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
            end, vector3(trailerPosition.x, trailerPosition.y, trailerPosition.z), true)
        end
    end
end

local function SpawnTestVehicle(licence)
    local playerPed = PlayerPedId()
	local coords = garageSpawn
    local heading = coords.w
    local tmpSpawnPosition = vector3(coords.x, coords.y, coords.z)
    if not QBCore.Functions.SpawnClear(tmpSpawnPosition, 5.0) then
        QBCore.Functions.Notify(Lang:t('error.area_is_obstructed'), 'error', 5000)
	    return
    else
        QBCore.Functions.SpawnVehicle(Config.VehicleModels[licence], function(_vehicle)
            local plate = GenerateNewVehiclePlate()
            currentVehicle = _vehicle
            currentPlate = plate
            currenVehicleName = Config.VehicleModels[licence]
            SetVehicleNumberPlateText(_vehicle, plate)
            SetEntityHeading(_vehicle, heading)
            SetFuel(_vehicle, 100.0)
            SetVehicleOnGroundProperly(_vehicle)
            SetVehicleEngineHealth(_vehicle, 1000.0)
            SetVehicleBodyHealth(_vehicle, 1000.0)
            SetVehicleCustomPrimaryColour(_vehicle, 0, 0, 0)
            SetVehicleDirtLevel(_vehicle, 0)
            SetVehicleUndriveable(_vehicle, false)
            WashDecalsFromVehicle(_vehicle, 1.0)
            SetVehRadioStation(_vehicle, 'OFF')
            TaskWarpPedIntoVehicle(playerPed, _vehicle, -1)
            TriggerEvent('mh-drivingteacherjob:client:giveKeys', plate)
        end, vector4(coords.x, coords.y, coords.z, heading), true)
    end
end

local function DeleteGarages()
    if zones ~= nil then
        for k, zone in pairs(zones) do
            if zone then zone:destroy() end
        end
    end
end

local function LoadOnDuty()
    -- Toggle Duty
    PlayerData = QBCore.Functions.GetPlayerData()
    for k, v in pairs(Config.Locations["duty"]) do
        if PlayerData.job.name == 'drivingteacher' then
            exports['qb-target']:RemoveZone("drivingteacher_"..k)
            exports['qb-target']:AddBoxZone("drivingteacher_"..k, v, 1, 1, {
                name = "drivingteacher_"..k,
                heading = 11,
                debugPoly = false,
                minZ = v.z - 1,
                maxZ = v.z + 1,
            }, {
                options = {
                    {
                        type = "client",
                        event = "mh-drivingteacherjob:client:ToggleDuty",
                        icon = "fas fa-sign-in-alt",
                        label = Lang:t('info.onoff_duty'),
                        job = "drivingteacher",
                    },
                },
                distance = 1.5
            })
        end
    end
end

local function DeleteAllBlips()
    if blips ~= nil then
        for _, v in pairs(blips) do
            if DoesBlipExist(v) then
                RemoveBlip(v)
            end
        end
        blips = {}
    end
end

local function LoadBlips()
    for _, station in pairs(Config.Locations["stations"]) do
        if station.showBlip then
            if station.type ~= nil then
                if PlayerData.job.name == 'drivingteacher' and PlayerData.job.onduty then
                    local blip = AddBlipForCoord(station.coords.x, station.coords.y, station.coords.z)
                    SetBlipSprite(blip, station.blipSprite)
                    SetBlipAsShortRange(blip, true)
                    SetBlipScale(blip, station.blipScale)
                    SetBlipColour(blip, station.blipColour)
                    BeginTextCommandSetBlipName("STRING")
                    AddTextComponentString(station.label)
                    EndTextCommandSetBlipName(blip)
                    blips[#blips + 1] = blip
                end
            else
                local blip = AddBlipForCoord(station.coords.x, station.coords.y, station.coords.z)
                SetBlipSprite(blip, station.blipSprite)
                SetBlipAsShortRange(blip, true)
                SetBlipScale(blip, station.blipScale)
                SetBlipColour(blip, station.blipColour)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(station.label)
                EndTextCommandSetBlipName(blip)
                blips[#blips + 1] = blip
            end
        end
    end
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    isLoggedIn = true
    Wait(1000)
    LoadOnDuty()
    LoadBlips()
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(data)
    PlayerData = data
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(job)
    PlayerData.job = job
    DeleteAllBlips()
    exports['qb-core']:HideText()
    Wait(100)
    LoadOnDuty()
    LoadBlips()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerData = QBCore.Functions.GetPlayerData()
        isLoggedIn = true
	LoadOnDuty()
        LoadBlips()
        exports['qb-core']:HideText()
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        PlayerData = {}
        isLoggedIn = false
        DeleteAllBlips()
        DeleteGarages()
        exports['qb-core']:HideText()
    end
end)

RegisterNetEvent('mh-drivingteacherjob:client:giveKeys', function(plate, vehicle)
    TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', plate)
end)

RegisterNetEvent('mh-drivingteacherjob:client:removeKeys', function(plate)
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
            submitText = "",
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
            submitText = "",
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

RegisterNetEvent('mh-drivingteacherjob:client:vehicleMenu', function()
    GetNeerestGarage()
    if garageType == 'car' then
        local menu = exports["qb-input"]:ShowInput({
            header = Lang:t('menu.main_header'),
            submitText = "",
            inputs = {
                {
                    text = Lang:t('menu.select_vehicle'),
                    name = "licence",
                    type = "select",
                    options = {
                        { value = "AM", text = Lang:t('licence.licence_am')},
                        { value = "A", text = Lang:t('licence.licence_a') },
                        { value = "B", text = Lang:t('licence.licence_b') },
                        { value = "BE", text = Lang:t('licence.licence_be') },
                        { value = "C", text = Lang:t('licence.licence_c') },
                        { value = "CE", text = Lang:t('licence.licence_ce') },
                        { value = "D", text = Lang:t('licence.licence_d') },
                        { value = "DE", text = Lang:t('licence.licence_de') },
                        { value = "R", text = Lang:t('licence.licence_r') },
                        { value = "AMB", text = Lang:t('licence.licence_amb') },
                        { value = "POL", text = Lang:t('licence.licence_pol') },
                    },
                    isRequired = true
                }
            }
        })
        if menu ~= nil and menu.licence ~= nil then
            if menu.licence == "AM" then SpawnTestVehicle('AM') end
            if menu.licence == "A" then SpawnTestVehicle('A') end
            if menu.licence == "B" then SpawnTestVehicle('B') end
            if menu.licence == "BE" then SpawnBoatTrailer('BE') end
            if menu.licence == "C" then SpawnTestVehicle('C') end
            if menu.licence == "CE" then SpawnTruckAndTrailer('CE') end
            if menu.licence == "D" then SpawnTestVehicle('D') end
            if menu.licence == "DE" then SpawnTestVehicle('D') end
            if menu.licence == "R" then SpawnTestVehicle('R') end
            if menu.licence == "AMB" then SpawnTestVehicle('AMB') end
            if menu.licence == "POL" then SpawnTestVehicle('POL') end
        end

    elseif garageType == 'air' then
        local menu = exports["qb-input"]:ShowInput({
            header = Lang:t('menu.main_header'),
            submitText = "",
            inputs = {
                {
                    text = Lang:t('menu.select_vehicle'),
                    name = "licence",
                    type = "select",
                    options = {
                        { value = "H", text = Lang:t('licence.licence_h') },
                        { value = "P", text = Lang:t('licence.licence_p') },
                    },
                    isRequired = true
                }
            }
        })
        if menu ~= nil and menu.licence ~= nil then
            if menu.licence == "H" then SpawnHelikoper('H') end
            if menu.licence == "P" then SpawnAirplane('P') end
        end

    elseif garageType == 'water' then
        local menu = exports["qb-input"]:ShowInput({
            header = Lang:t('menu.main_header'),
            submitText = "",
            inputs = {
                {
                    text = Lang:t('menu.select_vehicle'),
                    name = "licence",
                    type = "select",
                    options = {
                        { value = "T", text = Lang:t('licence.licence_t') },
                    },
                    isRequired = true
                }
            }
        })
        if menu ~= nil and menu.licence ~= nil then
            if menu.licence == "T" then SpawnBoat('T') end
        end
    end
end)

RegisterNetEvent('mh-drivingteacherjob:client:ToggleDuty', function()
    TriggerServerEvent("QBCore:ToggleDuty")
    DeleteAllBlips()
    exports['qb-core']:HideText()
    Wait(100)
    LoadBlips()
end)

CreateThread(function()
    while true do
        if isLoggedIn then
            if IsControlJustReleased(0, 38) and isInside then
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)
                if PlayerData.job.name == 'drivingteacher' and PlayerData.job.onduty then
                    if IsPedInAnyVehicle(ped, false) then
                        local veh = GetVehiclePedIsIn(ped)
                        local plate = QBCore.Functions.GetPlate(veh)
                        if plate:upper() == currentPlate:upper() then
                            TaskLeaveVehicle(ped, veh)
                            Wait(1500)
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
    while true do
        if isLoggedIn then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local isPointInside = garageCombo:isPointInside(pos)
            if PlayerData.job.name == 'drivingteacher' and PlayerData.job.onduty then
                if isPointInside then
                    if IsPedInAnyVehicle(ped, false) then
                        exports['qb-core']:DrawText(Lang:t('menu.park_vehicle'))
                    else
                        exports['qb-core']:DrawText(Lang:t('menu.open_garage'))
                    end
                    isInside = true
                else
                    if isInside then exports['qb-core']:HideText() end
                    isInside = false
                end
            end
        end
        Wait(1000)
    end
end)
