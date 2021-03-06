$(document).ready ->
  $(".wmd-input").each ->
    input = $(this)
    suffix = input.attr("data-suffix")
    converter = new Markdown.Converter()
    editor = new Markdown.Editor(converter, suffix)
    console.log editor
    
    editor.hooks.set "insertImageDialog", (callback) ->
      selector = $("#image-selector")
      images = selector.find("img[data-full-image-url]")
      closeButton = selector.find("[data-close]")
      saveButton = selector.find("[data-save]")
      urlInput = selector.find("[data-url-input]")
      
      selector.modal()
      
      finish = (url) ->
        selector.off('hide')
        images.off('click')
        closeButton.off('click')
        saveButton.off('click')
        saveButton.off('change')
        selector.modal('hide')
        callback(url)
      
      selector.on "hide", ->
        finish(null)
      
      updateSelectedImage = ->
        url = urlInput.val()
        images.removeClass("selected")
        images.filter(-> $(this).attr("data-full-image-url") == url).addClass("selected")
      
      images.css(cursor: "pointer").on "click", ->
        urlInput.val($(this).attr("data-full-image-url"))
        updateSelectedImage()
        
      urlInput.on "change", ->
        updateSelectedImage()
      
      closeButton.on "click", ->
        finish(null)
      
      saveButton.on "click", ->
        url = urlInput.val()
        if url and url != ""
          finish(url)
      
      true # tell the editor that we'll take care of getting the image url

    
    editor.run()
  
  $('#project-sidebar').affix
    offset: $('#project-sidebar').position()

  updateProjectThumbnails = ->
    projectThumbnails = $(".project-list .project")
    $.each ["title", "description", "actions", "author"], (part) ->
      items = projectThumbnails.find(".#{this}")
      items.css(display: 'block', height: 'auto')
      max = 0
      $.each items, ->
        height = $(this).height()
        max = height if height > max
      items.css(height: max)
  updateProjectThumbnails()
  $(window).on "resize", updateProjectThumbnails

  $("#project_contributor_ids").select2
    width: "100%"
