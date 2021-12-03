$(document).on("turbolinks:load", function () {
    // App.notifications = App.cable.subscriptions.create("MessagesChannel", {
      App.message = App.cable.subscriptions.create("MessageChannel", {
      connected: function() {
        //# Called when the subscription is ready for use on the server
      },

      disconnected: function() {
        //# Called when the subscription has been terminated by the server
      },

      received: function(data) {
        //# Called when there's incoming data on the websocket for this channel
        $("#messages").removeClass('hidden')
        $('#messages').append(this.renderMessage(data));
        $('#messages').scrollTop( $('#messages')[0].scrollHeight );
      },

      renderMessage: function(data) {
        return "<p> <b>" + data.user + ": </b>" + data.message + "</p>";
      }

    });
});