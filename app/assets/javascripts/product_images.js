$(document).ready(function(){
  // disable auto discover
  Dropzone.autoDiscover = false;

  if ($('.dropzone').length) {

    var dropzone = new Dropzone (".dropzone", {
      maxFilesize: 2, // set the maximum file size to 2 MB
      paramName: "product_image[image]", // Rails expects the file upload to be something like model[field_name]
      addRemoveLinks: true, // fales: don't show remove links on dropzone itself.
      maxFiles: 3,
      forceFallback: false, // Open for test
      dictDefaultMessage: '拖拽图片到这里',
      dictRemoveFile: '删除',
    });

    dropzone.on("success", function(file) {
      // this.removeFile(file);
      // $.getScript("/product_images");  # refresh upload file list
    });

    dropzone.on("removedfile", function(file) {
      console.log('file removed');
    });
  }
});
