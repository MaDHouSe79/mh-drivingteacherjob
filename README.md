<p align="center">
    <img width="140" src="https://icons.iconarchive.com/icons/iconarchive/red-orb-alphabet/128/Letter-M-icon.png" />  
    <h1 align="center">Hi 👋, I'm MaDHouSe</h1>
    <h3 align="center">A passionate allround developer </h3>    
</p>

<p align="center">
  <a href="https://github.com/MH-Scripts/mh-drivingteacherjob/issues">
    <img src="https://img.shields.io/github/issues/MH-Scripts/mh-drivingteacherjob"/> 
  </a>
  <a href="https://github.com/MH-Scripts/mh-drivingteacherjob/watchers">
    <img src="https://img.shields.io/github/watchers/MH-Scripts/mh-drivingteacherjob"/> 
  </a> 
  <a href="https://github.com/MH-Scripts/mh-drivingteacherjob/network/members">
    <img src="https://img.shields.io/github/forks/MH-Scripts/mh-drivingteacherjob"/> 
  </a>  
  <a href="https://github.com/MH-Scripts/mh-drivingteacherjob/stargazers">
    <img src="https://img.shields.io/github/stars/MH-Scripts/mh-drivingteacherjob?color=white"/> 
  </a>
  <a href="https://github.com/MH-Scripts/mh-drivingteacherjob/blob/main/LICENSE">
    <img src="https://img.shields.io/github/license/MH-Scripts/mh-drivingteacherjob?color=black"/> 
  </a>      
</p>

# My Youtube
- [Subscribe](https://www.youtube.com/@MaDHouSe79) 

# MH Driving Teacher Job for QBCore.
- There are 15 licences you can give to players with this job.

## Read UPDATE.MD 
- if there is a update read the update.md, maby you need to change something.

## How it works:
- To bill a player for a licence use `/bill [id] [amount]`
- you can also add some objects on the road as drive test obstacles, so the student can show his/her driving skills ;)  
- when spawning a vehicle, you must go insite this vehicle drivers seat and use `/givekeys [id]`
- with this you give the vehicle keys to the student so he/she can use the vehicle.
- When you give the keys, you get into the co-driver's seat and take the exam.
- When a student passes the exam, use `/give-licence [id] [N/A/AM/B/BE/C/CE/D/DE/P/T/H]` Ex: `/give-licence 1 BE`
- The fist licence you must always give the licence N this is the theory. 
- The `N licence` this is only when a player does not have the N licence so you know you this player is a starter)
- To take a the licence from a player use /take-licence [id] (this player is no longer licensed) Ex: `/take-licence 1` 
- The police can use this commands `/give-licence 1 N` and  `/take-licence 1` 

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
- [PolyZone](https://github.com/mkafrin/PolyZone)

## Installation:
- Create a folder `[mh]` in `resources`. 
- Put `mh-drivingteacherjob` in to `resources/[mh]`.
- Load this script after target and polyzone.
- in sever.sfg after `[standalone]` add -> `ensure [mh]`
- After you done with the instructions below, you can restart the server.


## Read The README.md!!! 
![foto1](https://naskho.org/images/ReadPlease.gif)

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

## Add to `resources/[qb]/qb-management/client/cl_config.lua` to `Config.BossMenus`:
- This is the bossmenu location
```lua
drivingteacher = {
    vector3(215.24, -1401.76, 30.58)
},
```

## Add To `qb-core/qb-shared/jobs.lua`:
```lua
drivingteacher = {
    name  = 'drivingteacher',
	label = 'Driving school',
        type  = 'driveschool',
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


## Add to `resources/[qb]/qb-radialmenu/config.lua` inside the `Config.JobInteractions`:
```lua
["drivingteacher"] = {
    {
        id = 'playerlicinceoptions2',
        title = 'Licince Options',
        icon = 'plus',
        items = {
            {
                id = 'givelicince1',
                title = 'Give',
                icon = 'plus',
                type = 'client',
                event = 'mh-drivingteacherjob:client:giveLicinceMenu',
                shouldClose = true
            },
        }
    },
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
},
```

## Edit qb-phone Option 1 `resources/[qb]/qb-phone/server.lua` around line 1055
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
                    MySQL.insert('INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (?, ?, ?, ?, ?)', {billed.PlayerData.citizenid, amount, biller.PlayerData.job.name, biller.PlayerData.charinfo.firstname, biller.PlayerData.citizenid})
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


## Edit qb-phone Option 2 `resources/[qb]/qb-phone/server.lua` around line 1055
- You can add `or biller.PlayerData.job.name == 'drivingteacher'` 
- to the job check if statement and add this to the end before `then`
- example: 
```lua
if biller.PlayerData.job.name == "police" or biller.PlayerData.job.name == 'ambulance' or biller.PlayerData.job.name == 'mechanic' or biller.PlayerData.job.name == 'drivingteacher' then
```

## Edit `qb-phone/html/js/lawyers.js`
- to call a driving teacher (if this player is online)
- you can change the colers in rgb()

## Add to `qb-phone/html/js/lawyers.js` around line 9/10
```js 
var drivingteacher = [];
```

## Add to `qb-phone/html/js/lawyers.js` around line 36
```js
if (lawyer.typejob == "drivingteacher") {
    drivingteacher.push(lawyer);
}
```

## Add to `qb-phone/html/js/lawyers.js` around line 134
```js
$(".lawyers-list").append('<br><h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; width:100%; display:block; background-color: rgb(155, 15, 120);">Driving Teacher (' + drivingteacher.length + ')</h1>');
if (drivingteacher.length > 0) {
    $.each(drivingteacher, function(i, lawyer10) {
        var element = '<div class="lawyer-list" id="lawyerid10-' + i + '"> <div class="lawyer-list-firstletter" style="background-color: #0d1218c0;">' + (lawyer10.name).charAt(0).toUpperCase() + '</div> <div class="lawyer-list-fullname">' + lawyer10.name + '</div> <div class="lawyer-list-call"><i class="fas fa-phone"></i></div> </div>'
        $(".lawyers-list").append(element);
        $("#lawyerid1-" + i).data('LawyerData', lawyer10);
    });
} else {
    var element = '<div class="lawyer-list"><div class="no-lawyers">There are no driving teachers online.</div></div>'
    $(".lawyers-list").append(element);
}
```

## Add to `qb-phone/html/js/lawyers.js` around line 176
```js
$(".lawyers-list").append('<br><h1 style="font-size:1.641025641025641vh; padding:1.0256410256410255vh; color:#fff; margin-top:0; width:100%; display:block; background-color: rgb(155, 15, 120);">Driving Teacher (' + drivingteacher.length + ')</h1>');
var element = '<div class="lawyer-list"><div class="no-lawyers">There are no driving teachers.</div></div>'
$(".lawyers-list").append(element);
```


&copy; [MaDHouSe79](https://www.youtube.com/@MaDHouSe79)