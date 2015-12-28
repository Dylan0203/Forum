class Category < ActiveRecord::Base
  has_many :article_categoryships, :dependent => :destroy
  has_many :articles, :through => :article_categoryships
end
