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
		['passed_for_license'] = "Je bent gelaagd voor %{license} licentie"
		['your_license_has_been_taken'] = "Uw rijbewijs is ingenomen door %{player}",
		['license_has_been_taken'] = "Speler met ID %{id} heeft geen geldig licentie meer",
	},

	menu = {
		["customer_id"] = "Player ID",
		['main_header'] = "Rijschool Menu",
		['licence_types'] = "Types N/A/AM/B/BE/C/CE/D/DE/T/H/P",
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
