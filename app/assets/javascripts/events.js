// $(document).ready(function () {
$(document).on('turbolinks:load', function () {
  $("#event_conducted_at").datepicker({
    autoclose: true,
    format: "dd/mm/yyyy"
  });
});