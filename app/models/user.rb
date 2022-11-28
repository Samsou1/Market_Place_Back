class User < ApplicationRecord
  has_many :apartments, class_name: "apartment", foreign_key: "reference_id"

  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :recoverable,
         jwt_revocation_strategy: JwtDenylist
         
end