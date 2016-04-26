Rails.application.routes.draw do
  root 'home#index'
  post 'record_done' => 'stream#record_done'
end
