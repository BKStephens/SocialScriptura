$(document).ready ->
  $('article#Comment').find('form').submit (event) ->
    event.stopPropagation()
    event.preventDefault()
    $.ajax
      type: 'POST'
      url: $(this).attr('action')
      data: $('form').serialize()
      dataType: 'json'
      success: (json) ->
        $('#Comment form')[0].reset()