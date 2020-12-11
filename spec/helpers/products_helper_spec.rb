require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ProductsHelper. For example:
#
# describe ProductsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ProductsHelper, type: :helper do
  before(:context) do
    user = User.create(username: 'user', role: 'admin')
    cart = Cart.create
    group = Group.create(name: 'group', user_id: user.id)
    product = Product.create(name: 'product', price: '12', quantity: 144, group_id: group.id)
    a = LineItem.create(quantity: 1, product_id: product.id, cart_id: cart.id)
    sales = Sale.create(user_id: user.id)
    sales.line_items << a
    product.line_items << a
    a.update_attribute('cart_id', nil)
  end

  let(:product) { Product.first }

  describe 'total_sales' do
    it 'return total sale of product' do
      expect(total_sales(product)).to eq(1)
    end
  end
end
