import select2 from 'select2'

const initSelect2 = () => {
  $('#tag_picker').select2({
    tags: true
  });
}

export default initSelect2;
