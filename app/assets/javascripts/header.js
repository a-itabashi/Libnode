$ (function () {
  $("#q_categories_id_eq").change(function () {
    console.log("change");
    $(".search-btn").click();
  });
})
