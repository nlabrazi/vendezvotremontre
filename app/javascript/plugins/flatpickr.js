import flatpickr from "flatpickr"
import 'flatpickr/dist/flatpickr.min.css'
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const initFlatPicker = () => {
  const bookingForm = document.getElementById('form-booking');

  if (bookingForm) {
    flatpickr(".flatpickr", {});
  };
};

export { initFlatPicker };
