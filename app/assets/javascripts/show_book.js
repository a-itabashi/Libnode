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
        console.log(image.url)
        $("#book-title").append(title);
        $("#book-author").append(author);
        $("#book-saled_at").append(saled_at);
        $("#book-description").append(description);
        $("#book-upvotes").append(upvotes);
        if (typeof(image.url) == "undefined") {
          $("#book-image").attr("src", image);
        }else{
          $("#book-image").attr("src", image.url);
        }
        // places[0]以外に値は入らない
        $("#book-places").append(`棚: ${places[0].shelf} 行: ${places[0].row} 列: ${places[0].column}`)
        categories.forEach(function(v){
          $("#book-categories").append(v);
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
