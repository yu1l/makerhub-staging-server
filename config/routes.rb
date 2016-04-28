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

  # User-Stream
  get ':name' => 'users#stream', as: :stream

  # User-Profile
  get ':name/profile' => 'users#profile', as: :profile

  # User-Play-Record
  get ':name/record/:uuid' => 'records#play', as: :play_record
end
