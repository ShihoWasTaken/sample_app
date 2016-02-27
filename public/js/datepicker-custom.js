$(function () {
    $('#datetimepicker').datetimepicker({
        viewMode: 'years',
        locale: 'fr',
        format: 'L',
        maxDate: $.now()
    });

    var date = $('#user_birthdate').val();
    if(date != "")
    {
      var splitted = date.split("-");
      var dateFormatted = splitted[2] + "/" + splitted[1] + "/" + splitted[0];
      $('#datetimepicker').children('input').val(dateFormatted);
    }


   $("#datetimepicker").on("dp.change", function(e) {
        var date = $('#datetimepicker').children('input').val();
        var splitted = date.split("/");
        var dateFormatted = splitted[2] + "-" + splitted[1] + "-" + splitted[0];
        $('#user_birthdate').val(dateFormatted);
      });
});