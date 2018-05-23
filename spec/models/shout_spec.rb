require 'rails_helper'

RSpec.describe Shout, type: :model do
  it 'is valid with a content and a user' do
    shout = Shout.new(user: build_stubbed(:user), content: build_stubbed(:text_shout))
    expect(shout).to be_valid
  end

  it 'is invalid without a content' do
    shout = Shout.new(user: build_stubbed(:user), content: nil)
    shout.valid?
    expect(shout.errors[:content]).to include "can't be blank"
  end

  it 'is invalid without a user' do
    shout = Shout.new(user: nil, content: build_stubbed(:text_shout))
    shout.valid?
    expect(shout.errors[:user]).to include "can't be blank"
  end

  it 'returns the user\'s username as a string' do
    shout = Shout.create(
      user: create(:user, username: 'largo'), content: build_stubbed(:text_shout)
    )
    expect(shout.username).to eq 'largo'
  end

  it 'returns a list of shouts in descending order of creation' do
    shout1 = create(:shout, content: create(:text_shout), created_at: 1.hour.ago)
    shout2 = create(:shout, content: create(:text_shout), created_at: 2.hours.ago)
    shout3 = create(:shout, content: create(:text_shout), created_at: 3.hours.ago)

    expect(Shout.all).to eq [shout1, shout2, shout3]
  end
end
