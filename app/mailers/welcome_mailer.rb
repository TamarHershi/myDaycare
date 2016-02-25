class WelcomeMailer < ActionMailer::Base

  def welcome(email)
    mail(to: email,
        from: "misstamar@gmail.com",
        subject: "Welcome",
        )
  end
end
