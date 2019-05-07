$(function () {
  $("#purchase-request-button").click(function(e) {
    $("#purchase-request-modal").modal("show", e.target);
    $("#request-book-title").val(e.target.parentElement.children[1].textContent);
  });
});
