console.log("Begin filter");

/*$.fn.filterGroups = function( options ) {
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
*/
