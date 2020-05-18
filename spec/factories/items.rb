FactoryBot.define do
  
  factory :item do
    name  {Faker::Name.last_name}
    image  {File.open("#{Rails.root}/public/images/test_image.jpg")}
    user
  end
end