SocialScriptura::Application.routes.draw do
  root :to => 'welcome#index'
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks", :registrations => "registrations"}
  
  get 'comments/update_verses' => 'comments#update_verses'
  
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
  patch 'bible_views' => 'bible#update_bible_view' 
  post 'bible_views' => 'bible#update_bible_view'
  get 'bible_search_versions_list' => 'bible#bible_search_versions_list'
  get 'relationships_content_stream' => 'relationships#content_stream'
end
