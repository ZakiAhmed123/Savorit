jQuery(document).ready(function($) {


  $(".Nashville").click(function() {
  $(".cropit-preview-image").data("filter", "Nashville");
  $(".cropit-preview-image").filterMe();
  });
  $(".1977").click(function() {
  $(".cropit-preview-image").data("filter", "1977");
  $(".cropit-preview-image").filterMe();
  });
  $(".Brannan").click(function() {
  $(".cropit-preview-image").data("filter", "Brannan");
  $(".cropit-preview-image").filterMe();
  });
  $(".Gotham").click(function() {
  $(".cropit-preview-image").data("filter", "Gotham");
  $(".cropit-preview-image").filterMe();
  });
  $(".Hefe").click(function() {
  $(".cropit-preview-image").data("filter", "Hefe");
  $(".cropit-preview-image").filterMe();
  });
  $(".Inkwell").click(function() {
  $(".cropit-preview-image").data("filter", "Inkwell");
  $(".cropit-preview-image").filterMe();
  });
  $(".LordKelvin").click(function() {
  $(".cropit-preview-image").data("filter", "Lord Kelvin");
  $(".cropit-preview-image").filterMe();
  });
  $(".xpro2").click(function() {
  $(".cropit-preview-image").data("filter", "X-PRO II");
  $(".cropit-preview-image").filterMe();
  });

$(function() {
  $('.image-editor').cropit({
    imageState: {
      src: 'http://lorempixel.com/500/400/',
    },
  });

  $('.rotate-cw').click(function() {
    $('.image-editor').cropit('rotateCW');
  });
  $('.rotate-ccw').click(function() {
    $('.image-editor').cropit('rotateCCW');
  });

  $('.export').click(function() {
    var imageData = $('.image-editor').cropit('export');
    window.open(imageData);
  });
});
});
