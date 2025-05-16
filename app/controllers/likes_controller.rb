class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = @post.likes.build(user: current_user)
    authorize @like
    @like.save
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
    end
  end

  def destroy
    @like = @post.likes.find_by(id: params[:id])
    authorize @like
    @like&.destroy

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
