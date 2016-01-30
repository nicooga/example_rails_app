class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find params[:id]
  end

  def show
    @post = Post.find params[:id]
  end

  def create
    @post = Post.new(permitted_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def update
    @post = Post.find params[:id]

    if @post.update permitted_params_for_update
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_path
  end

  private

  def permitted_params
    params.require(:post).permit :title, :body
  end

  def permitted_params_for_update
    params.require(:post).permit :body
  end
end
