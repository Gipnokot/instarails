module PostsHelper
  def username_from_email(email)
    email.to_s.split("@").first
  end

  def display_name(user)
    user.username.presence || user.email
  end
end
