class AddColumnUser < ActiveRecord::Migration
  def change
    add_column :users, :user_type, :string, :default => "p"
  end
end
