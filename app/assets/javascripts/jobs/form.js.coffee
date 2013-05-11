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

  # $("#slider-range").slider
  #   range: true
  #   min: 0
  #   max: 500
  #   values: [75, 300]
  #   slide: (event, ui) ->
  #     $("#amount").val "$" + ui.values[0] + " - $" + ui.values[1]

  # $("#amount").val "$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1)