console.log("zbzbzbzb");

(function() {
  $(function() {
    return $(document).on('change', '#brands_select', function(evt) {
      return $.ajax('update_models', {
        type: 'GET',
        dataType: 'script',
        data: {
          brand_id: $("#brands_select option:selected").val()
        },
        error: function(jqXHR, textStatus, errorThrown) {
          return console.log("AJAX Error: " + textStatus);
        },
        success: function(data, textStatus, jqXHR) {
          return console.log("Dynamic brand select OK!");
        }
      });
    });
  });

}).call(this);
