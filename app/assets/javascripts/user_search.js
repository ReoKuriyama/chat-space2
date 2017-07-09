$(function() {
  function buildHTML(todo) {
    var html =
    '<p>' +
    'test'+
    '</p>'
    return html;
  }

  $("#user-search-field").on("keyup", function() {
    var input = $("#user-search-field").val();
    console.log(input)
    $.ajax({
      type: 'GET',
      url: '/users',
      data: { keyword: input },
      dataType: 'json'
    })

    .done(function(products) {
      console.log('success')
    })
    .fail(function() {
      alert('ユーザー検索に失敗しました');
    })
  });
});
