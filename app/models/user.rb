class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  before_save { self.email = email.downcase }
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

  validates :nickname , presence: true
  validates :email, presence: true, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: "は@とドメインを含んだものを入力してください" }, 
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/, message: "は半角英数字で入力してください"}, length: { minimum: 6 }

  def self.search(search)
    return User.all unless search
    User.where('nickname LIKE(?)', "%#{search}%")
  end
end
