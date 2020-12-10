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

