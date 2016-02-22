class UserMailer < ApplicationMailer
  default :from => "misshershi@gmail.com"

  def welcome_email(child)
    @child = child
    @url  = "http://example.com/login"
    mail(:to => child.email, :subject => "Welcome to My Awesome Site")
  end
end

end
