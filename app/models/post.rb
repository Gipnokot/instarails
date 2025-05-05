class Post < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 150 }
  validates :body,  length: { maximum: 500 }, allow_blank: true
end

# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string(150)      not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
