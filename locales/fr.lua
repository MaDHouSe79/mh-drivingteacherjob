local Translations = {

    error = {
        ['area_is_obstructed'] = 'Erreur, la zone de réception est obstruée par quelque chose, réessayez',
        ['unknow_id_or_type'] = "ID ou type invalide",
        ['invalid_id'] = "Vous avez saisi un ID invalide.",
        ['not_a_instructor'] = "Vous n\'êtes pas un instructeur de conduite."
    },

    info = {
        ['on_duty'] = '[E] - Entrer en service',
        ['off_duty'] = '[E] - Sortir de service',
        ['onoff_duty'] = 'En service / Hors service'
    },

    notify = {
        ['student_not_found'] = "Aucun élève trouvé",
        ['no_info_found'] = "Aucune information sur l'examen de conduite trouvée",
        ['granted_access_license'] = "Le joueur avec l'ID %{id} a obtenu l\'accès à la licence %{license}",
        ['passed_for_license'] = "Vous avez réussi votre permis de conduire %{license}",
        ['your_license_has_been_taken'] = "Votre permis de conduire a été retiré par %{player}",
        ['license_has_been_taken'] = "Le joueur avec l\'ID %{id} n\'a plus de permis de conduire",
        ['wrong_vehicle_to_park'] = "Ce véhicule ne peut pas être garé ici car ce n'est pas une voiture d'auto-école."
    },

    menu = {
        ["customer_id"] = "ID du joueur",
        ['main_header'] = "Menu de l\'auto-école",
        ['licence_types'] = "Types N/A/AM/B/BE/C/CE/D/DE/T/H/P",
        ['park_vehicle'] = "[E] - Garer le véhicule",
        ['open_garage'] = "[E] - Ouvrir le garage",
        ['main_give_header'] = "Donner un permis",
        ['main_take_header'] = "Retirer un permis"
    },
    licence = {
        ['select_player'] = "Sélectionner le joueur",
        ['select_licence'] = "Sélectionner le permis",
        ['licence_n'] = "Preuve théorique",
        ['licence_am'] = "Permis de conduire pour cyclomoteur",
        ['licence_a'] = "Permis de conduire moto",
        ['licence_b'] = "Permis de conduire voiture",
        ['licence_be'] = "Permis de conduire voiture + remorque",
        ['licence_c'] = "Permis de conduire camion",
        ['licence_ce'] = "Permis de conduire camion + remorque",
        ['licence_d'] = "Permis de conduire bus",
        ['licence_de'] = "Permis de conduire bus + remorque",
        ['licence_t'] = "Permis bateau",
        ['licence_h'] = "Licence de pilote d'hélicoptère",
        ['licence_p'] = "Licence de pilote d'avion",
        ['licence_r'] = "Licence de course",
        ['licence_amb'] = "Permis d\'ambulancier",
        ['licence_pol'] = "Permis de police"
    },
    command = {
        ['add_help'] = "Donner un permis à un joueur",
        ['remove_help'] = "Retirer un permis"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
