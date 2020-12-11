require 'rails_helper'

RSpec.describe 'Add Group', type: :feature do
  before :each do
    user = User.create(username: 'user', role: 'admin')
    User.create(username: 'employee', role: 'employee')
    Group.create(name: 'test', user_id: user.id)
    visit '/login'
    within('.login-form') do
      fill_in 'Username', with: 'user'
    end
    click_button 'Login'
  end

  it 'render add group form' do
    visit '/groups'
    click_link 'Create Group'

    expect(current_path).to eq(new_group_path)
  end

  it 'create new group' do
    visit '/groups'
    click_link 'Create Group'

    within('.new_group') do
      fill_in 'Name', with: 'Group'
    end
    click_button 'Create Group'

    expect(current_path).to eq(groups_path)
  end

  scenario 'raise error if group exists', js: true do
    visit '/groups'
    click_link 'Create Group'

    within('.new_group') do
      fill_in 'Name', with: 'test'
    end
    click_button 'Create Group'

    expect(page).to have_selector('#toast-container')
    within('#toast-container') do
      expect(page).to have_text('Name has already been taken')
    end
  end

  scenario 'raise error if field empty', js: true do
    visit '/groups'
    click_link 'Create Group'

    within('.new_group') do
      fill_in 'Name', with: ''
    end
    click_button 'Create Group'

    expect(page).to have_selector('#toast-container')
    within('#toast-container') do
      expect(page).to have_text("Name can't be blank")
    end
  end
end
