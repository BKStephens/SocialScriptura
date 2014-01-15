$(document).ready ->
  $('article#Bible').find('form').submit (event) ->
    event.stopPropagation()
    event.preventDefault()
    $.ajax
      type: 'POST'
      url: $(this).attr('action')
      data: $('form').serialize()
      dataType: 'json'
      success: (json) ->     
        $("#BibleOutput").empty();
        $("#BibleOutput").text(json);
        $("#ContentStream").empty();
        $("#ContentStream").text(json);
      error: ->
        alert "This junk errored out son"