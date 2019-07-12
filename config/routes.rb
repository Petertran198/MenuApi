Rails.application.routes.draw do
  resources :orders
  scope module: 'api' do 
    namespace :v1 do 
      resources :menus
      resources :items
      post 'user_token' => 'user_token#create'
      resources :users
      resources :orders
    end
  end

end
