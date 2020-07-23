class ChangeDefaultOnIsPublishedForPosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :is_published, :integer, default: 0
  end
end
