class ApartmentsController < ApplicationController
  before_action :set_apartment, only: %i[ show update destroy ]

  # GET /apartments
  def index
    @apartments = Apartment.all

    render json: @apartments
  end

  # GET /apartments/1
  def show
    render json: @apartment, :include => {:user => {:only => :email}}
  end

  # POST /apartments
  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user = current_user

    if @apartment.save
      render json: @apartment, status: :created, location: @apartment
    else
      render json: @apartment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /apartments/1
  def update
    if @apartment.update(apartment_params)
      render json: @apartment
    else
      render json: @apartment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /apartments/1
  def destroy
    @apartment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def apartment_params
      params.require(:apartment).permit(:title, :description, :price, :address, :city, :postal_code, :surface, :furnished, :garden, :basement, :custodian)
    end
end
