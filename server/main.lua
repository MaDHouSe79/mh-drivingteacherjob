--[[ ===================================================== ]]--
--[[        QBCore Driving Teacher Job by MaDHouSe         ]]--
--[[ ===================================================== ]]--
local QBCore = exports['qb-core']:GetCoreObject()

local function RemoveAllLicences(player)
	local licenses = player.Functions.GetMetaData("licences")
	licenses.N = false
	licenses.AM = false
	licenses.A = false
	licenses.B = false
	licenses.BE = false
	licenses.C = false
	licenses.CE = false
	licenses.D = false
	licenses.DE = false
	licenses.T = false
	licenses.P = false
	licenses.H = false
	licenses.R = false
	licenses.AMB = licenses.AMB
	licenses.POL = licenses.POL
	licenses.business = licenses.business
	licenses.weapon = licenses.weapon
	player.Functions.SetMetaData("licences", licenses)
end

-- Functions
local function CreateLicense(target)

	local license = ""

	if target.PlayerData.metadata['licences'].N then
		local n = "N"
		license = license .. n
	end

	if target.PlayerData.metadata['licences'].AM then
		local am = "AM"
		if target.PlayerData.metadata['licences'].N then am = "/AM" end
		license = license .. am
	end

	if target.PlayerData.metadata['licences'].A then
		local a = "A"
		if target.PlayerData.metadata['licences'].AM then a = "/A" end
		license = license .. a
	end

	if target.PlayerData.metadata['licences'].B then
		local b = "B"
        if target.PlayerData.metadata['licences'].AM or target.PlayerData.metadata['licences'].A then b = "/B" end
		if target.PlayerData.metadata['licences'].BE then
			if target.PlayerData.metadata['licences'].A then b = "/BE" else b = "BE" end
		end
		license = license .. b
	end

	if target.PlayerData.metadata['licences'].B and target.PlayerData.metadata['licences'].C then
		local c = "/C"
		if target.PlayerData.metadata['licences'].CE then c = "/CE" end
		license = license .. c
	end

	if target.PlayerData.metadata['licences'].B and target.PlayerData.metadata['licences'].D then
		local d = "/D"
		if target.PlayerData.metadata['licences'].DE then d = "/DE" end
		license = license .. d
	end

	if target.PlayerData.metadata['licences'].T then
		local t = "T"
		if target.PlayerData.metadata['licences'].B then
			t = "/T"
		end
		license = license .. t
	end

	if target.PlayerData.metadata['licences'].H then
		local h = "H"
		if target.PlayerData.metadata['licences'].B then
			h = "/H"
		end
		license = license .. h
	end

	if target.PlayerData.metadata['licences'].P then
		local p = "P"
		if target.PlayerData.metadata['licences'].B then
			p = "/P"
		end
		license = license .. p
	end

	if target.PlayerData.metadata['licences'].R then
		local race = "R"
		if target.PlayerData.metadata['licences'].B then
			race = "/R"
		end
		license = license .. race
	end

	if target.PlayerData.metadata['licences'].AMB then
		local amb = "AMB"
		if target.PlayerData.metadata['licences'].B then
			amb = "/AMB"
		end
		license = license .. amb
	end

	if target.PlayerData.metadata['licences'].POL then
		local pol = "POL"
		if target.PlayerData.metadata['licences'].B then
			pol = "/POL"
		end
		license = license .. pol
	end

	return license
end

local function LicenseInfo(target)
	local info = {firstname = target.PlayerData.charinfo.firstname, lastname = target.PlayerData.charinfo.lastname, birthdate = target.PlayerData.charinfo.birthdate, type = CreateLicense(target)}
	return info
end

