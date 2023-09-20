class Post < ApplicationRecord
  validates :title, presence: true, length: { minimum: 5 }
  validates :comment_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :like_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }


  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  after_save :update_posts_counter

  def recent_comments(limit = 5)
    comments.last(limit)
  end

  private

  def update_posts_counter
    author.increment!(:post_counter)
  end
end
