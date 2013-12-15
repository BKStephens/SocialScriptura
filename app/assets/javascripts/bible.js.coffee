$(document).ready ->
  $('article#Bible form').submit (event) ->
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