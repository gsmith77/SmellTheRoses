class OwnersController < ApplicationController

    def new
        @owner = Owner.new
    end

    def create
        @owner = Owner.new(owner_params)
        if @owner.save
            session[:owner_id] = @owner.id
            redirect_to owner_path(current_owner)
        else
            render new_owner_path
        end
    end

    def show
        @owner = Owner.find(params[:id])
    end

    private

    def owner_params
        params.require("owner").permit(:first_name, :last_name, :user_name, :password)
    end
end
