// ページ読み込みと同時に借りるor返すボタンを非表示
// ページ読み込み段階で当該ボタンを表示しておかないとモーダルの起動が出来ない
$(function () {
  $(".borrow-detail").hide();
  $(".return-detail").hide();
  $(".image-text-field").hide();
  $(".upvote-button").hide();
  $(".downvote-button").hide();
});
