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

Config.Locations = {

    ['duty'] = {
	    [0] = vector4(200.66, -1388.16, 30.58, 230.81),
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
        },
        [2] = {
            label = "DriveSchool Theorie Examen",
            coords = vector4(208.83, -1382.73, 30.58, 132.58),
            heading = 202.24,
            blipSprite = 525,
            blipColour = 31,
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
