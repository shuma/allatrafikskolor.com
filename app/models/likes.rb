class Likes < ActiveRecord::Base
  attr_accessible :fan_count, :school_id
  belongs_to :school
end
