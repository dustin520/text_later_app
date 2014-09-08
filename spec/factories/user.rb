

FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    pswrd = Faker::Lorem.words(4).join("")
    password pswrd
    password_confirmation pswrd
    phone_num Faker::PhoneNumber.phone_number
    first_name Faker::Lorem.words(2).join("")
    last_name Faker::Lorem.words(2).join("")
  end
end