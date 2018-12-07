class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, dependent: :destroy, class_name: "Review"
  validates :email, presence: true, uniqueness: true
  validates :first_name , presence: true
  validates :last_name , presence: true
end
