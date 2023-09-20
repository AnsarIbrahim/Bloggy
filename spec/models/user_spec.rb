require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'when name and post_counter are present' do
      it 'is valid' do
        user = User.new(name: 'John Doe', post_counter: 0)
        expect(user).to be_valid
      end
    end

    context 'when name is missing' do
      it 'is invalid' do
        user = User.new(post_counter: 5)
        expect(user).to_not be_valid
      end
    end

    context 'when name is too long' do
      it 'is invalid' do
        user = User.new(name: 'A' * 51, post_counter: 5)
        expect(user).to_not be_valid
      end
    end

    context 'when post_counter is negative' do
      it 'is invalid' do
        user = User.new(name: 'John Doe', post_counter: -1)
        expect(user).to_not be_valid
      end
    end

    context 'when post_counter is zero' do
      it 'is valid' do
        user = User.new(name: 'John Doe', post_counter: 0)
        expect(user).to be_valid
      end
    end
  end

  describe 'recent_posts' do
    it 'returns the most recent posts' do
      user = User.create(name: 'John Doe', post_counter: 0)
      post1 = Post.create(title: 'First post', author: user, created_at: 1.day.ago)
      post2 = Post.create(title: 'Second post', author: user, created_at: 2.days.ago)
      post3 = Post.create(title: 'Third post', author: user, created_at: 3.days.ago)

      expect(user.recent_posts).to eq([post1, post2, post3])
    end
  end
end
