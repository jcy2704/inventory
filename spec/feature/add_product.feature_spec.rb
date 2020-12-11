# rubocop:disable Layout/LineLength

require 'rails_helper'

RSpec.describe 'Add Product', type: :feature do
  before :each do
    user = User.create(username: 'user', role: 'admin')
    User.create(username: 'employee', role: 'employee')
    group = Group.create(name: 'test', user_id: user.id)
    Product.create(name: 'test', price: 12, quantity: 1, group_id: group.id)
    visit '/login'
    within('.login-form') do
      fill_in 'Username', with: 'user'
    end
    click_button 'Login'
  end

  it 'render add product form' do
    visit '/products'
    click_link 'Add Product'

    expect(current_path).to eq(new_product_path)
  end

  it 'create new product' do
    visit '/products'
    click_link 'Add Product'

    within('.new_product') do
      fill_in 'Product Name', with: 'Product'
      fill_in 'Price', with: 12
      fill_in 'Quantity', with: 140
      select 'Test', from: 'product_group_id'
    end
    click_button 'Create Product'

    expect(current_path).to eq(products_path)
  end

  scenario 'raise error if product exists', js: true do
    visit '/products'
    click_link 'Add Product'

    within('.new_product') do
      fill_in 'Product Name', with: 'test'
      fill_in 'Price', with: 12
      fill_in 'Quantity', with: 140
      select 'Test', from: 'product_group_id'
    end
    click_button 'Create Product'

    expect(page).to have_selector('#toast-container')
    within('#toast-container') do
      expect(page).to have_text('Name has already been taken')
    end
  end

  scenario 'raise error if field empty', js: true do
    visit '/products'
    click_link 'Add Product'

    within('.new_product') do
      fill_in 'Product Name', with: ''
      fill_in 'Price', with: ''
      fill_in 'Quantity', with: ''
      select '', from: 'product_group_id'
    end
    click_button 'Create Product'

    expect(page).to have_selector('#toast-container')
    within('#toast-container') do
      expect(page).to have_text(
        "Name can't be blank Price can't be blank Price is not a number Quantity can't be blank Quantity is not a number Group can't be blank"
      )
    end
  end
end

# rubocop:enable Layout/LineLength
