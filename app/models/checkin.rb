class Checkin < ActiveRecord::Base
  attr_accessible :checkin_count, :school_id
  belongs_to :school
end
