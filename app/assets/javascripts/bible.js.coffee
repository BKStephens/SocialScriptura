$(document).ready ->
  chapters = $('#bible_view_chapter').html()
  
  #setting up loading spinner's positio
  content_stream_position = $('#ContentStream').position();
  spinner_vertical = content_stream_position.top + 80;
  spinner_horizontal = content_stream_position.left + ($('#ContentStream').width()/3);
  `$("#floatingCirclesG").css({"top": spinner_vertical, "left":spinner_horizontal})`
  
  $('#bible_view_book').change ->
    #Filter the Bible Chapters
    book = $('#bible_view_book :selected').text()
    options = $(chapters).filter("optgroup[label='#{book}']").html()
    if options 
      $('#bible_view_chapter').html(options)
    #Change the bible book in the comments section
    $('#comment_book_start').val(book).change();

  $('#bible_view_chapter').change ->
    chapter = $('#bible_view_chapter :selected').val()
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


  `function tree(data) {  
     var div = $('<div>');
       
     var panel = 
     "{{#comments}} <div class='comment'>"
       +"{{full_name}}"
       +"</br>"
       +"{{created_at}} {{book_start}} {{chapters}}:{{verse_start}}-{{verse_end}}"
       +"</br>"
       +"<div class='comment_verses'>{{verses}}</div>"
       +"</br>"
       +"<div class='comment'>{{description}}</div>"
       +"</br>"
     +"</div>{{/comments}}";
     
     var div = Mustache.to_html(panel, data)
     $('#ContentStream').append(div);
   }`
  
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
        $("#spinner").show();
      complete: ->
        $("#spinner").hide();
      success: (json) ->     
        console.log(JSON.parse(json.content_stream));
        $("#BibleOutput").empty();
        $("#BibleOutput").text(json.bible_content);
        $("#ContentStream").append(tree(JSON.parse(json.content_stream)));
    
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

  `$(function () {
    $('#new_bible_view').submit();
  })`