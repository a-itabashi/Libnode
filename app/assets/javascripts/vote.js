$(function upvote () {
  $(".upvote-button").click(function(e) {
    if (e) e.preventDefault();
    let set_id = $(this).attr('id')
    $.ajax({
      url: `${gon.domain}/books/${set_id}/upvotes`,
      type: 'post',
      dataType: 'json',
    }).done(function(response) {
      const count = response.count
      $(".upvote-button").hide();
      $(".downvote-button").removeAttr('id');
      $(".downvote-button").attr('id', set_id);
      $(".downvote-button").show();
      $(".upvotes-count").empty();
      $(".upvotes-count").append(count);
    });
  });

  $(".downvote-button").click(function(e) {
    if (e) e.preventDefault();
    let set_id = $(this).attr('id')
    $.ajax({
      url: `${gon.domain}/upvotes/${set_id}`,
      type: 'delete',
      dataType: 'json',
    }).done(function(response) {
      const count = response.count
      $(".downvote-button").hide();
      $(".upvote-button").removeAttr('id');
      $(".upvote-button").attr('id', set_id);
      $(".upvote-button").show();
      $(".upvotes-count").empty();
      $(".upvotes-count").append(count);
    });
  });
})
