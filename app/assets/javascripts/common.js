jQuery(document).ready(function($) {
  $("#formlink").live("click", function(e){
    e.preventDefault();
    $("#page").hide();
    $(".first").fadeIn();
    $(".second").hide();
    $("#superform").fadeIn();
  });
  $("#ff").bind("ajax:success", function(event, data, status, xhr) {
    $("#fs").attr("action", "/interests/" + data.id);
    $(".first").hide();
    $(".second").fadeIn();
  });
  $("#fs").bind("ajax:success", function(event, data, status, xhr) {
    window.location = "/lastpage";
  });

  $(".nobutton").bind("click", function(e){
    e.preventDefault();
    $(".shy").show();
  });
});
