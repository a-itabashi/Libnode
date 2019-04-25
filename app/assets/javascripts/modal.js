$(function() {
  const modals = ["borrow", "return"];

  modals.forEach(function(v) {

    $(`.${v}-button`).click(function(e) {
      $(`#${v}-modal`).modal("show", e.target);
    });

    $(`.${v}-detail`).click(function() {
      let set_id = $(this).attr("id");
      $(`#${v}-modal`).modal("show");
      $(".book-number").val(set_id);
    });

    $(`#${v}-modal`).on("show.bs.modal", function (event) {
      var button = $(event.relatedTarget)
      $("video").removeAttr('id');
      $("video").attr('id', `video-${button.data("name")}`);
    })

    hideModal(v);
  });
})

function hideModal (target) {
  $(`#${target}-modal`).on("hide.bs.modal", function () {
    $('input[name="book_id"]').val("");
    v = document.getElementById(`video-${target}`)
    stream = v.srcObject
    track = stream.getTracks();
    track[0].stop();
  });

  $("#borrow-list-submit-button").click(function() {
    $(`#${target}-modal`).modal("hide");
  });
};

