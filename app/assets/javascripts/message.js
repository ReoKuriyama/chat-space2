$(function(){
  function buildHTML(message){
   if (message.image) {
      var ImageHTML = '<br><img src="' + message.image + '">';
    } else {
      var ImageHTML = '';
    }
    var html =
      '<li>' +
      '<div class="chat-body">' +
      '<p class="chat-body__username">' +
      message.name +
      '</p>' +
      '<p class="chat-body__time">' +
      message.time +
      '</p>' +
      '</div>' +
      '<p class="chat-body__message">' +
      message.body +
      ImageHTML +
      '</p>' +
      '</li>';
    return html
  }

  $('form#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data) {
      var html = buildHTML(data);
      $('.wrap ul').append(html)
      $('#message_body').val('')
    })
    .fail(function() {
      alert('error');
    })
  });
});
