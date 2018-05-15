module AuthenticationHelper
  def sign_in(user)
    expect(controller).to receive(:current_user).and_return(user)
  end
end
