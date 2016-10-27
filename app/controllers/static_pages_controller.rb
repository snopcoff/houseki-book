class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @categories = Category.all
    @reviews = Review.order_by_time
  end
end
