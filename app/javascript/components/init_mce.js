const initMCE = () => {
  if(document.querySelector('.tinymce')){
    tinymce.remove();
    tinymce.init({
      selector: 'textarea',
      menubar: false,
      plugins: "image link table lists searchreplace visualblocks code fullscreen insertdatetime media paste help wordcount autolink imagetools emoticons",
      toolbar: [
        "undo redo | styleselect | bold italic backcolor | alignleft aligncenter alignright | bullist numlist outdent indent | image | link | table | code | help",
        "emoticons | insertdatetime"
      ]
    });
  }

}

export default initMCE;
