class ContactMailer < ActionMailer::Base
  default from: "info@vlinderloesem.nl"
  
  def contact_email(user)
      @contact = user
      mail(:to => "vlinderbloesem@gmail.com", :subject => user.onderwerp)
    end
end
