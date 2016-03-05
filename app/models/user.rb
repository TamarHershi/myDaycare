class User < ActiveRecord::Base
  has_many :children, through: :room
   validates :email, :name, :provider, presence: true
  belongs_to :room

  def self.find_or_create_from_omniauth(auth_hash, &block)
   user = self.find_by(email: auth_hash['info']['email'])
  # user.url = auth_hash['info']['urls'][user.provider.capitalize]
   if !user.nil?
     # User found continue on with your life
     return user
   else
     # Create a new user
     user = User.new
     user.email        = auth_hash['info']['email']
     user.provider   = auth_hash['provider']
     user.name   = auth_hash["info"]["name"]
  #   user.last_name      = auth_hash["info"]["last_name"]
    yield user if block_given?
     if user.save
       return user
     else
       return nil
     end
   end
  end
end
