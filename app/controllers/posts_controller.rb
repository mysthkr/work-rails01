class PostsController < ApplicationController
  before_action :set_post, only: [:edit, :update, :destroy]
  def new
    @post = Post.new
  end
  
  def index
    @posts = Post.all
  end
  
  def create
    @post = Post.new(content: params[:post][:content])
    if params[:back]
      render :new
    else
      if @post.save
        redirect_to posts_path, notice: "投稿しました！"
      else
        render :new
      end
    end
  end
  
  
  
  def destroy
    @post.destroy
    redirect_to posts_path, notice:"ブログを削除しました！"
  end
  
  
  private

  def post_params
    params.require(:post).permit(:content)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end
