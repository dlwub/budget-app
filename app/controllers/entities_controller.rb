class EntitiesController < ApplicationController
  before_action :authenticate_user!

  # GET /entities/index
  def index
    @category = Category.find(params[:category_id])
    @entities = current_user.entities.order(created_at: :desc)
  end 
  
  # GET /entities/new
  def new
    @entity = current_user.entities.new 
          
  end

  # POST /entities or /entities.json
  def create
    @entity = current_user.entities.new(entity_params)
    
    respond_to do |format|
      if @entity.save         
        format.html { redirect_to "/categories/:category_id", notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entity.errors, status: :unprocessable_entity }
      end
    end
  end

  

  private

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount, :category, :user_id)
  end
end
