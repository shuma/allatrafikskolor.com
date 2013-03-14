class ReviewsController < ApplicationController
    before_filter :signed_in_user, only: [:create, :destroy]
    
    def create
    	@school = School.find(params[:school_id])
    	@review = @school.reviews.new(params[:review])

    	@review.user_id = current_user.id
    	
        if @review.save
        	redirect_to @review.school, notice: "Review has been created."
   		else
        	render :new
    	end

        if current_user
            User.delay.share_review(current_user.id, school_url(@school))
        end
	end

	def new
    	@school = School.find_by_id(params[:school_id])
    	@review = Review.new
	end

    
    private 
    def signed_in?
        !current_user.nil?
    end

    def signed_in_user
        unless signed_in?
            session[:review] = {:content => params[:review][:content], :rating => params[:review][:rating], :school_id => params[:review][:school_id]}
            #session[:school] = School.find(params[:school_id])
            #session[:review] = params[:review]
            #session[:rating] = params[:rating]

            # Login the user to facebook
            redirect_to "/auth/facebook"
        end
    end
end
