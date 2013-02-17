$(document).ready ->
  if $(".wmd-input").length > 0
    converter = new Markdown.Converter()
    editor = new Markdown.Editor(converter)
    
    editor.hooks.set "insertImageDialog", (callback) ->
      #editor.ui.prompt "foo", "yes", callback
      true # tell the editor that we'll take care of getting the image url

    
    editor.run()
  
  $('#project-toc').affix
    offset: $('#project-toc').position()
