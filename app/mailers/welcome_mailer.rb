class WelcomeMailer < ActionMailer::Base

  def welcome(email, user)
    @user = user
    mail(to: email,
        from: "misstamar@gmail.com",
        subject: "Welcome #{@user.name} ",
        )
  end
end
