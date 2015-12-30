class AddViewToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :view, :integer, :default => 0
  end
end
