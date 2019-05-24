$.ajaxSetup({
  headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
  }
});

$(function () {
  $(".book-detail").hide();
  $(".trend-book-detail").hide();
  $("#purchase-request-modal").hide();
});

$(function remove_flash_after_fixed_time () {
  setTimeout("$('.alert').fadeOut()", 3000)
})

$(function () {
  $("[data-toggle=popover]").popover()
})
