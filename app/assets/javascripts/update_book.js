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
    }).done(function() {
    }).fail(function() {
    }).always(function() {
      window.location.href = `${gon.domain}/admin/books/edit`;
    });
  });
});
