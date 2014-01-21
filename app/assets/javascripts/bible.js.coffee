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
        $("#BibleOutput").text(json.bible_content);
        $("#ContentStream").empty();
        $("#ContentStream").text(json.content_stream);
      error: ->
        alert "This junk errored out son"