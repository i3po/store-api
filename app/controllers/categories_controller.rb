class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]
  before_action :authenticate_user, only: [:create, :update, :destroy]

  # GET /categories
  def index
    @categories = Category.all
    render json: @categories
  end

  # GET /categories/category
  def show
    @category = Category.where({category: params[:category_id]}).first
    render json: @category
  end

  # POST /categories
  def create
    @category = Category.new(category_params)
    if @category.save
      render json: @category, status: :created, location: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/category
  def update
    @category = Category.where({category: params[:category_id]}).first
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categories/category
  def destroy
    @category = Category.where({category: params[:category_id]}).first
    @category.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def category_params
      params.require(:category).permit(:category)
    end
end
