$(function () {
  $(".show-button").click(function() {
    let set_id = $(this).attr('id')
    return $.ajax({
      url: `books/${set_id}`,
      type: 'get',
      data: { set_id },
      dataType: 'json',
    }).done(function(response) {
      $(".book-image").empty();
      $(".book-title").empty();
      $(".book-author").empty();
      $(".book-image").append("<img src=" + response[0] + ">")
      $(".book-title").append(response[1])
      $(".book-author").append(response[2])
    }).fail(function() {
    });
  });
});
