require 'rails_helper'

RSpec.describe SaleGroup, type: :model do
  it { should validate_presence_of(:name) }
  it { should belong_to(:creator) }
  it { should have_and_belong_to_many(:sales) }
end
