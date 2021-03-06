Rails.application.routes.draw do
  resources :colors

  resources :reestrprihodovs

  resources :reestrotgruzoks

  resources :distributors

  devise_for :users
  resources :moneytypes

  resources :ourtimes

  resources :zakupkas do
    resources :zakupkaparts do
    end
  end

  resources :orders do
    member do
      get 'priemall'
      post 'uploadfromexcel'
      get 'arhive'
      get 'desarhive'
      get 'export'
    end
    collection do
      get 'arhives'
    end
    resources :orderparts do
      member do
        get 'otkaz'
        get 'otkazm'
        get 'inwork'
      end
    end
  end

  resources :orderstates

  resources :intproducts

  resources :prodtypes

  resources :employees do
    member do
      get :addlogin
      get :changepass
      post :changepasses
      get :dellogin
    end
  end

  resources :departments

  resources :products do
    collection do
      get 'search'
      get 'parse'
      get 'destroyall'
      get 'setorder'
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'orders#index'
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
