function file_selected(file_field){
  var filename = $(file_field)[0].files[0].name;
  $("#filename").val(filename);
}
