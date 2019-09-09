require 'rake'
class FlowersController < ApplicationController

    def new
        @flower = Flower.new
    end

    def create
    end

    def destroy
        current_owner.flowers.destroy_all
        if Flower.all.size < 15
            app = Rake.application
            app.init
            # do this as many times as needed
            app.add_import('lib/tasks/scrape.rake')
            # this loads the Rakefile and other imports
            app.load_rakefile
            app['seed_database'].invoke
        end
        redirect_to owner_path(current_owner)
    end

    private

    def flower_params
        params.require(:flower).permit(:name)
    end
end
