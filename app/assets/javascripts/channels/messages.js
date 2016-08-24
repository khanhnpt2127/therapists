App.messages = App.cable.subscriptions.create("MessagesChannel", {
  connected: function() {
    console.log("connected");
  },

  disconnected: function() {
    console.log("disconnected")
  },

  received: function(data) {
    $('#messages-body').val('', '');

    switch(data.action) {
      case 'append':
        $list = $("#messages-list")
        user_id = $list.data('user-id')
        user_type = $list.data('user-type')

        $tmpDiv = $('<div>').html(data.data)
        $message = $tmpDiv.find('.message')
        msg_user_id = $message.data('user-id')
        msg_user_type = $message.data('user-type')

        css = 'message my-message float-left'
        if(user_id === msg_user_id && user_type === msg_user_type) {
          css = 'message other-message float-right' 
        }

        $message.attr('class', css)
        $list.append($tmpDiv.html())
      break;

      case 'remove':
        $(data.data).remove()
      break;
    }
  }
});

