# app/mailers/custom_devise_mailer.rb
class CustomDeviseMailer < Devise::Mailer
  include Devise::Controllers::UrlHelpers
  default template_path: "devise/mailer"

  # Confirmation
  def confirmation_instructions(record, token, opts = {})
    Rails.logger.info ">> CUSTOM MAILER: enqueue confirmation for #{record.email}"
    # класс-метод возвращает ActionMailer::MessageDelivery
    Devise::Mailer
      .confirmation_instructions(record, token, opts)
      .deliver_later(queue: :mailers)
  end

  # Reset password
  def reset_password_instructions(record, token, opts = {})
    Rails.logger.info ">> CUSTOM MAILER: enqueue reset_password for #{record.email}"
    Devise::Mailer
      .reset_password_instructions(record, token, opts)
      .deliver_later(queue: :mailers)
  end

  # Unlock
  def unlock_instructions(record, token, opts = {})
    Rails.logger.info ">> CUSTOM MAILER: enqueue unlock for #{record.email}"
    Devise::Mailer
      .unlock_instructions(record, token, opts)
      .deliver_later(queue: :mailers)
  end
end
