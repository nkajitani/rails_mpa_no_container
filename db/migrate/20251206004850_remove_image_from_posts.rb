class RemoveImageFromPosts < ActiveRecord::Migration[8.1]
  def change
    remove_column :posts, :image, :string
  end
end
