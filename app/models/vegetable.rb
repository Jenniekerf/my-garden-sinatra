class Vegetable < ActiveRecord::Base 
  has_secure_password
  belongs_to :gardener
end