class FloristriesController < ApplicationController

    def index
        binding.pry
        @floristries = Floristry.all
    end
end
