class BooksController < ApplicationController

  def index
    books_all = Book.order_by_time.page(params[:page]).per Settings.size
    @categories = Category.all.without Category.first
    @q = books_all.ransack params[:q]
    @books = @q.result.page(params[:page]).per Settings.max_page
  end

  def show
    @categories = Category.all.without Category.first
    @book = Book.find_by_id params[:id]
    check_null @book
    @reviews = @book.reviews.order_by_time.page(params[:page]).per Settings.size
    @review_new = @reviews.build
  end
end
