class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = @post.likes.create(user: current_user)
    @post.update_likes_count
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @post = @like.post
    @like.destroy
    @post.update_likes_count
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
