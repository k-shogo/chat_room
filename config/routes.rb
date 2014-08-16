Rails.application.routes.draw do

  resources :rooms do
    resources :messages, only: [:create]
  end

end
