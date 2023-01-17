require 'bcrypt'
class LoginController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        render html: "hello login user"
    end

    def create
        usr = Useracc.find_by('useremail': params[:useremail])
        if(usr.nil?)
            render json: "User does not exit"
        # else
        #     if(usr.authenticate(params[:password]))
        #         session[:current_user_id] = usr.id
        else
                render json: "logged in successfully"
            # else
            #     render json: "Password is not correct"
            # end
        end
    end

    def destroy
        # session.delete(:current_user_id)
        render json: "Logged out successfully"
    end
end
