$(function() {

   if ($("select#brand").val() == "") {
    $("select#model option").remove();
    var row = "<option value=\"" + "" + "\">" + "Model" + "</option>";
    $(row).appendTo("select#model");
   }
   $("select#brand").change(function() {
    var id_value_string = $(this).val();
    if (id_value_string == "") {
     $("select#model option").remove();
     var row = "<option value=\"" + "" + "\">" + "Model" + "</option>";
     $(row).appendTo("select#model");
    } else {
     // Send the request and update model dropdown
     $.ajax({
      dataType: "json",
      cache: false,
      url: '/get_models_by_brand/' + id_value_string,
      timeout: 5000,
      error: function(XMLHttpRequest, errorTextStatus, error) {
       alert("Failed to submit : " + errorTextStatus + " ;" + error);
      },
      success: function(data) {
       // Clear all options from model select
       $("select#model option").remove();
       //put in a empty default line
       var row = "<option value=\"" + "" + "\">" + "Model" + "</option>";
       $(row).appendTo("select#model");
       // Fill model select
       $.each(data, function(i, j) {
        row = "<option value=\"" + j.id + "\">" + j.title + "</option>";
        $(row).appendTo("select#model");
       });
      }
     });
    }
   });

  });
