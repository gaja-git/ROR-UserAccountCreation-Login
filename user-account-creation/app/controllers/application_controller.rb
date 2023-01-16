class ApplicationController < ActionController::Base

    def index
        render html: "rendering application"
    end

end
