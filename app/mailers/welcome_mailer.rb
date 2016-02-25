class WelcomeMailer < ActionMailer::Base

  def welcome(email)
    mail(to: email,
        from: "misshershi@gmail.com",
        subject: "Welcome",
        body: "This is my first email"
        )
  end
end
