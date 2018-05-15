require 'rails_helper'

RSpec.describe Shout, type: :model do
  it 'is valid with a body and a user' do
    shout = Shout.new(body: 'Hey!', user: build_stubbed(:user))
    expect(shout).to be_valid
  end

  it 'is invalid without a body' do
    shout = Shout.new(body: nil, user: build_stubbed(:user))
    shout.valid?
    expect(shout.errors[:body]).to include "can't be blank"
  end

  it 'is invalid without a user' do
    shout = Shout.new(body: 'Hey!', user: nil)
    shout.valid?
    expect(shout.errors[:user]).to include "can't be blank"
  end

  it 'returns the user\'s username as a string' do
    shout = Shout.create(body: 'Hey!', user: create(:user, username: 'largo'))
    expect(shout.username).to eq 'largo'
  end

  it 'returns a list of shouts in descending order of creation' do
    shout1 = create(:shout, body: 'First in the list.', created_at: 1.hour.ago)
    shout2 = create(:shout, body: 'Second in the list.', created_at: 2.hours.ago)
    shout3 = create(:shout, body: 'Third in the list.', created_at: 3.hours.ago)

    expect(Shout.all.first).to eq shout1
  end
end
