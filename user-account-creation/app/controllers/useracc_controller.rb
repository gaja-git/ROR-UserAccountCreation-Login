require 'bcrypt'
class UseraccController < ApplicationController

skip_before_action :verify_authenticity_token
    def index
        # render html: "Rendering UserController"
        # current_user = Useracc.find_by_id(session[:current_user_id])
        # render json: current_user
        v = Useracc.all
        render json: v
    end

    def show
        v = Useracc.find(params[:id])
        render json: v
    end

    def create
        v = !params[:username].empty? and !params[:useremail].empty? and !params[:password].empty?

        if(v)
            p = Useracc.create('username': params[:username], 'useremail': params[:useremail], 'password': params[:password])
            puts p
            render json: "User added"
        else
            render json: "User not added"
        end
    end
end
