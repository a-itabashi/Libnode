$(function () {
  $(".book-delete").click(function(e) {
    if (e) e.preventDefault();
    let set_id = $(this).attr('id')
    $.ajax({
      url: `${gon.domain}/admin/books/${set_id}`,
      type: 'delete',
      dataType: 'json',
    }).done(function() {
    }).fail(function() {
    }).always(function(){
      window.location.href = `${gon.domain}/admin/books/edit`;
    });
  });
});
