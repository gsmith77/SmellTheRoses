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

        
    def add_to_owner
        @flower = Flower.find_by(name: params[:name])
        binding.pry
        if !@flower.nil? && current_owner.flowers.include?(@flower) == false
            current_owner.flowers << @flower
            current_owner.flowers.uniq
            render json: @flower, status:201
        else
            flash[:alert] = "You already own this plant"
            redirect_to owner_path(current_owner)
        end
    end

    def show
        @owner = Owner.find(params[:id])
    end

    private

    def owner_params
        params.require(:owner).permit(:first_name, :last_name, :user_name, :password)
    end
end
