class Apartment < ApplicationRecord
  belongs_to :user
  validates :title, :description, :price, :user, presence: true
end
