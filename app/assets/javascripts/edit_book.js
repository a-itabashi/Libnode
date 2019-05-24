$(function () {
  $(".edit-book").click(function(e) {
    if (e) e.preventDefault();
    // if (e) e.stopProvagation();
    let set_id = $(this).attr('id')
      $.ajax({
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

        $(".book-detail-edit-init").hide();
        $(".book-edit").show();
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
          $("#book-shelf").val(places[0].shelf)
          $("#book-row").val(places[0].row)
          $("#book-column").val(places[0].column)
        }

        $("#book-categories").tagit();
        $("#book-categories").tagit("removeAll");
        categories.forEach(function(v){
          $("#book-categories").tagit("createTag", v);
        });

        $(".update-book").attr("id", `${set_id}`)
        $(".book-delete").attr("id", `${set_id}`)
      }).fail(function() {
    });
  });
});
