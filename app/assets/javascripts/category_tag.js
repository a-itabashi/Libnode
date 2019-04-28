var tagList = ["こんにちは", "こんばんは","今晩は","春夏秋冬","寒いですね"];

$(document).ready(function() {
  $("#book-category-form").tagit({
    removeConfirmation: true,
    availableTags: tagList
  });
})
