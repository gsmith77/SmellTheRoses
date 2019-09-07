class FlowersController < ApplicationController

    def new
        @flower = Flower.new
    end

    def create
        @flower = Flower.new(flower_params)
        
    end

    private

    def flower_params
        params.require("flower").permit(:name, :color)
    end
end
