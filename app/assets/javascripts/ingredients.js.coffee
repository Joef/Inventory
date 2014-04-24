# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

class Chart  
  @drawChart:  =>
    id = $('#container').data('url')
    controller = id.substring(0, id.indexOf('-'))
    id = id.substring(id.indexOf('-')+1)
    
    if controller == 'ingredients' && !isNaN(parseInt(id))
      
      $.ajax
        url: "/invoice_ingredients.json"
        dataType: "json"
        data: 
          ingredient_id: id
        success: (data) ->
          
          dataTable = new google.visualization.DataTable()
          dataTable.addColumn({ type: 'date', id: 'Date' });
          dataTable.addColumn({ type: 'number', id: 'Qty' });
          for d,i in data
            qty = d.pack_qty * d.pack_size * d.qty_shipped
            
            date = d.invoice.invoice_date
            #have to parse the date out
            year = parseInt date.substring(0, 4)
            month = parseInt date.substring(5, 7) 
            day = parseInt date.substring(8,10)
            
            #Jan = 0
            date = new Date(year, month-1, day)
            dataTable.addRow([date , qty]) 
          
          if data.length > 0
            #add a dummy row for next year to normalize to 0
            dataTable.addRow([new Date(2014, 0, 1), 0])
          graph = new google.visualization.Calendar(document.getElementById('calendar_basic'))
  
          options = {
           title: "",
           height: 180,
           #calendar: { cellSize: 10 },
           noDataPattern: {
             backgroundColor: '#ccc',
             color: '#fff'
           }
          }
  
          graph.draw(dataTable, options)
          
        
      
      return true


google.load("visualization", "1.1", {packages:["calendar"]});
google.setOnLoadCallback(Chart.drawChart);


