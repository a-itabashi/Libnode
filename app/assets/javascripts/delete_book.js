$(function () {
  $(".book-delete").click(function(e) {
    if (e) e.preventDefault();

    let set_id = $(this).attr('id')
      $.ajax({
        // TODO: ドメイン名を変更
        url: `http://localhost:3000/admin/books/${set_id}`,
        type: 'delete',
        dataType: 'json',
      }).done(function(response) {

        // TODO: ドメイン名を変更
        window.location.href = "http://localhost:3000/admin/book_collection_list/edit";
      }).fail(function() {
    });
  });
});
