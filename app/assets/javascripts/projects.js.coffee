$(document).ready ->
  if $(".wmd-input").length > 0
    converter = new Markdown.Converter()
    editor = new Markdown.Editor(converter)
    
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
        selector.modal('hide')
        callback(url)
      
      selector.on "hide", ->
        finish(null)
        
      images.css(cursor: "pointer").on "click", ->
        finish($(this).attr("data-full-image-url"))
      
      closeButton.on "click", ->
        finish(null)
      
      saveButton.on "click", ->
        url = urlInput.val()
        if url and url != ""
          finish(url)
      
      true # tell the editor that we'll take care of getting the image url

    
    editor.run()
  
  $('#project-toc').affix
    offset: $('#project-toc').position()
