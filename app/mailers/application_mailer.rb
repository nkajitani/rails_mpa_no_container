class ApplicationMailer < ActionMailer::Base
  default from: Settings.notification_email
  layout "mailer"
end
