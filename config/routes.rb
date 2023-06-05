Rails.application.routes.draw do
  root "pages#home"
  resources :articles
  resources :categories

  get "/about" => "pages#about", as: :pages_about
end
