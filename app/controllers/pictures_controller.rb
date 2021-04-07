class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :update, :destroy]
  before_action :get_car

  # GET /pictures
  def index
    @pictures = @car.pictures.all

    render json: @pictures
  end

  # GET /pictures/1
  def show
    render json: @picture
  end

  # POST /pictures
  def create
    @picture = @car.pictures.build(picture_params)

    if @picture.save
      render json: @picture, status: :created, location: @picture
    else
      render json: @picture.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pictures/1
  def update
    if @picture.update(picture_params)
      render json: @picture
    else
      render json: @picture.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pictures/1
  def destroy
    @picture.destroy
  end

  private
    def get_car
      @car = Car.find(params[:car_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_picture
      @picture = @car.pictures.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def picture_params
      params.fetch(:picture, {})
    end
end
