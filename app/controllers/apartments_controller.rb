class ApartmentsController < ApplicationController
  before_action :set_apartment, only: %i[ show update destroy ]
  before_action :authenticate_user!, only: %i[create update destroy]

  # GET /apartments
  def index
    if params[:search_term]
      if params[:search_term] == 'user'
        @apartments = Apartment.where(user_id: current_user.id)
      else
        @apartments = Apartment.where('lower(city) LIKE :prefix', prefix: "#{params[:search_term].downcase}%")
      end
    else
      @apartments = Apartment.all
    end
    render json: @apartments
  end

  # GET /apartments/1
  def show
    render json: @apartment, :include => {:user => {:only => :email}, :picture => url_for(:picture)}
  end

  # POST /apartments
  def create
    @apartment = Apartment.new(apartment_params)
    @apartment.user = current_user
    if @apartment.save
      @apartment.picture.attach(params[:picture])
      render json: @apartment, status: :created, location: @apartment
    else
      render json: @apartment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /apartments/1
  def update
    if @apartment.user_id == current_user.id
      if @apartment.update(apartment_params)
        render json: @apartment
      else
        render json: @apartment.errors, status: :unprocessable_entity
      end
    else
      render json: @apartment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /apartments/1
  def destroy
    if @apartment.user_id == current_user.id
      @apartment.destroy
      render json: {message: "The item was successfully deleted"}, status: :ok
    else
      render json: {message: "Error, it's not your item, you can't delete it"}, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def apartment_params
      params.require(:apartment).except(:picture).permit(:title, :description, :price, :address, :city, :postal_code, :surface, :furnished, :garden, :basement, :custodian)
    end
    
    def picture_param
      params.require(:apartment).slice(:picture).permit(:picture)
    end
end
