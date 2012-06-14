jQuery(document).ready(function($) {
  $("#formlink").live("click", function(e){
    e.preventDefault();
    $("#page").fadeOut();
    $(".first").fadeOut();
    $(".second").hide();
    $("#superform").fadeIn();
  });
  $(".first form").live("submit", function(e){
    $(".first").fadeOut();
    $(".second").fadeIn();
  });
  $(".second form").live("submit", function(e){
    window.location = "/lastpage";
  });
});
