$(document).ready ->
  $('article#Message').find('form').submit (event) ->
    event.stopPropagation()
    event.preventDefault()
    $.ajax
      type: 'POST'
      url: $(this).attr('action')
      data: $('form').serialize()
      dataType: 'json'
      success: (json) ->
        $('#Message form')[0].reset()
      error: ->
        alert "A problem occured with sending this message."