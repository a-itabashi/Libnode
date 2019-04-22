// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require rails-ujs
//= require bootstrap
//= require activestorage
//= require jsqrcode/src/alignpat
//= require jsqrcode/src/bitmat
//= require jsqrcode/src/bmparser
//= require jsqrcode/src/datablock
//= require jsqrcode/src/databr
//= require jsqrcode/src/datamask
//= require jsqrcode/src/decoder
//= require jsqrcode/src/detector
//= require jsqrcode/src/errorlevel
//= require jsqrcode/src/findpat
//= require jsqrcode/src/formatinf
//= require jsqrcode/src/gf256
//= require jsqrcode/src/gf256poly
//= require jsqrcode/src/grid
//= require jsqrcode/src/qrcode
//= require jsqrcode/src/rsdecoder
//= require jsqrcode/src/version
//= require_tree .

$.ajaxSetup({
  headers: {
    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
  }
});

function file_selected(file_field){
  var filename = $(file_field)[0].files[0].name;
  $("#filename").val(filename);
}
