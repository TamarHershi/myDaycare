class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.string :last_name
      t.string :gender
      t.integer :room_id

      t.timestamps null: false
    end
  end
end
