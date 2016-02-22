class Child < ActiveRecord::Base
  has_many :users, through: :room
  belongs_to :room
end
