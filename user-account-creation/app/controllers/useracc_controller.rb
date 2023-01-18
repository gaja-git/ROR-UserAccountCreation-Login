require 'bcrypt'
class UseraccController < ApplicationController

skip_before_action :verify_authenticity_token
    def index
        # render html: "Rendering UserController"
        current_user = Useracc.find_by_id(session[:current_user_id])
        if(current_user.nil?)
            render json: "Not valid user, Please login/signup with us"
        else
            render json: current_user
        end
        # v = Useracc.all
        # render json: v
    end

    def show
        current_user = Useracc.find_by_id(session[:current_user_id])
        if(current_user.nil?)
            render json: "Not valid user, Please Login/Signup with us"
        else
            v = Useracc.find_by_id(params[:id])
            render json: v
        end
    end

    def create
        # current_user = Useracc.find_by_id(session[:current_user_id])
        # if(current_user.nil?)
        #     render json: "Not valid user, Please signup with us"
        # else
            v = !params[:username].nil? and !params[:useremail].nil? and !params[:password].nil?

            if(v)
                p = Useracc.create('username': params[:username], 'useremail': params[:useremail], 'password': params[:password])
                puts p
                render json: "User added"
            else
                render json: "User not added"
            end
        # end
    
    end
end
