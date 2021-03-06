Rails.application.routes.draw do

  mount Payola::Engine => '/payola', as: :payola

  root 'welcome#welcome'

  get 'sign_in' => 'sessions#new', as: :sign_in
  post 'sign_in' => 'sessions#create'
  get 'sign_out' => 'sessions#delete', as: :sign_out

  get "/users/new" => 'users#new', as: :sign_up
  post "/users/new" => 'users#create', as: :users
  get '/users/:id/feed' => 'users#feed', as: :posts
  get '/users/:id/feed/upload' => 'users#new_post', as: :new_post
  post 'users/:id/feed' => 'users#create_post'
  post 'users/:id/feed' => 'users#create_comment', as: :comments
  get '/users/explore/:id' => 'users#profile', as: :user
  get '/users/explore' => 'users#explore', as: :explore
  post 'users/explore/:id/follow' => 'following#create', as: :follow
  post 'users/explore/:id/unfollow' => 'following#delete', as: :unfollow


  get '/users/:id/orders/index' => 'orders#index', as: :orders
  get '/users/:id/orders/:id' => 'orders#show', as: :order


  get 'posts/:id' => 'posts#show', as: :post
  post '/users/:id/cart' => 'carts#add_to_cart', as: :add_to_cart
  get '/users/:id/cart' => 'carts#view', as: :cart
  delete '/users/:id/cart' => 'carts#remove_from_cart', as: :remove_from_cart

  get '/users/:id/checkout'=>'checkout#start', as: :checkout
  post '/users/:id/checkout'=> 'checkout#process_payment', as: :process_payment
  get '/users/:id/receipt/:id' => 'checkout#receipt', as: :receipt



  # get 'users/feed'
  #
  # get 'users/profile'
  #
  # get 'users/new'
  #
  # get 'users/explore'

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
