$(function() {
  const modals = ["borrow", "return"];

  modals.forEach(function(v) {
    if (`#${v}-modal` == window.location.hash) {
      $(`#${v}-modal`).modal("show");
    }

    $(`.${v}-button`).click(function(e) {
      modals.forEach(function (v) {
        $(`#${v}-modal`).modal("hide");
        $(".book-number").val("")
      });
      $(`#${v}-modal`).modal("show", e.target);
      history.pushState(null, null, `#${v}-modal`);
    });

    $(`.${v}-detail`).click(function() {
      let set_id = $(this).attr("id");
      $(`#${v}-modal`).modal("show");
      $(".book-number").val(set_id);
      $('input[name="borrow_list[book_id]"]').val(set_id);
      history.pushState(null, null, `#${v}-modal`);
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
    history.replaceState(null,null,"/");

    if (target == "borrow"){
      v = document.getElementsByTagName("video")[0]
    }else if (target == "return"){
      v = document.getElementsByTagName("video")[1]
    }
    stream = v.srcObject
    if (stream != null){
      track = stream.getTracks();
      track[0].stop();
    }
  });

  $("#borrow-list-submit-button").click(function(e) {
    $(`#${target}-modal`).modal("hide");
  });
};
