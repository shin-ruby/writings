class UserInfo < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  validates :username, presence: true
  
end
