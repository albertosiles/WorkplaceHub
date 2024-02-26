document.addEventListener('DOMContentLoaded', function () {
  flatpickr('#booking_start_date', {
    enableTime: false,
    dateFormat: 'Y-m-d',
    minDate: 'today',
    disable: <%= @unavailable_dates.to_json.html_safe %>
  });

  flatpickr('#booking_end_date', {
    enableTime: false,
    dateFormat: 'Y-m-d',
    minDate: 'today',
    disable: <%= @unavailable_dates.to_json.html_safe %>
  });
});
