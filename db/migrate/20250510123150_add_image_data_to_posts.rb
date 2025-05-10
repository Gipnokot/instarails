class AddImageDataToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :image_data, :jsonb
  end
end
