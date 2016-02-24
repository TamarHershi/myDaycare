class Info < ActiveRecord::Base
  belongs_to :child


  def self.new_infos(room)
    children = room.children
    children.each do |child|
      child << Info.create
    end
  end


end
