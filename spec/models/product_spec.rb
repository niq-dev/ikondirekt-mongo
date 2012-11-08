require 'spec_helper'

describe Product do
  it "should create a new instance given valid attributes" do
    #Factory(:product)
    post = FactoryGirl.create(:product)
  end
end