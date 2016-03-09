class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :email
      t.string :name
      t.string :last_name
      t.string :phone_number1
      t.string :phone_number2
      t.string :address
      t.timestamps null: false
    end
  end
end
