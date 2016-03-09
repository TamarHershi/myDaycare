class RemoveColumsFromChildModel < ActiveRecord::Migration
  def change
    add_column :children, :parent_id, :string
  end
end
