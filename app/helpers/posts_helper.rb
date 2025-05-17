module PostsHelper
  def username_from_email(email)
    email.to_s.split("@").first
  end

  def display_name(user)
    user.username.present? ? user.username : username_from_email(user.email)
  end
end
