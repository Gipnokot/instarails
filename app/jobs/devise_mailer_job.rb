class DeviseMailerJob
  include Sidekiq::Worker
  queue_as :mailers

  def perform(user_id, type, *args)
    user = User.find_by(id: user_id)
    unless user
      Rails.logger.error "DeviseMailerJob: User not found with id=#{user_id}"
      return
    end

    begin
      Rails.logger.info "DeviseMailerJob: Sending #{type} email to #{user.email}"
      case type.to_sym
      when :confirmation
        Devise::Mailer.confirmation_instructions(user, *args).deliver_now
      when :reset_password
        Devise::Mailer.reset_password_instructions(user, *args).deliver_now
      when :unlock
        Devise::Mailer.unlock_instructions(user, *args).deliver_now
      else
        Rails.logger.error "DeviseMailerJob: Unknown email type #{type}"
        return
      end
      Rails.logger.info "DeviseMailerJob: Successfully sent #{type} email to #{user.email}"
    rescue StandardError => e
      Rails.logger.error "DeviseMailerJob: Failed to send #{type} email to #{user.email}: #{e.message}"
      raise
    end
  end
end
