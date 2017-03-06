Rails.application.routes.draw do

  namespace :admin do
    resources :users
resources :animes
resources :bots
resources :comments
resources :contacts
resources :contents
resources :works

    root to: "users#index"
  end

  root 'pages#index'

  get 'bots/crawl', to: 'bots#crawl'
  get 'bots/scraping', to: 'bots#scraping'
  get 'bots/scrap', to: 'bots#scrap'
  get 'bots/insert_content', to: 'bots#insert_content'
  get 'bots/insert_bot', to: 'bots#insert_bot'

  resources :bots, only: [:show, :index]
  resources :works, only: [:create, :destroy, :show, :index, :new, :edit, :update] do
    resources :comments, only: [:create, :destroy]
  end
  
  
  resources :contents, only: [:create, :destroy, :show, :index, :new, :edit, :update] do
    resources :comments, only: [:create, :destroy]
  end
  

  devise_for :users
  get 'pages/index_smart_phone', to: 'pages#index_smart_phone'


  resources :animes, only: [:create, :destroy, :show]
  
  resources :contacts, only: [:new, :create]
  
  resources :tweets, only: [:new, :create] do
    collection do
      get 'post'
    end
  end
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
