class School < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: [:slugged, :history] 
  
  has_many :reviews
  has_one :price
  has_one :likes
  has_one :checkin

  scope :by_score,   :joins => :reviews, :group => "schools.id", :order => "AVG(reviews.rating) DESC"
  scope :by_likes,   :joins => :likes,   :group => "schools.id", :order => "AVG(likes.fan_count) DESC"
  scope :by_desc,    :joins => :reviews, :group => "schools.id", :order => "DESC"
    
  include Tire::Model::Search
  include Tire::Model::Callbacks


  def self.search(params)
    params[:sort] ||= 'asc'
    tire.search(load: true, page: params[:page], per_page: 7) do 
      query { string params[:query] } if params[:query].present?
      sort { by :paket_pris, params[:sort] }
    end
  end

  def to_indexed_json
    to_json(methods: [:paket_pris])
  end

  def paket_pris
    price.paket_pris
  end

  # Beräknar medelvärdet för alla recensioner
  def avgerage_review_rating
  	return nil if reviews.blank?
  	reviews.average(:rating)
  end

  def count_reviews
  	reviews.count
  end

  def latest_reviews
    Review.joins(:school, :user).select("content, rating, schools.name, users.name").limit(2) 
  end
end
