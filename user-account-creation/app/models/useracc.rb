class Useracc < ApplicationRecord
    has_secure_password 

    validates :username, :password, :useremail, presence: true
end