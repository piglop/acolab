$(document).ready ->
  updateWorkshopThumbnails = ->
    workshopThumbnails = $(".workshop-list .workshop")
    $.each ["name", "description", "last-update", "actions"], (part) ->
      items = workshopThumbnails.find(".#{this}")
      items.css(display: 'block', height: 'auto')
      max = 0
      $.each items, ->
        height = $(this).height()
        max = height if height > max
      items.css(height: max)
  updateWorkshopThumbnails()
  $(window).on "resize", updateWorkshopThumbnails
