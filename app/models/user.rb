class User < ApplicationRecord
  has_many :apartments, class_name: 'apartment', foreign_key: 'reference_id'

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :recoverable,
         jwt_revocation_strategy: JwtDenylist
  validates :first_name,
            length: {
              minimum: 2
            }, allow_nil: true
  validates :last_name,
            length: {
              minimum: 2
            }, allow_nil: true
end
