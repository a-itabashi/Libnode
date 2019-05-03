$(function () {
  $(".show-book").click(function(e) {
    if (e) e.preventDefault();
    // if (e) e.stopProvagation();
    let set_id = $(this).attr('id')
      $.ajax({
        // TODO: ドメイン名を変更
        url: `${gon.domain}/books/${set_id}`,
        type: 'get',
        data: { set_id },
        dataType: 'json',
      }).done(function(response) {
        const {
          title,
          author,
          saled_at,
          description,
          image,
          categories,
          places,
          upvotes,
          available
          // ...inputResponse,
        } = response;
        let emptyTarget = new Array(Object.keys(response))
        emptyTarget[0].forEach(function(v){
          $(`#book-${v}`).empty();
        });
        $(".book-detail-wrapper").show();
        $("#book-title").append(title);
        $("#book-author").append(author);
        $("#book-saled_at").append(saled_at);
        $("#book-description").append(description);

        if (upvotes.is_push == true) {
          $(".downvote-button").hide();
          $(".upvote-button").removeAttr('id');
          $(".upvote-button").attr('id', set_id);
          $(".upvote-button").show();
          $(".upvotes-count").empty();
          $(".upvotes-count").append(`${upvotes.count}人がいいね！`);
          upvotes.recentry_user.forEach(function(v){
            $(".upvotes-count").append(`<img src=${v}>`);
          })
        }else if (upvotes.is_push == false) {
          $(".upvote-button").hide();
          $(".downvote-button").removeAttr('id');
          $(".downvote-button").attr('id', set_id);
          $(".downvote-button").show();
          $(".upvotes-count").empty();
          $(".upvotes-count").append(`${upvotes.count}人がいいね！`);
          upvotes.recentry_user.forEach(function(v){
            $(".upvotes-count").append(`<img src=${v}>`);
          })
        } else {
          $(".downvote-button").hide();
          $(".upvote-button").hide();
        }

        if (typeof(image.url) == "undefined") {
          $("#book-image").attr("src", image);
        }else{
          $("#book-image").attr("src", image.url);
        }
        // places[0]以外に値は入らない
        if (places.length != 0) {
          $("#book-places").append(`棚: ${places[0].shelf} 行: ${places[0].row} 列: ${places[0].column}`)
        }
        categories.forEach(function(v){
          $("#book-categories").append(`<span id="tag">${v}</span>`);
        });

        if ( available == true ) {
          $(".btn-lending").hide().removeAttr('id');
          $(".borrow-detail").show().attr("id", `${set_id}`).text( "借りる" )
          $("#book-image").removeClass("black-filter");
        } else if ( available == false ) {
          $(".borrow-detail").hide().removeAttr('id');
          $(".btn-lending").show().text( "貸出中" )
          $("#book-image").addClass("black-filter");
        }
      }).fail(function() {
    });
  });
});
