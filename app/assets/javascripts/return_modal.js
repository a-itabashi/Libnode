$(function() {
  $(".return-button").click(function() {
    $('#return-modal').modal('show');
  });

  $("#borrow-list-submit-button").click(function() {
    $('#return-modal').modal('hide');
  })
})
