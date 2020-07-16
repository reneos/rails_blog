class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.boolean :is_published, default: false
      t.datetime :publish_date

      t.timestamps
    end
  end
end
