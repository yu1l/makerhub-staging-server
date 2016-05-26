Rails.application.routes.draw do
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

  # User-Update-Record-Title
  post ':nickname/record/:uuid/update_title' => 'users#update_record_title', as: :update_record_title

  # User-Profile
  get ':nickname/profile' => 'users#profile', as: :profile

  # User-Play-Record
  get ':nickname/record/:uuid' => 'records#play', as: :play_record

  # User-Category
  post ':nickname/category' => 'users#category'

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

  get '*path' => redirect('/')
end
