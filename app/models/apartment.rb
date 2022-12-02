class Apartment < ApplicationRecord
  belongs_to :user
  # validates :title, :description, :price, :user, presence: true
  has_one_attached :picture
end
