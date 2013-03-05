class Friend < ActiveRecord::Base
  belongs_to :user
  has_many :checkins
  validates :user_id, presence: true
end
