local Translations = {
	
    error = {
		['area_is_obstructed'] = 'Error, the receiving area is obstructed by something, try again',
		['unknow_id'] = "Ongeldige ID",
		['unknow_id_or_type'] = "Ongeldige ID of Type",
    },

    info = {
		['give_keys_to_student'] = "Geef de sleutels aan je leerling, en begin de rijexamen.",
		['on_duty'] = '[~g~E~s~] - Ga in dienst',
        ['off_duty'] = '[~r~E~s~] - Ga uit dienst',
        ['onoff_duty'] = '~g~In~s~/~r~Uit~s~ dienst',
    },

	notify = {
		['student_not_found'] = "No student found",
		['no_info_found'] = "No driving test info found"
	},

	menu = {
		["customer_id"] = "Speler ID",
		['main_header'] = "RijSchool Menu",
		['main_description'] = "Start een rijtest met een speler",
		['give_description'] = "Rijbewijs Geven",
		['take_description'] = "Rijbewijs Intrekken",
		['licence_types'] = "N/A/AM/B/BE/C/CE/D/DE/P",
		
		['driving_theory_test'] = 'Theorie examen[€%{price}]',
		['am_class_driving_practice_test'] = 'AM (Brommer) [€%{price}]',
		['a_class_driving_practice_test']  = 'A (Motor) [€%{price}]',
		['b_class_driving_practice_test']  = 'B (Auto) [€%{price}]',
		['be_class_driving_practice_test'] = 'BE (Auto + Aanhanger) [€%{price}]',
		['c_class_driving_practice_test']  = 'C (Vrachwagen) [€%{price}]',
		['ce_class_driving_practice_test'] = 'CE (Vrachwagen + Aanhanger) [€%{price}]',
		['d_class_driving_practice_test']  = 'D (Bus) [€%{price}]',
		['de_class_driving_practice_test'] = 'DE (Bus + Aanhanger) [€%{price}]',
		['p_class_driving_practice_test']  = 'P (Vliegbrevet) [€%{price}]',
	}
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})