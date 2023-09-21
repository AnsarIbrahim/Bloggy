require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'Like Model' do
    let(:user) { create(:user, name: 'Ansar', photo: 'Image', bio: 'Developer', post_counter: 0) }
    let(:post) { create(:post, title: 'test title', text: 'test text', comment_counter: 0, like_counter: 0) }

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

    describe '#update_likes' do
      it 'should increment the like_counter of the associated post' do
        like = create(:like, user:, post:)

        expect do
          like.send(:update_likes)
          post.reload
        end.to change(post, :like_counter).by(1)
      end
    end
  end
end
