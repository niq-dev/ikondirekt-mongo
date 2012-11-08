class Api::LocationsController < ApplicationController
  def index
    if params[:region_code].present?
      @places_list = ["", "&nbsp;"] + Location::Place.where(:region_code => params[:region_code]).map { |r| [r.code.to_s, r.name] }
      @response = Hash[@places_list]
    elsif params[:state_code].present?
      @regions_list =  Location::Region.where(:state_code => params[:state_code]).map { |r| [r.code.to_s, r.name] }
      @response = Hash[@regions_list]
    end

    respond_to do |format|
      format.json { render json: @response }
    end
  end
end