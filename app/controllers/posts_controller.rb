class PostsController < ApplicationController
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
  
  def show
    @post = Post.find(params[:id])
  end
  
  
  private

  def post_params
    params.require(:post).permit(:content)
  end
  
end
