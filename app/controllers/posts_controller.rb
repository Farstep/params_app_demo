class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @genres = Genre.all
  end

  def create
    @genres = Genre.all
    @post = Post.new(post_params)
    @post.genre_id = params[:genre][:name]
    if @post.save
      redirect_to post_path(@post), notice: '投稿に成功しました。'
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to recipe_path(@post), notice: '更新に成功しました。'
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
