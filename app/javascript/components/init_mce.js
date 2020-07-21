const initMCE = () => {
  if(document.querySelector('.tinymce')){
    tinymce.init({
      selector: '.tinymce',
      menubar: false,
      plugins: "link table lists searchreplace visualblocks code fullscreen insertdatetime media paste help wordcount autolink  emoticons",
      toolbar: [
        "undo redo | styleselect | bold italic backcolor | alignleft aligncenter alignright | bullist numlist outdent indent | link | table | code | help | emoticons | insertdatetime"
      ]
    });
  }

}

export default initMCE;
