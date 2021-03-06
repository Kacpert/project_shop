Rails.application.routes.draw do

  resources :favorites

  resources :examples

  get 'password_resets/new'

  get 'password_resets/edit'

  get 'register'  => 'customers#new'
  get 'carts/set_currency', as: :set_currency
  get 'customers/favorites', as: :customer_favorites
  resources :customers
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  resources :products,            only: [:show]
  resources :shopcart_products,   only: [:create, :destroy]
  resources :carts
  resources :line_items
  resources :orders,              only: [:new, :create]

  post 'newsletters' => 'newsletters#create'


  get 'translations/index'

  #get 'static_pages/home'
  
  #get 'static_pages/aboutus'

  #get 'static_pages/contact'
  root                'static_pages#home'
  get    'aboutus'   => 'static_pages#aboutus'
  get    'contact' => 'static_pages#contact'
  get    'shirts' => 'products#shirts'
  get    'suits' => 'products#suits'
  get    'show' => 'products#show'
  get    'accessories' => 'products#accessories'
  get    'shopcart' => 'products#shopcart'
  get    'favourite' => 'products#favourite'
  get    'login'  => 'sessions#new'
  post   'log_in'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

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
end
