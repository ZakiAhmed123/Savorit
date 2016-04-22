$(window).ready(function() {
  // Filtering
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

  // Rotating
  $('.rotate-cw').click(function() {
    $('#image-cropper').cropit('rotateCW');
  });
  $('.rotate-ccw').click(function() {
    $('#image-cropper').cropit('rotateCCW');
  });
// Cropping and Sending to database
  $('#image-cropper').cropit();
  $("#form_id").on("submit", function(event) {
    event.preventDefault();
    var imageData = $('#image-cropper').cropit('export');
    if (!imageData) {
      return false;
    }
    var file = dataURLtoBlob(imageData);
    var description = document.getElementById("description").value;
    var location = document.getElementById("location").value;
    var culture = document.getElementById("culture").value;
    var name = document.getElementById("name").value;
    var price = document.getElementById("price").value;
    // Create new form data
    var fd = new FormData();
    // Append our Canvas image file to the form data
    fd.append("post[photo]", file);
    fd.append("post[description]", description);
    fd.append("post[location]", location);
    fd.append("post[culture]", culture);
    fd.append("post[name]", name);
    fd.append("post[price]", price);
    // And send it
    $.ajax({
      url: "/users/5/feed",
      type: "POST",
      data: fd,
      processData: false,
      contentType: false,
      statusCode: {
        422: function() {
          alert("error");
        },
        200: function() {
          window.location = "/users/5/feed";
        }
      }
    });
  })

  function dataURLtoBlob(dataURL) {
    // Decode the dataURL
    var binary = atob(dataURL.split(',')[1]);
    // Create 8-bit unsigned array
    var array = [];
    for (var i = 0; i < binary.length; i++) {
      array.push(binary.charCodeAt(i));
    }
    // Return our Blob object
    return new Blob([new Uint8Array(array)], {
      type: 'image/png'
    });
  }
})
