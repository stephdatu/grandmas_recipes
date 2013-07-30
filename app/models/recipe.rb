class Recipe < ActiveRecord::Base
  validates :title, presence: true

  has_many :directions, dependent: :delete_all
  belongs_to :user
end
