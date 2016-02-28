$(function () {
    // On initialise un datepicker Bootstrap
    $('#datetimepicker').datetimepicker({
        viewMode: 'years',
        locale: 'fr',
        format: 'L',
        maxDate: $.now()
    });

    // On récupère la date du vrai champ et on met à jour le datePicker si elle n'est pas nulle
    // Ceci est utile en cas de soumission ratée du formulaire pour conserver la date rentrée
    var date = $('#user_birthdate').val();
    if(date != "")
    {
        var splitted = date.split("-");
        var dateFormatted = splitted[2] + "/" + splitted[1] + "/" + splitted[0];
        $('#datetimepicker').children('input').val(dateFormatted);
    }

    // A chaque fois que l'on change la date du DatePicker, on met à jour la date du vrai champ caché
    $("#datetimepicker").on("dp.change", function(e) {
        var date = $('#datetimepicker').children('input').val();
        var splitted = date.split("/");
        var dateFormatted = splitted[2] + "-" + splitted[1] + "-" + splitted[0];
        $('#user_birthdate').val(dateFormatted);
    });

    // On remplace le nom des attributs du model avec leur traduction en français pour avoir des messages d'erreurs totalement traduit
    $('.error-li').each(function () {
    var text = $(this).text();
        text = text.replace("Birthdate","Date de naissance");
        text = text.replace("Watchedmovies","Moyenne des films vu par semaine");
        text = text.replace("Readbooks","Moyenne des livres lu par semaine");
        text = text.replace("Readmorebooks","Lire plus de livres");
        $(this).text(text);
    });   
});