class Captain < ApplicationRecord
    has_many :shifts
    has_many :trucks, through: :shifts
    has_secure_password
    validates :name, presence: true
    validates :email, uniqueness: true, presence: true



    def self.google_omniauth_login(auth)
        self.find_or_create_by(email: auth[:info][:email]) do |c|
         c.name = auth.info.name
         c.password = SecureRandom.hex
        end
    end
end


    

