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
  get ':name' => 'stream#user', as: :stream

  # Stream-Current
  post ':name/current' => 'stream#current'

  # Stream-Chat
  get ':name/chat_window' => 'stream#extract_chat', as: :extract_chat
  post ':name/chat' => 'stream#chat', as: :chat

  # User-Update-Description
  post ':name/update_description' => 'users#update_description', as: :update_description

  # User-Update-Title
  post ':name/update_title' => 'users#update_title', as: :update_title

  # User-Update-Record-Title
  post ':name/record/:uuid/update_title' => 'users#update_record_title', as: :update_record_title

  # User-Profile
  get ':name/profile' => 'users#profile', as: :profile

  # User-Play-Record
  get ':name/record/:uuid' => 'records#play', as: :play_record

  # User-Category
  post ':name/category' => 'users#category'

  # Record-Category
  post ':name/record/:uuid/category' => 'users#record_category'

  # Follow
  get ':name/follow' => 'users#follow', as: :follow

  # Unfollow
  get ':name/unfollow' => 'users#unfollow', as: :unfollow

  # Group
  post ':name/groups' => 'groups#create'

  get '*path' => redirect('/')
end
