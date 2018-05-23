require 'rails_helper'

RSpec.describe TextShout, type: :model do
  it 'is valid with a body' do
    text_shout = TextShout.new(body: 'Twist and shout!')
    expect(text_shout).to be_valid
  end

  it 'is invalid without a body' do
    text_shout = TextShout.new(body: nil)
    text_shout.valid?
    expect(text_shout.errors[:body]).to include "can't be blank"
  end
end
