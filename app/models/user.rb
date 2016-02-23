class User < ActiveRecord::Base
  has_many :children, through: :room
  belongs_to :room

  def self.find_or_create_from_omniauth(auth_hash)
   user = self.find_by(uid: auth_hash["uid"])
   if !user.nil?
     # User found continue on with your life
     return user
   else
     # Create a new user
     user = User.new
     user.uid        = auth_hash["uid"]
     user.provider   = auth_hash["provider"]
     user.name   = auth_hash["info"]["name"]
     user.email      = auth_hash["info"]["email"]
     if user.save
       return user
     else
       return nil
     end
   end
  end
end
