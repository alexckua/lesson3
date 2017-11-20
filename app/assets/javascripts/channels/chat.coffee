App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(Chat[data['action']](data))

Chat = {
  create: (data) ->
    return if data['user_id'] == $('[data-user]').data('user')
    $('.chat').append(data['res'])
  delete: (data) ->
    $("#message_#{data['id']}").slideUp()
}
