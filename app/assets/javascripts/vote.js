$(function upvote () {
  $(".upvote-button").click(function(e) {
    if (e) e.preventDefault();
    let set_id = $(this).attr('id')
    $.ajax({
      url: `${gon.domain}/books/${set_id}/upvotes`,
      type: 'post',
      dataType: 'json',
    }).done(function(response) {
      const count = response.upvotes.count
      const recentry_user = response.upvotes.recentry_user
      $(".upvote-button").hide();
      $(".downvote-button").removeAttr('id');
      $(".downvote-button").attr('id', set_id);
      $(".downvote-button").show();
      $(".upvotes-count").empty();
      $(".upvotes-count").append(`${count}人がいいね！`);
      recentry_user.forEach(function(v, i){
        $(".upvotes-count").append(`<img src=${v}>`);
        if (i == 2 && count > 3){
          $(".upvotes-count").append("...");
        }
      })
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
      const count = response.upvotes.count
      const recentry_user = response.upvotes.recentry_user
      $(".downvote-button").hide();
      $(".upvote-button").removeAttr('id');
      $(".upvote-button").attr('id', set_id);
      $(".upvote-button").show();
      $(".upvotes-count").empty();
      $(".upvotes-count").append(`${count}人がいいね！`);
      recentry_user.forEach(function(v, i){
        $(".upvotes-count").append(`<img src=${v}>`);
        if (i == 2 && count > 3){
          $(".upvotes-count").append("...");
        }
      })
    });
  });
})
