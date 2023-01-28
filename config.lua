--[[ ===================================================== ]]--
--[[        QBCore Driving Teacher Job by MaDHouSe         ]]--
--[[ ===================================================== ]]--

Config = {}

Config.GiveKeyScriptTrigger = "qb-vehiclekeys:server:AcquireVehicleKeys"
Config.RemoveKeyScriptTrigger = "qb-vehiclekeys:client:RemoveKeys"

Config.Command = {
    ['add']    = "give-licence",
    ['remove'] = "take-licence",
}

Config.Garages = {
    -- job garage
    ['school1'] = {
        [0] =  {
            name = "Drive School Garage",                              -- blip name
            job = "drivingteacher",                                    -- job
            showBlip = true,                                           -- show blip
            blip  = 50,                                                -- blip icon
            coords = {x = 250.5708, y = -1405.9473, z = 30.5875, h = 314.9212}, -- map blip
            zones = {
                vector2(255.04981994628, -1394.9913330078),
                vector2(261.9594116211, -1400.4221191406),
                vector2(249.77505493164, -1414.904663086),
                vector2(242.17727661132, -1408.4309082032),
            },
            minZ = 27.587503433228,
            maxZ = 33.587503433228,
        }, -- you can add jog garage more here
    },-- you can add more job garages here
}

Config.Locations = {

    ['duty'] = {
	[0] = vector4(200.66, -1388.16, 30.58, 230.81),
    },

    ["stations"] = {
        [1] = {
	    label = "Drive School Het Klungeltje", 
            coords = vector4(218.03, -1391.48, 30.59, 141.9),
            heading = 139.21,
            blipSprite = 498,
            blipColour = 2,
            blipScale = 0.8,
            showBlip = true,
        },
        [2] = {
            label = "Drive School Theorie Examen",
            coords = vector4(208.83, -1382.73, 30.58, 132.58),
            heading = 202.24,
            blipSprite = 525,
            blipColour = 31,
            blipScale = 0.8,
            showBlip = true,
        },
	[3] = {
	    label = "Drive School Garage", 
            coords = vector4(250.5708, -1405.9473, 30.5875, 314.9212),
            heading = 44.4795,
            blipSprite = 50,
            blipColour = 2,
            blipScale = 0.8,
            showBlip = true,
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
    AM = 'faggio',  -- shooter
    A  = 'sanchez', -- motor
    B  = 'sadler',  -- car
    BE = 'sadler',  -- car plus
    C  = 'daf',     -- truck
    CE = 'daf',     -- truck plus
    D  = 'bus',     -- bus 
    DE = 'bus',     -- bus plus
    P  = 'luxor2',  -- plane (cont forget to Edit qb-smallresources/config.lua)
    T  = 'speeder', -- boat (cont forget to Edit qb-smallresources/config.lua)
    H  = 'frogger', -- Helikopter (cont forget to Edit qb-smallresources/config.lua)
}
