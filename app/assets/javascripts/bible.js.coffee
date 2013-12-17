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
        #$("#BibleOutput").load(@output);
      error: ->
        alert "This junk errored out son"