$(document).ready ->
  if $(".wmd-input").length > 0
    converter = new Markdown.Converter()
    editor = new Markdown.Editor(converter)
    
    editor.hooks.set "insertImageDialog", (callback) ->
      content = $("#image-selector").html()
      popup = $("<div>").addClass("wmd-prompt-dialog").css
        position: "fixed"
        left: "10%"
        top: "10%"
        width: "80%"
        height: "80%"
        "z-index": 2000
      .html(content).appendTo("body")
      popup.find("img").css(cursor: "pointer").click ->
        popup.remove()
        console.log $(this).attr("data-url")
        callback($(this).attr("data-url"))
      #editor.ui.prompt "foo", "yes", callback
      true # tell the editor that we'll take care of getting the image url

    
    editor.run()
  
  $('#project-toc').affix
    offset: $('#project-toc').position()
