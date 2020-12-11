require 'rails_helper'

RSpec.describe 'Roles', type: :feature do
  before :each do
    User.create(username: 'user', role: 'admin')
    User.create(username: 'employee', role: 'employee')
    visit '/login'
  end

  it 'login as admin' do
    within('.login-form') do
      fill_in 'Username', with: 'user'
    end
    click_button 'Login'
    visit root_path
    expect(page).to have_content 'All Users'
  end

  it 'login as employee' do
    within('.login-form') do
      fill_in 'Username', with: 'employee'
    end
    click_button 'Login'
    visit root_path
    expect(page).to have_no_content 'All Users'
  end
end
