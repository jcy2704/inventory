require 'rails_helper'

RSpec.describe LineItem, type: :model do
  before :all do
    Group.create(name: 'Group')
    Product.create(name: 'Product', quantity: 2, price: 12, group_id: 1)
    Cart.create
    LineItem.create(id: 1, quantity: 1, product_id: 1, cart_id: 1)
  end

  it { should belong_to(:product) }
  it { should belong_to(:cart) }

  let(:item) { LineItem.find(1) }

  it 'returns total price of the product' do
    expect(item.total_price).to eq(12)
  end
end
