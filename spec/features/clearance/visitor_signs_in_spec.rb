require "rails_helper"
require "support/features/clearance_helpers"

RSpec.feature "Visitor signs in" do
  scenario "with valid email, username and password" do
    create_user "user@example.com", "username", "password"
    sign_in_with "user@example.com", "username", "password"

    expect_user_to_be_signed_in
  end

  scenario "with valid mixed-case email, username and password " do
    create_user "user.name@example.com", "username", "password"
    sign_in_with "User.Name@example.com", "username", "password"

    expect_user_to_be_signed_in
  end

  scenario "tries with invalid password" do
    create_user "user@example.com", "username", "password"
    sign_in_with "user@example.com", "username", "wrong_password"

    expect_page_to_display_sign_in_error
    expect_user_to_be_signed_out
  end

  scenario "tries with invalid email" do
    sign_in_with "unknown.email@example.com", "username", "password"

    expect_page_to_display_sign_in_error
    expect_user_to_be_signed_out
  end

  private

  def create_user(email, username, password)
    FactoryBot.create(:user, email: email, username: username, password: password)
  end

  def expect_page_to_display_sign_in_error
    expect(page.body).to include(
      I18n.t("flashes.failure_after_create", sign_up_path: sign_up_path),
    )
  end
end
