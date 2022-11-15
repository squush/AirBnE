class CrimesController < ApplicationController
  def index
    @crimes = Crime.all
  end

  # Arstanbek
  def new
    @crime = Crime.new
  end

  #  Arstanbek
  def create
    @crime = Crime.new(crime_params)

    if @crime.save
      redirect_to @crime, notice: "Crime was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @crime = Crime.find(params[:id])
  end

  # Arstanbek added private set_crime and crime_params
  private

  def set_crime
    @crime = Crime.find(params[:id])
  end

  def crime_params
    params.require(:crime).permit(:crime_type, :area, :price)
  end
end
