console.log("Begin");

// $(function () {
//     var gameConsoleOptions = $('.watch_model_id option');
//     console.log("Game " + gameConsoleOptions);
//     $(".watch_brand_id").on("change", function () {
//         var label = $(this).find("option:selected").closest('optgroup').prop('label');
//         console.log("Label " + label);
//         if (label) {
//             gameConsoleOptions.hide();
//             gameConsoleOptions.filter(function (i, v) {
//                 return $(v).text() === label;
//             }).show();
//         } else {
//             gameConsoleOptions.show();
//         }
//       console.log("Game After " + gameConsoleOptions);
//     });
// });

$.fn.filterGroups = function( options ) {
  var settings = $.extend( {}, options);

  return this.each(function(){

    var $select = $(this);
        // Clone the optgroups to data, then remove them from dom
        $select.data('fg-original-groups', $select.find('optgroup').clone()).children('optgroup').remove();

        $(settings.groupSelector).change(function(){
          var $this = $(this);
          var optgroup_label = $this.val();
          var $optgroup =  $select.data('fg-original-groups').filter('optgroup[label="' + optgroup_label + '"]').clone();
          $select.children('optgroup').remove();
          $select.append($optgroup);
        }).change();

      });
};

$(function() {
  $('#watch_model_id').filterGroups({groupSelector: '#watch_brand_id', });
});
