class Post < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :title, presence: true, length: { maximum: 150 }
  validates :body,  length: { maximum: 500 }, allow_blank: true
  validates :image_data, presence: true

  scope :recent, -> { order(created_at: :desc) }

  def update_likes_count
    update(likes_count: likes.count)
  end
end

# == Schema Information
#
# Table name: posts
#
#  id          :bigint           not null, primary key
#  body        :text
#  image_data  :jsonb
#  likes_count :integer          default(0), not null
#  title       :string(150)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
