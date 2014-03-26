module CategoriesHelper
  def show_nested_category_name(categories, category, show_links)
    show_nested_category_name(categories, category, show_links, '>')
  end
  def show_nested_category_name(categories, category, show_links=false, separator)
    
    
    #walk the categories recursively, finding the parent
    name = show_links ? format_show_link(category) : category.name  #seed
    c = category
    if c.parent_id
      while !c.parent_id.nil?
        c = find_node(categories, c.parent_id)
        format_name = show_links && c.id != params[:id] ? format_show_link(c) : c.name
        name = format_name + " " + separator + " " + name
      end
    end
    return name
  end
  private
  def find_node(categories, seed)
    categories.each do |category|
      if(seed==category.id)
        return category
      end
      
    end
     
  end
  def format_show_link(category)
    link_to category.name, category
  end
end
