Rails.application.routes.draw do
  use_doorkeeper

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  root 'home#index'

  ### OBS-Start
  # on_publish
  post 'on_publish' => 'stream#on_publish'

  # on_play
  post 'on_play' => 'stream#on_play'

  # on_record_done
  post 'on_record_done' => 'stream#on_record_done'

  # screenshot_done
  post 'screenshot_done' => 'stream#screenshot_done'
  ### OBS-End

  # Streams
  get 'streams' => 'stream#all'

  # Stream-User
  get ':nickname' => 'stream#user', as: :stream

  # Stream-Current
  post ':nickname/current' => 'stream#current'

  # Stream-Chat
  get ':nickname/chat_window' => 'stream#extract_chat', as: :extract_chat
  post ':nickname/chat' => 'stream#chat', as: :chat

  # User-Update-Description
  post ':nickname/update_description' => 'users#update_description', as: :update_description

  # User-Update-Title
  post ':nickname/update_title' => 'users#update_title', as: :update_title
  post 'profile/update' => 'users#update'
  post 'profile/category' => 'users#category'

  # User-Update-Record-Title
  post ':nickname/record/:uuid/update_title' => 'users#update_record_title', as: :update_record_title

  # User-Profile
  get ':nickname/profile' => 'users#profile', as: :profile

  # User-Play-Record
  get ':nickname/record/:uuid' => 'records#play', as: :play_record

  # User-Private-Stream
  get ':uuid/stream' => 'users#private_stream', as: :private_stream

  # User-Stop-Private-Stream
  get ':uuid/stop_stream' => 'users#stop_private_stream', as: :stop_private_stream

  # Record-Category
  post ':nickname/record/:uuid/category' => 'users#record_category'

  # Channel - Block
  resource :channel, only: [] do
    member do
      post :block
      post :unblock
    end
  end

  # Follow
  get ':nickname/follow' => 'users#follow', as: :follow

  # Unfollow
  get ':nickname/unfollow' => 'users#unfollow', as: :unfollow

  # Group
  post ':nickname/groups' => 'groups#create'

  # Group-Invite
  get '/groups/:uuid/invite/:user_uuid' => 'groups#invite', as: :group_invite

  # API
  namespace :api, format: :json do
    namespace :v1 do
      get 'me' => 'users#me'

      scope :videos do
        get '' => 'videos#all'
        get '/' => 'videos#all'
        get '/:nickname' => 'videos#user'
        get '/:nickname/:uuid' => 'videos#video'
        patch '/:nickname/:uuid/title' => 'videos#update'
        patch '/:nickname/:uuid/category' => 'videos#update'
      end

      scope :streams do
        get '' => 'streams#all'
        get '/:nickname' => 'streams#user'
        patch '/:nickname/title' => 'streams#update'
        get '/:nickname/comments' => 'streams#comments'
        # post '/:nickname/comments' => 'streams#create_comment'
        # get '/:nickname/block_list' => 'streams#block_list'
        # post '/:nickname/block' => 'streams#block'
        # post '/:nickname/unblock' => 'streams#unblock'
      end

      get '/:nickname/followings' => 'users#followings'
      get '/:nickname/followers' => 'users#followers'
    end
  end

  get '*path' => redirect('/')
end
