$(function() {
  showReturnModal();
  hideReturnModal();
})

function showReturnModal () {
  $(".return-button").click(function() {
    $("#return-modal").modal("show");
  });

  $(".return-detail").click(function() {
    let set_id = $(this).attr("id");
    $("#return-modal").modal("show");
    $(".book-number").val(set_id);
  });
};

function hideReturnModal () {
  $("#borrow-list-submit-button").click(function() {
    $("#return-modal").modal("hide");
  });

  $("#return-modal").on("hide.bs.modal", function () {
    $(".book-number").val("");
  });
};
