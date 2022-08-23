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
		['passed_for_license'] = "You passed your %{license} license"
		['your_license_has_been_taken'] = "Your driver's license has been taken away by %{player}",
		['license_has_been_taken'] = "Player with ID %{id} no longer has a license",
	},

	menu = {
		["customer_id"] = "Player ID",
		['main_header'] = "DriveSchool Menu",
		['licence_types'] = "Types N/A/AM/B/BE/C/CE/D/DE/T/H/P",
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
