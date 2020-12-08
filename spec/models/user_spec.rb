require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    User.create(username: 'user', role: 'admin')
    User.create(username: 'employee', role: 'employee')
  end

  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username).case_insensitive }
  it { should validate_length_of(:username).is_at_least(4) }

  it { should validate_presence_of(:role) }
  it {
    should validate_inclusion_of(:role)
      .in_array(%w[admin employee])
  }

  it { should have_many(:sales) }

  let(:user) { User.find(1) }
  let(:user2) { User.find(2) }

  it 'see if current_user admin' do
    expect(user.admin?).to eq(true)
    expect(user2.admin?).to eq(false)
  end
end
