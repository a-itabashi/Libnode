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
          upvotes
          // ...inputResponse,
        } = response;

        let target = new Array(Object.keys(response))

        target[0].forEach(function(v){
          $(`#book-${v}`).empty();
        });

        $("#book-title").append(title);
        $("#book-author").append(author);
        $("#book-saled-at").append(saled_at);
        $("#book-upvotes").append(upvotes);
        $("#book-description").append(description);
        $("#book-image").append("<img src=" + image + ">");
        categories.forEach(function(v){
          $("#book-categories").append(v);
        });


      }).fail(function() {
    });
    // return false;
  });
});
