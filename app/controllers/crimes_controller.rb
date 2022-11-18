class CrimesController < ApplicationController
  before_action :get_crime_types, only: %i[index]

  def index
    # Filtering on crime index
    @query = params[:query].split(" ") if params[:query]
    @query.present? ? @crimes = Crime.all.search_by_type_and_area(params[:query]).order(:price) : @crimes = Crime.all.order(:price)

    # Mapbox on crime index
    @markers = @crimes.geocoded.map do |crime|
      {
        lat: crime.latitude,
        lng: crime.longitude,
        info_window: render_to_string(partial: "info_window", locals: {crime: crime})
      }
    end
  end

  def new
    @crime = Crime.new
  end

  def create
    @crime = Crime.new(crime_params)
    @crime.user = current_user
    if @crime.save
      redirect_to @crime, notice: "Crime was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @crime = Crime.find(params[:id])
    @user = User.find(@crime.user.id)
  end

  def destroy
    @crime = Crime.find(params[:id])
    @crime.destroy
    redirect_to crimes_path, notice: "Crime destroyed!"
  end

  def edit
    @crime = Crime.find(params[:id])
  end

  def update
    @crime = Crime.find(params[:id])
    @crime.update(crime_params)
    redirect_to crime_path(@crime)
  end

  def my_crimes
    @my_crimes = Crime.all.select { |crime| crime.user == current_user }
  end

  private

  def set_crime
    @crime = Crime.find(params[:id])
  end

  def crime_params
    params.require(:crime).permit(:crime_type, :area, :price, :years_experience)
  end

  def get_crime_types
    @crime_types = Crime.all.map { |crime| crime.crime_type.capitalize }
    @crime_types = @crime_types.uniq
    return @crime_types
  end
end
