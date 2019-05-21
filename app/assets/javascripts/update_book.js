$(function () {
  $(".update-book").click(function(e) {
    if (e) e.preventDefault();
    let set_id = $(this).attr('id');
    params = {
      book_registration_form_update: {
        id: set_id,
        title: $("#book-title").val(),
        image_raw_url: $("#book-image").attr("src"),
        author: $("#book-author").val(),
        saled_at: $("#book-saled_at").val(),
        description: $("#book-description").val(),
        places_attributes: {
          shelf: $("#book-shelf").val(),
          row: $("#book-row").val(),
          column: $("#book-column").val()
        },
        categories_attributes: { name: $("#book-categories").val() }
      }
    }
      $.ajax({
        url: `${gon.domain}/admin/registrations/${set_id}`,
        type: 'patch',
        data: params,
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
        debugger
        let emptyTarget = new Array(Object.keys(response))
        emptyTarget[0].forEach(function(v){
          $(`#book-${v}`).val("");
        });

        $(".book-detail-init").hide();
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

        $(".book-delete").attr("id", `${set_id}`)
        $(".book-delete").attr("id", `${set_id}`)
      }).fail(function() {
    });
  });
});
