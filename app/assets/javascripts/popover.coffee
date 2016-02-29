popover_reload = ->
  $("[data-toggle=popover]").popover
    viewport:
      selector: '.table-cal'
      padding: 0
    placement: 'auto'

ready =->
  $("[data-toggle=tooltip]").tooltip()
  popover_reload()

$(document).ready ready
$(document).on 'page:load', ready
$(document).on 'popover:reload', popover_reload
