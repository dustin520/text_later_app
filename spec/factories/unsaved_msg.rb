

FactoryGirl.define do
  factory :unsaved_msg do
    email Faker::Internet.email
    content Faker::Lorem.paragraph
    time Faker::Time.date
    send_num Faker::PhoneNumber.phone_number
  end
end