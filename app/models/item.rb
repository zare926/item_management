class Item < ApplicationRecord
  enum status: { unused: 0, used: 1 }
  enum size: { "選択してください":"","22cm":"22cm","22.5cm":"22.5cm",
               "23cm":"23cm","23.5cm":"23.5cm",
               "24cm":"24cm","24.5cm":"24.5cm",
               "25cm":"25cm","25.5cm":"25.5cm",
               "26cm":"26cm","26.5cm":"26.5cm",
               "27cm":"27cm","27.5cm":"27.5cm",
               "28cm":"28cm","28.5cm":"28.5cm",
               "29cm":"29cm","29.5cm":"29.5cm",
               "30cm":"30cm" }
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :used, optional: true
end
