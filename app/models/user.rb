class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true, length: { in: 3..12 }
  has_and_belongs_to_many :comics
end
