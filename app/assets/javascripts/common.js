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

  $("#ff .button").bind("click", function(){
   return validateErrors();
  });

  $("#fs .button").bind("click", function(){
   return validateErrors();
  });

  $("#fs").bind("ajax:success", function(event, data, status, xhr) {
    window.location = "/lastpage";
  });

  $(".nobutton").bind("click", function(e){
    e.preventDefault();
    $(".shy").show();
  });

  setAutocomolete("#ac1")
  setAutocomolete("#ac2")

  if ('placeholder' in document.createElement('input') == false) {
    $('[placeholder]').each( function(index, element){
      var m = $(element).attr("placeholder")
      element.value = m;
      $(element).focus(function(){if(element.value==m ){element.value ='';} });
      $(element).blur(function(){ if(element.value==''){element.value = m;} });
    });
  }
});
function validateErrors(){
  $(".error").remove();
  if ($(".required:visible[value=]").length > 0){
    $(".required:visible[value=]").each(function(){
      var left = "style='left:" + $(this).position().left +"px'";
      var div = "<div class='error' " + left + ">Proszę wypełnij pole!</div>"
      $(this).after(div)
    });
    return false;
  }
  else {
    return true;
  }
}
function setAutocomolete(id){
  $(id).autocomplete({
    source: function( request, response ) {
      $.ajax({
        url: "/communes", dataType: "json",
        data: { query: request.term },
        success: function(data) {
          $(id + "_b").val('')
          $(".error").remove()
          return response($.map(data, function(item) {
            return { label: item.name + " (" + item.desc + ")", value: item.id }
          }));
        }
      });
    },
    minLength: 2,
    select: function( event, ui ) {
      $(id).val(ui.item.label)
      $(id + "_b").val(ui.item.value)
      return false;
    },
    focus: function(event, ui) {
      $(id).val(ui.item.label)
      return false;
    }
  });
}
