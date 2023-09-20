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
end
