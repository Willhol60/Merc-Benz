require 'open-uri'
require 'json'

class LocationsController < ApplicationController
  def index
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    url = "https://api.mapbox.com/geocoding/v5/mapbox.places/museum.json?proximity=#{(@location.long).to_f},#{(@location.lat).to_f}types=poi&limit=5&access_token=#{ENV['MAPBOXTOKEN']}"
    hash_landmarks = JSON.parse(URI.open(url).read)
    @landmarks = hash_landmarks["features"]
    if @landmarks.empty?
      render 'create'
    else
      render 'index'
    end
  end

  private

  def location_params
    params.require(:location).permit(:lat, :long)
  end
end
