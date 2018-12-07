class Review < ActiveRecord::Base
  belongs_to :product, class_name: "Product", foreign_key: 'product_id'
  belongs_to :user, class_name: "User", foreign_key: 'user_id'
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}

end
