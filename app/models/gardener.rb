class Gardener < ActiveRecord::Base 
  has_secure_password
  has_many :vegetables
end