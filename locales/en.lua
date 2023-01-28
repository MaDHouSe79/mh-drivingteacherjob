local Translations = {
	
    error = {
		['area_is_obstructed'] = 'Error, the receiving area is obstructed by something, try again',
		['unknow_id_or_type'] = "Invalid ID or Type",
		['invalid_id'] = "You have entered a invalid ID..",
		['not_a_instructor'] = "You are not a driving instructor..",
    },

    info = {
		['on_duty'] = '[E] - Go into service',
        ['off_duty'] = '[E] - Get out of service',
        ['onoff_duty'] = 'In/Out service',
    },

	notify = {
		['student_not_found'] = "No student found",
		['no_info_found'] = "No driving test info found",
		['granted_access_license'] = "Player with ID %{id} has been granted access to %{license} license",
		['passed_for_license'] = "You passed your %{license} license",
		['your_license_has_been_taken'] = "Your driver's license has been taken away by %{player}",
		['license_has_been_taken'] = "Player with ID %{id} no longer has a license",
		['wrong_vehicle_to_park'] = "This vehicle cannot be parked here because it is not a driving school car.",
	},

	menu = {
		["customer_id"] = "Player ID",
		['main_header'] = "DriveSchool Menu",
		['licence_types'] = "Types N/A/AM/B/BE/C/CE/D/DE/T/H/P",
		['park_vehicle'] = "[E] - Park Vehicle",
		['open_garage'] = "[E] - Open Garage",
		['main_give_header'] = "Give Licence",
		['main_take_header'] = "Take Licence",
	},
	licence = {
		['select_player'] = "Select Player",
		['select_licence'] = "Select license",
		['licence_n'] = "Theory proof",
		['licence_am'] = "Moped driver's license",
		['licence_a'] = "Motorcycle license",
		['licence_b'] = "Car Driving License",
		['licence_be'] = "Car + Trailer Driving license",
		['licence_c'] = "Truck Driving License",
		['licence_ce'] = "Truck + Trailer Driving license",
		['licence_d'] = "Bus Driver's License",
		['licence_de'] = "Bus + Trailer Driving license",
		['licence_t'] = "Boat License",
		['licence_h'] = "Helicopter Pilot License",
		['licence_p'] = "Airplane Pilot License",
		['licence_r'] = "Race license",
		['licence_amb'] = "Ambulance license",
		['licence_pol'] = "Police license",
	},
	command = {
		['add_help'] = "Give a license to a player",
		['remove_help'] = "Taking a license",
	}
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
