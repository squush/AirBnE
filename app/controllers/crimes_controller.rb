class CrimesController < ApplicationController
  def index
    @crimes = Crime.all
    get_crime_types
    get_crime_areas
  end

  def show
    @crime = Crime.find(params[:id])
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
