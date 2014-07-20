# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  mustacheContentStreamBuilder = (data) ->
    panel = $("#contentStreamTemplate").html()
    div = `Mustache.to_html(panel, JSON.parse(data))`
    $('#ContentStream').append(div)
  
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
        $("#ContentStream").append(mustacheContentStreamBuilder(json.content_stream));