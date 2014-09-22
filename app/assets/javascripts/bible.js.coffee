$(document).ready ->
  chapters = $('#user_bible_view_chapter').html()
  
  mustacheContentStreamBuilder = (data) ->
    panel = $("#contentStreamTemplate").html()
    div = `Mustache.to_html(panel, JSON.parse(data))`
    $('#ContentStream').append(div)
  
  $('#user_bible_view_bible_version').change ->
    $('article#Bible').find('form').submit();

  $('#user_bible_view_bible_version').change ->
    bible_version = $('#user_bible_view_bible_version :selected').val()
    $('#comment_bible_version').val(bible_version)    

  $('#user_bible_view_book').change ->
    #Filter the Bible Chapters
    book = $('#user_bible_view_book :selected').text()
    options = $(chapters).filter("optgroup[label='#{book}']").html()
    if options 
      $('#user_bible_view_chapter').html(options)
    #Change the bible book in the comments section
    $('#comment_book_start').val(book).change();

  $('#user_bible_view_chapter').change ->
    chapter = $('#user_bible_view_chapter :selected').val()
    $('#comment_chapter_start').val(chapter).change();

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
      beforeSend: ->
        $("#comment_verse_end")
         .empty()
      success: (json) ->     
         $("#comment_verse_start")
         .empty()
         .append("<option value=\"#{option}\">#{option}</option>" for option in json)
         $("#comment_verse_end")
         .empty()
         .append("<option value=\"#{option}\">#{option}</option>" for option in json)
         $("#comment_verse_end").val(Math.max.apply(Math, json)).change();
         $('article#Bible').find('form').submit();         
      error: ->
        console.log('Error with comment_chapter_start javascript')

  $('article#Bible').find('form').submit (event) ->
    event.stopPropagation()
    event.preventDefault()
 
    $.ajax
      type: 'POST'
      url: $(this).attr('action')
      data: $('article#Bible').find('form').serialize()
      dataType: 'json'
      beforeSend: -> 
        $("#ContentStream").empty();
        $("#ContentStream").append('<article id="spinner"><div class="large progress"><div>Loading…</div></div></article>');
        $("#spinner").show();
      complete: ->
        $("#spinner").hide();
      success: (json) ->     
        $("#BibleOutput").empty();
        $("#BibleOutput").text(json.bible_content);
        $("#ContentStream").append(mustacheContentStreamBuilder(json.content_stream));
        $("#BibleCopyright").text(json.copyright)
        $("#fums").append(json.fums);
      error: ->
        console.log('Error with submit bible form javascript')

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
        $('.edit_user_bible_view').submit(); #TODO: refactor this to refresh comments without submit of other form
      error: ->
        console.log('Error with submit comment form javascript')

  $("#expand_comment_options").click ->
    $(this).find('i').toggleClass("fa-caret-square-o-down fa-caret-square-o-up");
    $("#comment_options").slideToggle "slow"

  set_verses_on_page_load = ->
    $("#comment_chapter_start").change()
      
  $ ->
    set_verses_on_page_load()
