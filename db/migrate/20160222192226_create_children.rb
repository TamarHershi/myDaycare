class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.string :last_name
      t.string :sex
      t.integer :room_id

      t.timestamps null: false
    end
  end
end
