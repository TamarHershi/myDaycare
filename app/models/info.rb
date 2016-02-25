require 'pry'
class Info < ActiveRecord::Base
  belongs_to :child


  def self.new_infos(room)
    children = room.children
    children.each do |child|
      info = Info.new
      info.child_id = child.id
      info.diaper_m = "Wet"
      info.save
    end
  end


end
