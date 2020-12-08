require 'rails_helper'

RSpec.describe 'Login', type: :feature do
  before :each do
    User.create(username: 'user', role: 'admin')
    User.create(username: 'employee', role: 'employee')
    visit '/login'
  end

  it 'login if user exists' do
    within('.login-form') do
      fill_in 'Username',	with: 'user'
    end
    click_button 'Login'
    expect(current_path).to eq(root_path)
  end

  scenario 'raise error if user doesnt exists', js: true do
    within('.login-form') do
      fill_in 'Username',	with: 'test'
    end
    click_button 'Login'
    expect(page).to have_selector('.toast-bottom-right')
  end

  scenario 'raise error if field empty', js: true do
    within('.login-form') do
      fill_in 'Username',	with: ''
    end
    click_button 'Login'
    expect(page).to have_selector('.toast-bottom-right')
  end
end
