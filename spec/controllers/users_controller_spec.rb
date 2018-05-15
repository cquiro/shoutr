require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  def user
    @user ||= create(:user)
  end

  describe "GET #show" do
    it 'assigns the requested user to @user' do
      get :show, params: { id: user }
      expect(assigns(:user)).to eq user
    end

    it 'assigns the user\'s shouts to @shouts' do
      create_list(:shout, 3, user: user)
      get :show, params: { id: user }
      expect(assigns(:shouts)).to eq user.shouts
    end

    it 'renders the show template' do
      get :show, params: { id: user }
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it 'assigns a new user to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
    end
  end
end
