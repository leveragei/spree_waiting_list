Spree::Core::Engine.add_routes do
  resources :stock_requests
  namespace :admin do
    resources :reports, :only => [] do
      collection do
        get :stock_requests
        post :stock_requests
      end
    end
  end
end
