class CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['ADMIN_NAME'], password: ENV['ADMIN_PASSWORD']

  def index
    @categories = Category.order(id: :desc).all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_parameters)

    if @category.save
      redirect_to '/admin/categories', notice: 'Category was successfully created'
    else
      render :new
    end
  end

  def destroy
  end

end
