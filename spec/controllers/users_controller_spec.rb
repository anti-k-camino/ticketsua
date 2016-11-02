require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET index' do
    context "Non authenticated user" do
      let!(:users){ create_list(:user, 2) }

      before { get :index }      

      it 'rendirects to sign in path' do
        expect(response).to redirect_to new_user_session_path
      end

    end
    context "Authenticated user" do
      sign_in_user
      let!(:users){ create_list(:user, 2) }

      before { get :index }

      it 'populates an array of all users' do
        expect(assigns(:users)).to match_array([@user] + users)
      end

      it 'renders index view' do
        expect(response).to render_template :index
      end
    end
  end

end
