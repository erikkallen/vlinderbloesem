class ContactMailer < ActionMailer::Base
  default from: "info@vlinderbloesem.nl"
  
  def contact_email(user)
      @contact = user
      mail(:to => "vlinderbloesem@gmail.com",:from => user.email, :subject => user.onderwerp)
    end
end
