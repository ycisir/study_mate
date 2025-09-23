import consumer from "channels/consumer"

consumer.subscriptions.create({ channel: "RoomChannel", room_id: 2}, {
  connected() {
    console.log("connected...")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(data)
  }
});
