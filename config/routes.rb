SocialScriptura::Application.routes.draw do
  get "search/index"
  root :to => 'welcome#index'
  #get "welcome/index"
  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'
      get 'bible' => 'bible#index'
      
  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  resources :comments
  resources :search
  resources :relationships do
    put 'relationships' => 'relationships#update'
    delete 'relationships' => 'relationships#destroy'
  end

  get 'bible_views' => 'bible#index'
  post 'bible_views' => 'bible#update_bible_view'
  #patch 'bible_views' => 'bible#choose_bible_view'

  #resources :bible_view, :path => 'bible#choose_bible_view', via: [:get,:post]
  #get 'bible_view' => 'bible#choose_bible_view'
end
