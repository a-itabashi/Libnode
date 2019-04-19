$(function() {
  showReturnModal();
  hideReturnModal();
})

function showReturnModal () {
  $(".return-button").click(function() {
    $('#return-modal').modal('show');
  });
}

function hideReturnModal () {
  $("#borrow-list-submit-button").click(function() {
    $('#return-modal').modal('hide');
  })
}
