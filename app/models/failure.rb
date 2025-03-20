class Failure < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_one :analysis, dependent: :destroy
  has_many :perspective_analyses, dependent: :destroy
  has_many :perspectives, through: :perspective_analyses
  
  validates :title, presence: true
  validates :date, presence: true
  validates :description, presence: true
end
