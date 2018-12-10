class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, dependent: :destroy, class_name: "Review"
  validates :email, presence: true, uniqueness: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates :first_name , presence: true
  validates :last_name , presence: true
  validates :password_digest , presence: true

  def self.authenticate_with_credentials(email, pwd)
   user =  User.find_by(:email => email.strip.downcase)
   pwd = pwd.length >= 6 ? pwd : nil
    if user && user.authenticate(pwd)
      return user
    else
      return false
    end
  end
  def self.password_conf(password, conf_password)
  return (password == conf_password && password.length > 6 ) ? true : false
  end
end
