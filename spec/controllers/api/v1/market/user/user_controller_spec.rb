require 'rails_helper'

describe Api::V1::Market::User::UserController do
  let!(:user) {FactoryGirl.create(:user)}

  context 'when logged out' do
    it {
      get :show
      response.code.should eq("401")
    }
  end

  context 'when logged in' do
    create_logged_user
    before {get :show}

    it { response.code.should eq("200") }
  end


  describe "show" do
    create_logged_user

    it 'should respond with user json' do
      get :show
      expect(response.body).to have_json_path("user")
    end

    it 'should retrieve correct user' do
      get :show, {:shop_slug => logged_user.slug}
      expect(parse_json(response.body)['user']['id']).to eq logged_user.id
    end

  end
end