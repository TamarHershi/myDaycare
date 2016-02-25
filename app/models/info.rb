require 'pry'
class Info < ActiveRecord::Base
  belongs_to :child


  def self.new_infos(room)
    children = room.children
    children.each do |child|
      if child.infos.last.nil? || child.infos.last.created_at.strftime('%D')!= DateTime.now.strftime('%D')
        info = Info.new
        info.child_id = child.id
        info.save
      end
    end
  end


end
