class Item < ApplicationRecord
  enum status: { unused: 0, used: 1 }
  mount_uploader :image, ImageUploader
  belongs_to :user
end
