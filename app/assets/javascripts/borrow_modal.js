$(function() {
  showBorrowModal();
  hideBorrowModal();
})

function showBorrowModal () {
  $(".borrow-button").click(function() {
    $("#borrow-modal").modal("show");
  });

  $(".borrow-detail").click(function() {
    let set_id = $(this).attr("id")
    $("#borrow-modal").modal("show");
    $(".book-number").val(set_id);
  });
}

function hideBorrowModal () {
  $("#borrow-list-submit-button").click(function() {
    $("#borrow-modal").modal("hide");
  })

  $("#borrow-modal").on("hide.bs.modal", function () {
    $(".book-number").val("");
  });
}
