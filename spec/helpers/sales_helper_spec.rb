require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SalesHelper. For example:
#
# describe SalesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SalesHelper, type: :helper do
  before(:context) do
    user = User.create(username: 'user', role: 'admin')
    cart = Cart.create
    group = Group.create(name: 'group', user_id: user.id)
    product = Product.create(name: 'product', price: '12', quantity: 144, group_id: group.id)
    a = LineItem.create(quantity: 1, product_id: product.id, cart_id: cart.id)
    product.line_items << a
    sales = Sale.create(user_id: user.id)
    sales.line_items << a
  end

  let(:sales) { Sale.first }

  describe 'total_sale' do
    it 'return total sale' do
      expect(total_sale(sales)).to eq(12)
    end
  end

  describe 'total_products' do
    it 'return total products sold' do
      expect(total_products(sales)).to eq(1)
    end
  end

  describe 'revenue' do
    it 'return total revenue' do
      expect(revenue(Sale.all)).to eq(12)
    end
  end
end
