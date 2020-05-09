class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum mysize: { "選択してください":"","22cm":"22cm","22.5cm":"22.5cm",
               "23cm":"23cm","23.5cm":"23.5cm",
               "24cm":"24cm","24.5cm":"24.5cm",
               "25cm":"25cm","25.5cm":"25.5cm",
               "26cm":"26cm","26.5cm":"26.5cm",
               "27cm":"27cm","27.5cm":"27.5cm",
               "28cm":"28cm","28.5cm":"28.5cm",
               "29cm":"29cm","29.5cm":"29.5cm",
               "30cm":"30cm" }
  has_many :items
  mount_uploader :iconimage, ImageUploader

  def self.search(search)
    return User.all unless search
    User.where('nickname LIKE(?)', "%#{search}%")
  end
end
