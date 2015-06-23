class UserInfo < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id
  validates :username, presence: true
  validate :avatar_size
  
  mount_uploader :avatar, AvatarUploader


  private

    def avatar_size
    	if avatar.size > 2.megabytes
    		errors.add(:avatar, "should be less than 2MB")
    	end
    end

end
