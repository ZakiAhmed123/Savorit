$(window).ready(function(){
  $('.rotate-cw').click(function() {
  $('.image-editor').cropit('rotateCW');
});
$('.rotate-ccw').click(function() {
  $('.image-editor').cropit('rotateCCW');
});
  $('#image-cropper').cropit();
  // In the demos I'm passing in an imageState option
  // so it renders an image by default:
  // $('#image-cropper').cropit({ imageState: { src: { imageSrc } } });
  // Exporting cropped image
  $('.download-btn').click(function() {
    var imageData = $('#image-cropper').cropit('export');
    window.open(imageData);
  });
  $(".cropit-save").click(function(){
    var imageData = $('#image-cropper').cropit('export');
    if (!imageData){
      return false;
    }
    var file= dataURLtoBlob(imageData);
    // Create new form data
    var fd = new FormData();
    // Append our Canvas image file to the form data
    fd.append("post[photo]", file);
    // And send it
    $.ajax({
       url: "/users/:id/feed",
       type: "POST",
       data: fd,
       processData: false,
       contentType: false,
       statusCode: {
        422: function() {
          alert( "error" );
        },
        200: function() {
          window.location = "/users/:id/feed";
        }
      }
    })
  })
  function dataURLtoBlob(dataURL) {
    // Decode the dataURL
    var binary = atob(dataURL.split(',')[1]);
    // Create 8-bit unsigned array
    var array = [];
    for(var i = 0; i < binary.length; i++) {
        array.push(binary.charCodeAt(i));
    }
    // Return our Blob object
    return new Blob([new Uint8Array(array)], {type: 'image/png'});
  }
})
