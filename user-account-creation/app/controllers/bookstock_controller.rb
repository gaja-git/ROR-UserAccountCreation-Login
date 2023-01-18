class BookstockController < ApplicationController

    skip_before_action :verify_authenticity_token
    def index
        current_user = Useracc.find_by_id(session[:current_user_id])
        if(current_user.nil?)
            render json: "Not valid user"
        else
            render json: Bookstock.all
        end
    end

    def show 
        current_user = Useracc.find_by_id(session[:current_user_id])
        if(current_user.nil?)
            render json: "Not valid user"
        else
            b = Bookstock.find_by_id(params[:id])
            if(b.nil?)
                render json:"No book of ID:#{params[:id]}" 
            else
                render json: b
            end
           
        end
    end

    def create
        current_user = Useracc.find_by_id(session[:current_user_id])
        if(current_user.nil?)
            render json: "Not valid user"
        else
            v = !params[:bookname].nil? and !params[:bookauthor].nil?  and !params[:bookquantity].nil?
            if(v)
                p = Bookstock.create('bookname': params[:bookname], 'bookauthor': params[:bookauthor], 'bookquantity': params[:bookquantity])
                puts p
                render json: "Book Added"
            else
                render json: "Book not added" 
            end   
        end 
    end

    def update
        current_user = Useracc.find_by_id(session[:current_user_id])
        if(current_user.nil?)
            render json: "Not valid user"
        else
            p = Bookstock.find(params[:id].to_i)
            p.update('bookname': params[:bookname], 'bookauthor': params[:bookauthor], 'bookquantity': params[:bookquantity])
            render json: "Book updated"
        end
    end

    def destroy
        current_user = Useracc.find_by_id(session[:current_user_id])
        if(current_user.nil?)
            render json: "Not valid user"
        else
            p = Bookstock.find(params[:id])
            p.destroy
            render json: "Book deleted"
        end
    end


end
