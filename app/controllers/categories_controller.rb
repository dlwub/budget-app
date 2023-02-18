class CategoriesController < ApplicationController
  
  # GET /categories or /categories.json
  def index
    @categories = current_user.categories
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = current_user.categories.find(params[:id])
    @entities = @category.entities
  end

  # GET /categories/new
  def new
    @category = current_user.categories.new    
  end

  # POST /categories or /categories.json
  def create
    @category = current_user.categories.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :icon, :user_id)
  end
end
