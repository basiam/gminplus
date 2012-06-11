jQuery(document).ready(function($) {
  $("#formlink").live("click", function(e){
    e.preventDefault;
    $("#page").fadeOut();
    $(".second").hide();
    $("#superform").fadeIn();
  });
});
