require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  def user
    @user ||= create(:user)
  end

  describe "GET #show" do
    before :each do
      sign_in(user)
    end

    it 'assigns a new shout to @shout' do
      get :show
      expect(assigns(:shout)).to be_a_new(Shout)
    end

    it 'assigns the user\'s shouts to @shouts' do
      create_list(:shout, 3, user: user)
      get :show
      expect(assigns(:shouts)).to eq user.shouts
    end

    it 'renders the show template' do
      get :show
      expect(response).to render_template :show
    end
  end
end
