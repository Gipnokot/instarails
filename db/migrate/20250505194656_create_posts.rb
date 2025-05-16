class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, limit: 150, null: false
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end

    add_check_constraint :posts, "char_length(body) <= 500", name: "body_max_length"
  end
end
