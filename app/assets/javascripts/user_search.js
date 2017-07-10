$(function() {
  function appendUser(user) {
    var html =
    '<div class="chat-group-user clearfix">' +
      '<p class="chat-group-user__name">' +
      user.name +
      '</p>' +
      '<a class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-user-id="' + user.id + '" data-user-name="' + user.name + '">追加' +
      '</a>' +
      '</div>';
    return html;
  }

  function addUser(id, name){
    var html =
      '<div class="chat-group-user clearfix" id="chat-group-user-' + id +  '">' +
      '<input type="hidden" name="group[user_ids][]" value="' + id + '">' +
      '<p class="chat-group-user__name">' +
      name +
      '</p>' +
      '<a class="user-search-remove chat-group-user__btn chat-group-user__btn--remove" data-user-id="' + id + '">削除' +
      '</a>' +
      '</div>';
    return html
  }

  $("#user-search-field").on("keyup", function() {
    var input = $("#user-search-field").val();
    $.ajax({
      type: 'GET',
      url: '/users',
      data: {
        name: input
      },
      dataType: 'json'
    })

    .done(function(users) {
      var html = "";
      users.forEach(function(user){
        html += appendUser(user);
      });

      $('#user-search-result').html(html)
    })
    .fail(function() {
      alert('ユーザー検索に失敗しました');
    })
  });

  // 検索結果に出てきたユーザーにイベントを設定
  $('#user-search-result').on('click', '.user-search-add', function(){
    var id = $(this).data('userId');
    var name = $(this).data('userName');
    var html = addUser(id, name);

    $('#chat-group-users').append(html);

    $(this).parent('.chat-group-user').remove();
  });

  // 削除ボタンのイベント
  $('#chat-group-users').on('click', '.user-search-remove', function(){
    var id = $(this).data('userId');
    $('#chat-group-user-' + id).remove();
  })
});
