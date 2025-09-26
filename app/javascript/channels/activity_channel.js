import consumer from "channels/consumer"

document.addEventListener("turbo:load", () => {
  
  const activity_list = document.getElementById("recent_activity_list");
  
  consumer.subscriptions.create("ActivityChannel", {
    connected() {
      console.log("activity section connected")
    },

    disconnected() {
      // Called when the subscription has been terminated by the server
    },

    received(data) {

      if (!activity_list || !data.activity_html) return;

      const tempDiv = document.createElement("div");
      tempDiv.innerHTML = data.activity_html.trim();

      const newToast = tempDiv.firstElementChild;
      if (!newToast) return;

      if (document.getElementById(newToast.id)) return;

      // Insert the new message at the top
      activity_list.insertAdjacentElement("afterbegin", newToast);


      while (activity_list.children.length > 5) {
        activity_list.removeChild(activity_list.lastElementChild);
      }

    }

  });

});