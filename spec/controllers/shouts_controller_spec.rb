require 'rails_helper'

RSpec.describe ShoutsController, type: :controller do
  describe "GET #show" do
    it 'assigns the requested shout to @shout' do
      shout = create(:shout, content: create(:text_shout))
      get :show, params: { id: shout }
      expect(assigns(:shout)).to eq shout
    end

    it 'renders the show template' do
      shout = create(:shout, content: create(:text_shout))
      get :show, params: { id: shout }
      expect(response).to render_template :show
    end
  end

  describe "POST #create" do
    before :each do
      sign_in(create(:user))
    end

    context 'with valid attributes' do
      it 'creates a shout' do
        expect{
          post :create, params: { shout: { content_type: 'TextShout',
                                           content: { body: 'Hello shout!' } } }
        }.to change(Shout, :count).by(1)
      end

      it 'redirects to root_path after create' do
        post :create, params: { shout: { content: { body: 'Hello shout!' } } }
        expect(response).to redirect_to root_path
      end

      it 'sets flash[:notice] message' do
        post :create, params: { shout: { content_type: 'TextShout',
                                         content: { body: 'Hello shout!' } } }
        expect(flash[:notice]).to eq "Shouted successfully."
      end
    end

    # context 'with invalid attributes' do
    #   it 'does not save the new shout in the database' do
    #     expect{
    #       # post :create, params: { shout: { body: nil } }
    #       post :create, params: { shout: { content: {} } }
    #     }.not_to change(Shout, :count)
    #   end

    #   it 'redirects to root_path' do
    #     # post :create, params: { shout: { body: nil } }
    #     post :create, params: { shout: { content: { body: nil } } }
    #     expect(response).to redirect_to root_path
    #   end

    #   it 'sets flash[:alert] message' do
    #     # post :create, params: { shout: { body: nil } }
    #     post :create, params: { shout: { content: { body: nil } } }
    #     expect(flash[:alert]).to eq "Could not shout."
    #   end
    # end
  end
end
