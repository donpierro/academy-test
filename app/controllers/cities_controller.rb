class CitiesController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def index
    @cities = City.select(:id, :name, :short_name).paginate(page: params[:page], per_page: 10)
    respond_with(@cities)
  end

  def show
    respond_with(@city)
  end

  def new
    @city = City.new
    respond_with(@city)
  end

  def edit
  end

  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to cities_path, notice: 'City was successfully created.'
    else
      redirect_to new_city_path, alert: @city.errors.full_messages.join(". ")
    end
  end

  def update
    @city.update(city_params)
    redirect_to cities_path, notice: 'City was successfully updated.'
  end

  def destroy
    @city.destroy
    redirect_to cities_path, notice: 'City was successfully deleted.'
  end

  private
    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit(:name, :short_name)
    end
end
