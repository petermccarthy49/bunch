require 'calculators/midpoint_calculator'

class MidpointsController < ApplicationController
	
  def index
    
  end

  def new

  end

  def create
    addresses = _create_addresses(params)
    coordinates = addresses.map{ |address| Coordinate.create_from(address) }
    midpoint = _create_midpoint_from(coordinates)
    midpoint.addresses << addresses[0]
    midpoint.addresses << addresses[1]
    render "show"
  end

  def _nth_address_details(n, params)
    { 
      :full_address => params["full_address_#{n}".to_sym], 
      :lat => params["lat_#{n}".to_sym].to_f, 
      :lng => params["lng_#{n}".to_sym].to_f
    }
  end

  def _create_addresses(params)
    addresses = [] 
    2.times { |i| addresses << Address.create(_nth_address_details(i, params)) }
    addresses
  end

  def _create_midpoint_from(coordinates, metric=:distance)
    midpoint_coordinates = MidpointCalculator.midpoint_by(:distance, coordinates)
    Midpoint.create(lat: midpoint_coordinates.lat, lng: midpoint_coordinates.lng)
  end

end