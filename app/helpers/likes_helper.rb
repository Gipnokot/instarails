module LikesHelper
  def user_liked?(post, user)
    post.likes.any? { |like| like.user_id == user.id }
  end

  def like_for(post, user)
    post.likes.find { |like| like.user_id == user.id }
  end
end
