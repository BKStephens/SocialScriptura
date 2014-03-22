$(document).ready ->
  chapters = $('#bible_view_chapter').html()
  $('#bible_view_book').change ->
    #Filter the Bible Chapters
    book = $('#bible_view_book :selected').text()
    options = $(chapters).filter("optgroup[label='#{book}']").html()
    if options 
      $('#bible_view_chapter').html(options)
    #Change the bible book in the comments section
    $('#comment_book_start').val(book).change();

  $('#comment_book_start').change ->
    book = $('#comment_book_start :selected').text()
    options = $(chapters).filter("optgroup[label='#{book}']").html()
    if options 
      $('#comment_chapter_start').html(options).change()
    
  $('#comment_chapter_start').change ->
    $.ajax
      type: 'GET'
      url: 'comments/update_verses'
      data: {comment: { chapter_start: $('select#comment_chapter_start').val() } }
      dataType: 'json'
      success: (json) ->     
         $("#comment_verse_start")
         .empty()
         .append("<option value=\"#{option}\">#{option}</option>" for option in json)
         $("#comment_verse_end")
         .empty()
         .append("<option value=\"#{option}\">#{option}</option>" for option in json)
         $("#comment_verse_end").val(Math.max.apply(Math, json)).change();
      error: ->
        alert "This junk errored out son"

  $('article#Bible').find('form').submit (event) ->
    event.stopPropagation()
    event.preventDefault()
    
    $.ajax
      type: 'POST'
      url: $(this).attr('action')
      data: $('article#Bible').find('form').serialize()
      dataType: 'json'
      success: (json) ->     
        $("#BibleOutput").empty();
        $("#BibleOutput").text(json.bible_content);
        $("#ContentStream").empty();
        $("#ContentStream").text(json.content_stream);
      error: ->
        alert "This junk errored out son"

  $('article#Comment').find('form').submit (event) ->
    event.stopPropagation()
    event.preventDefault()
    
    $.ajax
      type: 'POST'
      url: $(this).attr('action')
      data: $('article#Comment').find('form').serialize()
      dataType: 'json'
      success: (json) ->     
        $("#comment_description").val("");
      error: ->
        alert "This junk errored out son"

