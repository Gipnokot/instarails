class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch('SMTP_USERNAME', 'from@example.com')
  layout "mailer"

  self.delivery_job = ActionMailer::MailDeliveryJob
end
