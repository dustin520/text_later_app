

FactoryGirl.define do
  factory :saved_msg do
    subject Faker::Lorem.words.to_s
    content Faker::Lorem.paragraph
    time Faker::Time.date
    send_num Faker::PhoneNumber.phone_number
  end
end