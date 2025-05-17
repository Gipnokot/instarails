class AddAvatarDataToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :avatar_data, :jsonb
  end
end
