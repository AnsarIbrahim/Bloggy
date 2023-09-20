require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment Model' do
    let(:user) { create(:user, name: 'Ansar', photo: 'Image', bio: 'developer', post_counter: 0) }
    let(:post) { create(:post, title: 'test title', text: 'test text', comment_counter: 0, like_counter: 0) }

    it 'text should not be blank' do
      comment = build(:comment, user:, post:) # Let the factory set the text
      expect(comment).to be_valid
    end

    it 'post id must be integer' do
      comment = build(:comment, user:, post:, post_id: nil)
      expect(comment).to_not be_valid
    end

    it 'user id must be integer' do
      comment = build(:comment, user:, post:, user_id: nil)
      expect(comment).to_not be_valid
    end

    it 'should increment the comment counter of the associated post' do
      comment = build(:comment, user:, post:)

      expect do
        comment.save
        post.reload
      end.to change(post, :comment_counter).by(1)
    end
  end
end
