# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  find_field = (scope, field_name) ->
    scope.find("[name$='[" + field_name + "]']")
    
  
      
  update_fields = (event, ui, field)->
    $(field).val(ui.item.label)
    $(field).next().val(ui.item.value) #place the id into the hidden textfield ingredient_id
    return false 
    
  update_listeners = -> 
        
    $('.ingredient_name').each ->
      $(@).autocomplete({
        minLength: 2
        source: (request, response) -> 
          $.ajax
            url: "/ingredients.json"
            dataType: "json"
            data: 
              term: request.term
            success: (data) ->
              response $.map data, (item) ->
                return { 
                  label: item.name
                  object: item
                  value: item.id
                }
          
              return true
        focus: (event, ui) ->
          update_fields(event, ui, @) 
          return false
        select: (event, ui) ->
          update_fields(event, ui, @) 
          return false
          
      })
      return true
  update_listeners() 
  
  #when rows are added
  $(document).on 'click', '.add_fields', (e) ->
    e.preventDefault()
    update_listeners()
    return false
    
  