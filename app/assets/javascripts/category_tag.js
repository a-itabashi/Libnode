$(document).ready(function() {
  $.ajax({
    url: `${gon.domain}/categories`,
    type: "get",
    dataType: 'json',
    success: function (data) {
        $("#book-category-form").tagit({
            availableTags: data
        })
    }
  })
})
