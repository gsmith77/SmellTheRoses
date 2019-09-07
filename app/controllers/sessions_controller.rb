class SessionsController < ApplicationController

    def new
    
    end
    
    def create
        if auth.present?
            @owner = Owner.find_or_create_by(uid: auth['uid']) do |o|
            o.password = SecureRandom.urlsafe_base64(n=6)
            o.name = auth['info']['name']
            o.image = auth['info']['image']
            end
            session[:owner_id] = @owner.id
     
            redirect_to owner_path(@owner)
        elsif
            @owner = Owner.find_by(user_name: params[:user_name])
            session[:owner_id] = @owner.id
            redirect_to owner_path(@owner)
        else 
            @owner = Owner.find_by(user_name: params[:user_name])
            redirect_to '/signin' if @owner == nil
        end
    end

    def destroy
        session.delete(:owner_id)
        current_owner = nil
        flash[:alert] = "You are now Logged Out Have a Nice Day!"
        redirect_to '/'
    end

    private 

    def auth
        request.env['omniauth.auth']
    end
end