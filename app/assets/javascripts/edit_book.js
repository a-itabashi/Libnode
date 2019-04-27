$(function () {
  $(".edit-book").click(function(e) {
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
        if (typeof(image.url) == "undefined") {
          $("#book-image").attr("src", image);
        }else{
          $("#book-image").attr("src", image.url);
        }
        // places[0]以外に値は入らない
        if (places.length != 0) {
          $("#book-places").val(`棚: ${places[0].shelf} 行: ${places[0].row} 列: ${places[0].column}`)
        }
        categories.forEach(function(v){
          $("#book-categories").append(v);
        });
        $(".book-delete").attr("id", `${set_id}`)
        // TODO: ドメイン名を変更
        $(".update-form").attr("action", `${gon.domain}admin/registrations/${set_id}`).attr("method", "PATCH")
      }).fail(function() {
    });
  });
});
