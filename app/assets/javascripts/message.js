$(function(){
  function buildHTML(message){
    var ImageHTML = message.image ?
    '<br><img src="' + message.image + '">': '';
    var html =
      '<li data-message-id="' + message.id + '">' +
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

   function insertNew(message, lastId){
    if (message.id > lastId){
      html += buildHTML(message);
    }
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
      $("form#new_message")[0].reset();

      // formの入力を再度有効化する
      $("input").prop('disabled', false);

      $(".message_list").scrollTop($(".message_list")[0].scrollHeight);
    })
    .fail(function() {
      alert('error');
    })
  });

  //自動更新機能
  if (window.location.href.match(/\/groups\/\d+\/messages/)){
    var tenSecond = 10000
    setInterval(function(){
      var url = window.location.href
      $.ajax({
        url: url,
        type: "GET",
        dataType: 'json',
      })
      .done(function(messages){
        var lastId = $('.message_list li:last').data('messageId');
        var html = "";
        messages.forEach(function(message){
          insertNew(message ,lastId);
        });

        $('.wrap ul').append(html)
      })
      .fail(function() {
        alert('error');
      })
    }, tenSecond);// 10秒
  }
});
