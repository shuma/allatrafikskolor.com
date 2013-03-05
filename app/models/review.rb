class Review < ActiveRecord::Base
  belongs_to :school
  belongs_to :user
  attr_accessible :content, :rating, :school_id, :user_id
  
  #validates :user_id, presence: true
  #validates :content, presence: true
  #validates :rating, presence: true

  # shows from newest to oldest
  default_scope order: 'reviews.created_at DESC'
  # List the latest reviews
  # scope :by_reviews, :joins => :reviews, :group => "schools.id", :order => "(reviews.created_at) DESC"
  

  # returns the number of ratings for that article
  def count_ratings
    self.reviews.all.count
  end

  # returns the average rating for that article
  def avg_rating
    @avg = self.ratings.average(:rating)     
    @avg ? @avg : 0
  end
end
