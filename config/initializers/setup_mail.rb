ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.gmail.com",  
  :port                 => 587,  
  :domain               => "gmail.com",  
  :user_name            => ENV["SERVER_EMAIL"],  
  :password             => ENV["SERVER_EMAIL_PASSWORD"],  
  :authentication       => "plain",  
  :enable_starttls_auto => true, 
  :openssl_verify_mode => 'none'
} 
ActionMailer::Base.default_url_options[:host] = "localhost:3000" 
ActionMailer::Base.register_interceptor DevelopmentMailInterceptor if Rails.env.development?
