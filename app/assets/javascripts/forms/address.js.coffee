$ ->
  unless $(".filter-control").val() != ""
    $("#city-select").hide()

  cities = $(".filter-response").html()

  $(".filter-control").change ->
    region  = $(".filter-control :selected").text()
    options = $(cities).filter("optgroup[label='#{region}']").html()
    if options
      $(".filter-response").html(options)
      $("#city-select").slideDown()
