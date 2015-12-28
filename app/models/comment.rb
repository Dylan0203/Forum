class Comment < ActiveRecord::Base
  validates_presence_of :reply
  
  belongs_to :article
  belongs_to :user
end
