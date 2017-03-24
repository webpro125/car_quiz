# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#= require jquery-ui.min
$ ->
  $('#start').datepicker
    dateFormat: 'dd/mm/yy'
    prevText: '<i class="fa fa-angle-left"></i>'
    nextText: '<i class="fa fa-angle-right"></i>'
    onSelect: (selectedDate) ->
      $('#finish').datepicker 'option', 'minDate', selectedDate
      return
  $('#finish').datepicker
    dateFormat: 'dd/mm/yy'
    prevText: '<i class="fa fa-angle-left"></i>'
    nextText: '<i class="fa fa-angle-right"></i>'
    onSelect: (selectedDate) ->
      $('#start').datepicker 'option', 'maxDate', selectedDate
      return
