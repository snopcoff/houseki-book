class CategoriesController < ApplicationController
  before_action :find_category, except: [:index, :new, :create]

  def show
    @books = @category.books
    @categories = Category.all
  end

  private
  def find_category
    @category = Category.find_by id: params[:id]
    if @category.nil?
      flash[:danger] = t "flash.cate_nil"
      redirect_to root_path
    end
  end
end
