const initFilter = () => {

  console.log("Begin filter");

  $(document).on("change", ".select-watch-brand", function(){
    var brand = $(this).val();

    $.ajax({
      url: "/watches/new",
      method: "GET",
      dataType: "json",
      data: {brand: brand},
      error: function (xhr, status, error) {
        console.error('AJAX Error: ' + status + error);
      },
      success: function (response) {
        //console.log(response);
        var models = response["models"];
        $(".select-watch-model").empty();

        /*$(".select-watch-model").append('<option>Modèle</option>');*/
        for(var i=0; i< models.length; i++){
          $(".select-watch-model").append('<option value="' + models[i]["id"] + '">' + models[i]["name"] + '</option>');
        }
      }
    });
  });

};

export { initFilter };
