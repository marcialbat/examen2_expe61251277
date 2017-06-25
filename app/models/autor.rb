class Autor < ApplicationRecord
 has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  
  has_many :book
end
