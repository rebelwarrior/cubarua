root = global ? window

$ ->
  $("div#dialog").dialog
    modal : true
    autoOpen : false #false
    show : "bounce"
    hide : "puff"
    open : -> 
      console.log "Opening... ModalWindow"
      $.ajax
        dataType: 'jsonp'
        url: 'http://127.0.0.1:3000/all' #url for App sending jsonp
        error: (data, status, jqXHR)-> console.log("error: #{status}, loading JSON: #{data}, and: #{jqXHR}")
        success: (incomming_data, status, xhr)->
          console?.log("success #{data[0].name}, #{status}, #{xhr}")
          for agency in incomming_data
            $('#results').append "<li>" + agency + " </li>"   
    close : ->
      # $('#content').html "Articles: <br/>"
      console?.log "Reset Window Content: #{$('div#content').contents()}"
  $('#open').click -> 
    $('div#dialog').dialog("open")    
  # $('body').css('background', '#9999CC')
  