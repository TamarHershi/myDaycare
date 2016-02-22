class User < ActiveRecord::Base
  has_many :children, through: :room
  belongs_to :room
end
