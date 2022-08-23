# A RP Driving Teacher Job for QBCore.

## Included Free Mlo Interior and Free Daf Truck

## How it works:
- There are 11 licences you can give to players with this job.
- To bill a player for a licence use `/bill [id] [amount]`
- you can also add some objects on the road as drive test obstacles, so the student can show his/her driving skills ;)  
- when spawning a vehicle, you must go insite this vehicle drivers seat and use `/givekeys [id]`
- with this you give the vehicle keys to the student so he/she can use the vehicle.
- When you give the keys, you get into the co-driver's seat and take the exam.
- When a student passes the exam, use `/give-licence [id] [N/A/AM/B/BE/C/CE/D/DE/P/T/H]` Ex: `/give-licence 1 BE`
- The fist licence you must always give the licence N this is the theory. 
- The `N licence` this is only when a player does not have the N licence so you know you this player is a starter)
- To take a the licence from a player use /take-licence [id] (this player is no longer licensed) Ex: `/take-licence 1`



## NOTE !!:
- Edit `qb-smallresources/config.lua` and remove or set true to false for vehicles you don't want to be blacklisted
- if you don't do this, the vehicle will spawn, but will also removeed after spawning, or it does not spawn at all.
- So don't forget this part if you use the airplane or helikopter license. 
- To use one of this vehicles in that list, than just set it to false restart the server, and your done.


