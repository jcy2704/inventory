require 'rails_helper'

RSpec.describe 'Register', type: :feature do
  before :each do
    User.create(username: 'user', role: 'admin')
    visit '/new_user'
  end

  it 'register with user' do
    within('.register-form') do
      fill_in 'Username',	with: 'newuser'
    end
    click_button 'Create User'
    expect(current_path).to eq(root_path)
  end

  scenario 'raise error if user exists', js: true do
    within('.register-form') do
      fill_in 'Username',	with: 'user'
    end
    click_button 'Create User'
    expect(page).to have_selector('.toast-bottom-right')
    within('#toast-container') do
      expect(page).to have_text('Username has already been taken')
    end
  end

  scenario 'raise error if field empty', js: true do
    within('.register-form') do
      fill_in 'Username',	with: ''
    end
    click_button 'Create User'
    expect(page).to have_selector('.toast-bottom-right')
    within('#toast-container') do
      expect(page).to have_text("Username can't be blank")
    end
  end

  scenario 'raise error if role empty', js: true do
    within('.register-form') do
      fill_in 'Username',	with: 'test'
      select '', from: 'Role'
    end
    click_button 'Create User'
    expect(page).to have_selector('.toast-bottom-right')
    within('#toast-container') do
      expect(page).to have_text("Role can't be blank")
    end
  end
end
