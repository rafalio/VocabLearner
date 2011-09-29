# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#

$ ->
  $("#getDefn").click (e) ->
    e.preventDefault()
    word = $("#entry_name").val()
    $.post '/getDefinition', word: word, (data) ->
      if data
        data.map
        $("#entry_definition").html data.join("\n\n")
      else
        alert "Sorry, no definition was found!"
