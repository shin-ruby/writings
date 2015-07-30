class Liker < ActiveRecord::Base
	belongs_to :user
	belongs_to :writing
	validates :user_id, presence: true
	validates :writing_id, presence: true
end
