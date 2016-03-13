class CreateCharges < ActiveRecord::Migration
  def change
    create_table :charges do |t|
      t.string :year
      t.string :month
      t.integer :amount
      t.integer :confirmation_num
      t.integer :child_id
      t.timestamps null: false
    end
  end
end
