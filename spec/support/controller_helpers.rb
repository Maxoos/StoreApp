module ControllerHelpers
  def create_logged_user
    let(:logged_user) {FactoryGirl.create :user}
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in logged_user
    end
  end
end