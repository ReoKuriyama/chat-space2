$(function(){
  $('#new-message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData('#new-message-form');
    console.log(formData);
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
      $('.todos').append(html);
      textField.val('');
    })
    .fail(function() {
      alert('error');
    })
  });
});
