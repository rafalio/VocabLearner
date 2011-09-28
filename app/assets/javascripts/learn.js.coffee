# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
#
$ ->
  $("a[rel=popover]").popover({offset: 50, delayOut: 100, placement: "below"}).click ->
    e.preventDefault()
