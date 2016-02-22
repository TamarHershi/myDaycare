class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.integer :first_phone_number
      t.integer :seconde_phone_number
      t.string :medication_sensitivity
      t.string :city
      t.string :address
      t.integer :dob
      t.integer :ssn
      t.timestamps null: false
    end
  end
end
