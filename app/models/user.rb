class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :email, presence: true
    has_many :
    has_many : through: :
end
