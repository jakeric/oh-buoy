import flatpickr from 'flatpickr';

const toggleDateInputs = function() {
  const disabledDates = document.querySelector('.buoy-show-datepicker').getAttribute('disable-dates');
  const startDateinput = document.getElementById('booking_start_date');
  const endDateinput = document.getElementById('booking_end_date');

  flatpickr(startDateinput, {
    mode: "range",
    minDate: 'today',
    dateFormat: "Y-m-d",
    disable: JSON.parse(disabledDates),
    onChange: function(_, selectedDate) {
      let splitted = selectedDate.split(" to ");
      startDateinput.value = splitted[0];
      endDateinput.value = splitted[1];
    }});
};

export { toggleDateInputs }
