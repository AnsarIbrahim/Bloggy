class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  belongs_to :user

  after_save :update_comments_counter

  private

  def update_comments_counter
    post.increment!(:comments_count)
  end
end
