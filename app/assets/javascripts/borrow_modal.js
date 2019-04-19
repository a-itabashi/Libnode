$(function() {
  showBorrowModal();
  hideBorrowModal();
})

function showBorrowModal () {
  $(".borrow-button").click(function() {
    $('#borrow-modal').modal('show');
  });
}

function hideBorrowModal () {
  $("#borrow-list-submit-button").click(function() {
    $('#borrow-modal').modal('hide');
  })
}
