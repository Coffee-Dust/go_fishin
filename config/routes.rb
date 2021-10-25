Rails.application.routes.draw do
  resources :games, only: [:index, :show, :create, :destroy] do
    get "/start", to: "games#start"
  end
  post "/games/join", to: "games#join"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
