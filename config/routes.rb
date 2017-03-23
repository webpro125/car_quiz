Rails.application.routes.draw do
  devise_for :users, path: '/', path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 sign_up: 'registration'
             },
             controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  root 'pages#index'
  resources :feedbacks, only: [:new, :create]
  post :import_car, to: 'pages#import_car'
  get :thankyou, to: 'pages#thankyou'
  resources :cars, only: [:index] do
    get :search, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
