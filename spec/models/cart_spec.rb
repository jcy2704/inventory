require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should have_many(:line_items) }
  it { should have_many(:products) }

  let(:cart) { Cart.find(1) }

  it 'sum of total price' do
    expect(Cart.find(1).sub_total).to eq(12)
  end
end
