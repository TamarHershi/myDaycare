class AddBooleanPayedColumnCharges < ActiveRecord::Migration
  def change
    add_column :charges, :payed, :boolean , :default => false
  end
end
