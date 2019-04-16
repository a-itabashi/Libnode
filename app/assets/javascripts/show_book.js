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
          author,
          borrowed_num,
          description,
          id,
          image,
          price,
          saled_at,
          title,
          // ...inputResponse,
        } = response;
        $(".book-image").empty();
        $(".book-title").empty();
        $(".book-author").empty();
        $(".book-image").append("<img src=" + image + ">");
        $(".book-title").append(title);
        $(".book-author").append(author);
      }).fail(function() {
    });
    // return false;
  });
});
