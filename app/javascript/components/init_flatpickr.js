import flatpickr from 'flatpickr';

const initFlatpickr = () => {
  flatpickr('#publish_date_picker', {
    enableTime: true
  });
}

export default initFlatpickr;
