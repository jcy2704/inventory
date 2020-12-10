require 'rails_helper'

RSpec.describe 'Add User', type: :feature do
  before :each do
    User.create(username: 'user', role: 'admin')
    User.create(username: 'employee', role: 'employee')
    visit '/login'
    within('.login-form') do
      fill_in 'Username', with: 'user'
    end
    click_button 'Login'
  end

  it 'render add user form' do
    visit '/users'
    click_link 'Add User'

    expect(current_path).to eq(new_user_path)
  end

  it 'create new user' do
    visit '/users'
    click_link 'Add User'

    within('.register-form') do
      fill_in 'Username', with: 'newuser'
    end
    click_button 'Create User'

    expect(current_path).to eq(users_path)
  end

  scenario 'raise error if user exists', js: true do
    visit '/users'
    click_link 'Add User'

    within('.register-form') do
      fill_in 'Username', with: 'user'
    end
    click_button 'Create User'

    expect(page).to have_selector('#toast-container')
    within('#toast-container') do
      expect(page).to have_text('Username has already been taken')
    end
  end

  scenario 'raise error if field empty', js: true do
    visit '/users'
    click_link 'Add User'

    within('.register-form') do
      fill_in 'Username', with: ''
    end
    click_button 'Create User'

    expect(page).to have_selector('#toast-container')
    within('#toast-container') do
      expect(page).to have_text("Username can't be blank")
    end
  end

  scenario 'raise error if role empty', js: true do
    visit '/users'
    click_link 'Add User'

    within('.register-form') do
      fill_in 'Username', with: 'test'
      select '', from: 'Role'
    end

    click_button 'Create User'
    expect(page).to have_selector('#toast-container')
    within('#toast-container') do
      expect(page).to have_text("Role can't be blank")
    end
  end

  it 'redirect if not admin' do
    visit '/logout'
    visit '/login'
    within('.login-form') do
      fill_in 'Username', with: 'employee'
    end
    click_button 'Login'

    visit '/users/new'

    expect(current_path).to eq(root_path)
  end
end
