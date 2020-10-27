class User < ApplicationRecord
    has_secure_password
    validates :username, :presence => true, :uniqueness => true
    validates :email, :presence => true, :uniqueness => true

    has_many :characters
    has_many :campaigns, :through => :characters



    def self.find_or_create_via_omniauth(auth)
        User.find_or_create_by(:email => auth[:info][:email]) do |user|
            user.email = auth[:info][:email]
            user.username = auth[:info][:nickname]
            user.password = SecureRandom.hex
        end
    end
    
end
