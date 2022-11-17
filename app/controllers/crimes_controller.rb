class CrimesController < ApplicationController
  # Jackson
  def index

    get_crime_types
    get_crime_areas

    @query = params[:keywords].split(" ") if params[:keywords]
    @query.nil? ? all_crimes_by_price : get_crimes_by_query
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

  # Arstanbek added private set_crime and crime_params
  private

  def set_crime
    @crime = Crime.find(params[:id])
  end

  def crime_params
    params.require(:crime).permit(:crime_type, :area, :price, :years_experience)
  end

  def all_crimes_by_price
    @crimes = Crime.all.sort_by { |crime| crime.price }
    return @crimes
  end

  # This returns all the crimes where any word of the type or area matches any word of the search query
  def get_crimes_by_query
    all_crimes = Crime.all
    @crimes = []
    all_crimes.each do |crime|
      # TODO: possibly add stricter search criteria to account for commas, etc.
      crime_words = crime.crime_type.split(" ") + crime.area.split(" ")
      @crimes << crime if @query.any? { |word| crime_words.include?(word) }
    end
    @crimes = @crimes.sort_by { |crime| crime.price }
    return @crimes
  end

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
