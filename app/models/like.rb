class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :post, foreign_key: 'post_id'

  after_save :update_likes

  private

  def update_likes
    post.increment!(:like_counter)
  end
end
