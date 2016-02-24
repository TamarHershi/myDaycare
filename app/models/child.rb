class Child < ActiveRecord::Base
  has_many :users, through: :room
  has_many :infos
  belongs_to :room
end
