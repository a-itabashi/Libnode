$ (function () {
  $("#q_categories_id_eq").change(function () {
    console.log("change");
    $(".search-btn").click();
  });
  $("#q_categories_id_eq").hover(function () {
    $(this).click();
  });
  $(".category-select").hover(function () {
    console.log("i")
    $("select [name=q[categories_id_eq]]").click();
  });
})
