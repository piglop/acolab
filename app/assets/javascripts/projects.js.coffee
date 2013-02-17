$(document).ready ->
  if $(".wmd-input").length > 0
    converter = new Markdown.Converter()
    editor = new Markdown.Editor(converter)
    editor.run()
  
  $('#project-toc').affix
    offset: $('#project-toc').position()
