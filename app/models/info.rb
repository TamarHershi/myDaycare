require 'pry'
class Info < ActiveRecord::Base
  belongs_to :child


  def self.new_infos(room)
    children = room.children
    children.each do |child|
      binding.pry
      if child.infos.last.created_at.strftime('%D')!= DateTime.now.strftime('%D')
        info = Info.new
        info.child_id = child.id
        info.diaper_m = "Wet"
        info.save
      end
    end
  end


end
