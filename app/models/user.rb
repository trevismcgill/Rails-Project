class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true

    has_many :campaigns
    has_many :characters, through: :campaigns
end
