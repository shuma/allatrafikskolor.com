class SessionsController < ApplicationController
	after_filter :after_sign_in_path, :only => [:create]
	
	def create
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id 
    	#redirect_to :back
	end

	def destroy
		session[:user_id] = nil
		redirect_to :back
	end
	
  private

  def after_sign_in_path
    if session[:review]
      Review.create!(:content => session[:review][:content], 
      				 :school_id => session[:review][:school_id], 
      				 :user_id => current_user.id, :rating => session[:review][:rating])      
      #cleanup
      session[:review] = nil
    end
  end
end