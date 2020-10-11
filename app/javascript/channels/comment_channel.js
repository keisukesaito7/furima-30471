import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
      <div class="comment-box">
        <div class="comment-info">
          <p class="comment-user">${data.user.nickname}</p>
          <p class="comment-time">${data.comment.created_at}</p>
        </div>
        <p class="comment-text">${data.comment.text}</p>
      </div>
      `;
    const commentLists = document.getElementById('comment-lists');
    const newComment = document.getElementById('comment_text');
    commentLists.insertAdjacentHTML('afterbegin', html);
    newComment.value = "";
  }
});
