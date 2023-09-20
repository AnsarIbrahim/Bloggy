require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'is valid with a name and post_counter' do
      user = User.new(name: 'Ansar', post_counter: 0)
      expect(user).to be_valid
    end

    it 'is invalid without a name' do
      user = User.new(post_counter: 5)
      expect(user).to_not be_valid
    end

    it 'is invalid with a name exceeding 50 characters' do
      user = User.new(name: 'A' * 51, post_counter: 5)
      expect(user).to_not be_valid
    end

    it 'is invalid with a negative post_counter' do
      user = User.new(name: 'Ansar', post_counter: -1)
      expect(user).to_not be_valid
    end

    it 'is valid with a post_counter of 0' do
      user = User.new(name: 'Ansar', post_counter: 0)
      expect(user).to be_valid
    end
  end
end
