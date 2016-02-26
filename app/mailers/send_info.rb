require 'pry'
class SendInfo < ActionMailer::Base

  def send_info(email, child)
    @child = child
    @info = @child.infos.last
    mail(to: email,
        from: "misstamar@gmail.com",
        subject: "☀︎ 'My DayCare' Daily information ☀︎",
        )
  end
end
