class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.string :last_name
      t.string :gender
      t.integer :room_id
      t.string :parent1_number
      t.string :parent2_number
      t.string :medications_sensitivity
      t.string :city
      t.string :address
      t.datetime :dob
      t.integer :ssn

      t.timestamps null: false
    end
  end
end
