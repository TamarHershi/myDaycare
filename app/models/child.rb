class Child < ActiveRecord::Base
  belongs_to :parent
  has_many :users, through: :room
  has_many :charges
  has_many :infos
  validates :email, :name, :last_name, presence: true
  belongs_to :room

    # This method associates the attribute ":avatar" with a file attachment
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def self.not_attend(children)
    children.each do |child|
      child.attend = false
      child.save
    end
  end

  def self.highest_tuition(children)
    high = 0
    t_child = children.first
    children.each do |child|
      t_child = child if child.room.tuition > high
      high = child.room.tuition
    end
    return t_child
  end

  def paid?
    charges = self.charges
    return false if charges.count == 0
    charges.each do |charge|
      return true if (DateTime.now.strftime('%Y-%m') == charge.date) && (charge.payed)
    end
    return false
  end




end
