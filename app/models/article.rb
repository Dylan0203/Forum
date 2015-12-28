class Article < ActiveRecord::Base
   validates_presence_of :topic, :content, :user_id

   belongs_to :user

   has_many :article_categoryships
   has_many :categories, :through => :article_categoryships

   has_many :comments, :dependent => :destroy
end
