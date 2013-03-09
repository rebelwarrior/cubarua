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
        url: 'http://127.0.0.1:3000/api/v1/all' #url for App sending jsonp
        error: (data, status, jqXHR)-> console.log("error: #{status}, loading JSON: #{data}, and: #{jqXHR}")
        success: (incomming_data, status, xhr)->
          console?.log("success!: #{incomming_data[0]}, #{status}, #{xhr}")
          for agency in incomming_data
            $('#results').append "<ol>"
            for own key, value of agency['agency'] when key isnt 'id' #object
              $('#results').append "<li>" + key + " : <br/>    " + value + " </li>" 
            $('#results').append "</ol>"  
    close : ->
      $('#results').html "Agencias: <br/>"
      console?.log "Reset Window Content: #{$('div#content').contents()}"
  $('#open').click -> 
    $('div#dialog').dialog("open")    
  # $('body').css('background', '#9999CC')
  