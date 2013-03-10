$(document).ready ->
  updateArticleThumbnails = ->
    articleThumbnails = $(".article-list .article")
    $.each ["title", "description", "last-update", "actions"], (part) ->
      items = articleThumbnails.find(".#{this}")
      items.css(display: 'block', height: 'auto')
      max = 0
      $.each items, ->
        height = $(this).height()
        max = height if height > max
      items.css(height: max)
  updateArticleThumbnails()
  $(window).on "resize", updateArticleThumbnails
