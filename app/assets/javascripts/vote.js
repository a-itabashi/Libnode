function upvote () {
  $(".upvote-button").click(function(e) {
    if (e) e.preventDefault();
    let set_id = $(this).attr('id')
    $.ajax({
      url: `${gon.domain}/books/${set_id}/upvotes`,
      type: 'post',
      dataType: 'json',
    }).done(function(response) {
      $("#book-upvotes").empty();
      $("#book-upvotes").append(`<button class="downvote-button" id=${set_id}>いいねを取り消す${count}`);
    });
  });
}
