class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    base_scope = policy_scope(Post)
    @posts = base_scope.order(created_at: :desc).includes(:user, :likes).page(params[:page]).per(5)
  end

  def show
    authorize @post
    @comment = @post.comments.build
  end

  def new
    @post = current_user.posts.build
    authorize @post
  end

  def create
    @post = current_user.posts.build(post_params)
    authorize @post
    if @post.save
      redirect_to @post, notice: "Пост успешно создан"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @post
  end

  def update
    authorize @post
    if @post.update(post_params)
      redirect_to @post, notice: "Пост успешно обновлён.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @post
    if @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: "Пост был удалён." }
        format.turbo_stream { render turbo_stream: turbo_stream.remove(@post) }
      end
    else
      redirect_to posts_url, alert: "Не удалось удалить пост."
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end
end
