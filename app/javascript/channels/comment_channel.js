import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `<p><strong>${data.user_nickname}： </strong>${data.content}</p>`;
    const comments = document.getElementById('comments');
    const newMessage = document.getElementById('comment_text');
    comments.insertAdjacentHTML('beforeend', html);
    newMessage.value='';
  }
});
