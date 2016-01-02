class Comment < ActiveRecord::Base
  validates_presence_of :reply
  
  belongs_to :article, touch: :last_comment_time ,:counter_cache => true
  belongs_to :user
end
