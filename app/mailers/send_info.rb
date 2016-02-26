class WelcomeMailer < ActionMailer::Base

  def send_info(email, child, info)
    mail(to: email,
        from: "misstamar@gmail.com",
        subject: "MyDayCare daily information about #{child.name}",
        )
  end
end
