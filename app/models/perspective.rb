class Perspective < ApplicationRecord
  has_many :perspective_analyses
  has_many :failures, through: :perspective_analyses
  
  validates :name, presence: true, uniqueness: true
end
