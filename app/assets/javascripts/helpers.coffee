load_datepicker=->
  $(".datepicker").each ->
    opts=
      format: 'DD.MM.YYYY'
    if $(this).data('min')
      opts['minDate']=$(this).data('min')
    $(this).datetimepicker opts
load_datetimepicker=->
  date = new Date()
  $(".datetimepicker").datetimepicker
    format: 'DD.MM.YYYY HH:mm'
    defaultDate: new Date(date.getFullYear(), date.getMonth(), date.getDate())

ready =->
  $('.selectpicker').selectpicker()
  load_datepicker()
  load_datetimepicker()

$(document).ready ready
$(document).on 'page:load', ready
$(document).on 'page:load datepicker:reload', load_datepicker
$(document).on 'page:load datetimepicker:reload', load_datetimepicker
