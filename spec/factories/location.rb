FactoryGirl.define do

  factory :location_address, class: Location::Address do
    street "waldgasse 17"
    place_code 1100
    phone "+43 1 123456"
    fax "+43 1 123459"
  end

  factory :location_place, class: Location::Place do
    code "1100"
    name "Favoriten"
    region_code 900
  end

  factory :location_region, class: Location::Region do
    #before(:create) do
    #  state = FactoryGirl.create(:location_state)
    #end
    #code 900
    #name "Wien"
    #state_code state.code
  end

  factory :location_state, class: Location::State do
    code 9
    name "Wien"
    language "DE"
  end
end