Committees::Application.routes.draw do
  resources :committees, :only => [:show]
  resources :nominations, :only => [:new, :create]
  
  
  devise_for :users

  #   match 'products/:id' => 'catalog#view'

  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase

  #   resources :products

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

  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  root :to => 'main#index'

end
