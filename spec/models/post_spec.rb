require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Test User', post_counter: 0) }

  it 'is valid with a title, author, and default counters' do
    post = Post.new(title: 'Test Title', author: user)
    expect(post).to be_valid
  end

  it 'is invalid without a title' do
    post = Post.new(author: user)
    expect(post).to_not be_valid
  end

  it 'is valid with a comment_counter of 0' do
    post = Post.new(title: 'Test Title', author: user, comment_counter: 0)
    expect(post).to be_valid
  end

  it 'is invalid with a negative comment_counter' do
    post = Post.new(title: 'Test Title', author: user, comment_counter: -1)
    expect(post).to_not be_valid
  end

  it 'is valid with a like_counter of 0' do
    post = Post.new(title: 'Test Title', author: user, like_counter: 0)
    expect(post).to be_valid
  end

  it 'is invalid with a negative like_counter' do
    post = Post.new(title: 'Test Title', author: user, like_counter: -1)
    expect(post).to_not be_valid
  end

  it 'increments the author\'s post_counter after save' do
    Post.create(title: 'Test Title', author: user)
    expect(user.reload.post_counter).to eq(1)
  end

  describe 'recent_comments' do
    it 'returns the most recent comments' do
      post = Post.create(title: 'Test Title', author: user)
      comment1 = Comment.create(text: 'First comment', user_id: user.id, post_id: post.id, created_at: 1.day.ago)
      comment2 = Comment.create(text: 'Second comment', user_id: user.id, post_id: post.id, created_at: 2.days.ago)
      comment3 = Comment.create(text: 'Third comment', user_id: user.id, post_id: post.id, created_at: 3.days.ago)

      expect(post.recent_comments).to eq([comment1, comment2, comment3])
    end
  end

  describe 'update_posts_counter' do
    it 'increments the author\'s post_counter' do
      post = Post.create(title: 'Test Title', author: user)
      expect { post.send(:update_posts_counter) }.to change { user.reload.post_counter }.by(1)
    end
  end
end
