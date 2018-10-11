Rails.application.routes.draw do
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
  	namespace 'v1' do 
  	  resources :cars
  	  post 'search_cars', to: "cars#search"
      resources :enquiries
      get 'car_names_list', to: "enquiries#car_names"
    end
  end
end
