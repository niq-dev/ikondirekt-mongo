# encoding: utf-8
require 'spec_helper'

describe Enquiry do

  before :each do
    #Location::State.create(:code => 9, :name => "Wien", :language => "de")
    #Location::Region.create(:code => 900, :name => "Wien", :state_code => 9)
    #Location::Place.create(:code => 1100, :name => "Favoriten", :region_code => 900)
    #@customer = Customer.create!(:email => 'c@1.com',
    #                             :password => '123456',
    #                             :password_confirmation => '123456',
    #                             :first_name => "Yifeng",
    #                             :last_name => "Qin",
    #                             :gentler => "",
    #                             :title => "",
    #                             :birthday => "",
    #                             :mobile => "+43 69911091138",
    #                             :address => {:place_code => 1010,
    #                                          :street => "waldgasse 17"})
    @product = Product.create(:name => 'Konsumkredit')

    @product.enquiry_fields.create!(machine_name: :mark,
                                    title: 'Marke',
                                    type: :input,
                                    position: 1)
    @product.enquiry_fields.create!(machine_name: :type,
                                    title: 'Type',
                                    type: :input,
                                    position: 2)
    @product.enquiry_fields.create!(machine_name: :period,
                                    title: 'Laufzeit',
                                    type: :select,
                                    enum: '1 Jahre, 2 Jahren, 3 Jahren, 4 Jahren, 5 Jahren',
                                    position: 3)
    @product.enquiry_fields.create!(machine_name: :repayment,
                                    title: 'Rückführung',
                                    type: :select,
                                    enum: ["Raten", "Endfällig"],
                                    position: 4)
    @product.reply_fields.create!(machine_name: :effective_interest_rate,
                                  title: 'Effektivzinssatz (Indikation)',
                                  type: :input,
                                  position: 1)
    @product.reply_fields.create!(machine_name: :total,
                                  title: 'Gesamtbelastung in EUR',
                                  type: :input,
                                  position: 2)
    @product.reply_fields.create!(machine_name: :monthly_interest_rate,
                                  title: 'Gesamtrate p.M.',
                                  type: :input,
                                  position: 3)
  end

  it "should create a new instance with incoming info" do
    #@enquiry = @customer.enquiries.new(:product => @product)
    @enquiry = Enquiry.new(:product => Product.first)
    @enquiry.amount = 123
    @enquiry.period("123456")
    @enquiry.reason("blsdfhlsg")
    @enquiry.save!

    Enquiry.count.should be 1
    @enquiry_back = Enquiry.first
    @enquiry_back.should_not be_nil
    @enquiry_back.amount.should be 123
    @enquiry_back.reason.should be "blsdfhlsg"

  end
end
