$(function () {
  if (window.location.hash == "#purchase-request-modal") {
    $("#purchase-request-modal").modal("show");
  }

  $("#purchase-request-button").click(function(e) {
    $("#purchase-request-modal").modal("show", e.target);
    history.pushState(null, null, "#purchase-request-modal");
    $("#request-book-title").val(e.target.parentElement.children[1].textContent);
  });

  $("#purchase-request-modal").on("hide.bs.modal", function () {
    history.replaceState(null,null,"/");
  });
});
