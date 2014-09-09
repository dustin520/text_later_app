


FactoryGirl.define do
  factory :contact do
    first_name Faker::Lorem.words(2).join("")
    last_name Faker::Lorem.words(2).join("")
  	phone_num Faker::PhoneNumber.phone_number
  end
end