class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :topic
      t.text :content
      t.boolean :is_public
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
