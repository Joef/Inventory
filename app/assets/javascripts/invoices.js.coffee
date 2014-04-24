# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $('.datepicker').datepicker { dateFormat: "yy-mm-dd" }
  
  change_tab = (e)->
    
    if parseInt(e.which) == 9 #tab
      if !e.shiftKey
        e.preventDefault()
        $('.add_fields').click()
        $('.vendor_number').last().focus()
      return true
      
  
    
  #add_row when invoice_date is entered
  $('#invoice_invoice_date').blur().keydown (e) ->
    change_tab e
        
  format_currency = (number, precision) ->
    (Math.round(number *100) / 100).toFixed(precision)
  
  update_number = (field, precision) ->
    field.value = format_currency field.value, precision
    
  update_totals = ->
    sum = 0
    $('.total:visible').each ->
      sum += Number($(@).val())
    sum +=  Number($('.tax').val())
    $('#invoice_total').val format_currency sum, 2
  
  calculate_total = (row) ->
    calculator = row.find('.cost')
    basis = row.find('.cost_basis:checked').val()
    if(parseInt(basis) == 1)
      calculator[4].value = format_currency calculator[1].value * calculator[2].value * calculator[3].value, 2
    else
      calculator[4].value = format_currency calculator[0].value * calculator[3].value, 2   
    
    update_totals()
      
  update_listeners = -> 
    
    last_box = $('.total')
    #remove existing keydown
    last_box.off("keydown")
    
    last_box.last().keydown (e)  ->
      change_tab e
      
    #go to the next row, not remove button
    last_box.keydown (e) ->
      if !e.shiftKey
        e.preventDefault()
        i = last_box.index(@)
        $('.vendor_number')[i+1].focus()
    
    $('.tax').blur ->
      update_totals()
      update_number @,2
      return true
    
    $('.nested-fields').each -> 
      row = $(@)
      calculator = row.find('.cost')
      basis = row.find('.cost_basis:checked')
      
      calculator[4].value = format_currency calculator[4].value,3 if calculator.length > 0 # onload
      
      calculator.blur ->
        calculate_total row, basis.val()
        
      $(@).find('.cost_basis').change ->
        calculate_total row
      
        
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
                    value: item.id
                  }
            
            return true
          focus: (event, ui) ->
            $(@).val(ui.item.label)
            $(@).next().val(ui.item.value) #place the id into the hidden textfield ingredient_id
            console.log $(@).next().val()
            return false
          select: (event, ui) ->
            $(@).val(ui.item.label)
            $(@).next().val(ui.item.value) #place the id into the hidden textfield ingredient_id
            console.log $(@).next().val()
            return false
          
        })
      return true

    $('.vendor_number').each ->
      $(@).autocomplete({
          minLength: 4
          source: (request, response) -> 
            $.ajax
              url: "/invoice_ingredients.json"
              dataType: "json"
              data: 
                term: request.term
              success: (data) ->
                response $.map data, (item) ->
                  return { 
                    label: item.vendor_number + ":" + item.ingredient.name
                    value: item
                    name: item.vendor_number
                  }
            
            return true
          focus: (event, ui) ->
            $(@).val(ui.item.name)
            return false
          select: (event, ui) ->
            $(@).val(ui.item.name)
            #place the id into the hidden textfield ingredient_id
            row = $(@).parent().parent()#.find(":input")
            
            
            row.find("[name*='ingredient_name']").val       ui.item.value.ingredient.name
            row.find("[name*='ingredient_id']").val         ui.item.value.ingredient_id
            row.find("[name*='qty_ordered']").val(ui.item.value.qty_ordered)
            row.find("[name*='qty_shipped']").val(ui.item.value.qty_shipped)
            row.find("[name*='unit']").val(ui.item.value.unit)
            row.find("[name*='brand']").val(ui.item.value.brand)
            row.find("[name*='description']").val(ui.item.value.description)
            row.find("[name*='pack_qty']").val(ui.item.value.pack_qty)
            row.find("[name*='pack_size']").val(ui.item.value.pack_size)
            row.find("[name*='measure_id']").val(ui.item.value.measure_id)
            row.find("[name*='price']").val(format_currency ui.item.value.price)
            row.find("[name*='extended']").val(format_currency ui.item.value.extended)
            
            
            update_totals()
            
            return false
          
        })
      return true
    
    
  update_listeners() 
  
  #when rows are added
  $(document).on 'click', '.add_fields', (e) ->
    e.preventDefault()
    update_listeners()
    return false
    
  $(document).on 'click', '.remove_fields', (e) ->
    e.preventDefault()
    update_totals()
  
  rowsize = 13
  $(document).on 'keyup', '.grid', (e) ->
    fields = $('.grid')
    current = $.inArray(@, fields)
    if(current != 1)
      if parseInt(e.which) == 39 #right
        ix = current+1
        
      if parseInt(e.which) == 37 #left
        ix = current-1
      if parseInt(e.which) == 40 #down
        ix = current+rowsize
      if parseInt(e.which) == 38 #up
        ix = current-rowsize
      #console.log ix
      #fields[ix].focus() if fields[ix]
    true
  true