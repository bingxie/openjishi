$(document).ready(function(){
  // disable auto discover
  Dropzone.autoDiscover = false;

  if ($('.dropzone').length) {

    var dropzone = new Dropzone (".dropzone", {
      maxFilesize: 256, // set the maximum file size to 256 MB
      paramName: "product_image[image]", // Rails expects the file upload to be something like model[field_name]
      addRemoveLinks: true // don't show remove links on dropzone itself.
    });

    dropzone.on("success", function(file) {
      this.removeFile(file);
      $.getScript("/product_images");
    })
  }
});
