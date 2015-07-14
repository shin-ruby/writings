class Writing < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  default_scope -> { order created_at: :desc }
  mount_uploader :photo, PhotoUploader
  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 200}

  validate :photo_size
  

  private

    def photo_size
    	if photo.size > 5.megabytes
    		errors.add(:photo, "should be less than 5MB")
    	end
    end
  
end
