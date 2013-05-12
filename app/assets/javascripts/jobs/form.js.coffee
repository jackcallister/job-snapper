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

  $('.label-error-fix').parent().add_class('error')
