require 'rails_helper'

RSpec.describe 'Add Product', type: :feature do
  before :each do
    user = User.create(username: 'user', role: 'admin')
    User.create(username: 'employee', role: 'employee')
    group = Group.create(name: 'test', user_id: user.id)
    Product.create(name: 'test', price: 12, quantity: 1, group_id: group.id)
    SaleGroup.create(name: 'test', user_id: user.id)
    @current_cart = Cart.create
    visit '/login'
    within('.login-form') do
      fill_in 'Username', with: 'user'
    end
    click_button 'Login'
  end

  it 'add product to cart' do
    visit '/products'
    click_button 'Add Test to Cart'

    expect(page).to have_content 'Test'
  end

  it 'create sale with group' do
    visit '/products'
    click_button 'Add Test to Cart'

    click_button 'Sell'

    within('#new_sale') do
      select 'test', from: 'id'
    end

    click_button 'Create Sale'

    expect(current_path).to eq(sales_path)
  end

  it 'create sale without group' do
    visit '/products'
    click_button 'Add Test to Cart'

    click_button 'Sell'

    within('#new_sale') do
      select '', from: 'id'
    end

    click_button 'Create Sale'

    expect(current_path).to eq(sales_path)
  end
end
