module CommentsHelper
  def comment_author(comment)
    comment.user ? username_from_email(comment.user.email) : "Guest"
  end
end
