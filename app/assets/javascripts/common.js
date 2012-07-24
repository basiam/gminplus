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


  $("#ac1").autocomplete({
    source: function( request, response ) {
      $.ajax({
        url: "/communes", dataType: "json",
        data: { query: request.term },
        success: function(data) {
          $("#ac1_b").val('')
          return response($.map(data, function(item) {
            return { label: item.name + " (" + item.desc + ")", value: item.id }
          }));
        }
      });
    },
    minLength: 2,
    select: function( event, ui ) {
      $("#ac1").val(ui.item.label)
      $("#ac1_b").val(ui.item.value)
      return false;
    }
  });
  $("#ac2").autocomplete({
    source: function( request, response ) {
      $.ajax({
        url: "/communes", dataType: "json",
        data: { query: request.term },
        success: function(data) {
          $("#ac2_b").val('')
          return response($.map(data, function(item) {
            return { label: item.name + " (" + item.desc + ")", value: item.id }
          }));
        }
      });
    },
    minLength: 2,
    select: function( event, ui ) {
      $("#ac2").val(ui.item.label)
      $("#ac2_b").val(ui.item.value)
      return false;
    }
  });
});
