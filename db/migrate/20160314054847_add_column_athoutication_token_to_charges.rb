class AddColumnAthouticationTokenToCharges < ActiveRecord::Migration
  def change
    add_column :charges, :authenticity_token, :string
    add_column :charges, :stripeToken, :string
  end
end
