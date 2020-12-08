require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it { should belong_to(:product) }
  it { should belong_to(:cart) }
end
