require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /users/:user_id/posts' do
    it 'returns a successful response' do
      user = User.create(name: 'Test User')
      get "/users/#{user.id}/posts"
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      user = User.create(name: 'Test User')
      get "/users/#{user.id}/posts"
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      user = User.create(name: 'Test User')
      get "/users/#{user.id}/posts"
      expect(response.body).to include('Welcome to posts')
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'returns a successful response' do
      user = User.create(name: 'Test User')
      post = user.posts.create(title: 'Test Post', text: 'Test Content') # Ensure 'content' attribute is correct
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      user = User.create(name: 'Test User')
      post = user.posts.create(title: 'Test Post', text: 'Test Content') # Ensure 'content' attribute is correct
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body' do
      user = User.create(name: 'Test User')
      post = user.posts.create(title: 'Test Post', text: 'Test Content') # Ensure 'content' attribute is correct
      get "/users/#{user.id}/posts/#{post.id}"
      expect(response.body).to include('Details of Posts')
    end
  end
end
