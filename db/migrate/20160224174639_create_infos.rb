class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.integer :child_id
      t.string :diaper_m
      t.string :diaper_n
      t.string :diaper_a

      t.string :breakfast
      t.string :lunch
      t.string :afternoon

      t.string :general
      t.string :sleep_time

      t.boolean :more_daiper, :default => false
      t.boolean :more_wipes, :default => false
      t.boolean :more_clothes, :default => false

      t.timestamps null: false
    end
  end
end
