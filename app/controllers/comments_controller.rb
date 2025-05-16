class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: %i[edit update destroy]

  def new
    @comment = @post.comments.build(user: current_user)
    authorize @comment
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    authorize @comment
    if @comment.save
      redirect_to @post, notice: "Comment was created"
    else
      @comments = @post.comments.includes(:user).order(created_at: :desc)
      render "posts/show", status: :unprocessable_entity
    end
  end

  def edit
    authorize @comment
  end

  def update
    authorize @comment
    if @comment.update(comment_params)
      redirect_to @post, notice: "Comment was succesfully updated", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post, notice: "Comment was deleted"
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
