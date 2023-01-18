class SearchbkauthorController < ApplicationController

    skip_before_action :verify_authenticity_token
    def index
        render html: "Rendering searchbkauthor"
    end

    def create
        current_user = Useracc.find_by_id(session[:current_user_id])
        if(current_user.nil?)
            render json: "Not valid user"
        else
            bkbyauthor = Bookstock.where('bookauthor': params[:bookauthor])
            if(bkbyauthor.nil?)
                render json: "Book does not exit"
            else
                render json: bkbyauthor
            end
            
        end
    end
end
