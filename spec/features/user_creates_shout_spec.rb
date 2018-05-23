require 'rails_helper'
require "support/features/clearance_helpers"

feature 'User creates shout' do
  scenario 'successfully' do
    sign_in
    fill_in 'shout_content_body', with: 'Hey, there!'
    click_on 'Shout!'
    expect(page).to have_css 'div', text: "Hey, there!"
  end
end
