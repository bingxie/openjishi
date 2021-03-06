$(document).ready(() => {
  // disable auto discover
  Dropzone.autoDiscover = false;

  if ($('#new_product.dropzone').length) {

    const dropzone = new Dropzone (".dropzone", {
      url: "/product_images",
      maxFilesize: 2, // set the maximum file size to 2 MB
      paramName: "product_image[image]", // Rails expects the file upload to be something like model[field_name]
      addRemoveLinks: true, // fales: don't show remove links on dropzone itself.
      maxFiles: 6,
      forceFallback: false, // Open for test
      previewsContainer: ".dropzone-previews",
      // dictDefaultMessage: '拖拽图片到这里',
      dictRemoveFile: '删除',
      dictMaxFilesExceeded: '图片上传失败, 最多上传20张',
      dictFileTooBig: '图片上传失败, 尺寸需小于2M',
    });

    dropzone.on("success", (file, response) => {
      $(file.previewTemplate).append('<span class="hidden server_file_id">'+response.fileID+'</span>');
    });

    dropzone.on("removedfile", (file) => {
      const fileID = $(file.previewTemplate).children('.server_file_id').text();
      $.ajax({
        url: "/product_images/" + fileID,
        type: 'DELETE',
      });
    });
  }
});
