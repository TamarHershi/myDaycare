class AddDateColumnToChrges < ActiveRecord::Migration
  def change
    add_column :charges, :date, :string

  end
end
