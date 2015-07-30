class Comment < ActiveRecord::Base
  belongs_to :writing, counter_cache: :comments_count
end
