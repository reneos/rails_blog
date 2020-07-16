class AddDefaultToPublishDatePosts < ActiveRecord::Migration[6.0]
  def change
    change_column :posts, :publish_date, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
end
