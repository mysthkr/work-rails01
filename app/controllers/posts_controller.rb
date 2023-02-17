class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end
  
  def create
    @post = Post.new(post_params)
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "つうやきを投稿しました！"
      else
        render :new
      end
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
     if @post.update(post_params)
      redirect_to posts_path, notice: "つぶやきを編集しました！"
    else
      render :edit
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path, notice:"つぶやきを削除しました！"
  end
  
  def confirm
    @post = Post.new(post_params)
    render :new if @post.invalid?
  end
  
  private

  def post_params
    params.require(:post).permit(:content)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end