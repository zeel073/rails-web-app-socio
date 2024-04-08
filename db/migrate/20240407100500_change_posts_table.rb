class ChangePostsTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :posts, :title, :caption
    remove_column :posts, :description
    remove_column :posts, :keywords
  end
end
