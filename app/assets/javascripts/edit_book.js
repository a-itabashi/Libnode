$(function () {
  $(".edit-book").click(function(e) {
    if (e) e.preventDefault();
    // if (e) e.stopProvagation();
    let set_id = $(this).attr('id')
      $.ajax({
        // TODO: ドメイン名を変更
        url: `http://localhost:3000/books/${set_id}`,
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
          // ...inputResponse,
        } = response;

        let emptyTarget = new Array(Object.keys(response))
        emptyTarget[0].forEach(function(v){
          $(`#book-${v}`).val("");
        });
        $("#book-title").val(title);
        $("#book-author").val(author);
        $("#book-saled_at").val(saled_at);
        $("#book-description").val(description);
        $("#book-image").attr("src", image);
        // places[0]以外に値は入らない
        $("#book-shelf").val(places[0].shelf);
        $("#book-column").val(places[0].column);
        $("#book-row").val(places[0].row);

        $("#book-places").val(`棚: ${places[0].shelf} 行: ${places[0].row} 列: ${places[0].column}`)
        $("#book-categories").val(categories);
      }).fail(function() {
    });
  });
});
