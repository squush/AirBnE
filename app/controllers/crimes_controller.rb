class CrimesController < ApplicationController
  # Jackson
  def index
    @crimes = Crime.all
    get_crime_types
    get_crime_areas
  end

  # Arstanbek
  def new
    @crime = Crime.new
  end

  #  Arstanbek
  def create
    @crime = Crime.new(crime_params)
    @crime.user = current_user
    if @crime.save
      redirect_to @crime, notice: "Crime was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Jackson made the initial
  # Andrew made the rest
  def show
    @crime = Crime.find(params[:id])
    @user = User.find(@crime.user.id)
  end

  def my_crimes

  end

  # Arstanbek added private set_crime and crime_params
  private

  def set_crime
    @crime = Crime.find(params[:id])
  end

  def crime_params
    params.require(:crime).permit(:crime_type, :area, :price, :years_experience)
  end

  private

  def get_crime_types
    @crime_types = Crime.all.map { |crime| crime.crime_type }
    @crime_types = @crime_types.uniq
    return @crime_types
  end

  def get_crime_areas
    @crime_areas = Crime.all.map { |crime| crime.area }
    @crime_areas = @crime_areas.uniq
    return @crime_areas
  end
end
