JobSnapper::Application.routes.draw do

  devise_for  :candidates,
              :path_names => { :sign_in => "sign-in", :sign_out => "sign-out", :sign_up => "sign-up" }

  devise_for  :employers,
              :path_names => { :sign_in => "sign-in", :sign_out => "sign-out", :sign_up => "sign-up" }

  namespace :candidates do
    resource :profile, :except => [:destroy, :show]
    get "dashboard" => "dashboard#index"
  end

  namespace :employers do
    get "dashboard" => "dashboard#index", :as => "jobs_dashboard"
    get "dashboard/:job_id" => "dashboard#show", :as => "job_dashboard"
  end

  resources :jobs

  scope :jobs do
    resources :types, :only => [:show]
    resources :categories, :only => [:show]
  end

  namespace :applicant do
    resource :application, :controller => 'application', only: [:create, :destroy] do
      member do
        get ":id/accept" => "application#accept", as: "accept"
        get ":id/reject" => "application#reject", as: "reject"
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
