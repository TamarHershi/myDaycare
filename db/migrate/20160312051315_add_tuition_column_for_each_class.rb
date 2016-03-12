class AddTuitionColumnForEachClass < ActiveRecord::Migration
  def change
    add_column :rooms, :tuition, :integer
  end
end
