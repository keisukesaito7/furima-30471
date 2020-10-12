import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    function formatDate (date, format) {
      format = format.replace(/yyyy/g, date.getFullYear());
      format = format.replace(/MM/g, ('0' + (date.getMonth() + 1)).slice(-2));
      format = format.replace(/dd/g, ('0' + date.getDate()).slice(-2));
      format = format.replace(/HH/g, ('0' + date.getHours()).slice(-2));
      format = format.replace(/mm/g, ('0' + date.getMinutes()).slice(-2));
      return format;
    };

    const convertDate = new Date(data.comment.created_at);
    const reFormatDate = formatDate(convertDate, 'yyyy/MM/dd HH:mm');

    const html = `
      <div class="comment-box">
        <div class="comment-info">
          <p class="comment-user">${data.user.nickname}</p>
          <p class="comment-time">${reFormatDate}</p>
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
