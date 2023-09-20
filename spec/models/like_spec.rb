require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like Model' do
    let(:user) { User.create(name: 'Ansar', photo: 'Image', bio: 'Developer', post_counter: 5) }
    let(:post) { Post.create(title: 'test title', text: 'test text', comment_counter: 1, like_counter: 1) }

    it 'should have an integer post_id' do
      like = Like.new(user_id: user.id, post_id: post.id)
      like.post_id = 'string'
      expect(like).to_not be_valid
    end

    it 'should have an integer user_id' do
      like = Like.new(user_id: user.id, post_id: post.id)
      like.user_id = 'string'
      expect(like).to_not be_valid
    end
  end
end
