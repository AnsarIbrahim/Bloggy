require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a successful response' do
      User.create(name: 'Test User')
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      User.create(name: 'Test User')
      get users_path
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body for index' do
      User.create(name: 'Test User')
      get users_path
      expect(response.body).to include('Welcome to Bloggy')
    end
  end

  describe 'GET /users/:id' do
    it 'returns a successful response' do
      user = User.create(name: 'Test User')
      get user_path(user)
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      user = User.create(name: 'Test User')
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'includes correct placeholder text in the response body for show' do
      user = User.create(name: 'Test User')
      get user_path(user)
      expect(response.body).to include('User Details')
    end
  end
end
