class AddCountColumnsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :comments_count, :integer, :default => 0 
    add_column :articles, :last_comment_time, :datetime

    Article.pluck(:id).each do |i|
      Article.reset_counters(i, :comments) # 全部重算一次
    end

  end
end
