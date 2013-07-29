class Direction < ActiveRecord::Base
  belongs_to :recipe

  validates :step_number, numericality: { greater_than: 0 }
  validates :step_number, :description, presence: true
end
