require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET index' do
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
