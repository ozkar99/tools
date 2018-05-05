RSpec.describe "Home" do
  context "signed out" do
    before(:each) do
      get root_path
    end

    it "should have current_user as nil" do
      expect(controller.current_user).to eq(nil)
    end

    it "should show login link on menu" do
      expect(response.body).to include("Sign in")
    end

    it "should not display menu" do
      expect(response.body).to_not include("Passwd")
    end

    it "should render index template" do
      expect(response).to render_template(:index)
    end
  end

  context "signed in" do
    let(:user) { create(:user) }

    before(:each) do
      sign_in user
      get root_path
    end

    it "should have current_user set to user" do
      expect(controller.current_user).to eq(user)
    end

    it "should show hello message on menu" do
      expect(response.body).to include("Hello, #{user.email}")
    end

    it "should show sign out link on menu" do
      expect(response.body).to include("Sign out")
    end

    it "should display menu" do
      expect(response.body).to include("Passwd")
    end

    it "should render index template" do
      expect(response).to render_template(:index)
    end
  end
end
