# ROR-UserAccountCreation-Login

User account creation and Login api

User account creation:

rails new user-account-creation -d postgresql

/config/database.yml
replace
line 26:postgres_rails_app_development - bookdb
line 32: uncomment
line 35: uncomment give your password
line 40: uncomment

routes.rb add:
root "application#index"

rails generator controller useracc
/app/controller/application_controller.rb
def index
render html: "rendering application"
end

rails generate migration create_useracc
add the below fields:
t.string :username
t.string :useremail  
 t.string :password_digest

rails db:migrate

/app/model/
create useracc.rb
class Useracc < ApplicationRecord

end

inorder to hash the passsword
goto : gemfile
uncomment line 37 - bycrypt
then run "bundle install"

/config/routes
resources :user

in useracc_controller.rb
require 'bcrypt'
Add create for post operation

in useracc.rb model file
class Useracc < ApplicationRecord
has_secure_password  
end

rails generate controller login
/config/routes
resources :login

add crud in login_controller
create check email and password
to check password use usr.athenticate()

rails generate controller logout
/config/routes
resources :logout
add crud in logout_controller
