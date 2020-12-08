require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it { should belong_to(:product) }
  it { should belong_to(:cart) }

  it 'returns total price of the product' do
    expect(LineItem.find(1).total_price).to eq(12)
  end
end
