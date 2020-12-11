require 'rails_helper'

RSpec.describe Sale, type: :model do
  it { should belong_to(:seller) }
  it { should have_many(:line_items) }
end
