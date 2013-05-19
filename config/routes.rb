JobSnapper::Application.routes.draw do
  devise_for  :candidates, :employers,
              :path_names => { :sign_in => "sign-in", :sign_out => "sign-out", :sign_up => "sign-up" }

  namespace :candidates do
    resource :profiles, :except => [:show, :destroy]
  end

  namespace :employers do
    resource :dashboard, :only => [:show], :controller => "dashboard"
  end

  resources :jobs do
    resources :applications, :controller => "jobs/applications", :only => [:index, :show]
  end

  namespace :applicant do
    resource :application, :controller => 'application', only: [:create, :destroy] do
      member do
        get ":id/accept"    => "application#accept",    :as => "accept"
        get ":id/remove"    => "application#remove",    :as => "remove"
        get ":id/unaccept"  => "application#unaccept",  :as => "unaccept"
        get ":id/shortlist" => "application#shortlist", :as => "shortlist"
      end
    end
  end

  root to: "pages#home"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root to: 'welcome#index'

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

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
