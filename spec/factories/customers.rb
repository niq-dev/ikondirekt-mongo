FactoryGirl.define do
  factory :customer do
    first_name 'Test'
    last_name 'Customer'
    email 'customer@test.com'
    password 'test123'
    password_confirmation 'test123'
  end
end