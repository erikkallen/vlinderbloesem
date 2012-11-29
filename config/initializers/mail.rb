  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    :address => 'localhost',
    :enable_starttls_auto => false,
    :openssl_verify_mode => 'none',
  #  :domain => 'www.villa-bonaire.nl.com', 
    :port => 25
  }
