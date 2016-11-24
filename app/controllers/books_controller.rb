class BooksController < ApplicationController

  def index
    books_all = Book.order_by_time.page(params[:page]).per Settings.size
    @categories = Category.all
    @q = books_all.ransack params[:q]
    @books = @q.result.page(params[:page]).per Settings.default_size
  end

  def show
    @categories = Category.all
    @book = Book.find_by_id params[:id]
    check_null @book
    @reviews = @book.reviews.page(params[:page]).per Settings.size
    @review_new = @reviews.build
  end
end
