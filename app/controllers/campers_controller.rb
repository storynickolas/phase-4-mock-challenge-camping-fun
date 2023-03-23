class CampersController < ApplicationController

  def show
    camper = Camper.find_by(id: params[:id])
    if camper
      render json: camper, serializer: WithActivitySerializer
    else
      render json: { error: "Camper not found" }, status: :not_found
    end
    
  end

  def index
    render json: Camper.all
  end

  def create
    camper = Camper.create(camper_params)
    if camper.valid?
      render json: camper, status: :created
    else
      render json: { errors: camper.errors.full_messages }, status: :unprocessable_entity
    end


  end

  private

  def camper_params
    params.permit(:name, :age)
  end

end
