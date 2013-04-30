class StaticPagesController < ApplicationController
  def home
  	@top_schools = School.by_score.limit(5)
  	@top_likes = School.by_likes.limit(5)
    @lates_reviews = Review.limit(2) unless Review.nil? 
  end

  def help
  end

  def show
  end
end
