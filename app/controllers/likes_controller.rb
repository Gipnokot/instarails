class LikesController < ApplicationController
  before_action :set_post

  def create
    existing_like = @post.likes.find_by(user: current_user)

    if existing_like
      existing_like.destroy
    else
      @post.likes.create(user: current_user)
    end

    @post

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.post
    @like.destroy
    @post

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  # def update_likes_count(post)
  #   post.update_likes_count
  # end
end
