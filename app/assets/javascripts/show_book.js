$(function () {
  $(".show-button").click(function(e) {
    if (e) e.preventDefault();
    // if (e) e.stopProvagation();
    let set_id = $(this).attr('id')
      $.ajax({
        url: `books/${set_id}`,
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

        $("#book-title").append(title);
        $("#book-author").append(author);
        $("#book-saled_at").append(saled_at);
        $("#book-description").append(description);
        $("#book-upvotes").append(upvotes);
        $("#book-image").append("<img src=" + image + ">");
        // places[0]以外に値は入らない
        $("#book-places").append(`棚: ${places[0].shelf} 行: ${places[0].row} 列: ${places[0].column}`)
        categories.forEach(function(v){
          $("#book-categories").append(v);
        });
        if ( available == true ) {
          $(".return-detail").hide()
          $(".borrow-detail").show()
          $(".borrow-detail").text( "借りる" )
        } else if ( available == false ) {
          $(".borrow-detail").hide()
          $(".return-detail").show()
          $(".return-detail").text( "返す" )
        }
      }).fail(function() {
    });
  });
});
