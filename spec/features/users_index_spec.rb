require 'rails_helper'

RSpec.feature 'User Index Page', type: :feature do
  before do
    @user1 = create(:user, name: 'user1', post_counter: 5, photo: 'profile_picture.jpg')
    @user2 = create(:user, name: 'user2', post_counter: 3, photo: 'profile_picture2.jpg')
  end

  scenario 'I can see the username of all other users' do
    visit users_path

    expect(page).to have_content(@user1.name)
    expect(page).to have_content(@user2.name)
  end

  scenario 'I can see the profile picture for each user' do
    visit users_path
    expect(page).to have_css("img[src*='profile_picture.jpg']")
    expect(page).to have_css("img[src*='profile_picture2.jpg']")
  end

  scenario 'I can see the number of posts each user has written' do
    visit users_path

    expect(page).to have_content(@user1.post_counter)
    expect(page).to have_content(@user2.post_counter)
  end

  scenario "When I click on a user, I am redirected to that user's show page" do
    visit users_path

    click_link @user1.name
    expect(current_path).to eq(user_path(@user1))
  end
end
