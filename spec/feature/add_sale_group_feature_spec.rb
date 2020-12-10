require 'rails_helper'

RSpec.describe 'Add Sale Group', type: :feature do
  before :each do
    user = User.create(username: 'user', role: 'admin')
    User.create(username: 'employee', role: 'employee')
    SaleGroup.create(name: 'test', user_id: user.id)
    visit '/login'
    within('.login-form') do
      fill_in 'Username', with: 'user'
    end
    click_button 'Login'
  end

  it 'render add sale group form' do
    visit '/sale_groups'
    click_link 'Create Sale Group'

    expect(current_path).to eq(new_sale_group_path)
  end

  it 'create new sale group' do
    visit '/sale_groups'
    click_link 'Create Sale Group'

    within('.new_group') do
      fill_in 'Name', with: 'Group'
    end
    click_button 'Create Sale group'

    expect(current_path).to eq(sale_groups_path)
  end

  scenario 'raise error if sale group exists', js: true do
    visit '/sale_groups'
    click_link 'Create Sale Group'

    within('.new_group') do
      fill_in 'Name', with: 'test'
    end
    click_button 'Create Sale group'

    expect(page).to have_selector('#toast-container')
    within('#toast-container') do
      expect(page).to have_text('Name has already been taken')
    end
  end

  scenario 'raise error if field empty', js: true do
    visit '/sale_groups'
    click_link 'Create Sale Group'

    within('.new_group') do
      fill_in 'Name', with: ''
    end
    click_button 'Create Sale group'

    expect(page).to have_selector('#toast-container')
    within('#toast-container') do
      expect(page).to have_text("Name can't be blank")
    end
  end
end
