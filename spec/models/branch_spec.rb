#require 'spec_helper'
#
#describe Branch do
#  it "should create a new instance given valid attributes" do
#    FactoryGirl.create(:branch)
#  end
#
#  describe "name" do
#    it { should_not accept_values_for(:name, nil) }
#    it { should_not accept_values_for(:name, "a") }
#    it { should_not accept_values_for(:name, "a" * 201) }
#
#    it { should accept_values_for(:name, "a" * 2) }
#    it { should accept_values_for(:name, "a" * 200) }
#  end
#end