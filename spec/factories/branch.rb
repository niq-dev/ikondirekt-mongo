#FactoryGirl.define do
#  factory :branch do
#    sequence(:name) { |n| "Branch #{n}" }
#    sequence(:email) { |n| "email#{n}@branch.org" }
#    office_hours "Mo - Fr: 8:00 - 18:00, Sa: 9:00 - 12:00"
#    address  { FactoryGirl.build(:location_address) }
#
#    #association :address, factory: :location_address
#    #association :address
#  end
#end
