require 'spec_helper'

describe Location do

  before :each do
    Location::State.create(:code => 9, :name => "Wien", :language => "de")
    Location::Region.create(:code => 900, :name => "Wien", :state_code => 9)
    Location::Place.create(:code => 1100, :name => "Favoriten", :region_code => 1100)
  end

  describe "State" do
    it "should create a new instance given valid attributes" do
      FactoryGirl.create(:location_state)
    end
  end

  describe "Region" do
    it "should create a new instance given valid attributes" do
      #@region = Location::Region.create(:code => 901, :name => "Wien Flughafen", :state_code => 9)
      #@region.state.should_not be_nil
      #@region.state.code.should be @region.state_code
      FactoryGirl.create(:location_region)
    end
  end

  describe "Place" do
    it "should create a new instance given valid attributes" do
      @place = Location::Place.create(:code => 1010, :name => "Innen Stadt", :region_code => 900)
      #Location::Region.where(:code => @place.region_code).first.should_not be_nil
      #@region.state.should_not be_nil
      #@region.state.code.should be @region.state_code
    end
  end

  describe "Address" do
    it "should create a new instance given valid attributes" do
      @address = Location::Address.create(:street => "waldgasse 17", :place_code => 1100)
    end
  end
end
