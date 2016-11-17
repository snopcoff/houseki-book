class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @categories = Category.all
    @reviews = Review.order_by_time
    @book_random = Book.random.limit(1).first
  end
end
