class EntitiesController < ApplicationController
  # GET /Entities or /Entities.json
  def index
    @entities = Entity.all
  end

  # GET /Entities/new
  def new
    @Entity = Entity.new
  end

  # POST /Entities or /Entities.json
  def create
    @Entity = Entity.new(Entity_params)

    respond_to do |format|
      if @Entity.save
        CategoryEntity.create(Entity_id: @Entity.id, category_id: params[:category_id])
        format.html { redirect_to Entity_url(@Entity), notice: 'Entity was successfully created.' }
        format.json { render :show, status: :created, location: @Entity }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @Entity.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def Entity_params
    params.require(:Entity).permit(:name, :amount, :category, :user_id)
  end
end
