$(document).ready ->
  converter = new Markdown.Converter()
  
  if $(".wmd-input").length > 0
    editor = new Markdown.Editor(converter)
    editor.run()
  
  $(".markdown").each ->
    element = $(this)
    converted = converter.makeHtml(element.html())
    element.html(converted)
    