class Parent < ActiveRecord::Base
  has_many :children


  def more_then_one?
    if self.children.count > 1
      return true
    else
      return false
    end
  end

end
