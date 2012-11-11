# encoding: utf-8
require 'spec_helper'

shared_examples "Location Background Data" do
  context "initialized with dummy data" do
    @state = Location::State.create(:code => 9, :name => "Wien", :language => "de")
    @region = Location::Region.create(:code => 900, :name => "Wien", :state_code => 9)
    #@place = Location::Place.create(:code => 1100, :name => "Favoriten", :region_code => 1100)
  end

  it "should be validated" do
    Location::State.count.should == 1
    Location::State.count.should == 0
    Location::Region.count.should == 1
    Location::Place.count.should == 1
    #Location::State.first.name.should == "Wien"
    #
    #Location::Region.first.name.should == "Wien"
  end
end

#describe "Address" do
#  include_context "Location Background"
#
#  it "should create a new instance given valid attributes" do
#    Location::Address.create!(:place_code => 1130,
#                              :street => "Bahnhofstraße 31",
#                              :phone => '05 99 05-6714 00',
#                              :fax => '05 99 05-6714 00')
#  end
#end
#
#describe "State" do
#  include_context "Location Background"
#  it "should create a new instance given valid attributes" do
#    Location::State.create!(:code => 9, :name => "Wien", :language => "de")
#  end
#end
#
#describe "Region" do
#  it "should create a new instance given valid attributes" do
#    Location::Region.create(:code => 900, :name => "Wien", :state_code => 9)
#  end
#end
#
#describe "Place" do
#  include_context "Location Background"
#  it "should create a new instance given valid attributes" do
#    @place = Location::Place.new(:code => 1100, :name => "Favoriten", :region_code => 1100)
#    @place.region.code.should be 900
#    @place.region.state.should be_nil?
#  end
#end
