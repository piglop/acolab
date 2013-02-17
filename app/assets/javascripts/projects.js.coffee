$(document).ready ->
  if $(".wmd-input").length > 0
    converter = new Markdown.Converter()
    editor = new Markdown.Editor(converter)
    
    editor.hooks.set "insertImageDialog", (callback) ->
      selector = $("#image-selector")
      images = selector.find("img[data-full-image-url]")
      selector.modal()
      
      finish = (url) ->
        console.log ["finish", url]
        selector.off('hide')
        images.off('click')
        selector.modal('hide')
        callback(url)
      
      selector.on "hide", ->
        finish(null)
        
      images.css(cursor: "pointer").on "click", ->
        finish($(this).attr("data-full-image-url"))
        
      true # tell the editor that we'll take care of getting the image url

    
    editor.run()
  
  $('#project-toc').affix
    offset: $('#project-toc').position()
