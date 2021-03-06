require 'rails_helper'

RSpec.describe StreamController, type: :controller do
  describe 'POST #on_record_done' do
    before do
      allow(File).to receive(:exist?).with('/usr/local/nginx/html/hls/yhoshino11.flv').and_return(true)
      allow(File).to receive(:exist?).with('/usr/local/nginx/html/screenshot/yhoshino11.png').and_return(true)
      @user = User.find_from_auth(github_hash, nil)
      @user.update(live: true)
      post :on_record_done, token: @user.streaming_key
    end

    it do
      expect(response).to be_success
    end
  end

  describe 'POST #screenshot_done' do
    before do
      allow(File).to receive(:exist?).with('tmp/yhoshino11.png').and_return(false)
      allow(File).to receive(:exist?).with('/usr/local/nginx/html/screenshot/yhoshino11.png').and_return(true)
      allow(File).to receive(:size).and_return(1)
      @user = User.find_from_auth(github_hash, nil)
      @user.update(live: true)
      post :screenshot_done, name: 'yhoshino11'
    end

    it do
      expect(response).to be_success
    end
  end

  describe 'GET #user' do
    context 'via anonymous' do
      context 'when user does not exist' do
        before do
          get :user, nickname: ''
        end

        it do
          expect(response).to redirect_to(root_path)
        end
      end

      context 'live' do
        before do
          @user = User.find_from_auth(github_hash, nil)
          @user.update(live: true)
          get :user, nickname: @user.nickname
          @user.reload
        end

        it do
          expect(assigns(:total)).to be_nil
          expect(@user.total).to eq(1)
          expect(@user.private?).to be_falsy
          expect(response).to render_template(:user)
        end
      end

      context 'offline' do
        context 'with no record' do
          before do
            @user = User.find_from_auth(github_hash, nil)
            @user.update(live: false)
            get :user, nickname: @user.nickname
            @user.reload
          end

          it do
            expect(assigns(:total)).to eq(0)
            expect(@user.total).to eq(0)
            expect(@user.private?).to be_falsy
            expect(response).to render_template(:user)
          end
        end

        context 'with records' do
          before do
            @user = User.find_from_auth(github_hash, nil)
            @user.update(live: false)
            @user.records.create(total: 10, title: 'test stream')
            get :user, nickname: @user.nickname
            @user.reload
          end

          it do
            expect(assigns(:total)).to eq(10)
            expect(@user.total).to eq(0)
            expect(@user.private?).to be_falsy
            expect(response).to render_template(:user)
          end
        end
      end
    end

    context 'via others' do
      context 'live' do
        before do
          @user = User.find_from_auth(github_hash, nil)
          @user.update(live: true)
          @other = create(:user)
          sign_in(@other)
          get :user, nickname: @user.nickname
          @user.reload
        end

        it do
          expect(assigns(:total)).to be_nil
          expect(@user.total).to eq(1)
          expect(@user.private?).to be_falsy
          expect(response).to render_template(:user)
        end
      end

      context 'offline' do
        context 'with no record' do
          before do
            @user = User.find_from_auth(github_hash, nil)
            @user.update(live: false)
            @other = create(:user)
            sign_in(@other)
            get :user, nickname: @user.nickname
            @user.reload
          end

          it do
            expect(assigns(:total)).to eq(0)
            expect(@user.total).to eq(0)
            expect(@user.private?).to be_falsy
            expect(response).to render_template(:user)
          end
        end

        context 'with records' do
          before do
            @user = User.find_from_auth(github_hash, nil)
            @user.update(live: false)
            @other = create(:user)
            sign_in(@other)
            @user.records.create(total: 10, title: 'test stream')
            get :user, nickname: @user.nickname
            @user.reload
          end

          it do
            expect(assigns(:total)).to eq(10)
            expect(@user.total).to eq(0)
            expect(@user.private?).to be_falsy
            expect(response).to render_template(:user)
          end
        end
      end
    end

    context 'via current_user' do
      context 'live' do
        before do
          @user = User.find_from_auth(github_hash, nil)
          @user.update(live: true)
          sign_in(@user)
          get :user, nickname: @user.nickname
          @user.reload
        end

        it do
          expect(assigns(:total)).to be_nil
          expect(@user.total).to eq(1)
          expect(@user.private?).to be_falsy
          expect(response).to render_template(:user)
        end
      end

      context 'offline' do
        context 'with no record' do
          before do
            @user = User.find_from_auth(github_hash, nil)
            @user.update(live: false)
            sign_in(@user)
            get :user, nickname: @user.nickname
            @user.reload
          end

          it do
            expect(assigns(:total)).to eq(0)
            expect(@user.total).to eq(0)
            expect(@user.private?).to be_falsy
            expect(response).to render_template(:user)
          end
        end

        context 'with records' do
          before do
            @user = User.find_from_auth(github_hash, nil)
            @user.update(live: false)
            sign_in(@user)
            @user.records.create(total: 10, title: 'test stream')
            get :user, nickname: @user.nickname
            @user.reload
          end

          it do
            expect(assigns(:total)).to eq(10)
            expect(@user.total).to eq(0)
            expect(@user.private?).to be_falsy
            expect(response).to render_template(:user)
          end
        end
      end
    end
  end

  describe 'POST #on_publish' do
    context 'invalid params' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @user.update(live: false, total: 20)
        post :on_publish, token: ''
        @user.reload
      end

      it do
        expect(@user.live).to be_falsy
        expect(@user.total).to eq(20)
        expect(response.status).to eq(500)
      end
    end

    context 'valid params' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @user.update(live: false, total: 20)
        post :on_publish, token: @user.streaming_key
        @user.reload
      end

      it do
        expect(@user.live).to be_truthy
        expect(@user.total).to eq(0)
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'POST #on_play' do
    context 'invalid params' do
      before do
        post :on_play, swfurl: ''
      end

      it do
        expect(response.status).to eq(500)
      end
    end

    context 'valid params' do
      before do
        post :on_play, swfurl: 'http://test.test'
      end

      it do
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #all' do
    before do
      @user = User.find_from_auth(github_hash, nil)
      @user.update(live: true)
      get :all
    end

    it do
      expect(assigns(:users)).to eq([@user])
    end
  end

  describe 'POST #current' do
    context 'valid params' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        post :current, nickname: ''
      end

      it do
        expect(response.status).to eq(500)
      end
    end

    context 'valid params' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        post :current, nickname: @user.nickname
      end

      it do
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'POST #chat' do
    context 'via anonymous' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        post :chat, nickname: @user.nickname, chat: { text: 'hello world' }
      end

      it do
        expect(@user.chats.count).to eq(0)
        expect(response.status).to eq(500)
      end
    end

    context 'invalid params' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        sign_in(@user)
        post :chat, nickname: '', chat: { text: 'hello world' }
      end

      it do
        expect(@user.chats.count).to eq(0)
        expect(response.status).to eq(500)
      end
    end

    context 'valid params' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        sign_in(@user)
        post :chat, nickname: @user.nickname, chat: { text: 'hello world' }, format: :js
      end

      it do
        expect(@user.chats.count).to eq(1)
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'GET #extract_chat' do
    context 'invalid username' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        get :extract_chat, nickname: ''
      end

      it do
        expect(response).to redirect_to(root_path)
      end
    end

    context 'valid username' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        get :extract_chat, nickname: @user.nickname
      end

      it do
        expect(response).to render_template(:extract_chat)
        expect(response).to render_template(layout: false)
      end
    end
  end
end
