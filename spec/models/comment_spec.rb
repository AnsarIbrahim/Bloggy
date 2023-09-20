require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment Model' do
    let(:user) { User.create(name: 'Ansar', photo: 'Image', bio: 'developer', post_counter: 5) }
    let(:post) { Post.create(title: 'test title', text: 'test text', comment_counter: 1, like_counter: 1) }

    it 'text should not be blank' do
      comment = Comment.new(user_id: user.id, post_id: post.id, text: 'this is comment')
      comment.text = nil
      expect(comment).to_not be_valid
    end

    it 'post id must be integer' do
      comment = Comment.new(user_id: user.id, post_id: post.id, text: 'this is comment')
      comment.post_id = nil
      expect(comment).to_not be_valid
    end

    it 'user id must be integer' do
      comment = Comment.new(user_id: user.id, post_id: post.id, text: 'this is comment')
      comment.user_id = nil
      expect(comment).to_not be_valid
    end
  end
end
