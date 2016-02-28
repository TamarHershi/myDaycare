class AddAvatarToChild < ActiveRecord::Migration
  def self.up
    add_attachment :children, :avatar
  end

  def self.down
    remove_attachment :children, :avatar
  end
end
