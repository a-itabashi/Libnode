$(function() {
  $(".borrow-button").click(function() {
    $('#borrow-modal').modal('show');
  });

  $("#borrow-list-submit-button").click(function() {
    $('#borrow-modal').modal('hide');
  })
})
