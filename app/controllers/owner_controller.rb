class OwnersController < ApplicationController

    def new
        @owner = Owner.new
    end

    def create
        @owner = Owner.new(owner_params)
    end

    private

    def owner_params
        params.require("owner").permit(:first_name, :last_name)
    end
end
