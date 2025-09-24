import consumer from "channels/consumer"

document.addEventListener("turbo:load", () => {

  const room_element = document.getElementById("room-id");
  const room_id = room_element.getAttribute("data-room-id");

  const msgInput = document.getElementById("message_body");
  const imageInput = document.getElementById("message_image");
  const sendButton = document.getElementById("send_button");

  const checkMessageAndImage = () => {

    if (msgInput.value.trim() !== "" || imageInput.files.length > 0) {

      sendButton.disabled = false;

    } else {

      sendButton.disabled = true;

    }

  };

  checkMessageAndImage();
  msgInput.addEventListener("input", checkMessageAndImage);
  imageInput.addEventListener("change", checkMessageAndImage);


  consumer.subscriptions.create({ channel: "RoomChannel", room_id: room_id}, {
    connected() {
      console.log("connected to room " + room_id);
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      // console.log(data);

      // const user_element = document.getElementById("user-id");
      // const user_id = Number(user_element.getAttribute("data-user-id"));

      // // console.log(element);
      // // console.log(user_id);

      // let html;

      // if (user_id === data.message.user_id) {
      //   html = data.mine;
      // } else {
      //   html = data.theirs;
      // }


      const messageContainer = document.getElementById("messages");
      messageContainer.innerHTML = messageContainer.innerHTML + data.html


      // reset after send
      msgInput.value = ""
      imageInput.value = ""
      sendButton.disabled = true;


      // console.log(data.participants)

      if (data.participants) {

        const participantsElement = document.getElementById("participants");

        if (participantsElement) {

          participantsElement.innerHTML = data.participants;

        }

      }

    }

  });

});