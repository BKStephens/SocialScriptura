$(document).ready ->
  $('article#Bible').find('form').submit (event) ->
    event.stopPropagation()
    event.preventDefault()
    
    chapters = $('#bible_view_chapter').html()
    $('#bible_view_book').change ->
      book = $('#bible_view_book :selected').text()
      options = $(chapters).filter("optgroup[label='#{book}']").html()
      if options 
        $('#bible_view_chapter').html(options)
        
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

