class Analysis < ApplicationRecord
  belongs_to :failure
  
  validates :internal_factors, presence: true
  validates :external_factors, presence: true
end
