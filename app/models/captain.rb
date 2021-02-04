class Captain < ApplicationRecord
    has_many :shifts
    has_many :trucks, through: :shifts
    has_secure_password
    validates :name, presence: true
    validates :email, uniqueness: true, presence: true
end
