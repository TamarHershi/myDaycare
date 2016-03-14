class Charge < ActiveRecord::Base
  belongs_to :child

# check how many children for the parent
# if more then one
  #look for the highest tuition
    # full tuition for it
    # the others reduce 10%
# if only one - pay full tuition

  def self.more_then_one?(parent)
    if parent.children.count > 1
      return true
    else
      return false
    end
  end


end
