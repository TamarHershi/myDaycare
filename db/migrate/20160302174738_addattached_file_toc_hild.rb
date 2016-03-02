class AddattachedFileTocHild < ActiveRecord::Migration
  def change
    add_column :children, :attached_file, :string
  end
end
