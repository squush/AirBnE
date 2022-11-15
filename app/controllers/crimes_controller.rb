class CrimesController < ApplicationController
  # Jackson
  def index
    @crimes = Crime.all
  end

  # Jackson made the initial
  # Andrew made the rest
  def show
    @crime = Crime.find(params[:id])
    @user = User.find(@crime.user.id)
  end
end
