class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end

    add_check_constraint :comments, "char_length(body) <= 150", name: "body_length_check"
  end
end
