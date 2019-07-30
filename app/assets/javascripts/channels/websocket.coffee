$(document).on('turbolinks:load', ->
  updatePages = ->
    console.log('Updating pages')
    if $('#dashboard_page')[0] != undefined
      $('#dashboard_page')[0].click()
    return

  toastrNotification = (data) ->
    toastr.options = {
      "closeButton": true,
      "debug": false,
      "newestOnTop": true,
      "progressBar": true,
      "positionClass": "toast-top-right",
      "preventDuplicates": true,
      "onclick": null,
      "showDuration": "300",
      "hideDuration": "5000",
      "timeOut": "8000",
      "extendedTimeOut": "1000",
      "showEasing": "swing",
      "hideEasing": "linear",
      "showMethod": "fadeIn",
      "hideMethod": "fadeOut"
    }
    console.log(data)
    toastr[data['type']](data['content'], data['title'])
    return

  App.web_notifications = App.cable.subscriptions.create "WebsocketChannel",
    connected: ->
      console.log("Connected")

    disconnected: ->
      console.log("Disconnected")

    received: (data) ->
      console.log("Don't know how to deal with:" + JSON.stringify(data));
      switch data['type']
        when 'update_pages' then updatePages()
        when 'notification' then toastrNotification(data['body'])
)