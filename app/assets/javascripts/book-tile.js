$(function () {
  $("[data-toggle=popover]").popover()
  let container = document.querySelector('#masonry-gallery');

  imagesLoaded(container, function () {
    let msnry = new Masonry(container, {
      itemSelector: '.masonry-item',
      isFitWidth: true,
      columnWidth: 82,
    });
  });
})
