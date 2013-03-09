root = global ? window

$ ->
  $("div#dialog").dialog
    modal : true
    autoOpen : false #false
    width : 600 # "auto" #default is 300 pixels
    show : "bounce"
    hide : "puff"
    open : -> 
      console?.log "Opening... ModalWindow (JQueryUI Dialog)"
      $.ajax
        dataType: 'jsonp'
        url: 'http://127.0.0.1:3000/api/v1/id/01' #url for App sending jsonp
        error: (data, status, jqXHR)-> console?.log("error: #{status}, loading JSON: #{data}, and: #{jqXHR}")
        success: (incomming_data, status, xhr)->
          console?.log("success!: #{incomming_data}, #{status}, #{xhr}")
          if Object::toString.call(incomming_data) == '[object Array]' #is_array?
            console?.log "is an array"
            for agency in incomming_data
              $('#results').append "<br /> <ol> <li>" #Trying to get a number for each result
              for own key, value of agency['agency'] when key isnt 'id' #object
                $('#results').append "<li>" + key + " :  :  " + value + " </li>" 
              $('#results').append "</li>" #Trying to get a number for each result
              $('#results').append "</ol>" #Trying to get a number for each result
          else
            console?.log "not an array"
            for own key, value of incomming_data['agency']
              $('#results').append "<li>" + key + " :  :  " + value + " </li>"
    close : ->
      $('#results').html "Resultados: <br/>"
      console?.log "Reset Window Content: #{$('div#content').contents()}"
  $('#open').click -> 
    $('div#dialog').dialog("open")    
  # $('body').css('background', '#9999CC')
  