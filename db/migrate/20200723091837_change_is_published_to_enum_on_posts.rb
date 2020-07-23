class ChangeIsPublishedToEnumOnPosts < ActiveRecord::Migration[6.0]
  def change
    change_column_default :posts, :is_published, nil
    change_column :posts, :is_published, 'integer USING CAST(is_published AS integer)'
  end
end
