class AddCascadeDeleteToLikes < ActiveRecord::Migration[7.2]
  def change
    remove_foreign_key :likes, :posts
    add_foreign_key :likes, :posts, on_delete: :cascade
  end
end
