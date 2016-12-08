class Admin::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin
  before_action :find_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.order_by_time.page(params[:page]).per Settings.size
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:success] = "Create Post Success"
      redirect_to admin_posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes post_params
      flash[:success] = "Update successfully"
      redirect_to admin_posts_path
    else
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = "Destroy successfully"
    else
      flash[:danger] = "Destroy fail"
    end
    redirect_to :back
  end

  private
  def post_params
    params.require(:post).permit :content
  end

  def find_post
    @post = Post.find params[:id]
    unless @post
      flash[:danger] = "this post is not exist"
    end
  end
end
