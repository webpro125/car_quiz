Rails.application.routes.draw do
  devise_for :users, path: '/', path_names: {
                 sign_in: 'login',
                 sign_out: 'logout',
                 sign_up: 'registration'
             },
             controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  devise_for :admins, path: '/admin', path_names: {
                       sign_in: 'login',
                       sign_out: 'logout',
                       sign_up: 'registration'
                   },
             controllers: { sessions: 'admins/sessions' },
             :skip => [:registrations]

  authenticated :admin do
    namespace :admins, path: 'admin' do
      root to: 'dashboards#index', as: :superadmin_root
    end
  end

  root 'pages#index'
  resources :feedbacks, only: [:new, :create]
  post :import_car, to: 'pages#import_car'
  get :thankyou, to: 'pages#thankyou'
  resources :cars, only: [:index] do
    get :search, on: :collection
  end

  namespace :admins, path: 'admin' do
    get '/', to: 'dashboards#index'
    resources :dashboards, only: [:index]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
