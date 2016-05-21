require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET #index' do
    before do
      @user = User.find_from_auth(github_hash, nil)
      @user.update(live: true)
      get :index
    end

    it 'English as a default' do
      expect(I18n.locale).to eq(:en)
    end

    it 'assigns live users' do
      expect(assigns(:users)).to eq([@user])
    end

    it do
      expect(response).to render_template(:index)
    end

    describe 'locale' do
      before do
        request.env['HTTP_ACCEPT_LANGUAGE'] = 'ja'
        get :index
      end

      it 'Internationalize via header' do
        expect(I18n.locale).to eq(:ja)
      end
    end
  end
end
