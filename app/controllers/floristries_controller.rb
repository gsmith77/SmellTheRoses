class FloristriesController < ApplicationController

    def index
        @floristries = Floristry.all

        render json: @floristries
    end
end