## Dependencies:
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-radialmenu](https://github.com/qbcore-framework/qb-radialmenu) 
- [qb-smallresources](https://github.com/qbcore-framework/qb-smallresources)
- [Driving School Interior](https://forum.cfx.re/t/mlo-driving-school-interior/1466079)
- [Daf Truck](https://nl.gta5-mods.com/vehicles/truck-camion-daf-xf-euro-6)

## Installation:
- Put `qb-drivingteacherjob` in to `resources/[qb]` directory.
- After you done with the instructions below, you can restart the server.


## Read The README.md!!! 
![foto1](https://naskho.org/images/ReadPlease.gif)


#### Add to `management_funds database table`
```sql
INSERT INTO `management_funds` (`job_name`, `amount`, `type`) VALUES ('drivingteacher', '0', 'boss');
```

#### Edit `qb-core\server\player.lua` around line 120 to this code:
```lua
PlayerData.metadata['licences'] = PlayerData.metadata['licences'] or {
    ['N'] = false, -- theory
    ['AM'] = false, -- scooter
    ['A'] = false, -- motorcycle
    ['B'] = false, -- car
    ['BE'] = false, -- car
    ['C'] = false, -- truck
    ['CE'] = false, -- truck + trailer
    ['D'] = false, -- bus
    ['DE'] = false, -- bus + trailer
    ['P'] = false, -- plane or heli pilot
    ['T'] = false, -- boat
    ['H'] = false, -- Helikopter
    ['business'] = false,
    ['weapon'] = false
}
```

#### Edit `qb-core\shared\main.lua`:
- why? cause if people join the server and create a new character,
- they get a driver_license, and we don't want that.
```lua
QBShared.StarterItems = {
    ['phone'] = { amount = 1, item = 'phone' },
    ['id_card'] = { amount = 1, item = 'id_card' },
    --['driver_license'] = { amount = 1, item = 'driver_license' },
}
```

#### Add to `resources/[qb]/qb-management/client/cl_config.lua` to `Config.BossMenus`:
-- This is the bossmenu location
```lua
['drivingteacher'] = {
    vector3(215.24, -1401.76, 30.58) --  (Bossmenu)
},
```
#### Add to `resources/[qb]/qb-management/client/cl_config.lua` to `Config.BossMenuZones`:
- This is the bossmenu zone
```lua
['drivingteacher'] = {
    { coords = vector3(215.24, -1401.76, 30.58), length = 1.15, width = 2.6, heading = 307.07, minZ = 43.59, maxZ = 44.99 },
},
```

#### Add To `qb-core/qb-shared/jobs.lua`:
```lua
['drivingteacher'] = {
    name  = 'drivingteacher',
	label = 'Driving school',
	defaultDuty = false,
	offDutyPay = false,
	grades = {
        ['0'] = {
            name = 'Teorie instructeur',
            payment = 250
        },
        ['1'] = {
            name = 'Drive instructeur',
            payment = 255
        },
        ['2'] = {
            name = 'Fly instructeur',
            payment = 500
        },
        ['3'] = {
            name = 'Examen instructeur',
            payment = 500
        },
        ['4'] = {
            name = 'Boss',
            isboss = true,
            payment = 1000
        },
    },
},
```

#### Add to `resources/[qb]/qb-radialmenu/config.lua` inside the `Config.JobInteractions`:
```lua
["drivingteacher"] = {
    {
        id = 'instructorobjects',
        title = 'Objects',
        icon = 'road',
        items = {
            {
                id = 'deleteobject1',
                title = 'Remove Object',
                icon = 'trash',
                type = 'client',
                event = 'police:client:deleteObject',
                shouldClose = false
            }, {
                id = 'spawnhek1',
                title = 'Gate',
                icon = 'torii-gate',
                type = 'client',
                event = 'police:client:spawnBarrier',
                shouldClose = false
            }, {
                id = 'spawnpion1',
                title = 'Cone',
                icon = 'triangle-exclamation',
                type = 'client',
                event = 'police:client:spawnCone',
                shouldClose = false
            }, {
                id = 'spawntent1',
                title = 'Tent',
                icon = 'campground',
                type = 'client',
                event = 'police:client:spawnTent',
                shouldClose = false
            }, {
                id = 'spawnverlichting1',
                title = 'lighting',
                icon = 'lightbulb',
                type = 'client',
                event = 'police:client:spawnLight',
                shouldClose = false
            },
        }
    },
    {
        id = 'instructorvehicles',
        title = 'RijSchool Voertuigen',
        icon = 'road',
        items = {
            {
                id = 'vehicle0',
                title = 'Boot T',
                icon = 'car',
                type = 'client',
                event = 'qb-drivingteacherjob:client:spawnBoat',
                shouldClose = false
            }, 
            {
                id = 'vehicle1',
                title = 'Scooter AM',
                icon = 'car',
                type = 'client',
                event = 'qb-drivingteacherjob:client:spawnScooter',
                shouldClose = false
            },
            {
                id = 'vehicle2',
                title = 'Motor A',
                icon = 'car',
                type = 'client',
                event = 'qb-drivingteacherjob:client:spawnMotor',
                shouldClose = false
            },
            {
                id = 'vehicle3',
                title = 'Car B',
                icon = 'car',
                type = 'client',
                event = 'qb-drivingteacherjob:client:spawnCar',
                shouldClose = false
            },
            {
                id = 'vehicle4',
                title = 'Truck C',
                icon = 'car',
                type = 'client',
                event = 'qb-drivingteacherjob:client:spawnTruck',
                shouldClose = false
            },
            {
                id = 'vehicle5',
                title = 'Bus D',
                icon = 'car',
                type = 'client',
                event = 'qb-drivingteacherjob:client:spawnBus',
                shouldClose = false
            },
            {
                id = 'vehicle6',
                title = 'Boot en Trailer BE',
                icon = 'car',
                type = 'client',
                event = 'qb-drivingteacherjob:client:spawnBoatTrailer',
                shouldClose = false
            }, {
                id = 'vehicle7',
                title = 'Trailer CE',
                icon = 'car',
                type = 'client',
                event = 'qb-drivingteacherjob:client:spawnTruckTrailer',
                shouldClose = false
            }, 
            {
                id = 'vehicle8',
                title = 'Airplane P',
                icon = 'car',
                type = 'client',
                event = 'qb-drivingteacherjob:client:spawnAirplane',
                shouldClose = false
            }, 
            {
                id = 'vehicle9',
                title = 'Helikoper H',
                icon = 'car',
                type = 'client',
                event = 'qb-drivingteacherjob:client:spawnHelikoper',
                shouldClose = false
            }, 
        }
    },
},
```

#### Edit qb-phone Option 1 `resources/[qb]/qb-phone/server.lua` around line 1055
- Change the Command bill with this code below
```lua
QBCore.Commands.Add('bill', 'Bill A Player', {{name = 'id', help = 'Player ID'}, {name = 'amount', help = 'Fine Amount'}}, false, function(source, args)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(args[1]))
    local amount = tonumber(args[2])
    if biller.PlayerData.job.name == "police" or biller.PlayerData.job.name == 'ambulance' or biller.PlayerData.job.name == 'mechanic' or biller.PlayerData.job.name == 'drivingteacher' then
        if billed ~= nil then
            if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                if amount and amount > 0 then
                    MySQL.insert(
                        'INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (?, ?, ?, ?, ?)',
                        {billed.PlayerData.citizenid, amount, biller.PlayerData.job.name,
                         biller.PlayerData.charinfo.firstname, biller.PlayerData.citizenid})
                    TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
                    TriggerClientEvent('QBCore:Notify', source, 'Invoice Successfully Sent', 'success')
                    TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'New Invoice Received')
                else
                    TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 0', 'error')
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
        end
    else
        TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
    end
end)
```

#### Edit qb-phone Option 2 `resources/[qb]/qb-phone/server.lua` around line 1055
- You can add `or biller.PlayerData.job.name == 'drivingteacher'` 
- to the job check if statement and add this to the end before `then`
-
- example: `if biller.PlayerData.job.name == "police" or biller.PlayerData.job.name == 'ambulance' or biller.PlayerData.job.name == 'mechanic' or biller.PlayerData.job.name == 'drivingteacher' then`

## 🐞 Any bugs let my know.
- Have fun with this awesome qb-drivingteacherjob mod 😎👍


## 🙈 Youtube & Discord
- [Youtube](https://www.youtube.com/c/MaDHouSe79)
- [Discord](https://discord.gg/cEMSeE9dgS)
