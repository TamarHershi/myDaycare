class AddTutionColumnChildrenTable < ActiveRecord::Migration
  def change
    add_column :children, :tuition, :integer
  end
end
