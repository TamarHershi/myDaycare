class Room < ActiveRecord::Base
  has_many :children
  has_many :users
end
