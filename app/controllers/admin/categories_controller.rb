class Admin::CategoriesController < ApplicationController
  before_action :verify_admin
  before_action :find_category, except: [:index, :new, :create]

  def index
    @categories = Category.order_by_time.page(params[:page]).per Settings.size
  end

  def new
    @category = Category.new
  end

  def show
    @books = @category.books.order_by_time.page(params[:page]).per Settings.size
  end

  def edit
  end

  def update
    if @category.update_attributes category_params
      flash[:success] = t "categoryindex.update_success"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def create
    @category = Category.new category_params
    if @category.save
      @categories = Category.all
      flash[:success] = t "categoryindex.create_success"
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    unless @category == Category.first
      if @category.destroy
        @category.books.update_all category_id: 1
        flash[:success] = t "categoryindex.delete_success"
      end
    else
      flash[:danger] = "You can't delete this Category"
    end
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name
  end

  def find_category
    @category = Category.find_by id: params[:id]
    if @category.nil?
      flash[:danger] = t "flash.cate_nil"
      redirect_to admin_categories_path
    end
  end
end
