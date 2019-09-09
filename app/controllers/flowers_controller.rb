class FlowersController < ApplicationController

    def new
        @flower = Flower.new
    end

    def create
    end

    def destroy
        current_owner.flowers.destroy_all

        redirect_to owner_path(current_owner)
    end

    private

    def flower_params
        params.require(:flower).permit(:name)
    end
end
