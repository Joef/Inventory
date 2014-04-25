# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  id = $('#container').data('url')
  controller = id.substring(0, id.indexOf('-'))
  
  if controller != 'vendors'
    return false
  
  
  
  $('.filter').bind "click", (e)->
    e.preventDefault()
    m = $("[name='month']")
    y = $("[name='year']")
    $.ajax
      url: "/invoices"
      type: "GET"
      datatype: "script"
      data:
        start_date: m
        end_date: y
    return true
  return true
