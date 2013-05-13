$ ->
  $slider = $("#pay-slider")
  $slider.slider
    range: true
    values: [$('input#job_pay_rate_min').val(), $('input#job_pay_rate_max').val()],
    min: 13
    max: 100
    orientation: "horizontal"
    slide: (event, ui) ->
      $slider.find(".ui-slider-value:first").text("$" + ui.values[0]).end().find(".ui-slider-value:last").text "$" + ui.values[1]
      $("#job_pay_rate_min").val(ui.values[0])
      $("#job_pay_rate_max").val(ui.values[1])

  $('.label-error-fix').parent().addClass('error')

  # jQuery UI Datepicker
  $("#datepicker-start-date").datepicker(
    showOtherMonths: true
    selectOtherMonths: true
    dateFormat: "d MM, yy"
    yearRange: "-1:+1"
  ).prev(".btn").on "click", (e) ->
    e and e.preventDefault()
    $("#datepicker-start-date").focus()

  $.extend $.datepicker,
    _checkOffset: (inst, offset, isFixed) ->
      offset
