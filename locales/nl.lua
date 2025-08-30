local Translations = {
	
    error = {
		['area_is_obstructed'] = 'Fout, het ontvangstgebied wordt door iets belemmerd, probeer het opnieuw',
		['unknow_id_or_type'] = "Ongeldige ID of Type",
		['invalid_id'] = "U heeft een ongeldige ID ingevoerd..",
		['not_a_instructor'] = "Je bent geen rijinstructeur..",
    },

    info = {
		['on_duty'] = '[E] - Ga in Dienst',
        	['off_duty'] = '[E] - Ga uit Dienst',
        	['onoff_duty'] = 'In/Uit Dienst',
    },

	notify = {
		['student_not_found'] = "Geen leerling gevonden",
		['no_info_found'] = "Geen rijexameninformatie gevonden",
		['granted_access_license'] = "Speler met ID %{id} heeft toegang gekregen tot %{license} licentie",
		['passed_for_license'] = "Je bent gelaagd voor %{license} licentie",
		['your_license_has_been_taken'] = "Uw rijbewijs is ingenomen door %{player}",
		['license_has_been_taken'] = "Speler met ID %{id} heeft geen geldig licentie meer",
		['wrong_vehicle_to_park'] = "Dit voertuig kan hier niet worden gepakeerd omdat het geen rijschool auto is.",
	},

	menu = {
		["customer_id"] = "Player ID",
		['main_header'] = "Rijschool Menu",
		['licence_types'] = "Types N/A/AM/B/BE/C/CE/D/DE/T/H/P",
		['park_vehicle'] = "[E] - Parkeer voertuig",
		['open_garage'] = "[E] - Open Garage",
		['main_give_header'] = "Geef licantie",
		['main_take_header'] = "Neem Licentie",
	},
	licence = {
		['select_player'] = "Selecteer Speler",
		['select_licence'] = "Selecteer licentie",
		['licence_n'] = "Theorie bewijs",
		['licence_am'] = "Brommer Rijbewijs",
		['licence_a'] = "Motor Rijbewijs",
		['licence_b'] = "Auto Rijbewijs",
		['licence_be'] = "Auto + Aanhanger Rijbewijs",
		['licence_c'] = "Vrachtwagen Rijbewijs",
		['licence_ce'] = "Vrachtwagen + Aanhanger Rijbewijs",
		['licence_d'] = "Bus Rijbewijs",
		['licence_de'] = "Bus + Aanhanger Rijbewijs",
		['licence_t'] = "Vaarbewijs Boten",
		['licence_h'] = "Vliegbrevet Helikopter",
		['licence_p'] = "Vliegbrevet Vliegtuig",
		['licence_r'] = "Race licantie",
		['licence_amb'] = "Ambulance licantie",
		['licence_pol'] = "Politie licantie",
	},
	command = {
		['add_help'] = "Een licentie geven ",
		['remove_help'] = "Een licentie afnemen",
	}
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
