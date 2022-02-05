class Admin::DashboardController < ApplicationController

  http_basic_authenticate_with name: ENV["ADMIN_USERNAME"], password: ENV["ADMIN_PASSWORD"]

  def show
    @categories = Category.all
    @allProducts = Product.all
  end

  def index
    @categories = Category.all
    @allProducts = Product.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(:name)

    if @category.save
      redirect_to [:admin, :category], notice: 'Category created!'
    else
      render :new
    end
  end

end
