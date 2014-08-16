Rails.application.routes.draw do

  resources :rooms do
    resources :messages, only: [:create]
  end
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  root to: 'rooms#index'

end
