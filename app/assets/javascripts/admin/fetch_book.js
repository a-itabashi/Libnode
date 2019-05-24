$(function () {
  $(".image-text-field").hide();
  $(".fetch-book").click(function(e) {
    if (e) e.preventDefault();
    let isbn = $(".isbn").val();
      $.ajax({
        url: "/admin/fetch_books",
        type: 'get',
        data: { isbn },
        dataType: 'json',
      }).done(function(response) {
        $(".error-area").text("");
        const {
          title,
          author,
          saled_at,
          price,
          description,
          image,
          // ...inputResponse,
        } = response.params;
        debugger
        let emptyTarget = new Array(Object.keys(response.params))
        emptyTarget[0].forEach(function(v){
          $(`#book-${v}`).empty();
        });
        $(".area").empty();

        $("#book-title").val(title);
        $("#book-author").val(author);
        $("#book-saled_at").val(saled_at);
        $("#book-price").val(price);
        $("#book-description").val(description);

        $(".image-file-field").hide();
        $("#book-image").val(image);
        $(".area").append("<img src=" + image + ">");
      }).fail(function() {
        $(".error-area").text("書籍取得エラー");
    });
  });
});
