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
    scrollToBottom()
  update: (data) ->
    return if data['user_id'] == $('[data-user]').data('user')
    $("#message_" + data['id']).replaceWith(data['res'])
  delete: (data) ->
    $("#message_#{data['id']}").slideUp()
  vote: (data) ->
    return if data['user_id'] == $('[data-user]').data('user')
    $("#message_" + data['id'] + " span_likes").text(data['res']['likes_count'])
    $("#message_" + data['id'] + " span_dislikes").text(data['res']['dislikes_count'])
  user_online: (data) ->
    return if data['user_id'] == $('[data-user]').data('user')
    if ( data['online'] )
      if ($('#online-users > li[data-user-id="'+data['user_id']+'"]').length == 0)
        $('#online-users').append(data['message_html']);
    else
      $('#online-users > li[data-user-id="'+data['user_id']+'"]').remove();
}
