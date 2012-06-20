jQuery(document).ready(function($) {
  $("#formlink").live("click", function(e){
    e.preventDefault();
    $("#page").fadeOut();
    $(".first").fadeOut();
    $(".second").hide();
    $("#superform").fadeIn();
  });
  $("#ff").bind("ajax:success", function(event, data, status, xhr) {
    $("#fs").attr("action", "/interests/" + data.id);
    $(".first").fadeOut();
    $(".second").fadeIn();
  });
  $(".second form").live("submit", function(e){
    window.location = "/lastpage";
  });
});
