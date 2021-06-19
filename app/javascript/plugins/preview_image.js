const previewImage = () => {

  console.log("Preview Image");

  $(document).on("change", ".select-watch-model", function(){
    var model = $(this).val();

    $.ajax({
      url: "/watches/new",
      method: "GET",
      dataType: "json",
      data: {model: model},
      error: function (xhr, status, error) {
        console.error('AJAX Error: ' + status + error);
      },
      success: function (response) {
        console.log(response);
      }
    });
  });

};

export { previewImage };
