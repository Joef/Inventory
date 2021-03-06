module ApplicationHelper
  APPLICATION_NAME = "Inventory"
  
  def class_name(link_path)
    current_page?(link_path) ? ' class="active"' : ''
  end
  
  def nav_link(link_text, link_path)
  
    #usage:   nav_link 'Home', root_path
    #output:  <li class="current"><a href="/">Home</a></li>
  
    class_name = current_page?(link_path) ? 'class="active"' : ''

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end
  
  # if controller?("homepage") && action?("index", "show")
  def controller?(*controller)
    controller.include?(params[:controller])
  end
  def action?(*action)
    action.include?(params[:action])
  end
  def javascript(*files)
    content_for(:head) { javascript_include_tag(*files) }
  end
  def pageTitle(*controller)
    if params[:controller]
        params[:controller].to_s.titleize + " | " + APPLICATION_NAME    
    else
    APPLICATION_NAME
    end
  end
  def object_name
    params[:controller].to_s + '-' + params[:id].to_s
  end
  
  def sortable(column, title=nil)
    title ||=column.titleize
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, {sort: column, direction: direction}, {:class => css_class}
  end
  
  def menu_item_type
    [
      ['Not a menu item', 0],
      ['Food', 1],
      ['Beverage', 2]
    ]
  end
  def us_states
    [
      ['Alabama', 'AL'],
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'],
      ['California', 'CA'],
      ['Colorado', 'CO'],
      ['Connecticut', 'CT'],
      ['Delaware', 'DE'],
      ['District of Columbia', 'DC'],
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'],
      ['Idaho', 'ID'],
      ['Illinois', 'IL'],
      ['Indiana', 'IN'],
      ['Iowa', 'IA'],
      ['Kansas', 'KS'],
      ['Kentucky', 'KY'],
      ['Louisiana', 'LA'],
      ['Maine', 'ME'],
      ['Maryland', 'MD'],
      ['Massachusetts', 'MA'],
      ['Michigan', 'MI'],
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'],
      ['Missouri', 'MO'],
      ['Montana', 'MT'],
      ['Nebraska', 'NE'],
      ['Nevada', 'NV'],
      ['New Hampshire', 'NH'],
      ['New Jersey', 'NJ'],
      ['New Mexico', 'NM'],
      ['New York', 'NY'],
      ['North Carolina', 'NC'],
      ['North Dakota', 'ND'],
      ['Ohio', 'OH'],
      ['Oklahoma', 'OK'],
      ['Oregon', 'OR'],
      ['Pennsylvania', 'PA'],
      ['Puerto Rico', 'PR'],
      ['Rhode Island', 'RI'],
      ['South Carolina', 'SC'],
      ['South Dakota', 'SD'],
      ['Tennessee', 'TN'],
      ['Texas', 'TX'],
      ['Utah', 'UT'],
      ['Vermont', 'VT'],
      ['Virginia', 'VA'],
      ['Washington', 'WA'],
      ['West Virginia', 'WV'],
      ['Wisconsin', 'WI'],
      ['Wyoming', 'WY']
    ]
  end
end
