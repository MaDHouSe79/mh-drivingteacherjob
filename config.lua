--[[ ===================================================== ]]--
--[[        QBCore Driving Teacher Job by MaDHouSe         ]]--
--[[ ===================================================== ]]--

Config = {}

Config.UseMHVehicleKeyItem = false
Config.GiveKeyScriptTrigger = "qb-vehiclekeys:server:AcquireVehicleKeys"
Config.RemoveKeyScriptTrigger = "qb-vehiclekeys:client:RemoveKeys"

Config.FuelScript = "LegacyFuel"

Config.Command = {
    ['add']    = "give-licence",
    ['remove'] = "take-licence",
}

Config.Garages = {
    -- school garage
    ['school1'] = {
        [0] = {
            name = "Drive School Garage",                              -- blip name
            job = "drivingteacher",                                    -- job
            showBlip = true,                                           -- show blip
            blip  = 50,                                                -- blip icon
            coords = {x = 435.52386, y = -975.8889, z = 25.699798, h = 88.224151}, -- map blip
            zones = {
                vector2(228.42134094238, -1382.8787841797),
                vector2(225.22723388672, -1384.1031494141),
                vector2(221.87046813965, -1375.654296875),
                vector2(225.01322937012, -1374.4896240234),
            },
            minZ = 27.441860198975,
            maxZ = 33.441860198975,
	        debugPoly = false,
        },
        [1] = {
            name = "Air School Garage",                           -- blip name
            job = "drivingteacher",                                    -- job
            showBlip = true,                                           -- show blip
            blip  = 50,                                                -- blip icon
            coords = {x = -1242.5720, y = -2289.8779, z = 13.9445, h = 52.4307}, -- map blip
            zones = {
                vector2(-1221.4853515625, -2312.9094238282),
                vector2(-1273.4505615234, -2282.900390625),
                vector2(-1255.9765625, -2252.6423339844),
                vector2(-1203.982788086, -2282.5849609375),
            },
            minZ = 10.944558143616,
            maxZ = 16.944558143616,
	        debugPoly = false,
        },
        [2] = {
            name = "Boat School Garage",                           -- blip name
            job = "drivingteacher",                                    -- job
            showBlip = true,                                           -- show blip
            blip  = 50,                                                -- blip icon
            coords = {x = -726.3984, y = -1326.9353, z = 2.7375, h = 227.2540}, -- map blip
            zones = {
                vector2(-724.2865600586, -1336.021484375),
                vector2(-734.64678955078, -1327.3391113282),
                vector2(-733.41943359375, -1325.7987060546),
                vector2(-733.5630493164, -1323.7463378906),
                vector2(-730.953125, -1320.634399414),
                vector2(-728.89221191406, -1320.3969726562),
                vector2(-727.63116455078, -1318.9349365234),
                vector2(-717.32220458984, -1327.7377929688),
            },
            minZ = -1.3987105488778,
            maxZ = 4.6012894511222,
	        debugPoly = false,
        }, -- you can add jog garage more here

    },-- you can add more job garages here
}

Config.Locations = {

    ['duty'] = {
	    [0] = vector4(200.7381, -1388.1324, 30.5835, 48.9072),
    },

    ["stations"] = {
        [1] = {
	        label = "DriveSchool Het Klungeltje", 
            coords = vector4(218.03, -1391.48, 30.59, 141.9),
            heading = 139.21,
            blipSprite = 498,
            blipColour = 2,
            blipScale = 0.8,
            showBlip = true,
	        type = nil,
        },
        [2] = {
            label = "DriveSchool Theorie Examen",
            coords = vector4(208.83, -1382.73, 30.58, 132.58),
            heading = 202.24,
            blipSprite = 525,
            blipColour = 31,
            blipScale = 0.8,
            showBlip = true,
            type = nil,
        },
        [3] = {
	        label = "Rijschool Garage", 
            coords = vector4(226.3569, -1382.7115, 30.4731, 200.5626),
            spawn = vector4(226.3569, -1382.7115, 30.4731, 200.5626),
            heading = 200.5626,
            blipSprite = 50,
            blipColour = 2,
            blipScale = 0.5,
            showBlip = true,
            type = 'car',
        },
        [4] = {
	        label = "Vliegschool Garage", 
            coords = vector4(-1242.5720, -2289.8779, 13.9445, 52.4307),
            spawn = vector4(-1243.0061, -2290.5723, 13.9445, 62.2139),
            heading = 62.2139,
            blipSprite = 50,
            blipColour = 2,
            blipScale = 0.5,
            showBlip = true,
            type = 'air',
        },
        [5] = {
	        label = "Boatschool Garage", 
            coords = vector4(-726.3984, -1326.9353, 2.7375, 227.2540),
            spawn = vector4(-728.0537, -1328.1594, 0.0594, 229.6167),
            heading = 229.6167,
            blipSprite = 50,
            blipColour = 2,
            blipScale = 0.5,
            showBlip = true,
            type = 'water',
        },
    },
}

Config.Prices = {
    N  = 500,  -- theory
    AM = 500,  -- scooter (50cc)
    A  = 1500, -- motorcycle (125cc or above)
    B  = 2000, -- car
    BE = 1500, -- car + trailer
    C  = 5000, -- truck
    CE = 2000, -- truck + trailer
    D  = 5000, -- bus
    DE = 2000, -- bus + trailer
    T  = 1500, -- boat
    P  = 6000, -- pilot for airplane
    H  = 6000,  -- pilot for helikopter
    AMB = 6000, -- With this you can drive ambulance vehiclea
    POL = 6000, -- With this you can drive ambulance vehiclea
    R  = 8000, -- with this you can drives super cars
}

-- dont change this, if you dont know what you are doeing.
Config.Trailers = {
    BE = 'boatTrailer',
    CE = 'trailers4',
    DE = '', -- i have no bus trailer, but if you have one, you can add the model spawn name here.
}

-- don't change this, if you dont know what you are doeing.
Config.TrailerLoads = {
    BE = 'dinghy',
    CE = '',
}

-- this are the model name of the vehicles you can use,
-- change the vehicle model name if a vehicle is not working 
-- or if you want you can change the current added vehicles to your own vehicle models.
Config.VehicleModels = {
    AM = 'faggio',  -- scooter
    A  = 'pcj', -- motor
    B  = 'rhapsody',  -- car
    BE = 'sadler',  -- car plus
    C  = 'phantom',     -- truck
    CE = 'phantom',     -- truck plus
    D  = 'bus',     -- bus 
    DE = 'bus',     -- bus plus
    P  = 'luxor2',  -- plane (dont forget to Edit qb-smallresources/config.lua)
    T  = 'speeder', -- boat (dont forget to Edit qb-smallresources/config.lua)
    H  = 'frogger', -- Helikopter (dont forget to Edit qb-smallresources/config.lua)
    R  = 'lp770',   -- for supercars
    AMB = 'ambulance', -- ambulance
    POL = "police",  -- police
}
