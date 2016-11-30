class CategoriesController < ApplicationController
  before_action :find_category, except: [:index, :new, :create]

  def show
    @categories = Category.all.without Category.first
    @q = @category.books.ransack params[:q]
    @books = @q.result.page(params[:page]).per Settings.default_size
  end

  private
  def find_category
    @categories = Category.all.without Category.first
    if @category.nil?
      flash[:danger] = t "flash.cate_nil"
      redirect_to root_path
    end
  end
end
