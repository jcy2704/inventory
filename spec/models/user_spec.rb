require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username).case_insensitive }
  it { should validate_length_of(:username).is_at_least(4) }

  it { should validate_presence_of(:role) }
  it {
    should validate_inclusion_of(:role)
      .in_array(%w[admin employee])
  }

  it { should have_many(:sales) }
end

RSpec.describe Product, type: :model do
  before(:each) do
    Group.create(name: 'Group')
    Product.create(name: 'Product', quantity: 2, price: 12, group_id: 1)
  end
  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:price) }
  it do
    should validate_numericality_of(:price)
      .is_greater_than_or_equal_to(0)
  end

  it { should validate_presence_of(:quantity) }
  it do
    should validate_numericality_of(:quantity)
      .only_integer.is_greater_than_or_equal_to(0)
  end

  it { should validate_presence_of(:group_id) }

  it { should belong_to(:group) }

  it { should have_many(:line_items) }
end
