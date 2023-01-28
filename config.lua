--[[ ===================================================== ]]--
--[[        QBCore Driving Teacher Job by MaDHouSe         ]]--
--[[ ===================================================== ]]--

Config = {}

Config.debugPoly = false

Config.UseMHVehicleKeyItem = true



Config.GiveKeyScriptTrigger = "qb-vehiclekeys:server:AcquireVehicleKeys"
Config.RemoveKeyScriptTrigger = "qb-vehiclekeys:client:RemoveKeys"

Config.Command = {
    ['add']    = "give-licence",
    ['remove'] = "take-licence",
}


Config.Garages = {
    -- job garage
    ['school1'] = {
        [0] = {
            name = "Drive School Garage",                              -- blip name
            job = "drivingteacher",                                    -- job
            showBlip = true,                                           -- show blip
            blip  = 50,                                                -- blip icon
            coords = {x = 435.52386, y = -975.8889, z = 25.699798, h = 88.224151}, -- map blip
            zones = {
                vector2(-979.14624023438, -2070.6496582032),
                vector2(-989.44140625, -2060.1560058594),
                vector2(-981.58544921875, -2050.8298339844),
                vector2(-971.2191772461, -2061.1416015625),
            },
            minZ = 6.4056758880616,
            maxZ = 12.405675888062,
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
        }, -- you can add jog garage more here

    },-- you can add more job garages here
}

Config.Locations = {

    ['duty'] = {
	    [0] = vector4(-928.5503, -2026.6168, 9.4023, 313.7926),
    },

    ["stations"] = {
        [1] = {
	        label = "Rijschool Rolleman", 
            coords = vector4(-916.7308, -2036.9906, 9.4065, 44.4795),
            heading = 44.4795,
            blipSprite = 498,
            blipColour = 2,
            blipScale = 0.5,
            showBlip = true,
            type = nil,
        },
        [2] = {
            label = "Theorie Lokaal",
            coords = vector4(-923.6384, -2023.5885, 9.4023, 117.5955),
            heading = 117.5955,
            blipSprite = 525,
            blipColour = 31,
            blipScale = 0.5,
            showBlip = true,
            type = nil,
        },
        [3] = {
	        label = "Rijschool Garage", 
            coords = vector4(-981.4899, -2060.1426, 9.4057, 220.2482),
            spawn = vector4(-976.1197, -2065.4656, 9.4057, 220.4663),
            heading = 220.4663,
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
