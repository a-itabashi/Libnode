$(function () {
  $(".show-rank-book").click(function(e) {
    if (e) e.preventDefault();
    let set_id = $(this).attr('id')
      $.ajax({
        url: `${gon.domain}/trends/${set_id}`,
        type: 'get',
        data: { set_id },
        dataType: 'json',
      }).done(function(response) {
        const {
          title,
          author,
          link,
          image,
          // ...inputResponse,
        } = response;
        let emptyTarget = new Array(Object.keys(response))
        emptyTarget[0].forEach(function(v){
          $(`#book-${v}`).empty();
        });
        $(".trend-book-detail-init").hide();
        $(".trend-book-detail").show();
        $("#book-image").attr("src", image);
        $("#book-title").text(title);
        $("#book-author").text(author);
        $("#book-link").attr("href", link).text("Amazonリンク")
        $("#purchase-request-button").text("購入リクエスト")
      }).fail(function() {
    });
  });
});
