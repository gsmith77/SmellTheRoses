class FloristriesController < ApplicationController

    def index
        @floristries = Floristry.all

        render json: @floristries
    end

    def show
        @floristry = Floristry.find(params[:id])
        render json: @floristry
    end
end