local function GetOnlinePlayers()
    local sources = {}
    for k, id in pairs(QBCore.Functions.GetPlayers()) do
		local target = QBCore.Functions.GetPlayer(id)
		local info = { source = target.PlayerData.source, fullname = target.PlayerData.charinfo.firstname.." "..target.PlayerData.charinfo.lastname}
        sources[#sources+1] = info
    end
    return sources
end

QBCore.Functions.CreateCallback("mh-drivingteacherjob:server:GetOnlinePlayers", function(source, cb)
	cb(GetOnlinePlayers())
end)

QBCore.Commands.Add(Config.Command['add'], Lang:t('command.add_help'), {{"id", "ID"},{"type", Lang:t('menu.licence_types')}}, true, function(source, args)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == 'drivingteacher' or Player.PlayerData.job.name == 'police' then
		if args[1] and tonumber(args[1]) >= 1 then
			local studentId = tonumber(args[1])
			local student = QBCore.Functions.GetPlayer(studentId)
			if student then
				local license = tostring(args[2])
				student.PlayerData.metadata["licences"][license] = true
				student.Functions.SetMetaData("licences", student.PlayerData.metadata["licences"])
				TriggerClientEvent('QBCore:Notify', studentId, Lang:t('notify.passed_for_license', {license = license}), "success", 5000)
				TriggerClientEvent('QBCore:Notify', source,  Lang:t('notify.granted_access_license', {id = studentId, license = license}), "success", 5000)
				student.Functions.RemoveItem('driver_license', 1)
				TriggerClientEvent('qb-inventory:client:ItemBox', studentId, QBCore.Shared.Items['driver_license'], "remove")
				student.Functions.AddItem('driver_license', 1, nil, LicenseInfo(student))
				TriggerClientEvent('qb-inventory:client:ItemBox', studentId, QBCore.Shared.Items['driver_license'], 'add')
			end
		else
			TriggerClientEvent('QBCore:Notify', source, Lang:t('notify.invalid_id'), "error", 5000)
		end
	else
		TriggerClientEvent('QBCore:Notify', source, Lang:t('notify.not_a_instructor'), "error", 5000)
	end
end, 'user')

QBCore.Commands.Add(Config.Command['remove'], Lang:t('command.remove_help'), {{"id", "ID"}}, true, function(source, args)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.job.name == 'drivingteacher' or Player.PlayerData.job.name == 'police' then
		if args[1] and tonumber(args[1]) >= 1 then
			local studentId = tonumber(args[1])
			local student = QBCore.Functions.GetPlayer(studentId)
			if student then
				RemoveAllLicences(student)
				student.Functions.RemoveItem('driver_license', 1, nil)
				TriggerClientEvent('qb-inventory:client:ItemBox', studentId, QBCore.Shared.Items['driver_license'], "remove")
				TriggerClientEvent('QBCore:Notify', studentId, Lang:t('notify.your_license_has_been_taken', {player = Player.PlayerData.charinfo.firstname .." "..Player.PlayerData.charinfo.lastname}), "success", 5000)
				TriggerClientEvent('QBCore:Notify', source, Lang:t('notify.license_has_been_taken', {id = studentId}), "success", 5000)
			end
		else
			TriggerClientEvent('QBCore:Notify', source, Lang:t('notify.invalid_id'), "error", 5000)
		end
	else
		TriggerClientEvent('QBCore:Notify', source, Lang:t('notify.not_a_instructor'), "error", 5000)
	end
end, 'user')

RegisterServerEvent('mh-drivingteacherjob:server:givelicince', function(id, license)
	local src = source
	if id and tonumber(id) >= 1 then
		local studentID = tonumber(id)
		local student = QBCore.Functions.GetPlayer(studentID)
		if student then
			student.PlayerData.metadata["licences"][license] = true
			student.Functions.SetMetaData("licences", student.PlayerData.metadata["licences"])
			TriggerClientEvent('QBCore:Notify', studentID, Lang:t('notify.passed_for_license', {license = license}), "success", 5000)
			TriggerClientEvent('QBCore:Notify', src,  Lang:t('notify.granted_access_license', {id = studentID, license = license}), "success", 5000)
			student.Functions.RemoveItem('driver_license', 1)
			TriggerClientEvent('qb-inventory:client:ItemBox', studentID, QBCore.Shared.Items['driver_license'], "remove")
			student.Functions.AddItem('driver_license', 1, nil, LicenseInfo(student))
			TriggerClientEvent('qb-inventory:client:ItemBox', studentID, QBCore.Shared.Items['driver_license'], 'add')
		end
	end
end)

RegisterServerEvent('mh-drivingteacherjob:server:takelicince', function(id)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if id and tonumber(id) >= 1 then
		local targetID = tonumber(id)
		local target = QBCore.Functions.GetPlayer(targetID)
		if target then
			RemoveAllLicences(target)
			target.Functions.RemoveItem('driver_license', 1)
			TriggerClientEvent('qb-inventory:client:ItemBox', targetID, QBCore.Shared.Items['driver_license'], "remove")
			TriggerClientEvent('QBCore:Notify', targetID, Lang:t('notify.your_license_has_been_taken', {player = Player.PlayerData.charinfo.firstname .." "..Player.PlayerData.charinfo.lastname}), "success", 5000)
			TriggerClientEvent('QBCore:Notify', src, Lang:t('notify.license_has_been_taken', {id = targetID}), "success", 5000)
		end
	else
		TriggerClientEvent('QBCore:Notify', src, Lang:t('notify.invalid_id'), "error", 5000)
	end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName == GetCurrentResourceName() then
		MySQL.Async.fetchAll("SELECT * FROM players", function(rs)
			for k, v in pairs(rs) do
				local list = json.decode(v.metadata)
				if list['licences'] then
					if not list['licences']['N'] then list['licences']['N'] = false end
					if not list['licences']['AM'] then list['licences']['AM'] = false end
					if not list['licences']['A'] then list['licences']['A'] = false end
					if not list['licences']['B'] then list['licences']['B'] = false end
					if not list['licences']['BE'] then list['licences']['BE'] = false end
					if not list['licences']['C'] then list['licences']['C'] = false end
					if not list['licences']['CE'] then list['licences']['CE'] = false end
					if not list['licences']['T'] then list['licences']['T'] = false end
					if not list['licences']['P'] then list['licences']['P'] = false end
					if not list['licences']['H'] then list['licences']['H'] = false end
					if not list['licences']['R'] then list['licences']['R'] = false end
					if not list['licences']['AMB'] then list['licences']['AMB'] = false end
					if not list['licences']['POL'] then list['licences']['POL'] = false end
					if not list['licences']['N'] then list['licences']['N'] = false end
					if not list['licences']['N'] then list['licences']['N'] = false end
				end
				MySQL.update.await('UPDATE players SET metadata = ? WHERE citizenid = ?', {json.encode(list), v.citizenid})
			end
		end)
	end
end)
