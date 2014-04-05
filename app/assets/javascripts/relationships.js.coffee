# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  tree2 = (data) ->
    panel = $("#contentStreamTemplate").html()
    div = `Mustache.to_html(panel, data)`
    $('#ContentStream').append(div)
    console.log(panel)
    console.log(data)
    console.log(div)

  content_stream_position = $('#ContentStream').position();
  spinner_vertical = content_stream_position.top + 80;
  spinner_horizontal = content_stream_position.left + ($('#ContentStream').width()/3);
  `$("#floatingCirclesG").css({"top": spinner_vertical, "left":spinner_horizontal})`
  
  $.ajax
      type: 'GET'
      url: 'relationships_content_stream'
      dataType: 'json'
      beforeSend: -> 
        $("#ContentStream").empty();
        $("#spinner").show();
      complete: ->
        $("#spinner").hide();
      success: (json) ->     
        $("#ContentStream").append(tree2(JSON.parse(json.content_stream)));