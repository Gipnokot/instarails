module PostsHelper
  def username_from_email(email)
    email.to_s.split("@").first
  end
end
