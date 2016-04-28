Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'home#index'

  ### OBS-Start
  # on_publish
  post 'on_publish' => 'stream#on_publish'

  # on_record_done
  post 'on_record_done' => 'stream#on_record_done'
  ### OBS-End

  # Streams
  get 'streams' => 'stream#all'

  # Stream-User
  get ':name' => 'stream#user', as: :stream

  # Stream-Chat
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
end
