class StaticPagesController < ApplicationController

  def home
    @categories = Category.all.without Category.first
    @reviews = Review.order_by_time
    @book_random = Book.random
    @activities = PublicActivity::Activity.all.order(created_at: :desc)
    @posts = Post.order_by_time.page(params[:page]).per Settings.size
  end
end
