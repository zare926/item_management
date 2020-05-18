FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(min_length: 6)
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {password}
    password_confirmation {password}
    mysize                {"23cm"}
    iconimage             {File.open("#{Rails.root}/public/images/test_image.jpg")}
  end

end