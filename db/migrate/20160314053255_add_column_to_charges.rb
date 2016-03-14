class AddColumnToCharges < ActiveRecord::Migration
  def change
        add_column :charges, :child_id, :integer
  end
end
