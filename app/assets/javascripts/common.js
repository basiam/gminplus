jQuery(document).ready(function($) {
  $("#formlink").live("click", function(e){
    e.preventDefault();
    $("#page").fadeOut();
    $(".second").hide();
    $("#superform").fadeIn();
  });
  $(".first form").live("submit", function(e){
    $(".first").fadeOut();
    $(".second").fadeIn();
  });
  $(".second form").live("submit", function(e){
    $(".first").fadeIn();
    $("#page").fadeIn();
  });
});
