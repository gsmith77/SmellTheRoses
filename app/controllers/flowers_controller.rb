class FlowersController < ApplicationController

    def new
        @flower = Flower.new
    end

    def create
    end
    
    def add_to_user
        @flower = Flower.find_by(name: params[:name])
        if !@flower.nil
            current_owner.flowers << @flower
            render json: @flower, status:201
        else
            render json: @flower, status: 500
        end
    end

    def destroy
        current_owner.flowers.destroy_all
        %x[rake seed_database]
        redirect_to owner_path(current_owner)
    end

    private

    def flower_params
        params.require(:flower).permit(:name)
    end
end
