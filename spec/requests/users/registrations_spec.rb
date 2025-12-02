require 'rails_helper'

RSpec.describe "Users::Registrations", type: :request do
  describe "POST /admin/sign_up" do
    let(:valid_attributes) do
      {
        user: {
          name: "Test User",
          email: "test@example.com",
          password: "password",
          password_confirmation: "password"
        }
      }
    end

    it 'renders a successful response' do
      ActionMailer::Base.deliveries.clear

      post user_registration_path, params: valid_attributes

      user = User.last
      expect(user.email).to eq("test@example.com")
      expect(user.confirmed?).to be_falsey
      expect(response).to redirect_to(root_path)
      expect(ActiveJob::Base.queue_adapter.enqueued_jobs.size).to eq(1)
    end

    # Skip invalid case as the registrations logic remains standard Devise
    # it 'renders an unsuccessful response when validation fails' {}
  end
end
