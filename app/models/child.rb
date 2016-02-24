class Child < ActiveRecord::Base
  has_many :users, through: :room
  has_many :infos
  belongs_to :room


  def new_infos(room)
    children = room.children
    children.each do |child|
      child << Info.create
    end
  end

  
end
