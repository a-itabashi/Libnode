$(function () {
  $(".fetch-book").click(function(e) {
    if (e) e.preventDefault();
    let isbn = $(".isbn").val();
      $.ajax({
        url: "/admin/fetch_books",
        type: 'get',
        data: { isbn },
        dataType: 'json',
      }).done(function(response) {
        const {
          title,
          author,
          saled_at,
          price,
          description,
          image,
          // ...inputResponse,
        } = response.params;
        console.log(image);
        $("#book-title").val(title);
        $("#book-author").val(author);
        $("#book-saled_at").val(saled_at);
        $("#book-price").val(price);
        $("#book-description").val(description);
        $("#book-image")[0].files[0].name(image);
      }).fail(function() {
    });
  });
});
