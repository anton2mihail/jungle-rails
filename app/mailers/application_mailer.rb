class ApplicationMailer < ActionMailer::Base
  default from: 'no_reply@jungle.com'
  layout 'mailer'
end
