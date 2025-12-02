require 'rails_helper'

RSpec.describe "Users::Sessions", type: :request do
  describe "POST /users/sign_in" do
    it 'render a successful response' do
      user = create(:user)
      post user_session_path, params: { user: { email: user.email, password: user.password } }

      expect(response).to redirect_to(admin_root_path)
    end
    it 'render an unsuccessful response when validation fails' do
      post user_session_path, params: { user: { email: 'invalid@example.com', password: 'wrongpassword' } }

      expect(response).to have_http_status(:unprocessable_content)
    end
    it 'render an unsuccessful response when maximum attempts exceeded' do
      user = create(:user, failed_attempts: 4)
      post user_session_path, params: { user: { email: user.email, password: 'aaaa' } }

      expect(response).to have_http_status(:unprocessable_content)
    end
    it 'render an unsuccessful response when last attempt reached' do
      user = create(:user, failed_attempts: 3)
      post user_session_path, params: { user: { email: user.email, password: 'aaaa' } }

      expect(response).to have_http_status(:unprocessable_content)
      expect(flash.now[:alert]).to eq(I18n.t('devise.failure.last_attempt'))
    end
    it 'redirect new user session path response when not confirmed' do
      user = create(:user, confirmed_at: nil)
      post user_session_path, params: { user: { email: user.email, password: user.password } }

      expect(response).to redirect_to(new_user_session_path)
      expect(flash.now[:alert]).to eq(I18n.t('devise.failure.unconfirmed'))
    end
  end
end
