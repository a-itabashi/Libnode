$(function() {
  const modals = ["borrow", "return"];

  modals.forEach(function(v) {

    $(`.${v}-button`).click(function() {
      $(`#${v}-modal`).modal("show");
    });

    $(`.${v}-detail`).click(function() {
      let set_id = $(this).attr("id");
      $(`#${v}-modal`).modal("show");
      $(".book-number").val(set_id);
    });
    hideModal(v);
  });
})

function hideModal (target) {
  $(`#${target}-modal`).on("hide.bs.modal", function () {
    $('input[name="book_id"]').val("");
  });

  $("#borrow-list-submit-button").click(function() {
    $(`#${target}-modal`).modal("hide");
  });
};

