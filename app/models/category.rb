class Category < ApplicationRecord
  has_many :failures
  
  validates :name, presence: true, uniqueness: true
end
