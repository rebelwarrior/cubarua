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
          for value in incomming_data
            console?.log value
            for content in value
              console?.log content
          for agency in incomming_data
            $('#results').append "<li>" + $.parseJSON(agency['agency'][0]) + " </li>"   
    close : ->
      $('#results').html "Agencias: <br/>"
      console?.log "Reset Window Content: #{$('div#content').contents()}"
  $('#open').click -> 
    $('div#dialog').dialog("open")    
  # $('body').css('background', '#9999CC')
  