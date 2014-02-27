SocialScriptura::Application.routes.draw do
  root :to => 'welcome#index'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  resources :welcome
  resources :comments
  resources :search
  resources :relationships do
    put 'relationships' => 'relationships#update'
    delete 'relationships' => 'relationships#destroy'
  end
  resources :messages

  get 'bible' => 'bible#index'
  get 'bible_views' => 'bible#index'
  post 'bible_views' => 'bible#update_bible_view'
end
