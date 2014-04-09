class AddVendorTypeId < ActiveRecord::Migration
  def change
    rename_column :recipes, :title, :name
    add_column :vendors, :vendor_type_id, :integer
  end
end
